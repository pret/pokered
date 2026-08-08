BorderPalettes:
IF DEF(_RED)
	INCBIN "gfx/sgb/red_border.tilemap"
ENDC
IF DEF(_BLUE)
	INCBIN "gfx/sgb/blue_border.tilemap"
ENDC

REPT SNES_TILEMAP_WIDTH * 4
	dw 0 ; tilemap padding
ENDR

; SGB Palette 4
IF DEF(_RED)
	RGB 30,29,29
	RGB 25,22,25
	RGB 25,17,21
	RGB 24,14,12
ENDC
IF DEF(_BLUE)
	RGB  0, 0, 0 ; the first color is not defined, but if used, turns up as 30,29,29 (backdrop color)
	RGB 10,17,26
	RGB  5, 9,20
	RGB 16,20,27
ENDC
REPT 12
	RGB  0, 0, 0
ENDR

; SGB Palette 5
IF DEF(_RED)
	RGB 30,29,29
	RGB 22,31,16
	RGB 27,20, 6
	RGB 15,15,15
ENDC
IF DEF(_BLUE)
	RGB 30,29,29
	RGB 27,11, 6
	RGB  5, 9,20
	RGB 28,25,15
ENDC
REPT 12
	RGB  0, 0, 0
ENDR

; SGB Palette 6
IF DEF(_RED)
	RGB 30,29,29
	RGB 31,31,17
	RGB 18,21,29
	RGB 15,15,15
ENDC
IF DEF(_BLUE)
	RGB 30,29,29
	RGB 12,15,11
	RGB  5, 9,20
	RGB 14,22,17
ENDC
REPT 12
	RGB  0, 0, 0
ENDR

SGBBorderGraphics:
IF DEF(_RED)
	INCBIN "gfx/sgb/red_border.2bpp"
ENDC
IF DEF(_BLUE)
	INCBIN "gfx/sgb/blue_border.2bpp"
ENDC
