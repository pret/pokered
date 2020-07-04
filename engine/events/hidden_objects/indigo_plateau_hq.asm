PrintIndigoPlateauHQText:
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump IndigoPlateauHQText

IndigoPlateauHQText::
	text_far _IndigoPlateauHQText
	text_end
