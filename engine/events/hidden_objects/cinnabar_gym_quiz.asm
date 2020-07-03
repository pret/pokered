PrintCinnabarQuiz:
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump CinnabarGymQuiz

CinnabarGymQuiz::
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

UpdateCinnabarGymGateTileBlocks_::
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
