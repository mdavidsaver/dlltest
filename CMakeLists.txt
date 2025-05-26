cmake_minimum_required(VERSION 3.0)

project(example LANGUAGES C CXX)

include_directories(
  ${CMAKE_CURRENT_BINARY_DIR}
)

if(CMAKE_COMPILER_IS_GNUCC)
  add_compile_options(-Wall -Werror)
endif()

set(foo_SRC
   src/foo.h
   src/foo.c
)

if(WIN32)
  list(APPEND foo_SRC src/foo.rc)
endif()

add_library(foo SHARED ${foo_SRC})

set_target_properties(foo
  PROPERTIES
    VERSION 1.2  # ImageVersion
    SOVERSION 1.2 # suffix to SONAME
)
target_compile_definitions(foo PRIVATE -DBUILDING_FOO=1)

if(NOT WIN32)
  add_compile_options(
    -fvisibility=hidden
    $<$<COMPILE_LANGUAGE:CXX>:-fvisibility-inlines-hidden>
  )
endif()

add_executable(testexe
  src/test.c
)
target_link_libraries(testexe
  foo
)
