#include <stdint.h>

#include "../lua/lua-5.1/src/lua.h"
#include "../lua/lua-5.1/src/lualib.h"
#include "../lua/lua-5.1/src/lauxlib.h"

#include "console.h"

// Valid for ER 1.10
#define HKSI_OPENLIB_IBO 0x1490A80
typedef void(*hksI_openlib_fn)(lua_State *L, const char *libname, const luaL_Reg *l, int nup);
#define HKSI_LUAL_CHECKLSTRING 0x1497180
typedef char*(*hksi_luaL_checklstring_fn)(lua_State *L, int narg, size_t *len);

void fnptrInit(uint32_t ibo, void** fnptr);
const luaL_reg* getLuaExports();
