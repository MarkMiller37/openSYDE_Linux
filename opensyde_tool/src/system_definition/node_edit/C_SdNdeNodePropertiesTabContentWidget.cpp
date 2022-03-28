//----------------------------------------------------------------------------------------------------------------------
/*!
   \file
   \brief       Widget for node properties tab content

   Widget for node properties tab content

   \copyright   Copyright 2022 Sensor-Technik Wiedemann GmbH. All rights reserved.
*/
//----------------------------------------------------------------------------------------------------------------------

/* -- Includes ------------------------------------------------------------------------------------------------------ */
#include "precomp_headers.h"

#include "C_UsHandler.h"

#include "C_SdNdeNodePropertiesTabContentWidget.h"
#include "ui_C_SdNdeNodePropertiesTabContentWidget.h"

/* -- Used Namespaces ----------------------------------------------------------------------------------------------- */
using namespace stw_types;
using namespace stw_opensyde_gui;
using namespace stw_opensyde_gui_logic;

/* -- Module Global Constants --------------------------------------------------------------------------------------- */

/* -- Types --------------------------------------------------------------------------------------------------------- */

/* -- Global Variables ---------------------------------------------------------------------------------------------- */

/* -- Module Global Variables --------------------------------------------------------------------------------------- */

/* -- Module Global Function Prototypes ----------------------------------------------------------------------------- */

/* -- Implementation ------------------------------------------------------------------------------------------------ */

//----------------------------------------------------------------------------------------------------------------------
/*! \brief   Default constructor

   Set up GUI with all elements.

   \param[in,out]  opc_Parent    Optional pointer to parent
*/
//----------------------------------------------------------------------------------------------------------------------
C_SdNdeNodePropertiesTabContentWidget::C_SdNdeNodePropertiesTabContentWidget(QWidget * const opc_Parent) :
   QWidget(opc_Parent),
   mpc_Ui(new Ui::C_SdNdeNodePropertiesTabContentWidget)
{
   this->mpc_Ui->setupUi(this);

   // Splitter stretch: if there is more space stretch left widget (i.e. index 0)
   this->mpc_Ui->pc_Splitter->setStretchFactor(0, 10);
   this->mpc_Ui->pc_Splitter->setStretchFactor(1, 0);

   connect(this->mpc_Ui->pc_NodePropWidget, &C_SdNdeNodePropertiesWidget::SigChanged,
           this, &C_SdNdeNodePropertiesTabContentWidget::SigChanged);
   connect(this->mpc_Ui->pc_NodePropWidget, &C_SdNdeNodePropertiesWidget::SigNameChanged,
           this, &C_SdNdeNodePropertiesTabContentWidget::SigNameChanged);
   connect(this->mpc_Ui->pc_NodePropWidget, &C_SdNdeNodePropertiesWidget::SigBusBitrateClicked,
           this, &C_SdNdeNodePropertiesTabContentWidget::SigBusBitrateClicked);
   connect(this->mpc_Ui->pc_WidgetApplications, &C_SdNdeDbViewWidget::SigErrorChange, this,
           &C_SdNdeNodePropertiesTabContentWidget::SigErrorChange);
   connect(this->mpc_Ui->pc_WidgetApplications, &C_SdNdeDbViewWidget::SigOwnedDataPoolsChanged, this,
           &C_SdNdeNodePropertiesTabContentWidget::SigOwnedDataPoolsChanged);
   connect(this->mpc_Ui->pc_WidgetApplications, &C_SdNdeDbViewWidget::SigHalcLoadedFromTSP, this,
           &C_SdNdeNodePropertiesTabContentWidget::SigHalcLoadedFromTSP);
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief   Default destructor
*/
//----------------------------------------------------------------------------------------------------------------------
C_SdNdeNodePropertiesTabContentWidget::~C_SdNdeNodePropertiesTabContentWidget()
{
   delete this->mpc_Ui;
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief  Set node index

   \param[in]  ou32_NodeIndex    Node index
*/
//----------------------------------------------------------------------------------------------------------------------
void C_SdNdeNodePropertiesTabContentWidget::SetNodeIndex(const uint32 ou32_NodeIndex)
{
   this->mpc_Ui->pc_WidgetApplications->SetNodeIndex(ou32_NodeIndex);
   this->mpc_Ui->pc_NodePropWidget->SetNodeId(ou32_NodeIndex);
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief   Update applications
*/
//----------------------------------------------------------------------------------------------------------------------
void C_SdNdeNodePropertiesTabContentWidget::UpdateApplications() const
{
   this->mpc_Ui->pc_WidgetApplications->UpdateApplications();
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief   Save ui data to node

   Is called from outside
      - on system definition save
      - on page change
*/
//----------------------------------------------------------------------------------------------------------------------
void C_SdNdeNodePropertiesTabContentWidget::SaveToData() const
{
   this->mpc_Ui->pc_NodePropWidget->SaveToData();
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief   Selects the node name in the text edit for fast editing
*/
//----------------------------------------------------------------------------------------------------------------------
void C_SdNdeNodePropertiesTabContentWidget::SelectName() const
{
   this->mpc_Ui->pc_NodePropWidget->SelectName();
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief   Scrolls to the application with the index ou32_ApplicationIndex

   \param[in]  ou32_ApplicationIndex   Index of application
*/
//----------------------------------------------------------------------------------------------------------------------
void C_SdNdeNodePropertiesTabContentWidget::ShowApplication(const uint32 ou32_ApplicationIndex) const
{
   this->mpc_Ui->pc_WidgetApplications->ShowApplication(ou32_ApplicationIndex);
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief  Wrapper to call C_SdNdeDbViewWidget::AddFromTSP()
*/
//----------------------------------------------------------------------------------------------------------------------
void C_SdNdeNodePropertiesTabContentWidget::AddFromTSP()
{
   this->mpc_Ui->pc_WidgetApplications->AddFromTSP();
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief  Save user settings
*/
//----------------------------------------------------------------------------------------------------------------------
void C_SdNdeNodePropertiesTabContentWidget::SaveUserSettings()
{
   const QList<sintn> c_Sizes = this->mpc_Ui->pc_Splitter->sizes();

   if (c_Sizes.size() > 0)
   {
      C_UsHandler::h_GetInstance()->SetSdNodeEditSplitterX(c_Sizes.at(0));
   }
}

//----------------------------------------------------------------------------------------------------------------------
/*! \brief  Load user settings
*/
//----------------------------------------------------------------------------------------------------------------------
void C_SdNdeNodePropertiesTabContentWidget::LoadUserSettings()
{
   const sint32 s32_FirstSegmentWidth = C_UsHandler::h_GetInstance()->GetSdNodeEditSplitterX();

   this->mpc_Ui->pc_Splitter->SetFirstSegment(s32_FirstSegmentWidth);
}