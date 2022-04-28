MACRO RGB
	REPT _NARG / 3
		dw palred (\1) + palgreen (\2) + palblue (\3)
		SHIFT 3
	ENDR
ENDM

DEF palred   EQUS "(1 << 0) *"
DEF palgreen EQUS "(1 << 5) *"
DEF palblue  EQUS "(1 << 10) *"

DEF palettes EQUS "* PALETTE_SIZE"
DEF palette  EQUS "+ PALETTE_SIZE *"
DEF color    EQUS "+ PAL_COLOR_SIZE *"

DEF tiles EQUS "* LEN_2BPP_TILE"
DEF tile  EQUS "+ LEN_2BPP_TILE *"

MACRO dbsprite
; x tile, y tile, x pixel, y pixel, vtile offset, attributes
	db (\2 * TILE_WIDTH) % $100 + \4, (\1 * TILE_WIDTH) % $100 + \3, \5, \6
ENDM
