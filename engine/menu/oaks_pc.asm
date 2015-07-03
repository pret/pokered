OpenOaksPC: ; 1e915 (7:6915)
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

GetDexRatedText: ; 1e93b (7:693b)
	TX_FAR _GetDexRatedText
	db "@"

ClosedOaksPCText: ; 1e940 (7:6940)
	TX_FAR _ClosedOaksPCText
	db $0d,"@"

AccessedOaksPCText: ; 1e946 (7:6946)
	TX_FAR _AccessedOaksPCText
	db "@"
