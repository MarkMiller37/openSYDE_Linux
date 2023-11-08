# minimum 3.16 for precompiled headers
cmake_minimum_required(VERSION 3.16)
project("stw_target_glue_layer")

# --- Project source files ---------------------------------------------------------------------------------------------
set(TGL_SOURCES
   ${CMAKE_CURRENT_SOURCE_DIR}/TglFile.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/TglFile.hpp
   ${CMAKE_CURRENT_SOURCE_DIR}/TglTasks.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/TglTasks.hpp
   ${CMAKE_CURRENT_SOURCE_DIR}/TglTime.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/TglTime.hpp
   ${CMAKE_CURRENT_SOURCE_DIR}/TglUtils.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/TglUtils.hpp   
)

set(TGL_INCLUDE_DIRECTORIES
   ${CMAKE_CURRENT_SOURCE_DIR}
   ${CMAKE_CURRENT_SOURCE_DIR}/../../
   ${CMAKE_CURRENT_SOURCE_DIR}/../../stwtypes
)

# define library target including all sources (OBJECT: just drag in sources, do not really build as separate library)
add_library(stw_target_glue_layer ${TGL_SOURCES})

target_link_libraries(stw_target_glue_layer PUBLIC stw_class_library)

# add path to "local" precompiled_header.hpp but do *not* add to public path (so application can provide its own precompiled_headers.hpp)
target_include_directories(stw_target_glue_layer BEFORE PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../../precompiled_headers)
# make precompiled_header file known
target_precompile_headers(stw_target_glue_layer PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../../precompiled_headers/precomp_headers.hpp)

# add all include directories to library target and make public
target_include_directories(stw_target_glue_layer PUBLIC ${TGL_INCLUDE_DIRECTORIES})
