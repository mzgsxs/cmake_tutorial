cmake_minimum_required(VERSION 3.15...3.25)

project(MyDebugExample LANGUAGES C)

set(SOURCES simple_lib.c)
set(HEADERS simple_lib.h)

###---
# convinient alternative to message
###---
include(CMakePrintHelpers)
cmake_print_variables(SOURCES)

add_library(simple_lib ${SOURCES} ${HEADERS})
### ---
# Set POSITION_INDEPENDENT_CODE explicitly (optional)
set_target_properties(simple_lib PROPERTIES POSITION_INDEPENDENT_CODE ON)
cmake_print_properties(
    TARGETS simple_lib
    PROPERTIES POSITION_INDEPENDENT_CODE
)


add_executable(simple_example simple_example.c)

target_link_libraries(simple_example PUBLIC simple_lib)

## Does -lm work? (notice this is find_library, not find_package) Saves the
## location of the m library in a variable named MATH_LIBRARY
#find_library(MATH_LIBRARY m)
#
## If there is a -lm, let's use it
#if(MATH_LIBRARY)
#  target_link_libraries(simple_lib PUBLIC ${MATH_LIBRARY})
#endif()

# Portability Issues:On Windows, might need a `.lib` file instead of `.so`.
# Lack of Dependency Management

cmake_print_variables(CMAKE_MODULE_PATH)
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})
find_package(Math REQUIRED)
target_link_libraries(simple_lib PUBLIC Math::Math)

