# minimum 3.16 for precompiled headers
cmake_minimum_required(VERSION 3.16)
project("stw_class_library")

# --- Project source files ---------------------------------------------------------------------------------------------
set(SCL_SOURCES
   ${CMAKE_CURRENT_SOURCE_DIR}/C_SclChecksums.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/C_SclChecksums.hpp
   ${CMAKE_CURRENT_SOURCE_DIR}/C_SclDateTime.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/C_SclDateTime.hpp
   ${CMAKE_CURRENT_SOURCE_DIR}/C_SclDynamicArray.hpp
   ${CMAKE_CURRENT_SOURCE_DIR}/C_SclIniFile.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/C_SclIniFile.hpp
   ${CMAKE_CURRENT_SOURCE_DIR}/C_SclString.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/C_SclString.hpp
   ${CMAKE_CURRENT_SOURCE_DIR}/C_SclStringList.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/C_SclStringList.hpp
)

set(SCL_INCLUDE_DIRECTORIES
   ${CMAKE_CURRENT_SOURCE_DIR}
   ${CMAKE_CURRENT_SOURCE_DIR}/../stwtypes
)

# define library target including all sources (OBJECT: just drag in sources, do not really build as separate library)
add_library(stw_class_library ${SCL_SOURCES})

# add path to "local" precompiled_header.hpp but do *not* add to public path (so application can provide its own precompiled_headers.hpp)
target_include_directories(stw_class_library BEFORE PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../precompiled_headers)
# make precompiled_header file known
target_precompile_headers(stw_class_library PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../precompiled_headers/precomp_headers.hpp)

# add all include directories to library target and make public
target_include_directories(stw_class_library PUBLIC ${SCL_INCLUDE_DIRECTORIES})
