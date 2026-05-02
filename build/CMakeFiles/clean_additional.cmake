# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appmokmcompositor_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appmokmcompositor_autogen.dir/ParseCache.txt"
  "appmokmcompositor_autogen"
  "src/functions/core/CMakeFiles/core_autogen.dir/AutogenUsed.txt"
  "src/functions/core/CMakeFiles/core_autogen.dir/ParseCache.txt"
  "src/functions/core/core_autogen"
  "src/functions/database/CMakeFiles/database_autogen.dir/AutogenUsed.txt"
  "src/functions/database/CMakeFiles/database_autogen.dir/ParseCache.txt"
  "src/functions/database/database_autogen"
  "src/functions/ffmpeg_wrapper/CMakeFiles/ffmpeg_wrapper_autogen.dir/AutogenUsed.txt"
  "src/functions/ffmpeg_wrapper/CMakeFiles/ffmpeg_wrapper_autogen.dir/ParseCache.txt"
  "src/functions/ffmpeg_wrapper/ffmpeg_wrapper_autogen"
  "src/functions/timeline/CMakeFiles/timeline_functions_autogen.dir/AutogenUsed.txt"
  "src/functions/timeline/CMakeFiles/timeline_functions_autogen.dir/ParseCache.txt"
  "src/functions/timeline/timeline_functions_autogen"
  )
endif()
