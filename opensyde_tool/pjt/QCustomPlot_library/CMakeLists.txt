cmake_minimum_required(VERSION 3.14)

project(QCustomPlot_library LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 COMPONENTS Core Widgets)
if (Qt6_FOUND)
   message("Qt6 found")
else()
   message("Qt6 not found, trying Qt 5.15")
   find_package(Qt5 5.15 REQUIRED COMPONENTS Widgets)
endif()


find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Widgets)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets)

add_library(QCustomPlot_library STATIC
   ../../../libraries/qcustomplot-2.1.1/qcustomplot.cpp
   ../../../libraries/qcustomplot-2.1.1/qcustomplot.h
)

if (Qt6_FOUND)
   target_link_libraries(QCustomPlot_library PRIVATE Qt::Core Qt::Widgets)
else()
   target_link_libraries(QCustomPlot_library PRIVATE Qt::Widgets)
endif()

target_compile_definitions(QCustomPlot_library PRIVATE QCUSTOMPLOT_LIBRARY_LIBRARY)
