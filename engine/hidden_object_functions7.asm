PrintNewBikeText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump NewBicycleText

NewBicycleText:
	TX_FAR _NewBicycleText
	db "@"

DisplayOakLabLeftPoster:
	call EnableAutoTextBoxDrawing
	tx_pre_jump PushStartText

PushStartText:
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

SaveOptionText:
	TX_FAR _SaveOptionText
	db "@"

StrengthsAndWeaknessesText:
	TX_FAR _StrengthsAndWeaknessesText
	db "@"

SafariZoneCheck:
	CheckEventHL EVENT_IN_SAFARI_ZONE ; if we are not in the Safari Zone,
	jr z, SafariZoneGameStillGoing ; don't bother printing game over text
	ld a, [wNumSafariBalls]
	and a
	jr z, SafariZoneGameOver
	jr SafariZoneGameStillGoing

SafariZoneCheckSteps:
	ld a, [wSafariSteps]
	ld b, a
	ld a, [wSafariSteps + 1]
	ld c, a
	or b
	jr z, SafariZoneGameOver
	dec bc
	ld a, b
	ld [wSafariSteps], a
	ld a, c
	ld [wSafariSteps + 1], a
SafariZoneGameStillGoing:
	xor a
	ld [wSafariZoneGameOver], a
	ret

SafariZoneGameOver:
	call EnableAutoTextBoxDrawing
	xor a
	ld [wAudioFadeOutControl], a
	dec a
	call PlaySound
	ld c, BANK(SFX_Safari_Zone_PA)
	ld a, SFX_SAFARI_ZONE_PA
	call PlayMusic
.waitForMusicToPlay
	ld a, [wChannelSoundIDs + Ch4]
	cp SFX_SAFARI_ZONE_PA
	jr nz, .waitForMusicToPlay
	ld a, TEXT_SAFARI_GAME_OVER
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wPlayerMovingDirection], a
	ld a, SAFARI_ZONE_GATE
	ld [hWarpDestinationMap], a
	ld a, $3
	ld [wDestinationWarpID], a
	ld a, $5
	ld [wSafariZoneGateCurScript], a
	SetEvent EVENT_SAFARI_GAME_OVER
	ld a, 1
	ld [wSafariZoneGameOver], a
	ret

PrintSafariGameOverText:
	xor a
	ld [wJoyIgnore], a
	ld hl, SafariGameOverText
	jp PrintText

SafariGameOverText:
	TX_ASM
	ld a, [wNumSafariBalls]
	and a
	jr z, .noMoreSafariBalls
	ld hl, TimesUpText
	call PrintText
.noMoreSafariBalls
	ld hl, GameOverText
	call PrintText
	jp TextScriptEnd

TimesUpText:
	TX_FAR _TimesUpText
	db "@"

GameOverText:
	TX_FAR _GameOverText
	db "@"

PrintCinnabarQuiz:
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump CinnabarGymQuiz

CinnabarGymQuiz:
	TX_ASM
	xor a
	ld [wOpponentAfterWrongAnswer], a
	ld a, [wHiddenObjectFunctionArgument]
	push af
	and $f
	ld [hGymGateIndex], a
	pop af
	and $f0
	swap a
	ld [$ffdc], a
	ld hl, CinnabarGymQuizIntroText
	call PrintText
	ld a, [hGymGateIndex]
	dec a
	add a
	ld d, 0
	ld e, a
	ld hl, CinnabarQuizQuestions
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call CinnabarGymQuiz_1ea92
	jp TextScriptEnd

CinnabarGymQuizIntroText:
	TX_FAR _CinnabarGymQuizIntroText
	db "@"

CinnabarQuizQuestions:
	dw CinnabarQuizQuestionsText1
	dw CinnabarQuizQuestionsText2
	dw CinnabarQuizQuestionsText3
	dw CinnabarQuizQuestionsText4
	dw CinnabarQuizQuestionsText5
	dw CinnabarQuizQuestionsText6

CinnabarQuizQuestionsText1:
	TX_FAR _CinnabarQuizQuestionsText1
	db "@"

CinnabarQuizQuestionsText2:
	TX_FAR _CinnabarQuizQuestionsText2
	db "@"

CinnabarQuizQuestionsText3:
	TX_FAR _CinnabarQuizQuestionsText3
	db "@"

CinnabarQuizQuestionsText4:
	TX_FAR _CinnabarQuizQuestionsText4
	db "@"

CinnabarQuizQuestionsText5:
	TX_FAR _CinnabarQuizQuestionsText5
	db "@"

CinnabarQuizQuestionsText6:
	TX_FAR _CinnabarQuizQuestionsText6
	db "@"

CinnabarGymGateFlagAction:
	EventFlagAddress hl, EVENT_CINNABAR_GYM_GATE0_UNLOCKED
	predef_jump FlagActionPredef

CinnabarGymQuiz_1ea92:
	call YesNoChoice
	ld a, [$ffdc]
	ld c, a
	ld a, [wCurrentMenuItem]
	cp c
	jr nz, .wrongAnswer
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ld a, [hGymGateIndex]
	ld [$ffe0], a
	ld hl, CinnabarGymQuizCorrectText
	call PrintText
	ld a, [$ffe0]
	AdjustEventBit EVENT_CINNABAR_GYM_GATE0_UNLOCKED, 0
	ld c, a
	ld b, FLAG_SET
	call CinnabarGymGateFlagAction
	jp UpdateCinnabarGymGateTileBlocks_
.wrongAnswer
	call WaitForSoundToFinish
	ld a, SFX_DENIED
	call PlaySound
	call WaitForSoundToFinish
	ld hl, CinnabarGymQuizIncorrectText
	call PrintText
	ld a, [hGymGateIndex]
	add $2
	AdjustEventBit EVENT_BEAT_CINNABAR_GYM_TRAINER_0, 2
	ld c, a
	ld b, FLAG_TEST
	EventFlagAddress hl, EVENT_BEAT_CINNABAR_GYM_TRAINER_0
	predef FlagActionPredef
	ld a, c
	and a
	ret nz
	ld a, [hGymGateIndex]
	add $2
	ld [wOpponentAfterWrongAnswer], a
	ret

CinnabarGymQuizCorrectText:
	TX_SFX_ITEM_1
	TX_FAR _CinnabarGymQuizCorrectText
	TX_BLINK
	TX_ASM

	ld a, [$ffe0]
	AdjustEventBit EVENT_CINNABAR_GYM_GATE0_UNLOCKED, 0
	ld c, a
	ld b, FLAG_TEST
	call CinnabarGymGateFlagAction
	ld a, c
	and a
	jp nz, TextScriptEnd
	call WaitForSoundToFinish
	ld a, SFX_GO_INSIDE
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

CinnabarGymQuizIncorrectText:
	TX_FAR _CinnabarGymQuizIncorrectText
	db "@"

UpdateCinnabarGymGateTileBlocks_:
; Update the overworld map with open floor blocks or locked gate blocks
; depending on event flags.
	ld a, 6
	ld [hGymGateIndex], a
.loop
	ld a, [hGymGateIndex]
	dec a
	add a
	add a
	ld d, 0
	ld e, a
	ld hl, CinnabarGymGateCoords
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	inc hl
	ld a, [hl]
	ld [wGymGateTileBlock], a
	push bc
	ld a, [hGymGateIndex]
	ld [$ffe0], a
	AdjustEventBit EVENT_CINNABAR_GYM_GATE0_UNLOCKED, 0
	ld c, a
	ld b, FLAG_TEST
	call CinnabarGymGateFlagAction
	ld a, c
	and a
	jr nz, .unlocked
	ld a, [wGymGateTileBlock]
	jr .next
.unlocked
	ld a, $e
.next
	pop bc
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	ld hl, hGymGateIndex
	dec [hl]
	jr nz, .loop
	ret

CinnabarGymGateCoords:
	; format: x-coord, y-coord, direction, padding
	; direction: $54 = horizontal gate, $5f = vertical gate
	db $09,$03,$54,$00
	db $06,$03,$54,$00
	db $06,$06,$54,$00
	db $03,$08,$5f,$00
	db $02,$06,$54,$00
	db $02,$03,$54,$00

PrintMagazinesText:
	call EnableAutoTextBoxDrawing
	tx_pre MagazinesText
	ret

MagazinesText:
	TX_FAR _MagazinesText
	db "@"

BillsHousePC:
	call EnableAutoTextBoxDrawing
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	CheckEvent EVENT_LEFT_BILLS_HOUSE_AFTER_HELPING
	jr nz, .displayBillsHousePokemonList
	CheckEventReuseA EVENT_USED_CELL_SEPARATOR_ON_BILL
	jr nz, .displayBillsHouseMonitorText
	CheckEventReuseA EVENT_BILL_SAID_USE_CELL_SEPARATOR
	jr nz, .doCellSeparator
.displayBillsHouseMonitorText
	tx_pre_jump BillsHouseMonitorText
.doCellSeparator
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	tx_pre BillsHouseInitiatedText
	ld c, 32
	call DelayFrames
	ld a, SFX_TINK
	call PlaySound
	call WaitForSoundToFinish
	ld c, 80
	call DelayFrames
	ld a, SFX_SHRINK
	call PlaySound
	call WaitForSoundToFinish
	ld c, 48
	call DelayFrames
	ld a, SFX_TINK
	call PlaySound
	call WaitForSoundToFinish
	ld c, 32
	call DelayFrames
	ld a, SFX_GET_ITEM_1
	call PlaySound
	call WaitForSoundToFinish
	call PlayDefaultMusic
	SetEvent EVENT_USED_CELL_SEPARATOR_ON_BILL
	ret
.displayBillsHousePokemonList
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	tx_pre BillsHousePokemonList
	ret

BillsHouseMonitorText:
	TX_FAR _BillsHouseMonitorText
	db "@"

BillsHouseInitiatedText:
	TX_FAR _BillsHouseInitiatedText
	TX_BLINK
	TX_ASM
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	ld c, 16
	call DelayFrames
	ld a, SFX_SWITCH
	call PlaySound
	call WaitForSoundToFinish
	ld c, 60
	call DelayFrames
	jp TextScriptEnd

BillsHousePokemonList:
	TX_ASM
	call SaveScreenTilesToBuffer1
	ld hl, BillsHousePokemonListText1
	call PrintText
	xor a
	ld [wMenuItemOffset], a ; not used
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, 4
	ld [wMaxMenuItem], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
.billsPokemonLoop
	ld hl, wd730
	set 6, [hl]
	coord hl, 0, 0
	ld b, 10
	ld c, 9
	call TextBoxBorder
	coord hl, 2, 2
	ld de, BillsMonListText
	call PlaceString
	ld hl, BillsHousePokemonListText2
	call PrintText
	call SaveScreenTilesToBuffer2
	call HandleMenuInput
	bit 1, a ; pressed b
	jr nz, .cancel
	ld a, [wCurrentMenuItem]
	add EEVEE
	cp EEVEE
	jr z, .displayPokedex
	cp FLAREON
	jr z, .displayPokedex
	cp JOLTEON
	jr z, .displayPokedex
	cp VAPOREON
	jr z, .displayPokedex
	jr .cancel
.displayPokedex
	call DisplayPokedex
	call LoadScreenTilesFromBuffer2
	jr .billsPokemonLoop
.cancel
	ld hl, wd730
	res 6, [hl]
	call LoadScreenTilesFromBuffer2
	jp TextScriptEnd

BillsHousePokemonListText1:
	TX_FAR _BillsHousePokemonListText1
	db "@"

BillsMonListText:
	db   "EEVEE"
	next "FLAREON"
	next "JOLTEON"
	next "VAPOREON"
	next "CANCEL@"

BillsHousePokemonListText2:
	TX_FAR _BillsHousePokemonListText2
	db "@"

DisplayOakLabEmailText:
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump OakLabEmailText

OakLabEmailText:
	TX_FAR _OakLabEmailText
	db "@"
