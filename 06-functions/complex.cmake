include(CMakePrintHelpers)

function(COMPLEX required_arg_1)
###
#1.	`PARSE_ARGV 1`:
#	•	This indicates that the arguments to be parsed are taken from the `ARGV` list (arguments passed to the function) and that the first argument (`ARGV`) should be skipped.
#	•	The `1` means parsing starts from the second argument (`ARGV` onwards). This is useful when the first argument is a required positional argument or something you want to handle separately.
#	2.	`COMPLEX_PREFIX`:
#	•	This is the prefix used for all variables created by `cmake_parse_arguments`. For example:
#	•	If the keyword `SINGLE` is found, the variable `COMPLEX_PREFIX_SINGLE` will be set.
#	•	If a multi-value keyword like `MULTI_VALUES` is found, it will populate `COMPLEX_PREFIX_MULTI_VALUES`.
#	3.	`"SINGLE;ANOTHER"` (Options):
#	•	These are boolean flags that do not take any values. If one of these keywords appears in the arguments, its corresponding variable (e.g., `COMPLEX_PREFIX_SINGLE`) will be set to `TRUE`. If absent, it will be set to `FALSE`.
#	4.	`"ONE_VALUE;ALSO_ONE_VALUE"` (Single-Value Keywords):
#	•	These keywords are expected to be followed by exactly one value. For example:
#	•	If `ONE_VALUE value` appears in the arguments, `COMPLEX_PREFIX_ONE_VALUE` will be set to `"value"`.
#	•	If a keyword is not present, its variable will be empty.
#	5.	`"MULTI_VALUES;ANOTHER_MULTI_VALUES"` (Multi-Value Keywords):
#	•	These keywords can be followed by multiple values until another recognized keyword or the end of the arguments is encountered.
#	•	For example, if `MULTI_VALUES val1 val2 val3` appears, `COMPLEX_PREFIX_MULTI_VALUES` will contain `"val1;val2;val3"` as a CMake list.
####
  cmake_parse_arguments(
    PARSE_ARGV 1 COMPLEX_PREFIX "SINGLE;ANOTHER" "ONE_VALUE;ALSO_ONE_VALUE"
    "MULTI_VALUES;ANOTHER_MULTI_VALUES")
  message(STATUS "ARGV=${ARGV}")
  message(STATUS "ARGN=${ARGN}")
  message(STATUS "required_arg_1=${required_arg_1}")
  message(STATUS "COMPLEX_PREFIX_SINGLE=${COMPLEX_PREFIX_SINGLE}")
  message(STATUS "COMPLEX_PREFIX_ANOTHER=${COMPLEX_PREFIX_ANOTHER}")
  message(STATUS "COMPLEX_PREFIX_ONE_VALUE=${COMPLEX_PREFIX_ONE_VALUE}")
  message(
    STATUS "COMPLEX_PREFIX_ALSO_ONE_VALUE=${COMPLEX_PREFIX_ALSO_ONE_VALUE}")
  message(STATUS "COMPLEX_PREFIX_MULTI_VALUES=${COMPLEX_PREFIX_MULTI_VALUES}")
  message(
    STATUS
      "COMPLEX_PREFIX_ANOTHER_MULTI_VALUES=${COMPLEX_PREFIX_ANOTHER_MULTI_VALUES}"
  )
  message(
    STATUS
      "COMPLEX_PREFIX_UNPARSED_ARGUMENTS=${COMPLEX_PREFIX_UNPARSED_ARGUMENTS}")
endfunction()

complex(
  something
  SINGLE
  ONE_VALUE
  value
  MULTI_VALUES
  some
  other
  values
  ANOTHER_MULTI_VALUES
  even
  more
  values)
