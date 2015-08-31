Route16Script: ; 59933 (16:5933)
	call EnableAutoTextBoxDrawing
	ld hl, Route16TrainerHeaders
	ld de, Route16ScriptPointers
	ld a, [wRoute16CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute16CurScript], a
	ret

Route16Script_59946: ; 59946 (16:5946)
	xor a
	ld [wJoyIgnore], a
	ld [wRoute16CurScript], a
	ld [wCurMapScript], a
	ret

Route16ScriptPointers: ; 59951 (16:5951)
	dw Route16Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw Route16Script3

Route16Script0: ; 59959 (16:5959)
	CheckEventHL EVENT_BEAT_ROUTE16_SNORLAX
	jp nz, CheckFightingMapTrainers
	CheckEventReuseHL EVENT_FIGHT_ROUTE16_SNORLAX
	ResetEventReuseHL EVENT_FIGHT_ROUTE16_SNORLAX
	jp z, CheckFightingMapTrainers
	ld a, $a
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, SNORLAX
	ld [wCurOpponent], a
	ld a, 30
	ld [wCurEnemyLVL], a
	ld a, HS_ROUTE_16_SNORLAX
	ld [wMissableObjectIndex], a
	predef HideObject
	call UpdateSprites
	ld a, $3
	ld [wRoute16CurScript], a
	ld [wCurMapScript], a
	ret

Route16Script3: ; 5998f (16:598f)
	ld a, [wIsInBattle]
	cp $ff
	jp z, Route16Script_59946
	call UpdateSprites
	ld a, [wBattleResult]
	cp $2
	jr z, .asm_599a8
	ld a, $b
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
.asm_599a8
	SetEvent EVENT_BEAT_ROUTE16_SNORLAX
	call Delay3
	ld a, $0
	ld [wRoute16CurScript], a
	ld [wCurMapScript], a
	ret

Route16TextPointers: ; 599b9 (16:59b9)
	dw Route16Text1
	dw Route16Text2
	dw Route16Text3
	dw Route16Text4
	dw Route16Text5
	dw Route16Text6
	dw Route16Text7
	dw Route16Text8
	dw Route16Text9
	dw Route16Text10
	dw Route16Text11

Route16TrainerHeaders: ; 599cf (16:59cf)
Route16TrainerHeader0: ; 599cf (16:59cf)
	dbEventFlagBit EVENT_BEAT_ROUTE_16_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_16_TRAINER_0
	dw Route16BattleText1 ; TextBeforeBattle
	dw Route16AfterBattleText1 ; TextAfterBattle
	dw Route16EndBattleText1 ; TextEndBattle
	dw Route16EndBattleText1 ; TextEndBattle

Route16TrainerHeader1: ; 599db (16:59db)
	dbEventFlagBit EVENT_BEAT_ROUTE_16_TRAINER_1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_16_TRAINER_1
	dw Route16BattleText2 ; TextBeforeBattle
	dw Route16AfterBattleText2 ; TextAfterBattle
	dw Route16EndBattleText2 ; TextEndBattle
	dw Route16EndBattleText2 ; TextEndBattle

Route16TrainerHeader2: ; 599e7 (16:59e7)
	dbEventFlagBit EVENT_BEAT_ROUTE_16_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_16_TRAINER_2
	dw Route16BattleText3 ; TextBeforeBattle
	dw Route16AfterBattleText3 ; TextAfterBattle
	dw Route16EndBattleText3 ; TextEndBattle
	dw Route16EndBattleText3 ; TextEndBattle

Route16TrainerHeader3: ; 599f3 (16:59f3)
	dbEventFlagBit EVENT_BEAT_ROUTE_16_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_16_TRAINER_3
	dw Route16BattleText4 ; TextBeforeBattle
	dw Route16AfterBattleText4 ; TextAfterBattle
	dw Route16EndBattleText4 ; TextEndBattle
	dw Route16EndBattleText4 ; TextEndBattle

Route16TrainerHeader4: ; 599ff (16:59ff)
	dbEventFlagBit EVENT_BEAT_ROUTE_16_TRAINER_4
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_16_TRAINER_4
	dw Route16BattleText5 ; TextBeforeBattle
	dw Route16AfterBattleText5 ; TextAfterBattle
	dw Route16EndBattleText5 ; TextEndBattle
	dw Route16EndBattleText5 ; TextEndBattle

Route16TrainerHeader5: ; 59a0b (16:5a0b)
	dbEventFlagBit EVENT_BEAT_ROUTE_16_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_16_TRAINER_5
	dw Route16BattleText6 ; TextBeforeBattle
	dw Route16AfterBattleText6 ; TextAfterBattle
	dw Route16EndBattleText6 ; TextEndBattle
	dw Route16EndBattleText6 ; TextEndBattle

	db $ff

Route16Text1: ; 59a18 (16:5a18)
	TX_ASM
	ld hl, Route16TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route16BattleText1: ; 59a22 (16:5a22)
	TX_FAR _Route16BattleText1
	db "@"

Route16EndBattleText1: ; 59a27 (16:5a27)
	TX_FAR _Route16EndBattleText1
	db "@"

Route16AfterBattleText1: ; 59a2c (16:5a2c)
	TX_FAR _Route16AfterBattleText1
	db "@"

Route16Text2: ; 59a31 (16:5a31)
	TX_ASM
	ld hl, Route16TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route16BattleText2: ; 59a3b (16:5a3b)
	TX_FAR _Route16BattleText2
	db "@"

Route16EndBattleText2: ; 59a40 (16:5a40)
	TX_FAR _Route16EndBattleText2
	db "@"

Route16AfterBattleText2: ; 59a45 (16:5a45)
	TX_FAR _Route16AfterBattleText2
	db "@"

Route16Text3: ; 59a4a (16:5a4a)
	TX_ASM
	ld hl, Route16TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route16BattleText3: ; 59a54 (16:5a54)
	TX_FAR _Route16BattleText3
	db "@"

Route16EndBattleText3: ; 59a59 (16:5a59)
	TX_FAR _Route16EndBattleText3
	db "@"

Route16AfterBattleText3: ; 59a5e (16:5a5e)
	TX_FAR _Route16AfterBattleText3
	db "@"

Route16Text4: ; 59a63 (16:5a63)
	TX_ASM
	ld hl, Route16TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route16BattleText4: ; 59a6d (16:5a6d)
	TX_FAR _Route16BattleText4
	db "@"

Route16EndBattleText4: ; 59a72 (16:5a72)
	TX_FAR _Route16EndBattleText4
	db "@"

Route16AfterBattleText4: ; 59a77 (16:5a77)
	TX_FAR _Route16AfterBattleText4
	db "@"

Route16Text5: ; 59a7c (16:5a7c)
	TX_ASM
	ld hl, Route16TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route16BattleText5: ; 59a86 (16:5a86)
	TX_FAR _Route16BattleText5
	db "@"

Route16EndBattleText5: ; 59a8b (16:5a8b)
	TX_FAR _Route16EndBattleText5
	db "@"

Route16AfterBattleText5: ; 59a90 (16:5a90)
	TX_FAR _Route16AfterBattleText5
	db "@"

Route16Text6: ; 59a95 (16:5a95)
	TX_ASM
	ld hl, Route16TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route16BattleText6: ; 59a9f (16:5a9f)
	TX_FAR _Route16BattleText6
	db "@"

Route16EndBattleText6: ; 59aa4 (16:5aa4)
	TX_FAR _Route16EndBattleText6
	db "@"

Route16AfterBattleText6: ; 59aa9 (16:5aa9)
	TX_FAR _Route16AfterBattleText6
	db "@"

Route16Text7: ; 59aae (16:5aae)
	TX_FAR _Route16Text7
	db "@"

Route16Text10: ; 59ab3 (16:5ab3)
	TX_FAR _Route16Text10
	db "@"

Route16Text11: ; 59ab8 (16:5ab8)
	TX_FAR _Route16Text11
	db "@"

Route16Text8: ; 59abd (16:5abd)
	TX_FAR _Route16Text8
	db "@"

Route16Text9: ; 59ac2 (16:5ac2)
	TX_FAR _Route16Text9
	db "@"
