# openSYDE

openSYDE by STW (https://www.stw-mobile-machines.com/) is a software toolchain that supports implementation, commissioning, analysis and maintenance of control systems for mobile machines.

Purpose of this fork: Try to get the tool(s) ported to desktop linux with 64bit compiler.

Status:
* GUI builds and basic workflows look useable
* GUI projects can be loaded and saved
* Dashboard connect via CAN results in messages being seen on virtual socket CAN
** no full communication cycle done
* CAN Monitor, SYDE Coder C Not touched yet
* GUI has not been verified to still build and behave as expected on Windows

Used tool versions:
* Ubuntu: 23.10
* Qt Creator: 10.0.2
* Qt: 5.15.10
* GCC: Ubuntu 13.2.0-4ubuntu3 (64bit)

Used libraries:
* gettext / libintl: part of glibc under Linux (2.38.1ubuntu6)
* openssl: 3.0.10-1ubuntu2.1
* QCustomPlot: built static library from the sources provided with the Windows release
** dragging the sources in directly caused issues as the sources use Qt macros which are deactivated in the GUI build via "no_keywords"
** See pjt/QCustomPlot_library
** copied result to libs/qcustomplot
* BLF (for CAN Monitor): Same approach as QCustomPlot (adding the sources caused conflicts with DBC as files have the same names).

Known issues:
* tooltips behave oddly
* positions of some widgets are off in the UI
* Calling external tools:
** .chm user manual cannot directly be invoked from UI; needs work in C_HeHandler
** IDE cannot directly be invoked from UI; needs work in C_ImpUtil::h_OpenIde
* No alternative approach for QWinTaskbarProgress implemented; rescinded in Qt6 anyway
** needs cleanup in C_SyvUpInformationWidget, C_SyvUpSummaryWidget, C_SyvUpInformationWidget
** see https://forum.qt.io/topic/131934/is-there-an-alternative-to-qwintaskbarbutton-in-qt-6
* CAN "DLLs":
** C_SyvSeDllConfigurationDialog needs cleanup; no interactive configuration or "TestConnection" for Linux
** "DLL_Open", "DLL_Close", "CAN_Status" not available for Linux; calls have been #ifdefed and need cleanup
** Setting bitrate not implemented; needs to be added in C_CAN.cpp via socket CAN
* Ethernet driver:
** instancing Windows or Linux driver is #ifdefed, need cleanup
* C_GiSvPc::mh_GetIsLaptop should be refactored to Tgl

Setting up virtual CAN interface:
https://www.pragmaticlinux.com/2021/10/how-to-create-a-virtual-can-interface-on-linux/
Then use e.g. manual DLL configuration with path "vcan0"

