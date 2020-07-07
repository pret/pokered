mon_icon_header: MACRO
	dw \1 tile \2
	db \3
	db BANK(\1)
	dw vSprites tile \4
ENDM

MonPartySpritePointers:
; gfx pointer, gfx tile offset, # tiles, vSprites tile offset
	mon_icon_header SlowbroSprite,       12, 4, $00
	mon_icon_header BallSprite,           0, 8, $04
	mon_icon_header ClefairySprite,      12, 4, $0c
	mon_icon_header BirdSprite,          12, 4, $10
	mon_icon_header SeelSprite,           0, 4, $14
	mon_icon_header BugIconFrame2,        0, 1, $18
	mon_icon_header BugIconFrame2,        1, 1, $1a
	mon_icon_header PlantIconFrame2,      0, 1, $1c
	mon_icon_header PlantIconFrame2,      1, 1, $1e
	mon_icon_header SnakeIconFrame1,      0, 1, $20
	mon_icon_header SnakeIconFrame1,      1, 1, $22
	mon_icon_header QuadrupedIconFrame1,  0, 1, $24
	mon_icon_header QuadrupedIconFrame1,  1, 1, $26
	mon_icon_header TradeBubbleIconGFX,   0, 4, $38
	mon_icon_header SlowbroSprite,        0, 4, $40
	mon_icon_header BallSprite,           0, 8, $44
	mon_icon_header ClefairySprite,       0, 4, $4c
	mon_icon_header BirdSprite,           0, 4, $50
	mon_icon_header SeelSprite,          12, 4, $54
	mon_icon_header BugIconFrame1,        0, 1, $58
	mon_icon_header BugIconFrame1,        1, 1, $5a
	mon_icon_header PlantIconFrame1,      0, 1, $5c
	mon_icon_header PlantIconFrame1,      1, 1, $5e
	mon_icon_header SnakeIconFrame2,      0, 1, $60
	mon_icon_header SnakeIconFrame2,      1, 1, $62
	mon_icon_header QuadrupedIconFrame2,  0, 1, $64
	mon_icon_header QuadrupedIconFrame2,  1, 1, $66
	mon_icon_header TradeBubbleIconGFX,   4, 4, $78
