# This is a CMake script
message(STATUS "Starting script")

set(MY_LOCAL_VAR "This is local")
message(STATUS "${MY_LOCAL_VAR}")
message(STATUS "${MY_VARIABLE}")

file(GLOB OUTPUT_VAR *.cxx)
message(STATUS "${OUTPUT_VAR}")

#file(GLOB_RECURSE OUTPUT_VAR *.cxx)
#message(STATUS "${OUTPUT_VAR}")

# check for new files with CONFIGURE_DEPENDS
file(GLOB_RECURSE OUTPUT_VAR *.cxx)
message(STATUS "${OUTPUT_VAR}")

# list, a; b; c
set(VAR a b c)
# dont use space, eg
# set(MY_DIR "/path/with spaces/")
# target_include_directories(target PRIVATE ${MY_DIR})
# is equvalent to
# target_include_directories(target PRIVATE /path/with spaces/)
