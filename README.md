# openSYDE

openSYDE by STW (https://www.stw-mobile-machines.com/) is a software toolchain that supports implementation, commissioning, analysis and maintenance of control systems for mobile machines.

Purpose of this fork: 
* Try to get the tool(s) ported to desktop linux with 64bit compiler
* Convert from qmake to cmake project
* Upgrade to Qt 6.6

Status:
* GUI, CAN Monitor, SYDE Coder C build
* GUI basic workflows look useable
* Dashboard connect via CAN results in messages being seen on virtual socket CAN
  * no full communication cycle done
* CAN Monitor
  * UI looks good
  * GUI Dashboard connect services can be seen in trace Window on virtual socket CAN
  * Sending between multiple instances of CAN Monitor looks good
* GUI has not been verified to still build and behave as expected on Windows
* GUI and CAN Monitor projects were converted to cmake
* Communication via Ethernet not checked

Used tool versions:
* Ubuntu: 23.10
* Qt Creator: 11.0.3
* Qt: 6.6.0
* GCC: Ubuntu 13.2.0-4ubuntu3 (64bit)

Used libraries:
* gettext / libintl: part of glibc under Linux (2.38.1ubuntu6)
* openssl: 3.0.10-1ubuntu2.1
* QCustomPlot: built static library from the sources provided with the Windows release
  * dragging the sources in directly caused issues as the sources use Qt macros which are deactivated in the GUI build via "no_keywords"
  * See pjt/QCustomPlot_library
  * copied result to libs/qcustomplot
  * Upgraded to V2.1.1 (as 2.0.1 is not compatible with Qt6)
* BLF (for CAN Monitor): Same approach as QCustomPlot (adding the sources caused conflicts with DBC as files have the same names).

Known issues:
* A few changes needed to be made due to Qt API incompatibilities between V5 and V6
  * Inspection and regression test needed
* tooltips behave oddly
  * Something seems to be wrong with the "leave" detection. It triggers even when not leaving.
  * "if (rect().contains(mapFromGlobal(QCursor::pos())) == false)" before calling "m_HideToolTip" seems to help
* positions of some widgets are off in the UI
* calling external tools:
  * .chm user manual cannot directly be invoked from UI; needs work in C_HeHandler
  * IDE cannot directly be invoked from UI; needs work in C_ImpUtil::h_OpenIde
* no alternative approach for QWinTaskbarProgress implemented; rescinded in Qt6 anyway
  * needs cleanup in C_SyvUpInformationWidget, C_SyvUpSummaryWidget, C_SyvUpInformationWidget
  * see https://forum.qt.io/topic/131934/is-there-an-alternative-to-qwintaskbarbutton-in-qt-6
* CAN "DLLs":
  * C_SyvSeDllConfigurationDialog needs cleanup; no interactive configuration for Linux
  * "DLL_Open" and "DLL_Close" not available for Linux; calls have been #ifdefed and need cleanup
  * "DLL_Status" used by CAN Monitor not available for Linux; #ifdefed to return a bitrate of 125kBit/s; needs cleanup
  * Setting bitrate not implemented; needs to be added in C_CAN.cpp via socket CAN
* Ethernet driver:
  * instancing Windows or Linux driver is #ifdefed, need cleanup
* C_GiSvPc::mh_GetIsLaptop should be refactored to Tgl
* version number reported in about dialog is not correct for CAN Monitor; needs work

Setting up virtual CAN interface:
https://www.pragmaticlinux.com/2021/10/how-to-create-a-virtual-can-interface-on-linux/
Then use e.g. manual DLL configuration with path "vcan0" in GUI and CAN Monitor

