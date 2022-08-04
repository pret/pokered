; PureRGBnote: ADDED: this code is simply to set up what happens when pressing A on the PC in the new saffron city fossil super nerd's house.

FossilGuysPC:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	tx_pre FossilGuysComputer
	ret

FossilGuysComputer::
	text_asm
	ld hl, FossilGuysComputer1
	call PrintText
	ld a, 1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_RIGHT
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
	ld hl, FossilGuysComputer2
	call PrintText
	jp TextScriptEnd

FossilGuysComputer1:
	text_far _FossilGuysComputer1
	text_end

FossilGuysComputer2:
	text_far _FossilGuysComputer2
	text_end