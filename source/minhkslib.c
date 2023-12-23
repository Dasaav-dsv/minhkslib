#include <stdio.h>
#include <stdlib.h>

#include "../include/console.h"
#include "../include/hkslua.h"

int __declspec(dllexport) luaopen_minlualib(lua_State* L) {
    openConsole();
    const luaL_reg* exports = getLuaExports();
    hksI_openlib_fn f = NULL;
    fnptrInit(HKSI_OPENLIB_IBO, (void**)&f);
    f(L, "minlualib", exports, 0);
    return 1;
}