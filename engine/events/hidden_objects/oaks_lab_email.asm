DisplayOakLabEmailText:
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump OakLabEmailText

OakLabEmailText::
	text_far _OakLabEmailText
	text_end
