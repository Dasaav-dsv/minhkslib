#include <intrin.h>

#include "../include/hkslua.h"

hksi_luaL_checklstring_fn hksi_luaL_checklstring = NULL;

void* getImageBase() { return ((void**)(__readgsqword(0x60)))[2]; }
void* adjustToBase(uint32_t ibo) { return (void*)((uintptr_t)getImageBase() + ibo); }
void fnptrInit(uint32_t ibo, void** fnptr) { if (*fnptr == NULL) *fnptr = adjustToBase(ibo); }

int Labort(lua_State* L) {
    puts("minhkslib abort called!");
    abort();
    return 0;
}

int Lputs(lua_State* L) {
    fnptrInit(HKSI_LUAL_CHECKLSTRING, (void**)&hksi_luaL_checklstring);
    size_t len = 1024;
    char* lstr = hksi_luaL_checklstring(L, 1, &len);
    if (!lstr || !len) return 0;
    puts(lstr);
    return 0;
}

static const struct luaL_reg Lexports[] = {
    {"abort", &Labort},
    {"puts", &Lputs},
    {NULL, NULL}
};

const luaL_reg* getLuaExports() {
    return Lexports;
}