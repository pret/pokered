;;;;;;;; PureRGBnote: FIXED: Articuno cry is played within the DisplayMonFrontSpriteInBox code now

Route15GateLeftBinoculars:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre Route15UpstairsBinocularsText
	ld a, ARTICUNO
	ld [wCurPartySpecies], a
	jp DisplayMonFrontSpriteInBox

;;;;;;;;
	
	

Route15UpstairsBinocularsText::
	text_far _Route15UpstairsBinocularsText
	text_end
