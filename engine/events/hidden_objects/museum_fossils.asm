AerodactylFossil:
	ld a, FOSSIL_AERODACTYL
	ld [wcf91], a
	call DisplayMonFrontSpriteInBox
	call EnableAutoTextBoxDrawing
	tx_pre AerodactylFossilText
	ret

AerodactylFossilText::
	text_far _AerodactylFossilText
	text_end

KabutopsFossil:
	ld a, FOSSIL_KABUTOPS
	ld [wcf91], a
	call DisplayMonFrontSpriteInBox
	call EnableAutoTextBoxDrawing
	tx_pre KabutopsFossilText
	ret

KabutopsFossilText::
	text_far _KabutopsFossilText
	text_end

;;;;;;;; PureRGBnote: FIXED: Updated function to display the correct pokemon palette

DisplayMonFrontSpriteInBox:
; Displays a pokemon's front sprite in a pop-up window.
; [wcf91] = pokemon internal id number
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	xor a
	ldh [hWY], a
	call SaveScreenTilesToBuffer1
	ld a, MON_SPRITE_POPUP
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call UpdateSprites
	call Delay3 ; allow box to finish rendering before setting palette
	ld b, SET_PAL_MIDDLE_SCREEN_MON_BOX
	call RunPaletteCommand
	ld a, [wcf91]
	ld [wd0b5], a
	call GetMonHeader
	ld de, vChars1 tile $31
	call LoadMonFrontSprite
	ld a, $80
	ldh [hStartTileID], a
	hlcoord 10, 11
	predef AnimateSendingOutMon
	ld a, [wcf91]
	cp FOSSIL_KABUTOPS
	jr z, .skipCry
	cp FOSSIL_AERODACTYL
	jr z, .skipCry
	call PlayCry
.skipCry
	call WaitForTextScrollButtonPress
	ld a, MON_SPRITE_POPUP
	ld [wTextBoxID], a
	call DisplayTextBoxID ; redisplay the box to clear the pokemon sprite out
	call Delay3 ; allow box to finish clearing 
	call RunDefaultPaletteCommand ; reset palette to what it was before displaying this box
	call LoadScreenTilesFromBuffer1 ; close the box
	call Delay3 ; allow box to finish closing before resetting hWY
	ld a, $90
	ldh [hWY], a
	ret

;;;;;;;;
