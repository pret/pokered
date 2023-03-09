OpenOaksPC:
	call SaveScreenTilesToBuffer2
	ld hl, AccessedOaksPCText
	rst _PrintText
	ld hl, GetDexRatedText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .closePC
	predef DisplayDexRating
.closePC
	ld hl, ClosedOaksPCText
	rst _PrintText
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
