PrintNewBikeText: ; 1e94b (7:694b)
	call EnableAutoTextBoxDrawing
	tx_pre_jump NewBicycleText

NewBicycleText: ; 1e953 (7:6953)
	TX_FAR _NewBicycleText
	db "@"

DisplayOakLabLeftPoster: ; 1e958 (7:6958)
	call EnableAutoTextBoxDrawing
	tx_pre_jump PushStartText

PushStartText: ; 1e960 (7:6960)
	TX_FAR _PushStartText
	db "@"

DisplayOakLabRightPoster: ; 1e965 (7:6965)
	call EnableAutoTextBoxDrawing
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wd11e]
	cp $2
	tx_pre_id SaveOptionText
	jr c, .ownThreeOrMoreMon
	tx_pre_id StrengthsAndWeaknessesText
.ownThreeOrMoreMon
	jp PrintPredefTextID

SaveOptionText: ; 1e97e (7:697e)
	TX_FAR _SaveOptionText
	db "@"

StrengthsAndWeaknessesText: ; 1e983 (7:6983)
	TX_FAR _StrengthsAndWeaknessesText
	db "@"

SafariZoneCheck: ; 1e988 (7:6988)
	ld hl, wd790
	bit 7, [hl]; if we are not in the Safari Zone,
	jr z, SafariZoneGameStillGoing ; don't bother printing game over text
	ld a, [W_NUMSAFARIBALLS]
	and a
	jr z, SafariZoneGameOver
	jr SafariZoneGameStillGoing

SafariZoneCheckSteps: ; 1e997 (7:6997)
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
SafariZoneGameStillGoing: ; 1e9ab (7:69ab)
	xor a
	ld [wSafariZoneGameOver], a
	ret

SafariZoneGameOver: ; 1e9b0 (7:69b0)
	call EnableAutoTextBoxDrawing
	xor a
	ld [wMusicHeaderPointer], a
	dec a
	call PlaySound
	ld c, BANK(SFX_02_5f)
	ld a, SFX_SAFARI_ZONE_PA
	call PlayMusic
.asm_1e9c2
	ld a, [wc02a]
	cp $b9
	jr nz, .asm_1e9c2
	ld a, $d3
	ld [H_DOWNARROWBLINKCNT2], a
	call DisplayTextID
	xor a
	ld [wPlayerMovingDirection], a
	ld a, SAFARI_ZONE_ENTRANCE
	ld [H_DOWNARROWBLINKCNT1], a
	ld a, $3
	ld [wDestinationWarpID], a
	ld a, $5
	ld [W_SAFARIZONEENTRANCECURSCRIPT], a
	ld hl, wd790
	set 6, [hl]
	ld a, $1
	ld [wSafariZoneGameOver], a
	ret

PrintSafariGameOverText: ; 1e9ed (7:69ed)
	xor a
	ld [wJoyIgnore], a
	ld hl, SafariGameOverText
	jp PrintText

SafariGameOverText: ; 1e9f7 (7:69f7)
	TX_ASM
	ld a, [W_NUMSAFARIBALLS]
	and a
	jr z, .asm_1ea04
	ld hl, TimesUpText
	call PrintText
.asm_1ea04
	ld hl, GameOverText
	call PrintText
	jp TextScriptEnd

TimesUpText: ; 1ea0d (7:6a0d)
	TX_FAR _TimesUpText
	db "@"

GameOverText: ; 1ea12 (7:6a12)
	TX_FAR _GameOverText
	db "@"

PrintCinnabarQuiz: ; 1ea17 (7:6a17)
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump CinnabarGymQuiz

CinnabarGymQuiz: ; 1ea25 (7:6a25)
	TX_ASM
	xor a
	ld [wda38], a
	ld a, [wHiddenObjectFunctionArgument]
	push af
	and $f
	ld [$ffdb], a
	pop af
	and $f0
	swap a
	ld [$ffdc], a
	ld hl, CinnabarGymQuizIntroText
	call PrintText
	ld a, [$ffdb]
	dec a
	add a
	ld d, $0
	ld e, a
	ld hl, CinnabarQuizQuestions
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call CinnabarGymQuiz_1ea92
	jp TextScriptEnd

CinnabarGymQuizIntroText: ; 1ea5b (7:6a5b)
	TX_FAR _CinnabarGymQuizIntroText
	db "@"

CinnabarQuizQuestions: ; 1ea60 (7:6a60)
	dw CinnabarQuizQuestionsText1
	dw CinnabarQuizQuestionsText2
	dw CinnabarQuizQuestionsText3
	dw CinnabarQuizQuestionsText4
	dw CinnabarQuizQuestionsText5
	dw CinnabarQuizQuestionsText6

CinnabarQuizQuestionsText1: ; 1ea6c (7:6a6c)
	TX_FAR _CinnabarQuizQuestionsText1
	db "@"

CinnabarQuizQuestionsText2: ; 1ea71 (7:6a71)
	TX_FAR _CinnabarQuizQuestionsText2
	db "@"

CinnabarQuizQuestionsText3: ; 1ea76 (7:6a76)
	TX_FAR _CinnabarQuizQuestionsText3
	db "@"

CinnabarQuizQuestionsText4: ; 1ea7b (7:6a7b)
	TX_FAR _CinnabarQuizQuestionsText4
	db "@"

CinnabarQuizQuestionsText5: ; 1ea80 (7:6a80)
	TX_FAR _CinnabarQuizQuestionsText5
	db "@"

CinnabarQuizQuestionsText6: ; 1ea85 (7:6a85)
	TX_FAR _CinnabarQuizQuestionsText6
	db "@"

CinnabarGymQuiz_1ea8a: ; 1ea8a (7:6a8a)
	ld hl, wd79c
	predef_jump FlagActionPredef

CinnabarGymQuiz_1ea92: ; 1ea92 (7:6a92)
	call YesNoChoice
	ld a, [$ffdc]
	ld c, a
	ld a, [wCurrentMenuItem]
	cp c
	jr nz, .asm_1eab8
	ld hl, wd126
	set 5, [hl]
	ld a, [$ffdb]
	ld [$ffe0], a
	ld hl, CinnabarGymQuizCorrectText
	call PrintText
	ld a, [$ffe0]
	ld c, a
	ld b, FLAG_SET
	call CinnabarGymQuiz_1ea8a
	jp CinnabarGymQuiz_1eb0a
.asm_1eab8
	call WaitForSoundToFinish
	ld a, SFX_DENIED
	call PlaySound
	call WaitForSoundToFinish
	ld hl, CinnabarGymQuizIncorrectText
	call PrintText
	ld a, [$ffdb]
	add $2
	ld c, a
	ld b, FLAG_TEST
	ld hl, wd79a
	predef FlagActionPredef
	ld a, c
	and a
	ret nz
	ld a, [$ffdb]
	add $2
	ld [wda38], a
	ret

CinnabarGymQuizCorrectText: ; 1eae3 (7:6ae3)
	db $0b
	TX_FAR _CinnabarGymQuizCorrectText
	db $06
	TX_ASM

	ld a, [$ffe0]
	ld c, a
	ld b, FLAG_TEST
	call CinnabarGymQuiz_1ea8a
	ld a, c
	and a
	jp nz, TextScriptEnd
	call WaitForSoundToFinish
	ld a, SFX_GO_INSIDE
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

CinnabarGymQuizIncorrectText: ; 1eb05 (7:6b05)
	TX_FAR _CinnabarGymQuizIncorrectText
	db "@"

CinnabarGymQuiz_1eb0a: ; 1eb0a (7:6b0a)
	ld a, $6
	ld [$ffdb], a
.asm_1eb0e
	ld a, [$ffdb]
	dec a
	add a
	add a
	ld d, $0
	ld e, a
	ld hl, CinnabarGymGateCoords
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	inc hl
	ld a, [hl]
	ld [wd12f], a
	push bc
	ld a, [$ffdb]
	ld [$ffe0], a
	ld c, a
	ld b, FLAG_TEST
	call CinnabarGymQuiz_1ea8a
	ld a, c
	and a
	jr nz, .asm_1eb36
	ld a, [wd12f]
	jr .asm_1eb38
.asm_1eb36
	ld a, $e
.asm_1eb38
	pop bc
	ld [wd09f], a
	predef ReplaceTileBlock
	ld hl, $ffdb
	dec [hl]
	jr nz, .asm_1eb0e
	ret

CinnabarGymGateCoords: ; 1eb48 (7:6b48)
	; format: x-coord, y-coord, direction, padding
	; direction: $54 = horizontal gate, $5f = vertical gate
	db $09,$03,$54,$00
	db $06,$03,$54,$00
	db $06,$06,$54,$00
	db $03,$08,$5f,$00
	db $02,$06,$54,$00
	db $02,$03,$54,$00

PrintMagazinesText: ; 1eb60 (7:6b60)
	call EnableAutoTextBoxDrawing
	tx_pre MagazinesText
	ret

MagazinesText: ; 1eb69 (7:6b69)
	TX_FAR _MagazinesText
	db "@"

BillsHousePC: ; 1eb6e (7:6b6e)
	call EnableAutoTextBoxDrawing
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	ld a, [wd7f2]
	bit 7, a
	jr nz, .asm_1ebd2
	bit 3, a
	jr nz, .asm_1eb86
	bit 6, a
	jr nz, .asm_1eb8b
.asm_1eb86
	tx_pre_jump BillsHouseMonitorText
.asm_1eb8b
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
	ld hl, wd7f2
	set 3, [hl]
	ret
.asm_1ebd2
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	tx_pre BillsHousePokemonList
	ret

BillsHouseMonitorText: ; 1ebdd (7:6bdd)
	TX_FAR _BillsHouseMonitorText
	db "@"

BillsHouseInitiatedText: ; 1ebe2 (7:6be2)
	TX_FAR _BillsHouseInitiatedText
	db $06
	TX_ASM
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
	ld c, 16
	call DelayFrames
	ld a, SFX_SWITCH
	call PlaySound
	call WaitForSoundToFinish
	ld c, 60
	call DelayFrames
	jp TextScriptEnd

BillsHousePokemonList: ; 1ec05 (7:6c05)
	TX_ASM
	call SaveScreenTilesToBuffer1
	ld hl, BillsHousePokemonListText1
	call PrintText
	xor a
	ld [W_ANIMATIONID], a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, $3
	ld [wMenuWatchedKeys], a
	ld a, $4
	ld [wMaxMenuItem], a
	ld a, $2
	ld [wTopMenuItemY], a
	ld a, $1
	ld [wTopMenuItemX], a
.asm_1ec2d
	ld hl, wd730
	set 6, [hl]
	coord hl, 0, 0
	ld b, $a
	ld c, $9
	call TextBoxBorder
	coord hl, 2, 2
	ld de, BillsMonListText
	call PlaceString
	ld hl, BillsHousePokemonListText2
	call PrintText
	call SaveScreenTilesToBuffer2
	call HandleMenuInput
	bit 1, a
	jr nz, .asm_1ec74
	ld a, [wCurrentMenuItem]
	add EEVEE
	cp EEVEE
	jr z, .asm_1ec6c
	cp FLAREON
	jr z, .asm_1ec6c
	cp JOLTEON
	jr z, .asm_1ec6c
	cp VAPOREON
	jr z, .asm_1ec6c
	jr .asm_1ec74
.asm_1ec6c
	call DisplayPokedex
	call LoadScreenTilesFromBuffer2
	jr .asm_1ec2d
.asm_1ec74
	ld hl, wd730
	res 6, [hl]
	call LoadScreenTilesFromBuffer2
	jp TextScriptEnd

BillsHousePokemonListText1: ; 1ec7f (7:6c7f)
	TX_FAR _BillsHousePokemonListText1
	db "@"

BillsMonListText: ; 1ec84 (7:6c84)
	db   "EEVEE"
	next "FLAREON"
	next "JOLTEON"
	next "VAPOREON"
	next "CANCEL@"

BillsHousePokemonListText2: ; 1ecaa (7:6caa)
	TX_FAR _BillsHousePokemonListText2
	db "@"

DisplayOakLabEmailText: ; 1ecaf (7:6caf)
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump OakLabEmailText

OakLabEmailText: ; 1ecbd (7:6cbd)
	TX_FAR _OakLabEmailText
	db "@"
