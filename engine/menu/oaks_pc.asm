OpenOaksPC:
	call SaveScreenTilesToBuffer2
	ld hl, AccessedOaksPCText
	call PrintText
	ld hl, GetDexRatedText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_1e932
	predef DisplayDexRating
.asm_1e932
	ld hl, ClosedOaksPCText
	call PrintText
	jp LoadScreenTilesFromBuffer2

GetDexRatedText:
	TX_FAR _GetDexRatedText
	db "@"

ClosedOaksPCText:
	TX_FAR _ClosedOaksPCText
	db $0d,"@"

AccessedOaksPCText:
	TX_FAR _AccessedOaksPCText
	db "@"
