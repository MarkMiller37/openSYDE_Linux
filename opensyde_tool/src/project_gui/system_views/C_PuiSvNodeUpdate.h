//----------------------------------------------------------------------------------------------------------------------
/*!
   \file
   \brief       Node update data (header)

   See cpp file for detailed description

   \copyright   Copyright 2017 Sensor-Technik Wiedemann GmbH. All rights reserved.
*/
//----------------------------------------------------------------------------------------------------------------------
#ifndef C_PUISVNODEUPDATE_H
#define C_PUISVNODEUPDATE_H

/* -- Includes ------------------------------------------------------------------------------------------------------ */
#include <vector>
#include <QString>
#include "stwtypes.h"
#include "C_PuiSvNodeUpdateParamInfo.h"

/* -- Namespace ----------------------------------------------------------------------------------------------------- */
namespace stw_opensyde_gui_logic
{
/* -- Global Constants ---------------------------------------------------------------------------------------------- */

/* -- Types --------------------------------------------------------------------------------------------------------- */

class C_PuiSvNodeUpdate
{
public:
   C_PuiSvNodeUpdate(void);

   enum E_GenericFileType
   {
      eFTP_DATA_BLOCK,
      eFTP_FILE_BASED
   };

   void CalcHash(stw_types::uint32 & oru32_HashValue) const;

   //Vectors
   void ClearParamPaths(void);
   void ClearPathsAsAppropriate(const E_GenericFileType oe_Type);
   const std::vector<C_PuiSvNodeUpdateParamInfo> & GetParamInfos(void) const;
   const std::vector<QString> & GetPaths(const E_GenericFileType oe_Type) const;
   const std::vector<bool> & GetSkipUpdateOfParamInfosFlags(void) const;
   const std::vector<bool> & GetSkipUpdateOfPathsFlags(const E_GenericFileType oe_Type) const;
   void SetParamInfos(const std::vector<C_PuiSvNodeUpdateParamInfo> & orc_Value);
   void SetPaths(const std::vector<QString> & orc_Value, const E_GenericFileType oe_Type);
   void SetSkipUpdateOfParamInfosFlags(const std::vector<bool> & orc_Value);
   void SetSkipUpdateOfPathsFlags(const std::vector<bool> & orc_Value, const E_GenericFileType oe_Type);
   stw_types::sint32 SetParamInfoContent(const stw_types::uint32 ou32_Index, const QString & orc_FilePath,
                                         const stw_types::uint32 ou32_LastKnownCrc);

   //Elements
   void AddPath(const QString & orc_Path, const E_GenericFileType oe_Type);
   void AddParamInfo(const C_PuiSvNodeUpdateParamInfo & orc_Value);
   stw_types::sint32 SetPath(const stw_types::uint32 ou32_Index, const QString & orc_Value,
                             const E_GenericFileType oe_Type);
   stw_types::sint32 SetParamInfo(const stw_types::uint32 ou32_Index, const C_PuiSvNodeUpdateParamInfo & orc_Value);
   stw_types::sint32 SetSkipUpdateOfPath(const stw_types::uint32 ou32_Index, const bool oq_SkipFile,
                                         const E_GenericFileType oe_Type);
   stw_types::sint32 SetSkipUpdateOfParamInfo(const stw_types::uint32 ou32_Index, const bool oq_SkipFile);
   stw_types::sint32 RemovePath(const stw_types::uint32 ou32_Index, const E_GenericFileType oe_Type);
   stw_types::sint32 RemoveParamInfo(const stw_types::uint32 ou32_Index);

   void OnSyncNodeApplicationAdded(const stw_types::uint32 ou32_NodeIndex,
                                   const stw_types::uint32 ou32_ApplicationIndex);
   void OnSyncNodeApplicationMoved(const stw_types::uint32 ou32_NodeIndex,
                                   const stw_types::uint32 ou32_ApplicationSourceIndex,
                                   const stw_types::uint32 ou32_ApplicationTargetIndex);
   void OnSyncNodeApplicationAboutToBeDeleted(const stw_types::uint32 ou32_NodeIndex,
                                              const stw_types::uint32 ou32_ApplicationIndex);
   void OnSyncNodeApplicationAboutToBeChangedFromParamSetHALC(const stw_types::uint32 ou32_NodeIndex,
                                                              const stw_types::uint32 ou32_ApplicationIndex);
   void OnSyncNodeApplicationChangedToParamSetHALC(const stw_types::uint32 ou32_NodeIndex,
                                                   const stw_types::uint32 ou32_ApplicationIndex);
   void OnSyncNodeApplicationResultPathSizeChanged(const stw_types::uint32 ou32_NodeIndex,
                                                   const stw_types::uint32 ou32_ApplicationIndex,
                                                   const stw_types::uint32 ou32_OldSize,
                                                   const stw_types::uint32 ou32_NewSize);

   stw_types::uint32 u32_NodeUpdatePosition; // Position of node in update sequence

private:
   std::vector<QString> mc_DataBlockPaths;
   std::vector<QString> mc_FileBasedPaths;
   std::vector<C_PuiSvNodeUpdateParamInfo> mc_ParamSetPaths;
   std::vector<std::vector<bool> > mc_SkipUpdateOfFiles; // Flags for skipping an update of the associated file
   // First level has three "layers":
   // 1: flags for datablock paths
   // 2: flags for file based paths
   // 3: flags for parameter set paths

   static const stw_types::sintn mhsn_PARAMETER_SET_INDEX = 2;
};

/* -- Extern Global Variables --------------------------------------------------------------------------------------- */
} //end of namespace

#endif
