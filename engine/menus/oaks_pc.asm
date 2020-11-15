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
	text_far _GetDexRatedText
	text_end

ClosedOaksPCText:
	text_far _ClosedOaksPCText
	text_waitbutton
	text_end

AccessedOaksPCText:
	text_far _AccessedOaksPCText
	text_end
