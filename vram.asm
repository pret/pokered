SECTION "VRAM", VRAM

UNION
; generic
vChars0:: ds $800
vChars1:: ds $800
vChars2:: ds $800
vBGMap0:: ds $400
vBGMap1:: ds $400

NEXTU
; battle/menu
vSprites::  ds $800
vFont::     ds $800
vFrontPic:: ds 7 * 7 * $10
vBackPic::  ds 7 * 7 * $10

NEXTU
; overworld
vNPCSprites::  ds $800
vNPCSprites2:: ds $800
vTileset::     ds $800

NEXTU
; title
	ds $800
vTitleLogo::  ds $800
	ds 7 * 7 * $10
vTitleLogo2:: ds $1e0

ENDU
