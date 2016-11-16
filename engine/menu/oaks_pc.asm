OpenOaksPC:
	call SaveScreenTilesToBuffer2
	ld hl, AccessedOaksPCText
	call PrintText
	ld hl, GetDexRatedText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .closePC
	predef DisplayDexRating
.closePC
	ld hl, ClosedOaksPCText
	call PrintText
	jp LoadScreenTilesFromBuffer2

GetDexRatedText:
	TX_FAR _GetDexRatedText
	db "@"

ClosedOaksPCText:
	TX_FAR _ClosedOaksPCText
	TX_WAIT
	db "@"

AccessedOaksPCText:
	TX_FAR _AccessedOaksPCText
	db "@"
