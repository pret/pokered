PrintWaitingText::
	hlcoord 3, 10
	ld b, 1
	ld c, 11
	ld a, [wIsInBattle]
	and a
	jr z, .trade
; battle
	call TextBoxBorder
	jr .borderDone
.trade
	call CableClub_TextBoxBorder
.borderDone
	hlcoord 4, 11
	ld de, WaitingText
	call PlaceString
	ld c, 50
	jp DelayFrames

WaitingText:
	db "Waiting...!@"
