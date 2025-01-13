### ---
# default to empty build type neither optimized nor debug. 
#

cmake -S . -B build-debug -DCMAKE_BUILD_TYPE=Debug
cmake --build build-debug
gdb build-debug/simple_example

