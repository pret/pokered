BorderPalettes:
	INCBIN "gfx/sgb/sgb_border.tilemap"

	ds $100

	RGB 31,31,31 ; PAL_SGB1
	RGB 31,28,00
	RGB 16,18,31
	RGB 03,03,03

	ds $18

	RGB 31,31,31 ; PAL_SGB2
	RGB 31,09,01
	RGB 28,14,04
	RGB 03,03,03

	ds $18

	RGB 31,31,31 ; PAL_SGB3
	RGB 31,15,18
	RGB 01,22,06
	RGB 03,03,03

	ds $18

SGBBorderGraphics:
	INCBIN "gfx/sgb/sgb_border.2bpp"
