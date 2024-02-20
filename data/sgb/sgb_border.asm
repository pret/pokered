; Indigo palette.
; 08,00,16
; 09,07,16
; 13,12,21
; 18,17,25
; 18,21,29
; 21,22,28

BorderPalettes:
	INCBIN "gfx/sgb/green_border.tilemap"

	ds $100

	RGB 30,29,29 ; PAL_SGB1
	RGB 21,22,28
	RGB 18,17,25
	RGB 13,12,21

	ds $18

	RGB 30,29,29 ; PAL_SGB2
	RGB 21,22,28 ; OG: Green
	RGB 18,17,25
	RGB 15,15,15

	ds $18

	RGB 30,29,29 ; PAL_SGB3
	RGB 21,22,28 ; OG: Yellow
	RGB 18,21,29
	RGB 15,15,15

	ds $18

SGBBorderGraphics:
	INCBIN "gfx/sgb/green_border.2bpp"