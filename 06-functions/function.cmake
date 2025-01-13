
# ARGN after the explicitly listed positional arguments
# ARGV all arguments

function(MyFunction Arg1)
  message(STATUS "All arguments (ARGV): ${ARGV}")
  message(STATUS "Non-positional arguments (ARGN): ${ARGN}")
endfunction()

MyFunction(First Second Third)

# Using `PARENT_SCOPE`, variables can be set in the parent scope (outside the function), as functions in CMake introduce their own local scope.
function(SetVariable VarName VarValue)
  set(${VarName} "${VarValue}" PARENT_SCOPE)
endfunction()

SetVariable(MyVar "Hello")
message(STATUS "${MyVar}")  # Outputs: Hello

