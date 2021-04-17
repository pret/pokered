.PHONY: all clean

CC := gcc
CFLAGS := -O3 -std=c99 -Wall -Wextra -Wno-missing-field-initializers

tools := scan_includes gfx pkmncompress

all: $(tools)
	@:

clean:
	rm -f $(tools)

gfx: common.h
%: %.c
	$(CC) $(CFLAGS) -o $@ $<
