Route14Script: ; 559d3 (15:59d3)
	call EnableAutoTextBoxDrawing
	ld hl, Route14TrainerHeaders
	ld de, Route14ScriptPointers
	ld a, [W_ROUTE14CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROUTE14CURSCRIPT], a
	ret

Route14ScriptPointers: ; 559e6 (15:59e6)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route14TextPointers: ; 559ec (15:59ec)
	dw Route14Text1
	dw Route14Text2
	dw Route14Text3
	dw Route14Text4
	dw Route14Text5
	dw Route14Text6
	dw Route14Text7
	dw Route14Text8
	dw Route14Text9
	dw Route14Text10
	dw Route14Text11

Route14TrainerHeaders: ; 55a02 (15:5a02)
Route14TrainerHeader0: ; 55a02 (15:5a02)
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_0
	dw Route14BattleText1 ; TextBeforeBattle
	dw Route14AfterBattleText1 ; TextAfterBattle
	dw Route14EndBattleText1 ; TextEndBattle
	dw Route14EndBattleText1 ; TextEndBattle

Route14TrainerHeader1: ; 55a0e (15:5a0e)
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_1
	dw Route14BattleText2 ; TextBeforeBattle
	dw Route14AfterBattleText2 ; TextAfterBattle
	dw Route14EndBattleText2 ; TextEndBattle
	dw Route14EndBattleText2 ; TextEndBattle

Route14TrainerHeader2: ; 55a1a (15:5a1a)
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_2
	dw Route14BattleText3 ; TextBeforeBattle
	dw Route14AfterBattleText3 ; TextAfterBattle
	dw Route14EndBattleText3 ; TextEndBattle
	dw Route14EndBattleText3 ; TextEndBattle

Route14TrainerHeader3: ; 55a26 (15:5a26)
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_3
	dw Route14BattleText4 ; TextBeforeBattle
	dw Route14AfterBattleText4 ; TextAfterBattle
	dw Route14EndBattleText4 ; TextEndBattle
	dw Route14EndBattleText4 ; TextEndBattle

Route14TrainerHeader4: ; 55a32 (15:5a32)
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_4
	dw Route14BattleText5 ; TextBeforeBattle
	dw Route14AfterBattleText5 ; TextAfterBattle
	dw Route14EndBattleText5 ; TextEndBattle
	dw Route14EndBattleText5 ; TextEndBattle

Route14TrainerHeader5: ; 55a3e (15:5a3e)
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_5
	dw Route14BattleText6 ; TextBeforeBattle
	dw Route14AfterBattleText6 ; TextAfterBattle
	dw Route14EndBattleText6 ; TextEndBattle
	dw Route14EndBattleText6 ; TextEndBattle

Route14TrainerHeader6: ; 55a4a (15:5a4a)
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_6
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_6
	dw Route14BattleText7 ; TextBeforeBattle
	dw Route14AfterBattleText7 ; TextAfterBattle
	dw Route14EndBattleText7 ; TextEndBattle
	dw Route14EndBattleText7 ; TextEndBattle

Route14TrainerHeader7: ; 55a56 (15:5a56)
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_7, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_7, 1
	dw Route14BattleText8 ; TextBeforeBattle
	dw Route14AfterBattleText8 ; TextAfterBattle
	dw Route14EndBattleText8 ; TextEndBattle
	dw Route14EndBattleText8 ; TextEndBattle

Route14TrainerHeader8: ; 55a62 (15:5a62)
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_8, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_8, 1
	dw Route14BattleText9 ; TextBeforeBattle
	dw Route14AfterBattleText9 ; TextAfterBattle
	dw Route14EndBattleText9 ; TextEndBattle
	dw Route14EndBattleText9 ; TextEndBattle

Route14TrainerHeader9: ; 55a6e (15:5a6e)
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_9, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_9, 1
	dw Route14BattleText10 ; TextBeforeBattle
	dw Route14AfterBattleText10 ; TextAfterBattle
	dw Route14EndBattleText10 ; TextEndBattle
	dw Route14EndBattleText10 ; TextEndBattle

	db $ff

Route14Text1: ; 55a7b (15:5a7b)
	TX_ASM
	ld hl, Route14TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText1: ; 55a85 (15:5a85)
	TX_FAR _Route14BattleText1
	db "@"

Route14EndBattleText1: ; 55a8a (15:5a8a)
	TX_FAR _Route14EndBattleText1
	db "@"

Route14AfterBattleText1: ; 55a8f (15:5a8f)
	TX_FAR _Route14AfterBattleText1
	db "@"

Route14Text2: ; 55a94 (15:5a94)
	TX_ASM
	ld hl, Route14TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText2: ; 55a9e (15:5a9e)
	TX_FAR _Route14BattleText2
	db "@"

Route14EndBattleText2: ; 55aa3 (15:5aa3)
	TX_FAR _Route14EndBattleText2
	db "@"

Route14AfterBattleText2: ; 55aa8 (15:5aa8)
	TX_FAR _Route14AfterBattleText2
	db "@"

Route14Text3: ; 55aad (15:5aad)
	TX_ASM
	ld hl, Route14TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText3: ; 55ab7 (15:5ab7)
	TX_FAR _Route14BattleText3
	db "@"

Route14EndBattleText3: ; 55abc (15:5abc)
	TX_FAR _Route14EndBattleText3
	db "@"

Route14AfterBattleText3: ; 55ac1 (15:5ac1)
	TX_FAR _Route14AfterBattleText3
	db "@"

Route14Text4: ; 55ac6 (15:5ac6)
	TX_ASM
	ld hl, Route14TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText4: ; 55ad0 (15:5ad0)
	TX_FAR _Route14BattleText4
	db "@"

Route14EndBattleText4: ; 55ad5 (15:5ad5)
	TX_FAR _Route14EndBattleText4
	db "@"

Route14AfterBattleText4: ; 55ada (15:5ada)
	TX_FAR _Route14AfterBattleText4
	db "@"

Route14Text5: ; 55adf (15:5adf)
	TX_ASM
	ld hl, Route14TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText5: ; 55ae9 (15:5ae9)
	TX_FAR _Route14BattleText5
	db "@"

Route14EndBattleText5: ; 55aee (15:5aee)
	TX_FAR _Route14EndBattleText5
	db "@"

Route14AfterBattleText5: ; 55af3 (15:5af3)
	TX_FAR _Route14AfterBattleText5
	db "@"

Route14Text6: ; 55af8 (15:5af8)
	TX_ASM
	ld hl, Route14TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText6: ; 55b02 (15:5b02)
	TX_FAR _Route14BattleText6
	db "@"

Route14EndBattleText6: ; 55b07 (15:5b07)
	TX_FAR _Route14EndBattleText6
	db "@"

Route14AfterBattleText6: ; 55b0c (15:5b0c)
	TX_FAR _Route14AfterBattleText6
	db "@"

Route14Text7: ; 55b11 (15:5b11)
	TX_ASM
	ld hl, Route14TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText7: ; 55b1b (15:5b1b)
	TX_FAR _Route14BattleText7
	db "@"

Route14EndBattleText7: ; 55b20 (15:5b20)
	TX_FAR _Route14EndBattleText7
	db "@"

Route14AfterBattleText7: ; 55b25 (15:5b25)
	TX_FAR _Route14AfterBattleText7
	db "@"

Route14Text8: ; 55b2a (15:5b2a)
	TX_ASM
	ld hl, Route14TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText8: ; 55b34 (15:5b34)
	TX_FAR _Route14BattleText8
	db "@"

Route14EndBattleText8: ; 55b39 (15:5b39)
	TX_FAR _Route14EndBattleText8
	db "@"

Route14AfterBattleText8: ; 55b3e (15:5b3e)
	TX_FAR _Route14AfterBattleText8
	db "@"

Route14Text9: ; 55b43 (15:5b43)
	TX_ASM
	ld hl, Route14TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText9: ; 55b4d (15:5b4d)
	TX_FAR _Route14BattleText9
	db "@"

Route14EndBattleText9: ; 55b52 (15:5b52)
	TX_FAR _Route14EndBattleText9
	db "@"

Route14AfterBattleText9: ; 55b57 (15:5b57)
	TX_FAR _Route14AfterBattleText9
	db "@"

Route14Text10: ; 55b5c (15:5b5c)
	TX_ASM
	ld hl, Route14TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText10: ; 55b66 (15:5b66)
	TX_FAR _Route14BattleText10
	db "@"

Route14EndBattleText10: ; 55b6b (15:5b6b)
	TX_FAR _Route14EndBattleText10
	db "@"

Route14AfterBattleText10: ; 55b70 (15:5b70)
	TX_FAR _Route14AfterBattleText10
	db "@"

Route14Text11: ; 55b75 (15:5b75)
	TX_FAR _Route14Text11
	db "@"
