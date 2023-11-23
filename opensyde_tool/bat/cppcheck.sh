#!/bin/bash

# perform Cppcheck (to be run after build_release.sh)

echo "Performing Cppcheck"
cd ..
cppcheck . --project=temp_openSYDE_Release/compile_commands.json \
   --enable=all  \
   --suppress=missingInclude \
   --suppress=missingIncludeSystem \
   --suppress=noExplicitConstructor \
   --suppress=missingOverride \
   --suppress=unknownMacro \
   -ilibs/opensyde_core/xml_parser/tinyxml2 \
   -ilibs/dbc_driver_library/src/Vector/DBC
cd bat


