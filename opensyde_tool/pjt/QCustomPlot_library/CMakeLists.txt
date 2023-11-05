cmake_minimum_required(VERSION 3.14)

project(QCustomPlot_library LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Widgets)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets)

add_library(QCustomPlot_library STATIC
   ../../../libraries/qcustomplot-2.0.1/qcustomplot.cpp
   ../../../libraries/qcustomplot-2.0.1/qcustomplot.h
)

target_link_libraries(QCustomPlot_library PRIVATE Qt${QT_VERSION_MAJOR}::Widgets)

target_compile_definitions(QCustomPlot_library PRIVATE QCUSTOMPLOT_LIBRARY_LIBRARY)
