; interrupts
SECTION "vblank", ROM0[$40]
	jp VBlank
SECTION "lcdc",   ROM0[$48]
	rst $38
SECTION "timer",  ROM0[$50]
	jp Timer
SECTION "serial", ROM0[$58]
	jp Serial
SECTION "joypad", ROM0[$60]
	reti