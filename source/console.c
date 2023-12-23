#define WIN32_LEAN_AND_MEAN
#include <Windows.h>

#include <stdio.h>

#include "../include/console.h"

void openConsole() {
	AllocConsole();
	freopen("CON", "w", stdout);
}