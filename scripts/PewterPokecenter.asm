PewterPokecenter_Script:
	call SetLastBlackoutMap ; PureRGBnote: ADDED: set blackout map on entering pokemon center
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

PewterPokecenter_TextPointers:
	dw PewterHealNurseText
	dw PewterPokecenterText2
	dw PewterJigglypuffText
	dw PewterTradeNurseText

PewterHealNurseText:
	script_pokecenter_nurse

PewterPokecenterText2:
	text_far _PewterPokecenterText2
	text_end

PewterJigglypuffText:
	text_asm
	ld a, TRUE
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .JigglypuffText
	rst PrintTextRST

	ld a, SFX_STOP_ALL_MUSIC
	rst PlaySoundRST
	ld c, 32
	rst DelayFramesRST

	ld hl, JigglypuffFacingDirections
	ld de, wJigglypuffFacingDirections
	ld bc, JigglypuffFacingDirectionsEnd - JigglypuffFacingDirections
	rst CopyDataRST

	ld a, [wSprite03StateData1ImageIndex]
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

.spinMovementLoop
	ld a, [hl]
	ld [wSprite03StateData1ImageIndex], a
; rotate the array
	push hl
	ld hl, wJigglypuffFacingDirections
	ld de, wJigglypuffFacingDirections - 1
	ld bc, JigglypuffFacingDirectionsEnd - JigglypuffFacingDirections
	rst CopyDataRST
	ld a, [wJigglypuffFacingDirections - 1]
	ld [wJigglypuffFacingDirections + 3], a
	pop hl
	ld c, 24
	rst DelayFramesRST
	ld a, [wChannelSoundIDs]
	ld b, a
	ld a, [wChannelSoundIDs + CHAN2]
	or b
	jr nz, .spinMovementLoop

	ld c, 48
	rst DelayFramesRST
	call PlayDefaultMusic
	rst TextScriptEnd

.JigglypuffText:
	text_far _PewterJigglypuffText
	text_end

JigglypuffFacingDirections:
	db $30 | SPRITE_FACING_DOWN
	db $30 | SPRITE_FACING_LEFT
	db $30 | SPRITE_FACING_UP
	db $30 | SPRITE_FACING_RIGHT
JigglypuffFacingDirectionsEnd:

PewterTradeNurseText:
	script_cable_club_receptionist
