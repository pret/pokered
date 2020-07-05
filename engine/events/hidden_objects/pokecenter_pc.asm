OpenPokemonCenterPC:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	ld a, $1
	ld [wAutoTextBoxDrawingControl], a
	tx_pre_jump PokemonCenterPCText

PokemonCenterPCText::
	script_pokecenter_pc
