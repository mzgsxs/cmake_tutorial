cmake_minimum_required(VERSION 3.15..3.25)

project(MyProject LANGUAGES CXX)

# subfolder files visibility
add_library(simple_lib lib/simple_lib.cpp lib/simple_lib.hpp)
target_include_directories(simple_lib PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/lib")

# marco visibility
target_compile_definitions(simple_lib PUBLIC MYLIB_PUBLIC)
target_compile_definitions(simple_lib PRIVATE MYLIB_PRIVATE)



### ---------------------------------------------------------


### ---------------------------------------------------------



### ---------------------------------------------------------
### interface specifies no cource is necessary

# Create a static library from the precompiled object file
# without IMPORTED, source code is reuiqred
add_library(MathUtils STATIC IMPORTED)
# Specify the location of the precompiled object file
set_target_properties(MathUtils PROPERTIES
    IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/obj/MathUtils.o  # Use .o for Linux/macOS
    INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_SOURCE_DIR}/include
)

# (alternative) Explicitly - Specify the include directory for the MathUtils library
#target_include_directories(MathUtils INTERFACE ${CMAKE_SOURCE_DIR}/include)

### ---------------------------------------------------------



### ---------------------------------------------------------
# Header-only libraries in C++ are a type of library where all the code 
# (both declarations and implementations) resides in header files
add_library(StringUtils INTERFACE)
set_target_properties(StringUtils PROPERTIES
    # if imported, usually /external/path/include
    INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_SOURCE_DIR}/include 
    INTERFACE_COMPILE_DEFINITIONS STRINGUTILS_HEADER_ONLY=1
)

# (alternative) Explicitly 
#target_include_directories(StringUtils INTERFACE ${CMAKE_SOURCE_DIR}/include)
#target_compile_definitions(StringUtils INTERFACE STRINGUTILS_HEADER_ONLY=1)

# Below export is not possible if 
# Export MyLib for use in other projects
# more on this later
#target_include_directories(StringUtils INTERFACE
#    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
#    $<INSTALL_INTERFACE:include>
#)
#install(TARGETS StringUtils EXPORT StringUtilsTargets)
#install(EXPORT StringUtilsTargets DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/export)

### ---------------------------------------------------------


# cpp version feature control
target_compile_features(simple_lib PUBLIC cxx_std_11)

add_executable(myexample simple_example.cpp)
# must link if this library is used 
target_link_libraries(myexample PUBLIC simple_lib) 
target_link_libraries(myexample PRIVATE MathUtils)
