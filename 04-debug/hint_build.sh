# Hinting the installation of software package that is installed outside of a system paths works can also be done with environment variables. In CMake 3.12+, individual packages locations can be hinted by setting their installation root path in <PackageName>_ROOT.
export HDF5_ROOT=$HOME/software/hdf5-1.12.0

export CMAKE_PREFIX_PATH=$HOME/software/hdf5-1.12.0:$HOME/software/boost-1.74.0:$CMAKE_PREFIX_PATH

###
# nstalled package SHOULD!!! provide its own details to CMake
# Always supply <package>Config.cmake !!!
# for dependencies, try look for Config first
# such libraries are ROOT and BOOST
