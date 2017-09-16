cmake_minimum_required(VERSION 3.0)

project(example LANGUAGES C CXX)

include_directories(
  ${CMAKE_CURRENT_BINARY_DIR}
)

add_library(foo SHARED
   src/foo.h
   src/foo.c
)
include(GenerateExportHeader)
generate_export_header(foo
  BASE_NAME foo
)
if(WIN32)
  set_target_properties(foo
    PROPERTIES
      VERSION 1.2
  )
  # cross mingw
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