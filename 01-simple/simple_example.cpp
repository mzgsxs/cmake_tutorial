// This is an example file as part of Modern-CMake

#include "simple_lib.hpp"

#ifndef MYLIB_PUBLIC
#error "Must have MYLIB_PUBLIC defined"
#endif

#ifdef MYLIB_PRIVATE
#error "Must not have MYLIB_PRIVATE defined"
#endif


#include "Utils/MathUtils.h"
#include "Utils/StringUtils.h"
#include<string> 



#include <iostream>
int main() {

    std::cout << "Simple example C++ compiled correctly and ran." << std::endl;
    std::cout << simple_lib_function() << std::endl;

    // Using MathUtils constants and functions
    std::cout << "PI: " << Utils::PI << std::endl;

    int sum = Utils::Add(3, 5);  // This will call the function from the 
    std::cout << "Sum: " << sum << std::endl;

    std::string s{"aduwq"};
    Utils::Print(s);

    return 0;
}
