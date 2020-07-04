; rst vectors (unused)

SECTION "rst0", ROM0[$0000]
	rst $38

SECTION "rst8", ROM0[$0008]
	rst $38

SECTION "rst10", ROM0[$0010]
	rst $38

SECTION "rst18", ROM0[$0018]
	rst $38

SECTION "rst20", ROM0[$0020]
	rst $38

SECTION "rst28", ROM0[$0028]
	rst $38

SECTION "rst30", ROM0[$0030]
	rst $38

SECTION "rst38", ROM0[$0038]
	rst $38


; Game Boy hardware interrupts

SECTION "vblank", ROM0[$0040]
	jp VBlank

SECTION "lcd", ROM0[$0048]
	rst $38

SECTION "timer", ROM0[$0050]
	jp Timer

SECTION "serial", ROM0[$0058]
	jp Serial

SECTION "joypad", ROM0[$0060]
	reti


SECTION "Header", ROM0[$0100]

Start::
; Nintendo requires all Game Boy ROMs to begin with a nop ($00) and a jp ($C3)
; to the starting address.
	nop
	jp _Start

; The Game Boy cartridge header data is patched over by rgbfix.
; This makes sure it doesn't get used for anything else.

	ds $0150 - @, $00
