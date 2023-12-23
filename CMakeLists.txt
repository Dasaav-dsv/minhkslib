cmake_minimum_required(VERSION 3.25)
project(minhkslib)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

include(${CMAKE_SOURCE_DIR}/lua/lua-5.1/lua.cmake)
add_library(minhkslib SHARED
    ${CMAKE_SOURCE_DIR}/source/console.c
    ${CMAKE_SOURCE_DIR}/source/hkslua.c
    ${CMAKE_SOURCE_DIR}/source/minhkslib.c
)

# Not necessary - only hksi_lua game functions are currently used
# target_link_libraries(minhkslib ${CMAKE_SOURCE_DIR}/lib/lua-static.lib)