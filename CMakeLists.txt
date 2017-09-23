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

include(GenerateExportHeader)
generate_export_header(foo
  BASE_NAME foo
)

if(WIN32)
  set_target_properties(foo
    PROPERTIES
      VERSION 1.2  # ImageVersion
  )
  # hosted msvc
  #  foo.dll
  #  foo.lib
  # mingw
  #  libfoo.dll.a
  #  libfoo.dll

else()
  set_target_properties(foo
    PROPERTIES
      SOVERSION 1.2
  )
  # ELF targets
  #  file name: libfoo.so
  #  SONAME   : libfoo.so.3.4
endif()

add_executable(testexe
  src/test.c
)
target_link_libraries(testexe
  foo
)
