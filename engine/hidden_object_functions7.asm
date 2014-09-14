PrintNewBikeText: ; 1e94b (7:694b)
	call EnableAutoTextBoxDrawing
	ld a, $39
	jp PrintPredefTextID

NewBicycleText: ; 1e953 (7:6953)
	TX_FAR _NewBicycleText
	db "@"

DisplayOakLabLeftPoster: ; 1e958 (7:6958)
	call EnableAutoTextBoxDrawing
	ld a, $05 ; PushStartText
	jp PrintPredefTextID

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
	ld a, $6 ; SaveOptionText
	jr c, .asm_1e97b
	ld a, $7 ; StrengthsAndWeaknessesText
.asm_1e97b
	jp PrintPredefTextID

SaveOptionText: ; 1e97e (7:697e)
	TX_FAR _SaveOptionText
	db "@"

StrengthsAndWeaknessesText: ; 1e983 (7:6983)
	TX_FAR _StrengthsAndWeaknessesText
	db "@"

SafariZoneCheck: ; 1e988 (7:6988)
	ld hl, wd790
	bit 7, [hl]
	jr z, asm_1e9ab
	ld a, [W_NUMSAFARIBALLS] ; W_NUMSAFARIBALLS
	and a
	jr z, asm_1e9b0
	jr asm_1e9ab

SafariZoneCheckSteps: ; 1e997 (7:6997)
	ld a, [wSafariSteps] ; wd70d
	ld b, a
	ld a, [wSafariSteps + 1] ; wd70e
	ld c, a
	or b
	jr z, asm_1e9b0
	dec bc
	ld a, b
	ld [wSafariSteps], a ; wd70d
	ld a, c
	ld [wSafariSteps + 1], a ; wd70e
asm_1e9ab: ; 1e9ab (7:69ab)
	xor a
	ld [wSafariZoneGameOver], a
	ret
asm_1e9b0: ; 1e9b0 (7:69b0)
	call EnableAutoTextBoxDrawing
	xor a
	ld [wMusicHeaderPointer], a
	dec a
	call PlaySound
	ld c, BANK(SFX_02_5f)
	ld a, (SFX_02_5f - SFX_Headers_02) / 3
	call PlayMusic
.asm_1e9c2
	ld a, [wc02a]
	cp $b9
	jr nz, .asm_1e9c2
	ld a, $d3
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	xor a
	ld [wd528], a
	ld a, $9c
	ld [H_DOWNARROWBLINKCNT1], a ; $ff8b
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
	db $08 ; asm
	ld a, [W_NUMSAFARIBALLS] ; W_NUMSAFARIBALLS
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
	cp $4
	ret nz
	call EnableAutoTextBoxDrawing
	ld a, $31
	jp PrintPredefTextID

CinnabarGymQuiz: ; 1ea25 (7:6a25)
	db $08 ; asm
	xor a
	ld [wda38], a
	ld a, [wWhichTrade] ; wWhichTrade
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
	ld a, [wCurrentMenuItem] ; wCurrentMenuItem
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
	ld b, $1
	call CinnabarGymQuiz_1ea8a
	jp CinnabarGymQuiz_1eb0a
.asm_1eab8
	call WaitForSoundToFinish
	ld a, (SFX_02_51 - SFX_Headers_02) / 3
	call PlaySound
	call WaitForSoundToFinish
	ld hl, CinnabarGymQuizIncorrectText
	call PrintText
	ld a, [$ffdb]
	add $2
	ld c, a
	ld b, $2
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
	db $06,$08

	ld a, [$ffe0]
	ld c, a
	ld b, $2
	call CinnabarGymQuiz_1ea8a
	ld a, c
	and a
	jp nz, TextScriptEnd
	call WaitForSoundToFinish
	ld a, (SFX_02_57 - SFX_Headers_02) / 3
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
	ld hl, CinnabarGymGateCoords ; $6b48
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
	ld b, $2
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
	ld a, $30
	call PrintPredefTextID
	ret

MagazinesText: ; 1eb69 (7:6b69)
	TX_FAR _MagazinesText
	db "@"

BillsHousePC: ; 1eb6e (7:6b6e)
	call EnableAutoTextBoxDrawing
	ld a, [wSpriteStateData1 + 9]
	cp $4
	ret nz
	ld a, [wd7f2]
	bit 7, a
	jr nz, .asm_1ebd2
	bit 3, a
	jr nz, .asm_1eb86
	bit 6, a
	jr nz, .asm_1eb8b
.asm_1eb86
	ld a, $2d
	jp PrintPredefTextID
.asm_1eb8b
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, $2e
	call PrintPredefTextID
	ld c, $20
	call DelayFrames
	ld a, (SFX_02_3c - SFX_Headers_02) / 3
	call PlaySound
	call WaitForSoundToFinish
	ld c, $50
	call DelayFrames
	ld a, (SFX_02_48 - SFX_Headers_02) / 3
	call PlaySound
	call WaitForSoundToFinish
	ld c, $30
	call DelayFrames
	ld a, (SFX_02_3c - SFX_Headers_02) / 3
	call PlaySound
	call WaitForSoundToFinish
	ld c, $20
	call DelayFrames
	ld a, (SFX_02_3a - SFX_Headers_02) / 3
	call PlaySound
	call WaitForSoundToFinish
	call PlayDefaultMusic
	ld hl, wd7f2
	set 3, [hl]
	ret
.asm_1ebd2
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, $2f
	call PrintPredefTextID
	ret

BillsHouseMonitorText: ; 1ebdd (7:6bdd)
	TX_FAR _BillsHouseMonitorText
	db "@"

BillsHouseInitiatedText: ; 1ebe2 (7:6be2)
	TX_FAR _BillsHouseInitiatedText
	db $06
	db $08 ; asm
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
	ld c, $10
	call DelayFrames
	ld a, (SFX_02_49 - SFX_Headers_02) / 3
	call PlaySound
	call WaitForSoundToFinish
	ld c, $3c
	call DelayFrames
	jp TextScriptEnd

BillsHousePokemonList: ; 1ec05 (7:6c05)
	db $08 ; asm
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
	ld hl, wTileMap
	ld b, $a
	ld c, $9
	call TextBoxBorder
	ld hl, wTileMap + $2a
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
	cp $4
	ret nz
	call EnableAutoTextBoxDrawing
	ld a, $8 ; OakLabEmailText
	jp PrintPredefTextID

OakLabEmailText: ; 1ecbd (7:6cbd)
	TX_FAR _OakLabEmailText
	db "@"
