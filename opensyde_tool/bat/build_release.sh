#!/bin/bash

# build GUI application

echo "create build directory 'temp_openSYDE_Release'"
rm -rf ../temp_openSYDE_Release
mkdir ../temp_openSYDE_Release
cd ../temp_openSYDE_Release

# this step is always needed
# CMAKE_EXPORT_COMPILE_COMMANDS: create compile commands in json-format (to be used by cppcheck)
echo "configure with cmake"
cmake -S ../pjt/openSYDE -B ../temp_openSYDE_Release -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

echo "build with cmake/ninja"
cmake --build . --parallel 4 --target all install

#return
cd ../bat

