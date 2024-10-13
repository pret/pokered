.PHONY: all clean

CC := gcc
CFLAGS := -O3 -flto -std=c11 -Wall -Wextra -pedantic

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
