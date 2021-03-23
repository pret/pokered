DisplayOakLabLeftPoster:
	call EnableAutoTextBoxDrawing
	tx_pre_jump PushStartText

PushStartText::
	text_far _PushStartText
	text_end

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
	text_far _SaveOptionText
	text_end

StrengthsAndWeaknessesText::
	text_far _StrengthsAndWeaknessesText
	text_end
