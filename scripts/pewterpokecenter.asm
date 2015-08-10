PewterPokecenterScript: ; 5c587 (17:4587)
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

PewterPokecenterTextPointers: ; 5c58d (17:458d)
	dw PewterPokecenterText1
	dw PewterPokecenterText2
	dw PewterPokecenterText3
	dw PewterPokecenterText4

PewterPokecenterText1: ; 5c595 (17:4595)
	db $ff

PewterPokecenterText2: ; 5c596 (17:4596)
	TX_FAR _PewterPokecenterText1
	db "@"

PewterPokecenterText3: ; 5c59b (17:459b)
	TX_ASM
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, PewterPokecenterText5
	call PrintText
	ld a, $ff
	call PlaySound
	ld c, 32
	call DelayFrames
	ld hl, JigglypuffFacingDirections
	ld de, wJigglypuffFacingDirections
	ld bc, JigglypuffFacingDirectionsEnd - JigglypuffFacingDirections
	call CopyData

	ld a, [wSpriteStateData1 + 3 * $10 + $2]
	ld hl, wJigglypuffFacingDirections
.findMatchingFacingDirectionLoop
	cp [hl]
	inc hl
	jr nz, .findMatchingFacingDirectionLoop
	dec hl
	push hl
	ld c, BANK(Music_JigglypuffSong)
	ld a, MUSIC_JIGGLYPUFF_SONG
	call PlayMusic
	pop hl
.loop
	ld a, [hl]
	ld [wSpriteStateData1 + 3 * $10 + $2], a

; rotate the array
	push hl
	ld hl, wJigglypuffFacingDirections
	ld de, wJigglypuffFacingDirections - 1
	ld bc, JigglypuffFacingDirectionsEnd - JigglypuffFacingDirections
	call CopyData
	ld a, [wJigglypuffFacingDirections - 1]
	ld [wJigglypuffFacingDirections + 3], a
	pop hl

	ld c, 24
	call DelayFrames

	ld a, [wChannelSoundIDs]
	ld b, a
	ld a, [wChannelSoundIDs + CH1]
	or b
	jr nz, .loop

	ld c, 48
	call DelayFrames
	call PlayDefaultMusic
	jp TextScriptEnd

PewterPokecenterText5: ; 5c603 (17:4603)
	TX_FAR _PewterPokecenterText5
	db "@"

JigglypuffFacingDirections: ; 5c608 (17:4608)
	db $30 | SPRITE_FACING_DOWN
	db $30 | SPRITE_FACING_LEFT
	db $30 | SPRITE_FACING_UP
	db $30 | SPRITE_FACING_RIGHT
JigglypuffFacingDirectionsEnd:

PewterPokecenterText4: ; 5c60c (17:460c)
	db $f6
