find_library(MATH_LIBRARY NAMES math m PATHS /usr/lib /usr/local/lib)
find_path(MATH_INCLUDE_DIR NAMES math.h PATHS /usr/include /usr/local/include)

if(MATH_LIBRARY AND MATH_INCLUDE_DIR)
    set(Math_FOUND TRUE)
    add_library(Math::Math INTERFACE IMPORTED)
    set_target_properties(Math::Math PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${MATH_INCLUDE_DIR}"
        INTERFACE_LINK_LIBRARIES "${MATH_LIBRARY}"
    )
else()
    set(Math_FOUND FALSE)
endif()

mark_as_advanced(MATH_LIBRARY MATH_INCLUDE_DIR)

