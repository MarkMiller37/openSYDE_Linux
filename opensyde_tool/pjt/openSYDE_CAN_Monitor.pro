#-------------------------------------------------
#
# Project created by QtCreator 2016-05-03T11:00:30
#
#-------------------------------------------------

QT       += core gui
CONFIG   += precompile_header
CONFIG   += no_keywords

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets svg

TARGET = openSYDE_CAN_Monitor
TEMPLATE = app

DESTDIR = $${PWD}/../result/tool/CAN_Monitor

#version info:
RC_FILE = $${PWD}/../src/can_monitor/cam_resources.rc

#include relevant openSYDE core modules
opensyde_core_skip_modules += opensyde_core_skip_zipping
opensyde_core_skip_modules += opensyde_core_skip_code_generation
opensyde_core_skip_modules += opensyde_core_skip_protocol_drivers
opensyde_core_skip_modules += opensyde_core_skip_imports
include($${PWD}/../libs/opensyde_core/opensyde_core.pri)

SOURCES += \
    $${PWD}/../src/gettext/C_GtGetText.cpp \
    $${PWD}/../src/util/C_Uti.cpp \
    $${PWD}/../src/system_views/communication/C_SyvComMessageMonitor.cpp \
    $${PWD}/../src/system_views/communication/C_SyvComMessageLoggerFileBlf.cpp \
    $${PWD}/../src/system_views/communication/C_SyvComDriverThread.cpp \
    $${PWD}/../src/com_import_export/C_CieImportDbc.cpp \
    $${PWD}/../src/com_import_export/C_CieConverter.cpp \
    $${PWD}/../src/system_definition/node_edit/datapools/C_SdNdeDpContentUtil.cpp\
    $${PWD}/../src/can_monitor/cam_main.cpp \
    $${PWD}/../src/project_operations/C_PopErrorHandling.cpp \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/AttributeDefinition.cpp \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/AttributeRelation.cpp \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/AttributeValueType.cpp \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/BitTiming.cpp \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/EnvironmentVariable.cpp \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/Message.cpp \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/Network.cpp \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/Parser.cpp \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/Signal.cpp \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/SignalGroup.cpp \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/SignalType.cpp \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/ValueTable.cpp \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/platform.cpp \
    $${PWD}/../src/opensyde_gui_elements/widget/C_OgeWiCustomMessage.cpp \
    $${PWD}/../src/opensyde_gui_elements/widget/C_OgeWiError.cpp \
    $${PWD}/../src/opensyde_gui_elements/C_OgePopUpDialog.cpp \
    $${PWD}/../src/opensyde_gui_elements/C_OgeOverlay.cpp \
    $${PWD}/../src/opensyde_gui_elements/group_box/C_OgeGbxMouseMove.cpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabHeadingMessage.cpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabDescriptionMessage.cpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubCancel.cpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubDialog.cpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubIconText.cpp \
    $${PWD}/../src/opensyde_gui_elements/text_browser/C_OgeTebMessageDetails.cpp \
    $${PWD}/../src/navigable_gui/C_NagToolTip.cpp \
    $${PWD}/../src/opensyde_gui_elements/widget/C_OgeWiUtil.cpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabPopUpTitle.cpp \
    $${PWD}/../src/help_engine/C_HeHandler.cpp \
    $${PWD}/../src/opensyde_gui_elements/group_box/C_OgeGbxHover.cpp \
    $${PWD}/../src/opensyde_gui_elements/group_box/C_OgeGbxTransparent.cpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabContextMenuBase.cpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabPopUpSubTitle.cpp \
    $${PWD}/../src/opensyde_gui_elements/frame/C_OgeFraBorder.cpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubStandard.cpp \
    $${PWD}/../src/opensyde_gui_elements/text_browser/C_OgeTebContextMenuBase.cpp \
    $${PWD}/../src/opensyde_gui_elements/group_box/C_OgeGbxToolTip.cpp \
    $${PWD}/../src/opensyde_gui_elements/group_box/C_OgeGbxToolTipBase.cpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabHeadingToolTip.cpp \
    $${PWD}/../src/opensyde_gui_elements/text_edit/C_OgeTedToolTipContent.cpp \
    $${PWD}/../src/opensyde_gui_elements/C_OgeContextMenu.cpp \
    $${PWD}/../src/opensyde_gui_elements/C_OgeToolTipBase.cpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubToolTipBase.cpp \
    $${PWD}/../src/can_monitor/C_CamMainWindow.cpp \
    $${PWD}/../src/opensyde_gui_elements/widget/C_OgeWiOnlyBackground.cpp \
    $${PWD}/../src/opensyde_gui_elements/widget/C_OgeWiWithToolTip.cpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetTreeDelegate.cpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetTreeGuiBuffer.cpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetTreeModel.cpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetTreeView.cpp \
    $${PWD}/../src/table_base/tree_base/C_TblTreItem.cpp \
    $${PWD}/../src/table_base/tree_base/C_TblTreModel.cpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubSvgIconOnly.cpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabSvgOnly.cpp \
    $${PWD}/../src/can_monitor/user_settings/C_UsHandler.cpp \
    $${PWD}/../src/can_monitor/user_settings/C_UsFiler.cpp \
    $${PWD}/../src/navigable_gui/C_NagAboutDialog.cpp \
    $${PWD}/../src/opensyde_gui_elements/group_box/C_OgeGbx.cpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabGroupItem.cpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabGroupItemValue.cpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabToolTipBase.cpp \
    $${PWD}/../src/can_monitor/C_CamComDriverBase.cpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetWidget.cpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetStatusBarWidget.cpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetControlBarWidget.cpp \
    $${PWD}/../src/can_monitor/message_generator/C_CamGenWidget.cpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosWidget.cpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDllWidget.cpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosFilterWidget.cpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseWidget.cpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosLoggingWidget.cpp \
    $${PWD}/../src/can_monitor/C_CamTitleBarWidget.cpp \
    $${PWD}/../src/can_monitor/util/C_CamUtiStyleSheets.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/label/C_CamOgeLabStatusBar.cpp \
    $${PWD}/../src/util/C_UtiClipBoardHelper.cpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetClipBoardHelper.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/splitter/C_CamOgeSpi.cpp \
    $${PWD}/../src/opensyde_gui_elements/splitter/C_OgeSpiBase.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/widget/C_CamOgeWiSectionHeader.cpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabGenericNoPaddingNoMargins.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/widget/C_CamOgeWiSettingSubSection.cpp \
    $${PWD}/../src/opensyde_gui_elements/radio_button/C_OgeRabProperties.cpp \
    $${PWD}/../src/opensyde_gui_elements/radio_button/C_OgeRabToolTipBase.cpp \
    $${PWD}/../src/opensyde_gui_elements/frame/C_OgeFraSeparator.cpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubProjAction.cpp \
    $${PWD}/../src/opensyde_gui_elements/combo_box/C_OgeCbxToolTipBase.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/combo_box/C_CamOgeCbxWhite.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/push_button/C_CamOgePubAbout.cpp \
    $${PWD}/../src/can_monitor/message_generator/C_CamGenTableView.cpp \
    $${PWD}/../src/can_monitor/message_generator/C_CamGenTableModel.cpp \
    $${PWD}/../src/opensyde_gui_elements/line_edit/C_OgeLeContextMenuBase.cpp \
    $${PWD}/../src/opensyde_gui_elements/line_edit/C_OgeLeDark.cpp \
    $${PWD}/../src/util/C_UtiFindNameHelper.cpp \
    $${PWD}/../src/can_monitor/message_generator/C_CamGenMessagesWidget.cpp \
    $${PWD}/../src/can_monitor/project/C_CamProHandler.cpp \
    $${PWD}/../src/can_monitor/project/C_CamProHandlerFiler.cpp \
    $${PWD}/../src/can_monitor/project/C_CamProMessageData.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/push_button/C_CamOgePubProjOp.cpp \
    $${PWD}/../src/can_monitor/project/C_CamProClipBoardHelper.cpp \
    $${PWD}/../src/table_base/C_TblModelAction.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/push_button/C_CamOgePubSettingsAdd.cpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosFilterItemWidget.cpp \
    $${PWD}/../src/opensyde_gui_elements/C_OgeTransparentScrollArea.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/check_box/C_CamOgeChxSettings.cpp \
    $${PWD}/../src/opensyde_gui_elements/check_box/C_OgeChxToolTipBase.cpp \
    $${PWD}/../src/table_base/C_TblViewScroll.cpp \
    $${PWD}/../src/table_base/C_TblViewToolTipBase.cpp \
    $${PWD}/../src/table_base/C_TblDelegate.cpp \
    $${PWD}/../src/opensyde_gui_elements/line_edit/C_OgeLeToolTipBase.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/combo_box/C_CamOgeCbxTable.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/line_edit/C_CamOgeLeTableEdit.cpp \
    $${PWD}/../src/table_base/C_TblEditLineEditBase.cpp \
    $${PWD}/../src/opensyde_gui_elements/combo_box/C_OgeCbxIconDelegate.cpp \
    $${PWD}/../src/opensyde_gui_elements/combo_box/C_OgeCbxResizingView.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/group_box/C_CamOgeGbxMessageGeneratorBackground.cpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosFilterPopup.cpp \
    $${PWD}/../src/opensyde_gui_elements/line_edit/C_OgeLePropertiesName.cpp \
    $${PWD}/../src/opensyde_gui_elements/text_edit/C_OgeTedPropertiesComment.cpp \
    $${PWD}/../src/opensyde_gui_elements/text_edit/C_OgeTedToolTipBase.cpp \
    $${PWD}/../src/opensyde_gui_elements/text_edit/C_OgeTedContextMenuBase.cpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubConfigure.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/line_edit/C_CamOgeLeIdPopUp.cpp \
    $${PWD}/../src/opensyde_gui_elements/check_box/C_OgeChxProperties.cpp \
    $${PWD}/../src/opensyde_gui_elements/combo_box/C_OgeCbxText.cpp \
    $${PWD}/../src/opensyde_gui_elements/combo_box/C_OgeCbxIconOnly.cpp \
    $${PWD}/../src/can_monitor/project/C_CamProFilterData.cpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubIconOnly.cpp \
    $${PWD}/../src/opensyde_gui_elements/scroll_area/C_OgeSaMain.cpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosFilterTableView.cpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosFilterTableModel.cpp \
    $${PWD}/../src/can_monitor/message_generator/signals/C_CamGenSigTableView.cpp \
    $${PWD}/../src/can_monitor/message_generator/signals/C_CamGenSigTableModel.cpp \
    $${PWD}/../src/can_monitor/message_generator/signals/C_CamGenSigWidget.cpp \
    $${PWD}/../src/table_base/C_TblViewInteraction.cpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetTreeLoggerData.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/group_box/C_CamOgeGbxMessageSignalsBorder.cpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseItemWidget.cpp \
    $${PWD}/../src/can_monitor/project/C_CamProDatabaseData.cpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseBusSelectionPopup.cpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabHeadingGroupBold.cpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosSectionPopup.cpp \
    $${PWD}/../src/can_monitor/message_generator/signals/C_CamGenSigTableDelegate.cpp \
    $${PWD}/../src/can_monitor/message_generator/C_CamGenKeySelect.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/spin_box/C_CamOgeSpxProperties.cpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxAllBase.cpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxToolTipBase.cpp \
    $${PWD}/../src/opensyde_gui_elements/widget/C_OgeWiSpinBoxGroup.cpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxAutoFixBase.cpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxDoubleAutoFix.cpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxInt64.cpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxInt64AutoFix.cpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxDoubleToolTipBase.cpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxInt64ToolTipBase.cpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxDoubleDynamicDecimalsBase.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/widget/C_CamOgeWiSpinBoxGroupTable.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/combo_box/C_CamOgeCbxDark.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/push_button/C_CamOgePubDarkBrowse.cpp \
    $${PWD}/../src/can_monitor/project/C_CamProLoggingData.cpp \
    $${PWD}/../src/can_monitor/data_base/C_CamDbDbc.cpp \
    $${PWD}/../src/can_monitor/data_base/C_CamDbDbcMessageId.cpp \
    $${PWD}/../src/can_monitor/data_base/C_CamDbHandler.cpp \
    $${PWD}/../src/can_monitor/data_base/C_CamDbOsy.cpp \
    $${PWD}/../src/can_monitor/message_generator/signals/C_CamGenSigUtil.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/menu/C_CamOgeMuRecentProjects.cpp \
    $${PWD}/../src/opensyde_gui_elements/line_edit/C_OgeLeProperties.cpp \
    $${PWD}/../src/table_base/tree_base/C_TblTreDataElementSortFilter.cpp \
    $${PWD}/../src/opensyde_gui_elements/C_OgeTreeViewToolTipBase.cpp \
    $${PWD}/../src/system_definition/C_SdTooltipUtil.cpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseSelectionModel.cpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseSelectionPopup.cpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseSelectionView.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/combo_box/C_CamOgeCbxTableSmall.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/tool_button/C_CamOgeTobRecentProjects.cpp \
    $${PWD}/../src/opensyde_gui_elements/tool_button/C_OgeTobToolTipBase.cpp \
    $${PWD}/../src/can_monitor/util/C_CamUti.cpp \
    $${PWD}/../src/can_monitor/message_generator/C_CamGenTableDelegate.cpp \
    $${PWD}/../src/table_base/C_TblDelegateUtil.cpp \
    $${PWD}/../src/opensyde_gui_elements/C_OgeTreeToolTipBase.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/push_button/C_CamOgePubPathVariables.cpp \
    $${PWD}/../src/opensyde_gui_elements/line_edit/C_OgeLeFilePathBase.cpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/line_edit/C_CamOgeLeFilePath.cpp \
    $${PWD}/../src/opensyde_gui_elements/menu/C_OgeMuSections.cpp \
    $${PWD}/../src/table_base/tree_base/C_TblTreSimpleItem.cpp \
    $${PWD}/../src/table_base/tree_base/C_TblTreSimpleModel.cpp \
    $${PWD}/../src/opensyde_gui_elements/combo_box/C_OgeCbxTableBase.cpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetTreeLoggerDataGreyOutInformation.cpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubMessageCancel.cpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubMessageOk.cpp \
    $${PWD}/../src/can_monitor/table_base/C_CamTblDelegate.cpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetUtil.cpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetSettingsPopup.cpp \
    $${PWD}/../src/opensyde_gui_elements/combo_box/C_OgeCbxMultiSelect.cpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabElided.cpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxDoubleAutoFixCustomTrigger.cpp \
    $${PWD}/../src/can_monitor/data_base/C_CamDbOsyMessageId.cpp \
    $${PWD}/../src/can_monitor/data_base/C_CamDbOsyListId.cpp \
    $${PWD}/../src/can_monitor/data_base/C_CamDbDbcUnmappedMessageId.cpp

#using our standard compiler warning switches we will get some (non-critical) warnings in Scanner.cpp
#we do not want to modify that library (as it is auto generated)
#so we want to suppress those warnings
#to do that we define an additional compiler named "dbc_scanner" and assign Scanner.cpp to be built with that compiler
#see https://stackoverflow.com/questions/27683777/how-to-specify-compiler-flag-to-a-single-source-file-with-qmake
# for more information
*-g++* {
   SOURCES_DBC_SCANNER = $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/Scanner.cpp  #define sources to be built with additional compiler
   dbc_scanner.name = dbc_scanner
   dbc_scanner.input = SOURCES_DBC_SCANNER              #assign sources
   dbc_scanner.dependency_type = TYPE_C
   dbc_scanner.variable_out = OBJECTS
   dbc_scanner.output = ${QMAKE_VAR_OBJECTS_DIR}${QMAKE_FILE_IN_BASE}$${first(QMAKE_EXT_OBJ)}
   #invoke C compiler (as it's a C file)
   dbc_scanner.commands = $${QMAKE_CC} $(CFLAGS) $(INCPATH) -w -c ${QMAKE_FILE_IN} -o ${QMAKE_FILE_OUT}
   QMAKE_EXTRA_COMPILERS += dbc_scanner
}

#for MSVC: simply add the file to the standard compiler:
win32-msvc* {
SOURCES += $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/Scanner.cpp
}

PRECOMPILED_HEADER = $${PWD}/../src/precompiled_headers/can_monitor/precomp_headers.hpp

HEADERS  += \
    $${PWD}/../src/gettext/C_GtGetText.hpp \
    $${PWD}/../src/util/C_Uti.hpp \
    $${PWD}/../src/system_views/communication/C_SyvComMessageMonitor.hpp \
    $${PWD}/../src/system_views/communication/C_SyvComMessageLoggerFileBlf.hpp \
    $${PWD}/../src/system_views/communication/C_SyvComDriverThread.hpp \
    $${PWD}/../libs/flexlexer/FlexLexer.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/Attribute.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/AttributeDefinition.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/AttributeObjectType.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/AttributeRelation.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/AttributeValueType.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/BitTiming.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/ByteOrder.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/EnvironmentVariable.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/ExtendedMultiplexor.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/Message.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/Network.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/Node.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/Parser.hpp \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/Scanner.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/Signal.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/SignalGroup.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/SignalType.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/ValueDescriptions.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/ValueTable.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/ValueType.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/location.hh \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/platform.h \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/position.hh \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/stack.hh \
    $${PWD}/../libs/dbc_driver_library/src/Vector/DBC/vector_dbc_export.h \
    $${PWD}/../src/com_import_export/C_CieImportDbc.hpp \
    $${PWD}/../src/com_import_export/C_CieConverter.hpp \
    $${PWD}/../src/system_definition/node_edit/datapools/C_SdNdeDpContentUtil.hpp \
    $${PWD}/../src/project_operations/C_PopErrorHandling.hpp \
    $${PWD}/../src/opensyde_gui_elements/widget/C_OgeWiCustomMessage.hpp \
    $${PWD}/../src/opensyde_gui_elements/widget/C_OgeWiError.hpp \
    $${PWD}/../src/opensyde_gui_elements/C_OgePopUpDialog.hpp \
    $${PWD}/../src/opensyde_gui_elements/C_OgeOverlay.hpp \
    $${PWD}/../src/opensyde_gui_elements/group_box/C_OgeGbxMouseMove.hpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabHeadingMessage.hpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabDescriptionMessage.hpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubCancel.hpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubDialog.hpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubIconText.hpp \
    $${PWD}/../src/opensyde_gui_elements/text_browser/C_OgeTebMessageDetails.hpp \
    $${PWD}/../src/navigable_gui/C_NagToolTip.hpp \
    $${PWD}/../src/opensyde_gui_elements/widget/C_OgeWiUtil.hpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabPopUpTitle.hpp \
    $${PWD}/../src/help_engine/C_HeHandler.hpp \
    $${PWD}/../src/opensyde_gui_elements/group_box/C_OgeGbxHover.hpp \
    $${PWD}/../src/opensyde_gui_elements/group_box/C_OgeGbxTransparent.hpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabContextMenuBase.hpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabPopUpSubTitle.hpp \
    $${PWD}/../src/opensyde_gui_elements/frame/C_OgeFraBorder.hpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubStandard.hpp \
    $${PWD}/../src/opensyde_gui_elements/text_browser/C_OgeTebContextMenuBase.hpp \
    $${PWD}/../src/opensyde_gui_elements/group_box/C_OgeGbxToolTip.hpp \
    $${PWD}/../src/opensyde_gui_elements/group_box/C_OgeGbxToolTipBase.hpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabHeadingToolTip.hpp \
    $${PWD}/../src/opensyde_gui_elements/text_edit/C_OgeTedToolTipContent.hpp \
    $${PWD}/../src/opensyde_gui_elements/C_OgeContextMenu.hpp \
    $${PWD}/../src/opensyde_gui_elements/C_OgeToolTipBase.hpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubToolTipBase.hpp \
    $${PWD}/../src/can_monitor/C_CamMainWindow.hpp \
    $${PWD}/../src/opensyde_gui_elements/widget/C_OgeWiOnlyBackground.hpp \
    $${PWD}/../src/opensyde_gui_elements/widget/C_OgeWiWithToolTip.hpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetTreeDelegate.hpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetTreeGuiBuffer.hpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetTreeModel.hpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetTreeView.hpp \
    $${PWD}/../src/table_base/tree_base/C_TblTreItem.hpp \
    $${PWD}/../src/table_base/tree_base/C_TblTreModel.hpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubSvgIconOnly.hpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabSvgOnly.hpp \
    $${PWD}/../src/can_monitor/cam_constants.hpp \
    $${PWD}/../src/can_monitor/user_settings/C_UsHandler.hpp \
    $${PWD}/../src/can_monitor/user_settings/C_UsFiler.hpp \
    $${PWD}/../src/navigable_gui/C_NagAboutDialog.hpp \
    $${PWD}/../src/opensyde_gui_elements/group_box/C_OgeGbx.hpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabGroupItem.hpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabGroupItemValue.hpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabToolTipBase.hpp \
    $${PWD}/../src/can_monitor/C_CamComDriverBase.hpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetWidget.hpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetStatusBarWidget.hpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetControlBarWidget.hpp \
    $${PWD}/../src/can_monitor/message_generator/C_CamGenWidget.hpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosWidget.hpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDllWidget.hpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosFilterWidget.hpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseWidget.hpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosLoggingWidget.hpp \
    $${PWD}/../src/can_monitor/C_CamTitleBarWidget.hpp \
    $${PWD}/../src/can_monitor/util/C_CamUtiStyleSheets.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/label/C_CamOgeLabStatusBar.hpp \
    $${PWD}/../src/constants.hpp \
    $${PWD}/../src/util/C_UtiClipBoardHelper.hpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetClipBoardHelper.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/splitter/C_CamOgeSpi.hpp \
    $${PWD}/../src/opensyde_gui_elements/splitter/C_OgeSpiBase.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/widget/C_CamOgeWiSectionHeader.hpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabGenericNoPaddingNoMargins.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/widget/C_CamOgeWiSettingSubSection.hpp \
    $${PWD}/../src/opensyde_gui_elements/radio_button/C_OgeRabProperties.hpp \
    $${PWD}/../src/opensyde_gui_elements/radio_button/C_OgeRabToolTipBase.hpp \
    $${PWD}/../src/opensyde_gui_elements/frame/C_OgeFraSeparator.hpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubProjAction.hpp \
    $${PWD}/../src/opensyde_gui_elements/combo_box/C_OgeCbxToolTipBase.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/combo_box/C_CamOgeCbxWhite.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/push_button/C_CamOgePubAbout.hpp \
    $${PWD}/../src/can_monitor/message_generator/C_CamGenTableView.hpp \
    $${PWD}/../src/can_monitor/message_generator/C_CamGenTableModel.hpp \
    $${PWD}/../src/opensyde_gui_elements/line_edit/C_OgeLeContextMenuBase.hpp \
    $${PWD}/../src/opensyde_gui_elements/line_edit/C_OgeLeDark.hpp \
    $${PWD}/../src/util/C_UtiFindNameHelper.hpp \
    $${PWD}/../src/can_monitor/message_generator/C_CamGenMessagesWidget.hpp \
    $${PWD}/../src/can_monitor/project/C_CamProHandler.hpp \
    $${PWD}/../src/can_monitor/project/C_CamProHandlerFiler.hpp \
    $${PWD}/../src/can_monitor/project/C_CamProMessageData.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/push_button/C_CamOgePubProjOp.hpp \
    $${PWD}/../src/can_monitor/project/C_CamProClipBoardHelper.hpp \
    $${PWD}/../src/table_base/C_TblModelAction.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/push_button/C_CamOgePubSettingsAdd.hpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosFilterItemWidget.hpp \
    $${PWD}/../src/opensyde_gui_elements/C_OgeTransparentScrollArea.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/check_box/C_CamOgeChxSettings.hpp \
    $${PWD}/../src/opensyde_gui_elements/check_box/C_OgeChxToolTipBase.hpp \
    $${PWD}/../src/table_base/C_TblViewScroll.hpp \
    $${PWD}/../src/table_base/C_TblViewToolTipBase.hpp \
    $${PWD}/../src/table_base/C_TblDelegate.hpp \
    $${PWD}/../src/opensyde_gui_elements/line_edit/C_OgeLeToolTipBase.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/combo_box/C_CamOgeCbxTable.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/line_edit/C_CamOgeLeTableEdit.hpp \
    $${PWD}/../src/table_base/C_TblEditLineEditBase.hpp \
    $${PWD}/../src/opensyde_gui_elements/combo_box/C_OgeCbxIconDelegate.hpp \
    $${PWD}/../src/opensyde_gui_elements/combo_box/C_OgeCbxResizingView.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/group_box/C_CamOgeGbxMessageGeneratorBackground.hpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosFilterPopup.hpp \
    $${PWD}/../src/opensyde_gui_elements/line_edit/C_OgeLePropertiesName.hpp \
    $${PWD}/../src/opensyde_gui_elements/text_edit/C_OgeTedPropertiesComment.hpp \
    $${PWD}/../src/opensyde_gui_elements/text_edit/C_OgeTedToolTipBase.hpp \
    $${PWD}/../src/opensyde_gui_elements/text_edit/C_OgeTedContextMenuBase.hpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubConfigure.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/line_edit/C_CamOgeLeIdPopUp.hpp \
    $${PWD}/../src/opensyde_gui_elements/check_box/C_OgeChxProperties.hpp \
    $${PWD}/../src/opensyde_gui_elements/combo_box/C_OgeCbxText.hpp \
    $${PWD}/../src/opensyde_gui_elements/combo_box/C_OgeCbxIconOnly.hpp \
    $${PWD}/../src/can_monitor/project/C_CamProFilterData.hpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubIconOnly.hpp \
    $${PWD}/../src/opensyde_gui_elements/scroll_area/C_OgeSaMain.hpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosFilterTableView.hpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosFilterTableModel.hpp \
    $${PWD}/../src/can_monitor/message_generator/signals/C_CamGenSigTableView.hpp \
    $${PWD}/../src/can_monitor/message_generator/signals/C_CamGenSigTableModel.hpp \
    $${PWD}/../src/can_monitor/message_generator/signals/C_CamGenSigWidget.hpp \
    $${PWD}/../src/table_base/C_TblViewInteraction.hpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetTreeLoggerData.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/group_box/C_CamOgeGbxMessageSignalsBorder.hpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseItemWidget.hpp \
    $${PWD}/../src/can_monitor/project/C_CamProDatabaseData.hpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseBusSelectionPopup.hpp \
    $${PWD}/../libs/blf_driver_library/BLF.h \
    $${PWD}/../libs/blf_driver_library/BLF/AbstractFile.h \
    $${PWD}/../libs/blf_driver_library/BLF/AfdxFrame.h \
    $${PWD}/../libs/blf_driver_library/BLF/AfdxStatistic.h \
    $${PWD}/../libs/blf_driver_library/BLF/AppText.h \
    $${PWD}/../libs/blf_driver_library/BLF/AppTrigger.h \
    $${PWD}/../libs/blf_driver_library/BLF/CanDriverError.h \
    $${PWD}/../libs/blf_driver_library/BLF/CanDriverErrorExt.h \
    $${PWD}/../libs/blf_driver_library/BLF/CanDriverHwSync.h \
    $${PWD}/../libs/blf_driver_library/BLF/CanDriverStatistic.h \
    $${PWD}/../libs/blf_driver_library/BLF/CanErrorFrame.h \
    $${PWD}/../libs/blf_driver_library/BLF/CanErrorFrameExt.h \
    $${PWD}/../libs/blf_driver_library/BLF/CanFdErrorFrame64.h \
    $${PWD}/../libs/blf_driver_library/BLF/CanFdMessage.h \
    $${PWD}/../libs/blf_driver_library/BLF/CanFdMessage64.h \
    $${PWD}/../libs/blf_driver_library/BLF/CanMessage.h \
    $${PWD}/../libs/blf_driver_library/BLF/CanMessage2.h \
    $${PWD}/../libs/blf_driver_library/BLF/CanOverloadFrame.h \
    $${PWD}/../libs/blf_driver_library/BLF/CompressedFile.h \
    $${PWD}/../libs/blf_driver_library/BLF/config.h \
    $${PWD}/../libs/blf_driver_library/BLF/Doxygen.h \
    $${PWD}/../libs/blf_driver_library/BLF/DriverOverrun.h \
    $${PWD}/../libs/blf_driver_library/BLF/EnvironmentVariable.h \
    $${PWD}/../libs/blf_driver_library/BLF/EthernetFrame.h \
    $${PWD}/../libs/blf_driver_library/BLF/EthernetRxError.h \
    $${PWD}/../libs/blf_driver_library/BLF/EthernetStatus.h \
    $${PWD}/../libs/blf_driver_library/BLF/EventComment.h \
    $${PWD}/../libs/blf_driver_library/BLF/Exceptions.h \
    $${PWD}/../libs/blf_driver_library/BLF/File.h \
    $${PWD}/../libs/blf_driver_library/BLF/FileStatistics.h \
    $${PWD}/../libs/blf_driver_library/BLF/FlexRayData.h \
    $${PWD}/../libs/blf_driver_library/BLF/FlexRayStatusEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/FlexRaySync.h \
    $${PWD}/../libs/blf_driver_library/BLF/FlexRayV6Message.h \
    $${PWD}/../libs/blf_driver_library/BLF/FlexRayV6StartCycleEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/FlexRayVFrError.h \
    $${PWD}/../libs/blf_driver_library/BLF/FlexRayVFrReceiveMsg.h \
    $${PWD}/../libs/blf_driver_library/BLF/FlexRayVFrReceiveMsgEx.h \
    $${PWD}/../libs/blf_driver_library/BLF/FlexRayVFrStartCycle.h \
    $${PWD}/../libs/blf_driver_library/BLF/FlexRayVFrStatus.h \
    $${PWD}/../libs/blf_driver_library/BLF/GlobalMarker.h \
    $${PWD}/../libs/blf_driver_library/BLF/GpsEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/J1708Message.h \
    $${PWD}/../libs/blf_driver_library/BLF/KLineStatusEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinBaudrateEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinBusEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinChecksumInfo.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinCrcError.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinCrcError2.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinDatabyteTimestampEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinDisturbanceEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinDlcInfo.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinLongDomSignalEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinLongDomSignalEvent2.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinMessage.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinMessage2.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinMessageDescriptor.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinReceiveError.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinReceiveError2.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinSchedulerModeChange.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinSendError.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinSendError2.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinShortOrSlowResponse.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinSlaveTimeout.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinSleepModeEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinSpikeEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinSpikeEvent2.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinStatisticEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinSyncError.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinSyncError2.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinSynchFieldEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinUnexpectedWakeup.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinWakeupEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/LinWakeupEvent2.h \
    $${PWD}/../libs/blf_driver_library/BLF/LogContainer.h \
    $${PWD}/../libs/blf_driver_library/BLF/Most50Message.h \
    $${PWD}/../libs/blf_driver_library/BLF/Most50Pkt.h \
    $${PWD}/../libs/blf_driver_library/BLF/Most150AllocTab.h \
    $${PWD}/../libs/blf_driver_library/BLF/Most150Message.h \
    $${PWD}/../libs/blf_driver_library/BLF/Most150MessageFragment.h \
    $${PWD}/../libs/blf_driver_library/BLF/Most150Pkt.h \
    $${PWD}/../libs/blf_driver_library/BLF/Most150PktFragment.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostAllocTab.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostCtrl.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostDataLost.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostEcl.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostEthernetPkt.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostEthernetPktFragment.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostGenReg.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostHwMode.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostLightLock.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostNetState.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostPkt.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostPkt2.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostReg.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostSpy.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostStatistic.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostStatisticEx.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostStress.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostSystemEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostTrigger.h \
    $${PWD}/../libs/blf_driver_library/BLF/MostTxLight.h \
    $${PWD}/../libs/blf_driver_library/BLF/ObjectHeader.h \
    $${PWD}/../libs/blf_driver_library/BLF/ObjectHeader2.h \
    $${PWD}/../libs/blf_driver_library/BLF/ObjectHeaderBase.h \
    $${PWD}/../libs/blf_driver_library/BLF/platform.h \
    $${PWD}/../libs/blf_driver_library/BLF/RealtimeClock.h \
    $${PWD}/../libs/blf_driver_library/BLF/SerialEvent.h \
    $${PWD}/../libs/blf_driver_library/BLF/SystemVariable.h \
    $${PWD}/../libs/blf_driver_library/BLF/UncompressedFile.h \
    $${PWD}/../libs/blf_driver_library/BLF/vector_blf_export.h \
    $${PWD}/../libs/blf_driver_library/BLF/VectorTypes.h \
    $${PWD}/../libs/blf_driver_library/BLF/WlanFrame.h \
    $${PWD}/../libs/blf_driver_library/BLF/WlanStatistic.h \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabHeadingGroupBold.hpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosSectionPopup.hpp \
    $${PWD}/../src/can_monitor/message_generator/signals/C_CamGenSigTableDelegate.hpp \
    $${PWD}/../src/can_monitor/message_generator/C_CamGenKeySelect.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/spin_box/C_CamOgeSpxProperties.hpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxAllBase.hpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxToolTipBase.hpp \
    $${PWD}/../src/opensyde_gui_elements/widget/C_OgeWiSpinBoxGroup.hpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxAutoFixBase.hpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxDoubleAutoFix.hpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxInt64.hpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxInt64AutoFix.hpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxDoubleToolTipBase.hpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxInt64ToolTipBase.hpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxDoubleDynamicDecimalsBase.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/widget/C_CamOgeWiSpinBoxGroupTable.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/combo_box/C_CamOgeCbxDark.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/push_button/C_CamOgePubDarkBrowse.hpp \
    $${PWD}/../src/can_monitor/project/C_CamProLoggingData.hpp \
    $${PWD}/../src/can_monitor/data_base/C_CamDbDbc.hpp \
    $${PWD}/../src/can_monitor/data_base/C_CamDbDbcMessageId.hpp \
    $${PWD}/../src/can_monitor/data_base/C_CamDbHandler.hpp \
    $${PWD}/../src/can_monitor/data_base/C_CamDbOsy.hpp \
    $${PWD}/../src/can_monitor/message_generator/signals/C_CamGenSigUtil.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/menu/C_CamOgeMuRecentProjects.hpp \
    $${PWD}/../src/opensyde_gui_elements/line_edit/C_OgeLeProperties.hpp \
    $${PWD}/../src/table_base/tree_base/C_TblTreDataElementSortFilter.hpp \
    $${PWD}/../src/opensyde_gui_elements/C_OgeTreeViewToolTipBase.hpp \
    $${PWD}/../src/system_definition/C_SdTooltipUtil.hpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseSelectionModel.hpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseSelectionPopup.hpp \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseSelectionView.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/combo_box/C_CamOgeCbxTableSmall.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/tool_button/C_CamOgeTobRecentProjects.hpp \
    $${PWD}/../src/opensyde_gui_elements/tool_button/C_OgeTobToolTipBase.hpp \
    $${PWD}/../src/can_monitor/util/C_CamUti.hpp \
    $${PWD}/../src/can_monitor/message_generator/C_CamGenTableDelegate.hpp \
    $${PWD}/../src/table_base/C_TblDelegateUtil.hpp \
    $${PWD}/../src/opensyde_gui_elements/C_OgeTreeToolTipBase.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/push_button/C_CamOgePubPathVariables.hpp \
    $${PWD}/../src/opensyde_gui_elements/line_edit/C_OgeLeFilePathBase.hpp \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/line_edit/C_CamOgeLeFilePath.hpp \
    $${PWD}/../src/opensyde_gui_elements/menu/C_OgeMuSections.hpp \
    $${PWD}/../src/table_base/tree_base/C_TblTreSimpleItem.hpp \
    $${PWD}/../src/table_base/tree_base/C_TblTreSimpleModel.hpp \
    $${PWD}/../src/opensyde_gui_elements/combo_box/C_OgeCbxTableBase.hpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetTreeLoggerDataGreyOutInformation.hpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubMessageCancel.hpp \
    $${PWD}/../src/opensyde_gui_elements/push_button/C_OgePubMessageOk.hpp \
    $${PWD}/../src/can_monitor/table_base/C_CamTblDelegate.hpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetUtil.hpp \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetSettingsPopup.hpp \
    $${PWD}/../src/opensyde_gui_elements/combo_box/C_OgeCbxMultiSelect.hpp \
    $${PWD}/../src/opensyde_gui_elements/label/C_OgeLabElided.hpp \
    $${PWD}/../src/opensyde_gui_elements/spin_box/C_OgeSpxDoubleAutoFixCustomTrigger.hpp \
    $${PWD}/../src/can_monitor/data_base/C_CamDbOsyMessageId.hpp \
    $${PWD}/../src/can_monitor/data_base/C_CamDbOsyListId.hpp \
    $${PWD}/../src/can_monitor/data_base/C_CamDbDbcUnmappedMessageId.hpp

FORMS    += \
    $${PWD}/../src/opensyde_gui_elements/widget/C_OgeWiCustomMessage.ui \
    $${PWD}/../src/opensyde_gui_elements/widget/C_OgeWiError.ui \
    $${PWD}/../src/opensyde_gui_elements/C_OgePopUpDialog.ui \
    $${PWD}/../src/navigable_gui/C_NagToolTip.ui \
    $${PWD}/../src/can_monitor/C_CamMainWindow.ui \
    $${PWD}/../src/navigable_gui/C_NagAboutDialog.ui \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetWidget.ui \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetStatusBarWidget.ui \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetControlBarWidget.ui \
    $${PWD}/../src/can_monitor/message_generator/C_CamGenWidget.ui \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosWidget.ui \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDllWidget.ui \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosFilterWidget.ui \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseWidget.ui \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosLoggingWidget.ui \
    $${PWD}/../src/can_monitor/C_CamTitleBarWidget.ui \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/widget/C_CamOgeWiSectionHeader.ui \
    $${PWD}/../src/can_monitor/can_monitor_gui_elements/widget/C_CamOgeWiSettingSubSection.ui \
    $${PWD}/../src/can_monitor/message_generator/C_CamGenMessagesWidget.ui \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosFilterItemWidget.ui \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosFilterPopup.ui \
    $${PWD}/../src/can_monitor/message_generator/signals/C_CamGenSigWidget.ui \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseItemWidget.ui \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseBusSelectionPopup.ui \
    $${PWD}/../src/can_monitor/message_generator/C_CamGenKeySelect.ui \
    $${PWD}/../src/opensyde_gui_elements/widget/C_OgeWiSpinBoxGroup.ui \
    $${PWD}/../src/can_monitor/can_monitor_settings/C_CamMosDatabaseSelectionPopup.ui \
    $${PWD}/../src/can_monitor/message_trace/C_CamMetSettingsPopup.ui

INCLUDEPATH += $${PWD}/../src \
               $${PWD}/../src/can_monitor \
               $${PWD}/../src/can_monitor/data_base \
               $${PWD}/../src/can_monitor/project \
               $${PWD}/../src/can_monitor/user_settings \
               $${PWD}/../src/can_monitor/message_trace \
               $${PWD}/../src/can_monitor/can_monitor_settings \
               $${PWD}/../src/can_monitor/message_generator \
               $${PWD}/../src/can_monitor/message_generator/signals \
               $${PWD}/../src/can_monitor/can_monitor_gui_elements \
               $${PWD}/../src/can_monitor/can_monitor_gui_elements/check_box \
               $${PWD}/../src/can_monitor/can_monitor_gui_elements/combo_box \
               $${PWD}/../src/can_monitor/can_monitor_gui_elements/group_box \
               $${PWD}/../src/can_monitor/can_monitor_gui_elements/push_button \
               $${PWD}/../src/can_monitor/can_monitor_gui_elements/label \
               $${PWD}/../src/can_monitor/can_monitor_gui_elements/line_edit \
               $${PWD}/../src/can_monitor/can_monitor_gui_elements/menu \
               $${PWD}/../src/can_monitor/can_monitor_gui_elements/splitter \
               $${PWD}/../src/can_monitor/can_monitor_gui_elements/spin_box \
               $${PWD}/../src/can_monitor/can_monitor_gui_elements/tool_button \
               $${PWD}/../src/can_monitor/can_monitor_gui_elements/widget \
               $${PWD}/../src/can_monitor/table_base \
               $${PWD}/../src/can_monitor/util \
               $${PWD}/../src/help_engine \
               $${PWD}/../src/opensyde_gui_elements \
               $${PWD}/../src/opensyde_gui_elements/check_box \
               $${PWD}/../src/opensyde_gui_elements/combo_box \
               $${PWD}/../src/opensyde_gui_elements/frame \
               $${PWD}/../src/opensyde_gui_elements/group_box \
               $${PWD}/../src/opensyde_gui_elements/label \
               $${PWD}/../src/opensyde_gui_elements/line_edit \
               $${PWD}/../src/opensyde_gui_elements/menu \
               $${PWD}/../src/opensyde_gui_elements/push_button \
               $${PWD}/../src/opensyde_gui_elements/radio_button \
               $${PWD}/../src/opensyde_gui_elements/splitter \
               $${PWD}/../src/opensyde_gui_elements/spin_box \
               $${PWD}/../src/opensyde_gui_elements/scroll_area \
               $${PWD}/../src/opensyde_gui_elements/text_browser \
               $${PWD}/../src/opensyde_gui_elements/text_edit \
               $${PWD}/../src/opensyde_gui_elements/tool_button \
               $${PWD}/../src/opensyde_gui_elements/widget \
               $${PWD}/../src/navigable_gui \
               $${PWD}/../src/com_import_export \
               $${PWD}/../src/table_base \
               $${PWD}/../src/table_base/tree_base \
               $${PWD}/../src/system_definition \
               $${PWD}/../src/system_definition/node_edit/datapools \
               $${PWD}/../src/system_views/communication \
               $${PWD}/../src/project_operations/ \
               $${PWD}/../src/gettext \
               $${PWD}/../src/util \
               $${PWD}/../src/precompiled_headers/can_monitor \
               $${PWD}/../libs/flexlexer \
               $${PWD}/../libs/dbc_driver_library/src \
               $${PWD}/../libs/dbc_driver_library/src/Vector \
               $${PWD}/../libs/blf_driver_library

#do not issue deprecation warnings (tested code can contain deprecated functions which we do want to provide)
*-g++* {
QMAKE_CXXFLAGS += -Wno-deprecated-declarations
}

linux {
#"Note that on GNU systems, you don’t need to link with libintl because the gettext library functions are already contained in GNU libc."

LIBS += -L$${PWD}/../libs/blf_driver_library -lvector_blf_linux

LIBS += -lz  #used by BLF library

}

win32 {
LIBS += -L$${PWD}/../libs/gettext -lintl \
        -L$${PWD}/../libs/blf_driver_library -lvector_blf \
        -lz

LIBS += -lws2_32   #WinSock
LIBS += -lIphlpapi #IP helper API

#add windows API libraries
LIBS += -lversion
}

QMAKE_TARGET_COMPANY = STW
QMAKE_TARGET_PRODUCT = openSYDE CAN Monitor
#QMAKE_TARGET_DESCRIPTION = TODO
#See C coding rules v4.00r0
QMAKE_TARGET_COPYRIGHT = STW (c) 2018

DISTFILES +=

RESOURCES += \
    $${PWD}/../src/can_monitor/cam_application.qrc

#compiler with function intrumentation (for "Embedded Profiler")
#QMAKE_CXXFLAGS += -finstrument-functions
#workaround for https://bugreports.qt.io/browse/QTBUG-35884 (for "Embedded Profiler")
#QMAKE_CXXFLAGS += -finstrument-functions-exclude-function-list=load,store
#create map file
#QMAKE_LFLAGS += -Wl,-Map=qt_test.map
#libraries for "Embedded Profiler"
#LIBS += -L$$PWD/eprofiler-windows32-mingw-intel-1.2.3/EProfiler/windows32-mingw-intel/lib/ -lEProfilerStatic
#LIBS += -lpthread
