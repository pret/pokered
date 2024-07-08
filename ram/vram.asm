SECTION "VRAM", VRAM

UNION
; generic
vChars0:: ds $80 tiles
vChars1:: ds $80 tiles
vChars2:: ds $80 tiles
vBGMap0:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT
vBGMap1:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT

NEXTU
; battle/menu
vSprites::  ds $80 tiles
vFont::     ds $80 tiles
vFrontPic:: ds 7 * 7 tiles
vBackPic::  ds 7 * 7 tiles

NEXTU
; overworld
vNPCSprites::  ds $80 tiles
vNPCSprites2:: ds $80 tiles
vTileset::     ds $80 tiles

NEXTU
; title
	ds $80 tiles
vTitleLogo::  ds $80 tiles
	ds 7 * 7 tiles
vTitleLogo2:: ds 30 tiles

ENDU

ENDSECTION
