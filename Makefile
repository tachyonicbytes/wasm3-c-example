CC      = gcc-11
CFLAGS  = -std=c99 -ggdb3 -pedantic -Wall -Wextra -Wwrite-strings -Werror # some extra protection
LDFLAGS = -I wasm3/source/ -L wasm3/source/ -I wasm3/build/source/ -L wasm3/build/source/ -lm3 # add the path to the m3 library

.PHONY: compile-wasm3 compile

all: compile-wasm3 compile

compile-wasm3:
	cd wasm3 && mkdir -p build && cd build && cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .. && make

compile:
	$(CC) $(LDFLAGS) $(CFLAGS) ./main.c -o main
