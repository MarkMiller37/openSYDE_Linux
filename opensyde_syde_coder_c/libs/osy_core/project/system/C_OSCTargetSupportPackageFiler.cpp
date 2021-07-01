//----------------------------------------------------------------------------------------------------------------------
/*!
   \file
   \brief        File handler for target support package file data.

   Handle XML loading and parsing.

   \copyright   Copyright 2018 Sensor-Technik Wiedemann GmbH. All rights reserved.
*/
//----------------------------------------------------------------------------------------------------------------------

/* -- Includes ------------------------------------------------------------------------------------------------------ */
#include "precomp_headers.h"

#include "stwtypes.h"
#include "stwerrors.h"
#include "C_OSCTargetSupportPackageFiler.h"
#include "TGLFile.h"
#include "C_OSCLoggingHandler.h"
#include "C_OSCXMLParser.h"
#include "CSCLString.h"
#include "C_OSCSystemFilerUtil.h"

/* -- Used Namespaces ----------------------------------------------------------------------------------------------- */
using namespace stw_types;
using namespace stw_errors;
using namespace stw_opensyde_core;
using namespace stw_tgl;
using namespace stw_scl;

/* -- Module Global Constants --------------------------------------------------------------------------------------- */

/* -- Types --------------------------------------------------------------------------------------------------------- */

/* -- Global Variables ---------------------------------------------------------------------------------------------- */

/* -- Module Global Variables --------------------------------------------------------------------------------------- */

/* -- Module Global Function Prototypes ----------------------------------------------------------------------------- */

/* -- Implementation ------------------------------------------------------------------------------------------------ */

//----------------------------------------------------------------------------------------------------------------------
/*! \brief   Load target support package.

   Load data from specified file and place it in target support package instance

   \param[out]    orc_TargetSupportPackage   target support package information read from file
   \param[in]     orc_Path                   path to file

   \return
   C_NO_ERR    data read
   C_RANGE     specified target support package file does not exist
   C_NOACT     specified file is present but structure is invalid (e.g. invalid XML file)
   C_CONFIG    in specified file is a XML node or attribute missing
*/
//----------------------------------------------------------------------------------------------------------------------
sint32 C_OSCTargetSupportPackageFiler::h_Load(C_OSCTargetSupportPackage & orc_TargetSupportPackage,
                                              const stw_scl::C_SCLString & orc_Path)
{
   sint32 s32_Return = C_NO_ERR;

   if (TGL_FileExists(orc_Path) == true)
   {
      C_OSCXMLParser c_XMLParser;

      s32_Return = c_XMLParser.LoadFromFile(orc_Path);
      if (s32_Return == C_NO_ERR)
      {
         s32_Return = mh_Load(orc_TargetSupportPackage, c_XMLParser);
      }
      else
      {
         osc_write_log_error("Loading Target Support Package",
                             "File \"" + orc_Path + "\" could not be opened.");
         s32_Return = C_NOACT;
      }
   }
   else
   {
      osc_write_log_error("Loading Target Support Package", "File \"" + orc_Path + "\" does not exist.");
      s32_Return = C_RANGE;
   }

   return s32_Return;
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief   Load data from xml file.

   Parse a .syde_tsp file and save parameters to C_OSCTargetSupportPackage.

   \param[in]     orc_TargetSupportPackage      target support package information to write to file
   \param[in]     orc_XMLParser                 XML parser

   \return
   C_NO_ERR    XML data read and placed into target support package instance
   C_CONFIG    XML node or attribute missing
*/
//----------------------------------------------------------------------------------------------------------------------
sint32 C_OSCTargetSupportPackageFiler::mh_Load(C_OSCTargetSupportPackage & orc_TargetSupportPackage,
                                               C_OSCXMLParserBase & orc_XMLParser)
{
   sint32 s32_Return = C_NO_ERR;
   C_SCLString c_Text;
   C_SCLString c_HalcIncluded;

   //"empty" target support package to have a clearly defined status:
   orc_TargetSupportPackage.Clear();

   //Check if root node exists:
   c_Text = orc_XMLParser.SelectRoot();

   if (c_Text != "opensyde-target-support-package")
   {
      osc_write_log_error("Loading target support package", "XML node \"opensyde-target-support-package\" not found.");
      s32_Return = C_CONFIG;
   }
   else
   {
      if (orc_XMLParser.SelectNodeChild("file-version") == "file-version")
      {
         uint16 u16_FileVersion = 0U;
         try
         {
            u16_FileVersion = static_cast<uint16>(orc_XMLParser.GetNodeContent().ToInt());
         }
         catch (...)
         {
            osc_write_log_error("Loading target support package",
                                "\"file-version\" could not be converted to a number.");
            s32_Return = C_CONFIG;
         }

         //is the file version one we know ?
         if (s32_Return == C_NO_ERR)
         {
            osc_write_log_info("Loading target support package", "Value of \"file-version\": " +
                               C_SCLString::IntToStr(u16_FileVersion));
            //Check file version
            if ((u16_FileVersion != 1U) && (u16_FileVersion != 2U))
            {
               osc_write_log_error("Loading target support package",
                                   "Version defined by \"file-version\" is not supported.");
               s32_Return = C_CONFIG;
            }
         }
      }
      else
      {
         osc_write_log_error("Loading target support package", "XML node \"file-version\" not found.");
         s32_Return = C_CONFIG;
      }
      //no special handling required yet based on version
      orc_XMLParser.SelectNodeParent(); //back to parent
   }

   // no if statement because of CPPCheck warning. Still safe, because we don't throw error if <halc-included> is not in
   // XML. We want to be compatible with the old file version. Potential error from above gets caught in next if.
   c_Text = orc_XMLParser.SelectNodeChild("halc-included");
   if (c_Text == "halc-included")
   {
      c_HalcIncluded = orc_XMLParser.GetNodeContent().LowerCase();
   }
   // back to parent
   orc_XMLParser.SelectNodeParent();

   // device name
   if (s32_Return == C_NO_ERR)
   {
      c_Text = orc_XMLParser.SelectNodeChild("device-name");
      if (c_Text != "device-name")
      {
         osc_write_log_error("Loading target support package", "XML node \"device-name\" not found.");
         s32_Return = C_CONFIG;
      }
      else
      {
         orc_TargetSupportPackage.c_DeviceName = orc_XMLParser.GetNodeContent();
      }
      orc_XMLParser.SelectNodeParent(); //back to parent
   }

   // TSP comment
   if (s32_Return == C_NO_ERR)
   {
      c_Text = orc_XMLParser.SelectNodeChild("tsp-comment");
      if (c_Text != "tsp-comment")
      {
         osc_write_log_error("Loading target support package", "XML node \"tsp-comment\" not found.");
         s32_Return = C_CONFIG;
      }
      else
      {
         orc_TargetSupportPackage.c_Comment = orc_XMLParser.GetNodeContent();
      }
      orc_XMLParser.SelectNodeParent();
   }

   //Code export settings
   if ((orc_XMLParser.SelectNodeChild("code-export-settings") == "code-export-settings") && (s32_Return == C_NO_ERR))
   {
      if (orc_XMLParser.SelectNodeChild("scaling-support") == "scaling-support")
      {
         s32_Return = C_OSCSystemFilerUtil::h_StringToCodeExportScalingType(
            orc_XMLParser.GetNodeContent(), orc_TargetSupportPackage.c_CodeExportSettings.e_ScalingSupport);
         //Return
         tgl_assert(orc_XMLParser.SelectNodeParent() == "code-export-settings");
      }
      else
      {
         orc_TargetSupportPackage.c_CodeExportSettings.e_ScalingSupport = C_OSCNodeCodeExportSettings::eFLOAT32;
      }
      //Return
      orc_XMLParser.SelectNodeParent();
   }
   else
   {
      orc_TargetSupportPackage.c_CodeExportSettings.Initialize();
   }

   //openSYDE server settings
   if (s32_Return == C_NO_ERR)
   {
      c_Text = orc_XMLParser.SelectNodeChild("open-syde-server-settings");
      if (c_Text != "open-syde-server-settings")
      {
         osc_write_log_error("Loading target support package", "XML node \"open-syde-server-settings\" not found.");
         s32_Return = C_CONFIG;
      }
      else
      {
         if (orc_XMLParser.AttributeExists("dpd-application-index") == true)
         {
            orc_TargetSupportPackage.u8_ApplicationIndex =
               static_cast<uint8>(orc_XMLParser.GetAttributeUint32("dpd-application-index"));
         }
         else
         {
            osc_write_log_error("Loading target support package", "XML attribute \"dpd-application-index\" not found "
                                "in node \"open-syde-server-setting\".");
            s32_Return = C_CONFIG;
         }
         if ((s32_Return == C_NO_ERR) && (orc_XMLParser.AttributeExists("max-parallel-transmissions") == true))
         {
            orc_TargetSupportPackage.u8_MaxParallelTransmissions =
               static_cast<uint8>(orc_XMLParser.GetAttributeUint32("max-parallel-transmissions"));
         }
         else
         {
            osc_write_log_error("Loading target support package", "XML attribute \"max-parallel-transmissions\" not found "
                                "in node \"open-syde-server-setting\".");
            s32_Return = C_CONFIG;
         }
         if ((s32_Return == C_NO_ERR) && (orc_XMLParser.AttributeExists("max-tx-message-buffer") == true))
         {
            orc_TargetSupportPackage.u16_MaxMessageBufferTx =
               static_cast<uint16>(orc_XMLParser.GetAttributeUint32("max-tx-message-buffer"));
         }
         else
         {
            osc_write_log_error("Loading target support package", "XML attribute \"max-tx-message-buffer\" not found "
                                "in node \"open-syde-server-setting\".");
            s32_Return = C_CONFIG;
         }
         if ((s32_Return == C_NO_ERR) && (orc_XMLParser.AttributeExists("max-rx-routing-message-buffer") == true))
         {
            orc_TargetSupportPackage.u16_MaxRoutingMessageBufferRx =
               static_cast<uint16>(orc_XMLParser.GetAttributeUint32("max-rx-routing-message-buffer"));
         }
         else
         {
            osc_write_log_error("Loading target support package", "XML attribute \"max-rx-routing-message-buffer\" not found "
                                "in node \"open-syde-server-setting\".");
            s32_Return = C_CONFIG;
         }
      }

      //Return
      orc_XMLParser.SelectNodeParent();
   }

   // template project
   if (s32_Return == C_NO_ERR)
   {
      c_Text = orc_XMLParser.SelectNodeChild("template-project");
      if (c_Text != "template-project")
      {
         osc_write_log_error("Loading target support package", "XML node \"template-project\" not found.");
         s32_Return = C_CONFIG;
      }
      else
      {
         //template path
         c_Text = orc_XMLParser.SelectNodeChild("template");
         if (c_Text != "template")
         {
            osc_write_log_error("Loading target support package", "No XML node \"template\" found.");
            s32_Return = C_CONFIG;
         }
         else
         {
            orc_TargetSupportPackage.c_TemplatePath = orc_XMLParser.GetNodeContent();
         }
      }
      orc_XMLParser.SelectNodeParent();
   }

   // halc definition, only continue if there is a halc config in tsp file
   if ((s32_Return == C_NO_ERR) && (c_HalcIncluded == "true"))
   {
      c_Text = orc_XMLParser.SelectNodeChild("halc-definition");
      if (c_Text != "halc-definition")
      {
         osc_write_log_error("Loading target support package", "XML node \"halc-definition\" not found.");
         s32_Return = C_CONFIG;
      }
      else
      {
         s32_Return = mh_ParseHalcSection(orc_TargetSupportPackage, orc_XMLParser);
      }
      // back to parent
      orc_XMLParser.SelectNodeParent();
   }
   else
   {
      // if a TSP with halc was loaded those attributes were set. If one loads a TSP without halc right afterwards the
      // attributes remain set, so we need to clear them
      orc_TargetSupportPackage.c_HalcDefPath = "";
      orc_TargetSupportPackage.c_HalcComment = "";
   }

   if (s32_Return == C_NO_ERR)
   {
      c_Text = orc_XMLParser.SelectNodeChild("application");
      if (c_Text != "application")
      {
         osc_write_log_error("Loading target support package", "XML node \"application\" not found.");
         s32_Return = C_CONFIG;
      }
      else
      {
         // parse this application
         do
         {
            s32_Return = mh_ParseApplication(orc_TargetSupportPackage, orc_XMLParser);
            c_Text = orc_XMLParser.SelectNodeNext("application");
         }
         while ((s32_Return == C_NO_ERR) && (c_Text == "application"));
      }
   }

   return s32_Return;
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief   Load applications data from XML file.

   Requires the XML parser to be on node "application".

   \param[in]     orc_TargetSupportPackage      target support package information to write to file
   \param[in]     orc_XMLParser                 XML parser

   \return
   C_NO_ERR    application data read and placed into target support package instance
   C_CONFIG    XML node or attribute missing
*/
//----------------------------------------------------------------------------------------------------------------------
sint32 C_OSCTargetSupportPackageFiler::mh_ParseApplication(C_OSCTargetSupportPackage & orc_TargetSupportPackage,
                                                           C_OSCXMLParserBase & orc_XMLParser)
{
   sint32 s32_Return = C_NO_ERR;
   C_SCLString c_Text;
   C_OSCTSPApplication c_Application;

   // is-programmable
   if (orc_XMLParser.AttributeExists("is-programmable") == false)
   {
      osc_write_log_error("Loading target support package", "XML attribute \"is-programmable\" not found.");
      s32_Return = C_CONFIG;
   }
   else
   {
      c_Application.q_IsProgrammable = static_cast<bool>(orc_XMLParser.GetAttributeBool("is-programmable"));
   }

   // generates halc psi files. Required attribute, but no error, due to compatibility with old tsp version
   if (orc_XMLParser.AttributeExists("generate-halc-psi") == true)
   {
      c_Application.q_GeneratesPsiFiles = static_cast<bool>(orc_XMLParser.GetAttributeBool("generate-halc-psi"));
   }

   // process id (required if and only if programmable)
   if ((s32_Return == C_NO_ERR) && (c_Application.q_IsProgrammable == true))
   {
      if (orc_XMLParser.AttributeExists("process-id") == false)
      {
         osc_write_log_error("Loading target support package", "XML attribute \"process-id\" not found.");
         s32_Return = C_CONFIG;
      }
      else
      {
         c_Application.u8_ProcessId = static_cast<uint8>(orc_XMLParser.GetAttributeUint32("process-id"));
      }
   }

   // display name of application
   if (s32_Return == C_NO_ERR)
   {
      c_Text = orc_XMLParser.SelectNodeChild("display-name");
      if (c_Text != "display-name")
      {
         osc_write_log_error("Loading target support package", "No XML node \"display-name\" found.");
         s32_Return = C_CONFIG;
      }
      else
      {
         c_Application.c_Name = orc_XMLParser.GetNodeContent();
      }
      orc_XMLParser.SelectNodeParent(); //back to parent
   }

   // comment
   if (s32_Return == C_NO_ERR)
   {
      c_Text = orc_XMLParser.SelectNodeChild("comment");
      if (c_Text != "comment")
      {
         osc_write_log_error("Loading target support package", "No XML node \"comment\" found.");
         s32_Return = C_CONFIG;
      }
      else
      {
         c_Application.c_Comment = orc_XMLParser.GetNodeContent();
      }
      orc_XMLParser.SelectNodeParent(); //back to parent
   }

   // IDE call
   if (s32_Return == C_NO_ERR)
   {
      c_Text = orc_XMLParser.SelectNodeChild("ide-call");
      if (c_Text != "ide-call")
      {
         osc_write_log_error("Loading target support package", "XML node \"ide-call\" not found.");
         s32_Return = C_CONFIG;
      }
      else
      {
         c_Application.c_IdeCall = orc_XMLParser.GetNodeContent();
      }
      orc_XMLParser.SelectNodeParent(); //back to parent
   }

   // generate (required if and only if file generation is enabled)
   if ((s32_Return == C_NO_ERR) &&
       ((c_Application.q_IsProgrammable == true) || (c_Application.q_GeneratesPsiFiles == true)))
   {
      c_Text = orc_XMLParser.SelectNodeChild("code-generation");
      if (c_Text != "code-generation")
      {
         osc_write_log_error("Loading target support package", "XML node \"code-generation\" not found.");
         s32_Return = C_CONFIG;
      }
      else
      {
         // generated code structure version (optional attribute)
         if (orc_XMLParser.AttributeExists("generated-code-version") == true)
         {
            c_Application.u16_GenCodeVersion =
               static_cast<uint16>(orc_XMLParser.GetAttributeUint32("generated-code-version"));
         }
         else
         {
            // probably deprecated TSP -> default to first version
            // (note: if not programmable this is not reached and therefore defaults to its initial value 0,
            // but this does not harm as "code-generation-version" makes no sense in this case)
            osc_write_log_warning("Loading target support package",
                                  "XML attribute \"generated-code-version\" not found.");
            c_Application.u16_GenCodeVersion = 1U;
         }

         // file generator type
         c_Text = orc_XMLParser.SelectNodeChild("type");
         if (c_Text != "type")
         {
            osc_write_log_error("Loading target support package",
                                "XML node \"code-generation\".\"type\" not found.");
            s32_Return = C_CONFIG;
         }
         else
         {
            if (orc_XMLParser.AttributeExists("is-standard-opensyde") == false)
            {
               osc_write_log_error("Loading target support package",
                                   "XML attribute \"is-standard-opensyde\" not found.");
               s32_Return = C_CONFIG;
            }
            else
            {
               c_Application.q_IsStandardSydeCoderC = orc_XMLParser.GetAttributeBool("is-standard-opensyde");
            }
         }
         orc_XMLParser.SelectNodeParent(); //back to parent

         // if the file generator is not standard, a path do the file generator is required
         if ((s32_Return == C_NO_ERR) && (c_Application.q_IsStandardSydeCoderC == false))
         {
            c_Text = orc_XMLParser.SelectNodeChild("path");
            if (c_Text != "path")
            {
               osc_write_log_error("Loading target support package",
                                   "XML node \"code-generation\".\"path\" not found but required.");
               s32_Return = C_CONFIG;
            }
            else
            {
               c_Application.c_CodeGeneratorPath = orc_XMLParser.GetNodeContent();
            }
            orc_XMLParser.SelectNodeParent(); //back to parent
         }
      }
      tgl_assert(orc_XMLParser.SelectNodeParent() == "application"); //back to parent
   }

   // project-folder
   if (s32_Return == C_NO_ERR)
   {
      c_Text = orc_XMLParser.SelectNodeChild("project-folder");
      if (c_Text != "project-folder")
      {
         osc_write_log_error("Loading target support package", "No XML node \"project-folder\" found.");
         s32_Return = C_CONFIG;
      }
      else
      {
         c_Application.c_ProjectFolder = orc_XMLParser.GetNodeContent();
      }
      orc_XMLParser.SelectNodeParent(); //back to parent
   }

   // generate (required if and only if file generation is enabled)
   if ((s32_Return == C_NO_ERR) &&
       ((c_Application.q_IsProgrammable == true) || (c_Application.q_GeneratesPsiFiles == true)))
   {
      c_Text = orc_XMLParser.SelectNodeChild("generate");
      if (c_Text != "generate")
      {
         osc_write_log_error("Loading target support package", "No XML node \"generate\" found.");
         s32_Return = C_CONFIG;
      }
      else
      {
         c_Application.c_GeneratePath = orc_XMLParser.GetNodeContent();
      }
      orc_XMLParser.SelectNodeParent(); //back to parent
   }

   // result
   // old file version, do not throw error, so we maintain compatibility
   if ((s32_Return == C_NO_ERR) && (orc_XMLParser.SelectNodeChild("result") == "result"))
   {
      c_Application.c_ResultPaths.resize(1);
      c_Application.c_ResultPaths[0] = orc_XMLParser.GetNodeContent();

      orc_XMLParser.SelectNodeParent(); // back to application
   }
   // new file version
   else if ((s32_Return == C_NO_ERR) && (orc_XMLParser.SelectNodeChild("result-paths") == "result-paths"))
   {
      C_SCLString c_CurrNode = orc_XMLParser.SelectNodeChild("output-file");
      if (c_CurrNode != "output-file")
      {
         osc_write_log_error("Loading target support package", "No XML node \"output-file\" found. ");
         s32_Return = C_CONFIG;
         orc_XMLParser.SelectNodeParent(); //back to parent result-paths
         orc_XMLParser.SelectNodeParent(); //back to parent application
      }
      else
      {
         c_Application.c_ResultPaths.clear();
         do
         {
            c_Application.c_ResultPaths.push_back(orc_XMLParser.GetNodeContent());
            c_CurrNode = orc_XMLParser.SelectNodeNext("output-file");
         }
         while (c_CurrNode == "output-file");

         // maximum of 2 output files allowed
         tgl_assert(c_Application.c_ResultPaths.size() <= 2);

         orc_XMLParser.SelectNodeParent(); //back to parent result-paths
         orc_XMLParser.SelectNodeParent(); //back to parent application
      }
   }
   // invalid version
   else
   {
      osc_write_log_error("Loading target support package", "No XML node \"result\" or \"result-paths\" found.");
      s32_Return = C_CONFIG;
      orc_XMLParser.SelectNodeParent(); // back to application
   }

   // add application
   orc_TargetSupportPackage.c_Applications.push_back(c_Application);

   return s32_Return;
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief Load halc data from XML file.

   Requires the XML parser to be on node "halc-definition".

   \param[in]     orc_TargetSupportPackage      target support package information to write to file
   \param[in]     orc_XMLParser                 XML parser

   \return
   C_NO_ERR    halc data read and placed into target support package instance
   C_CONFIG    XML node or attribute missing
*/
//----------------------------------------------------------------------------------------------------------------------
sint32 C_OSCTargetSupportPackageFiler::mh_ParseHalcSection(C_OSCTargetSupportPackage & orc_TargetSupportPackage,
                                                           C_OSCXMLParserBase & orc_XMLParser)
{
   sint32 s32_Return = C_NO_ERR;
   C_SCLString c_Text;

   c_Text = orc_XMLParser.SelectNodeChild("halc-path");
   if (c_Text != "halc-path")
   {
      osc_write_log_error("Loading target support package", "XML node \"halc-path\" not found.");
      s32_Return = C_CONFIG;
   }
   else
   {
      orc_TargetSupportPackage.c_HalcDefPath = orc_XMLParser.GetNodeContent();
      c_Text = orc_XMLParser.SelectNodeNext("halc-comment");
      if (c_Text != "halc-comment")
      {
         osc_write_log_error("Loading target support package", "XML node \"halc-comment\" not found.");
         s32_Return = C_CONFIG;
      }
      else
      {
         orc_TargetSupportPackage.c_HalcComment = orc_XMLParser.GetNodeContent();
      }
   }
   // go back to "halc-definition"
   orc_XMLParser.SelectNodeParent();

   return s32_Return;
}
