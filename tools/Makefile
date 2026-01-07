.PHONY: all clean

CC := gcc
CFLAGS := -O3 -std=c11 -Wall -Wextra -pedantic

ifeq ($(OS),Windows_NT)
    NULL := NUL
else
    NULL := /dev/null
endif

PROBE_LTO := $(shell echo 'int main(void){return 0;}' | $(CC) -flto -x c - -o $(NULL) 2>$(NULL) && echo y)

ifeq ($(PROBE_LTO),y)
    CFLAGS += -flto
endif

tools := \
	gfx \
	make_patch \
	pkmncompress \
	scan_includes

all: $(tools)
	@:

clean:
	$(RM) $(tools)

%: %.c common.h
	$(CC) $(CFLAGS) -o $@ $<
