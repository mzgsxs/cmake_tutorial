cmake_minimum_required(VERSION 3.12) # CONFIGURE_DEPENDS requires CMake 3.12 or later
project(MyProject)

# Use file(GLOB) with CONFIGURE_DEPENDS to automatically detect source files
file(GLOB SOURCES CONFIGURE_DEPENDS *.cxx *.h)

# Create an executable target using the dynamically generated file list
add_executable(MyExecutable ${SOURCES})

