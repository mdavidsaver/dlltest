cmake_minimum_required(VERSION 3.0)

project(test2 LANGUAGES C CXX)

message(STATUS "CWD: ${CMAKE_CURRENT_BINARY_DIR}")
message(STATUS "FOO_SRC: ${CMAKE_CURRENT_SOURCE_DIR}/../src")
message(STATUS "FOO_BIN: ${FOO_BIN}")

find_library(FOO_LIBRARY
    NAMES foo
    PATHS ${FOO_BIN}
    NO_DEFAULT_PATH
)
message(STATUS "Library: ${FOO_LIBRARY}")

find_path(FOO_INCLUDES
    NAMES foo.h
    PATHS ${CMAKE_CURRENT_SOURCE_DIR}/../src
    NO_DEFAULT_PATH
)
message(STATUS "Header: ${FOO_INCLUDES}")

include_directories(
  ${FOO_INCLUDES}
)

add_executable(test2
  test2.c
)
target_link_libraries(test2
 ${FOO_LIBRARY}
)
