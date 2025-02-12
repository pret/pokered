MACRO tile_ids
	dw \1
	dn \3, \2
ENDM

TileIDListPointerTable:
; entries correspond to TILEMAP_* constants (see constants/gfx_constants.asm)
	table_width 3
	; tilemap pointer, width, height
	tile_ids MonTiles,               7,  7
	tile_ids SlideDownMonTiles_7x5,  7,  5
	tile_ids SlideDownMonTiles_7x3,  7,  3
	tile_ids GengarIntroTiles1,      7,  7
	tile_ids GengarIntroTiles2,      7,  7
	tile_ids GengarIntroTiles3,      7,  7
	tile_ids GameBoyTiles,           6,  8
	tile_ids LinkCableTiles,        12,  3
	assert_table_length NUM_TILEMAPS

DownscaledMonTiles_5x5:
	INCBIN "gfx/pokemon/downscaled_5x5.tilemap"

DownscaledMonTiles_3x3:
	INCBIN "gfx/pokemon/downscaled_3x3.tilemap"

MonTiles:
	INCBIN "gfx/pokemon/front.tilemap"

SlideDownMonTiles_7x5:
	INCBIN "gfx/pokemon/slide_down_7x5.tilemap"

SlideDownMonTiles_7x3:
	INCBIN "gfx/pokemon/slide_down_7x3.tilemap"

GengarIntroTiles1:
	INCBIN "gfx/intro/gengar_1.tilemap"

GengarIntroTiles2:
	INCBIN "gfx/intro/gengar_2.tilemap"

GengarIntroTiles3:
	INCBIN "gfx/intro/gengar_3.tilemap"

GameBoyTiles:
	INCBIN "gfx/trade/game_boy.tilemap"

LinkCableTiles:
	INCBIN "gfx/trade/link_cable.tilemap"
