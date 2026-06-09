.PHONY: all clean format

CC := gcc
CFLAGS := -O3 -std=c11 -Wall -Wextra -pedantic

tools := \
	gfx \
	make_patch \
	pkmncompress \
	scan_includes

all: $(tools)
	@:

clean:
	$(RM) $(tools)

format:
	clang-format -i $$(git ls-files '*.h' '*.c')

%: %.c common.h
	$(CC) $(CFLAGS) -o $@ $<
