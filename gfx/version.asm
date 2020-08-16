IF DEF(_ENGLISH)
Version_GFX:
IF DEF(_RED)
	INCBIN "gfx/title/red_version.1bpp" ; 10 tiles
ENDC
IF DEF(_BLUE)
	INCBIN "gfx/title/blue_version.1bpp" ; 8 tiles
ENDC
Version_GFXEnd:
ENDC

IF DEF(_GERMAN)
Version_GFX:
IF DEF(_RED)
	INCBIN "gfx/title/rote_edition.1bpp" ; 10 tiles
ENDC
IF DEF(_BLUE)
	INCBIN "gfx/title/blaue_edition.1bpp" ; 10 tiles
ENDC
Version_GFXEnd:
ENDC
