DisplayOakLabLeftPoster:
	call EnableAutoTextBoxDrawing
	tx_pre_jump PushStartText

PushStartText::
	TX_FAR _PushStartText
	db "@"

DisplayOakLabRightPoster:
	call EnableAutoTextBoxDrawing
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	cp 2
	tx_pre_id SaveOptionText
	jr c, .ownLessThanTwo
	; own two or more mon
	tx_pre_id StrengthsAndWeaknessesText
.ownLessThanTwo
	jp PrintPredefTextID

SaveOptionText::
	TX_FAR _SaveOptionText
	db "@"

StrengthsAndWeaknessesText::
	TX_FAR _StrengthsAndWeaknessesText
	db "@"
