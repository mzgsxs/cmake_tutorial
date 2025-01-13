# Works with 3.15 and tested through 3.21
cmake_minimum_required(VERSION 3.15...3.25)




# Project name and a few useful settings. Other commands can pick up the results
project(
  ModernCMakeExample
  VERSION 0.1
  DESCRIPTION "An example project with CMake"
  LANGUAGES CXX)



### ----
# prevents insource build
# this has to be placed after project(...)
# otherwise PROJECT_BINARY_DIR is not set yet
### ----
### Require out-of-source builds
file(TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/CMakeLists.txt" LOC_PATH)
message(STATUS "Checking for CMakeLists.txt at: ${LOC_PATH}")
if(EXISTS "${LOC_PATH}")
    message(FATAL_ERROR "You cannot build in a source directory (or any directory with "
                        "CMakeLists.txt file). Please make a build subdirectory. Feel free to "
                        "remove CMakeCache.txt and CMakeFiles.")
endif()





# Only do these if this is the main project, and not if it is included through
# add_subdirectory
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  message(STATUS "Building MyProject as standalone")
  # Optionally set things like CMAKE_CXX_STANDARD,
  # CMAKE_POSITION_INDEPENDENT_CODE here

  # Let's ensure -std=c++xx instead of -std=g++xx
  set(CMAKE_CXX_EXTENSIONS OFF)

  # Let's nicely support folders in IDE's
  set_property(GLOBAL PROPERTY USE_FOLDERS ON)


  ### ----
  # this will define BUILD_TESTING and default to ON
  ### ----
  # Testing only available if this is the main app. Note this needs to be done
  # in the main CMakeLists since it calls enable_testing, which must be in the
  # main CMakeLists.
  include(CTest)

  # Docs only available if this is the main app
  find_package(Doxygen)
  if(Doxygen_FOUND)
    add_subdirectory(docs)
  else()
    message(STATUS "Doxygen not found, not building docs")
  endif()
endif()





### ----
# download, build and integrate specified package 
### ----
# FetchContent added in CMake 3.11, downloads during the configure step
# FetchContent_MakeAvailable was not added until CMake 3.14
include(FetchContent)

# Formatting library, adds fmt::fmt Always use the full git hash, not the tag,
# safer and faster to recompile
FetchContent_Declare(
  fmtlib
  GIT_REPOSITORY https://github.com/fmtlib/fmt.git
  GIT_TAG 8.0.1)
FetchContent_MakeAvailable(fmtlib)


### ----
# find pre-installed packages, for small to mid size project
### ----
# Accumulator library This is header only, so could be replaced with git
# submodules or FetchContent
find_package(Boost REQUIRED)
# Adds Boost::boost / Boost::headers (newer FindBoost / BoostConfig 3.15 name)



# The compiled library code is here
add_subdirectory(src)

# The executable code is here
add_subdirectory(apps)

# Testing only available if this is the main app
if(BUILD_TESTING)
  add_subdirectory(tests)
endif()
