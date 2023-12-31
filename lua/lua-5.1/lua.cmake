
#Based on http://lua-users.org/wiki/BuildingLua
CMAKE_MINIMUM_REQUIRED(VERSION 3.25)
PROJECT (lua)

SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/../lib)

ADD_DEFINITIONS(-D_CRT_SECURE_NO_WARNINGS) 

FILE(GLOB HDR_LIBLUA
${CMAKE_CURRENT_LIST_DIR}/src/lapi.h
${CMAKE_CURRENT_LIST_DIR}/src/lauxlib.h
${CMAKE_CURRENT_LIST_DIR}/src/lcode.h
${CMAKE_CURRENT_LIST_DIR}/src/ldebug.h
${CMAKE_CURRENT_LIST_DIR}/src/ldo.h
${CMAKE_CURRENT_LIST_DIR}/src/lfunc.h
${CMAKE_CURRENT_LIST_DIR}/src/lgc.h
${CMAKE_CURRENT_LIST_DIR}/src/llex.h
${CMAKE_CURRENT_LIST_DIR}/src/llimits.h
${CMAKE_CURRENT_LIST_DIR}/src/lmem.h
${CMAKE_CURRENT_LIST_DIR}/src/lobject.h
${CMAKE_CURRENT_LIST_DIR}/src/lopcodes.h
${CMAKE_CURRENT_LIST_DIR}/src/lparser.h
${CMAKE_CURRENT_LIST_DIR}/src/lstate.h
${CMAKE_CURRENT_LIST_DIR}/src/lstring.h
${CMAKE_CURRENT_LIST_DIR}/src/ltable.h
${CMAKE_CURRENT_LIST_DIR}/src/ltm.h
${CMAKE_CURRENT_LIST_DIR}/src/luaconf.h
${CMAKE_CURRENT_LIST_DIR}/src/lualib.h
${CMAKE_CURRENT_LIST_DIR}/src/lundump.h
${CMAKE_CURRENT_LIST_DIR}/src/lvm.h
${CMAKE_CURRENT_LIST_DIR}/src/lzio.h
)

FILE(GLOB SRC_LIBLUA
${CMAKE_CURRENT_LIST_DIR}/src/lapi.c
${CMAKE_CURRENT_LIST_DIR}/src/lauxlib.c
${CMAKE_CURRENT_LIST_DIR}/src/lbaselib.c
${CMAKE_CURRENT_LIST_DIR}/src/lcode.c
${CMAKE_CURRENT_LIST_DIR}/src/ldblib.c
${CMAKE_CURRENT_LIST_DIR}/src/ldebug.c
${CMAKE_CURRENT_LIST_DIR}/src/ldo.c
${CMAKE_CURRENT_LIST_DIR}/src/ldump.c
${CMAKE_CURRENT_LIST_DIR}/src/lfunc.c
${CMAKE_CURRENT_LIST_DIR}/src/lgc.c
${CMAKE_CURRENT_LIST_DIR}/src/linit.c
${CMAKE_CURRENT_LIST_DIR}/src/liolib.c
${CMAKE_CURRENT_LIST_DIR}/src/llex.c
${CMAKE_CURRENT_LIST_DIR}/src/lmathlib.c
${CMAKE_CURRENT_LIST_DIR}/src/lmem.c
${CMAKE_CURRENT_LIST_DIR}/src/loadlib.c
${CMAKE_CURRENT_LIST_DIR}/src/lobject.c
${CMAKE_CURRENT_LIST_DIR}/src/lopcodes.c
${CMAKE_CURRENT_LIST_DIR}/src/loslib.c
${CMAKE_CURRENT_LIST_DIR}/src/lparser.c
${CMAKE_CURRENT_LIST_DIR}/src/lstate.c
${CMAKE_CURRENT_LIST_DIR}/src/lstring.c
${CMAKE_CURRENT_LIST_DIR}/src/lstrlib.c
${CMAKE_CURRENT_LIST_DIR}/src/ltable.c
${CMAKE_CURRENT_LIST_DIR}/src/ltablib.c
${CMAKE_CURRENT_LIST_DIR}/src/ltm.c
${CMAKE_CURRENT_LIST_DIR}/src/luac.c
${CMAKE_CURRENT_LIST_DIR}/src/lundump.c
${CMAKE_CURRENT_LIST_DIR}/src/lvm.c
${CMAKE_CURRENT_LIST_DIR}/src/lzio.c
${CMAKE_CURRENT_LIST_DIR}/src/print.c
)

FILE(GLOB SRC_LUA ${CMAKE_CURRENT_LIST_DIR}/src/lua.c)
FILE(GLOB SRC_LUAC ${CMAKE_CURRENT_LIST_DIR}/src/luac.c)

LIST(APPEND SRC_LIBLUA ${HDR_LIBLUA})

ADD_LIBRARY(lua-static ${SRC_LIBLUA})
ADD_LIBRARY(lua5.1 SHARED ${SRC_LIBLUA})
SET_TARGET_PROPERTIES(lua5.1 PROPERTIES DEFINE_SYMBOL "LUA_BUILD_AS_DLL")

ADD_EXECUTABLE(lua ${SRC_LUA})
ADD_EXECUTABLE(luac ${SRC_LUAC})

TARGET_LINK_LIBRARIES(lua lua5.1)
TARGET_LINK_LIBRARIES(luac lua-static)