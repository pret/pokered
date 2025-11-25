SECTION "VRAM", VRAM

UNION
; generic
vChars0:: ds $80 tiles
vChars1:: ds $80 tiles
vChars2:: ds $80 tiles
vBGMap0:: ds TILEMAP_AREA
vBGMap1:: ds TILEMAP_AREA

NEXTU
; battle/menu
vSprites::  ds $80 tiles
vFont::     ds $80 tiles
vFrontPic:: ds PIC_SIZE tiles
vBackPic::  ds PIC_SIZE tiles

NEXTU
; overworld
vNPCSprites::  ds $80 tiles
vNPCSprites2:: ds $80 tiles
vTileset::     ds $80 tiles

NEXTU
; title
	ds $80 tiles
vTitleLogo::  ds $80 tiles
	ds PIC_SIZE tiles
vTitleLogo2:: ds 30 tiles

ENDU

ENDSECTION
