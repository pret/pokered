Route19Script: ; 55d44 (15:5d44)
	call EnableAutoTextBoxDrawing
	ld hl, Route19TrainerHeaders
	ld de, Route19ScriptPointers
	ld a, [wRoute19CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute19CurScript], a
	ret

Route19ScriptPointers: ; 55d57 (15:5d57)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route19TextPointers: ; 55d5d (15:5d5d)
	dw Route19Text1
	dw Route19Text2
	dw Route19Text3
	dw Route19Text4
	dw Route19Text5
	dw Route19Text6
	dw Route19Text7
	dw Route19Text8
	dw Route19Text9
	dw Route19Text10
	dw Route19Text11

Route19TrainerHeaders: ; 55d73 (15:5d73)
Route19TrainerHeader0: ; 55d73 (15:5d73)
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_0
	dw Route19BattleText1 ; TextBeforeBattle
	dw Route19AfterBattleText1 ; TextAfterBattle
	dw Route19EndBattleText1 ; TextEndBattle
	dw Route19EndBattleText1 ; TextEndBattle

Route19TrainerHeader1: ; 55d7f (15:5d7f)
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_1
	dw Route19BattleText2 ; TextBeforeBattle
	dw Route19AfterBattleText2 ; TextAfterBattle
	dw Route19EndBattleText2 ; TextEndBattle
	dw Route19EndBattleText2 ; TextEndBattle

Route19TrainerHeader2: ; 55d8b (15:5d8b)
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_2
	dw Route19BattleText3 ; TextBeforeBattle
	dw Route19AfterBattleText3 ; TextAfterBattle
	dw Route19EndBattleText3 ; TextEndBattle
	dw Route19EndBattleText3 ; TextEndBattle

Route19TrainerHeader3: ; 55d97 (15:5d97)
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_3
	dw Route19BattleText4 ; TextBeforeBattle
	dw Route19AfterBattleText4 ; TextAfterBattle
	dw Route19EndBattleText4 ; TextEndBattle
	dw Route19EndBattleText4 ; TextEndBattle

Route19TrainerHeader4: ; 55da3 (15:5da3)
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_4
	dw Route19BattleText5 ; TextBeforeBattle
	dw Route19AfterBattleText5 ; TextAfterBattle
	dw Route19EndBattleText5 ; TextEndBattle
	dw Route19EndBattleText5 ; TextEndBattle

Route19TrainerHeader5: ; 55daf (15:5daf)
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_5
	dw Route19BattleText6 ; TextBeforeBattle
	dw Route19AfterBattleText6 ; TextAfterBattle
	dw Route19EndBattleText6 ; TextEndBattle
	dw Route19EndBattleText6 ; TextEndBattle

Route19TrainerHeader6: ; 55dbb (15:5dbb)
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_6
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_6
	dw Route19BattleText7 ; TextBeforeBattle
	dw Route19AfterBattleText7 ; TextAfterBattle
	dw Route19EndBattleText7 ; TextEndBattle
	dw Route19EndBattleText7 ; TextEndBattle

Route19TrainerHeader7: ; 55dc7 (15:5dc7)
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_7, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_7, 1
	dw Route19BattleText8 ; TextBeforeBattle
	dw Route19AfterBattleText8 ; TextAfterBattle
	dw Route19EndBattleText8 ; TextEndBattle
	dw Route19EndBattleText8 ; TextEndBattle

Route19TrainerHeader8: ; 55dd3 (15:5dd3)
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_8, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_8, 1
	dw Route19BattleText9 ; TextBeforeBattle
	dw Route19AfterBattleText9 ; TextAfterBattle
	dw Route19EndBattleText9 ; TextEndBattle
	dw Route19EndBattleText9 ; TextEndBattle

Route19TrainerHeader9: ; 55ddf (15:5ddf)
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_9, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_9, 1
	dw Route19BattleText10 ; TextBeforeBattle
	dw Route19AfterBattleText10 ; TextAfterBattle
	dw Route19EndBattleText10 ; TextEndBattle
	dw Route19EndBattleText10 ; TextEndBattle

	db $ff

Route19Text1: ; 55dec (15:5dec)
	TX_ASM
	ld hl, Route19TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route19Text2: ; 55df6 (15:5df6)
	TX_ASM
	ld hl, Route19TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route19Text3: ; 55e00 (15:5e00)
	TX_ASM
	ld hl, Route19TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route19Text4: ; 55e0a (15:5e0a)
	TX_ASM
	ld hl, Route19TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route19Text5: ; 55e14 (15:5e14)
	TX_ASM
	ld hl, Route19TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route19Text6: ; 55e1e (15:5e1e)
	TX_ASM
	ld hl, Route19TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route19Text7: ; 55e28 (15:5e28)
	TX_ASM
	ld hl, Route19TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route19Text8: ; 55e32 (15:5e32)
	TX_ASM
	ld hl, Route19TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route19Text9: ; 55e3c (15:5e3c)
	TX_ASM
	ld hl, Route19TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route19Text10: ; 55e46 (15:5e46)
	TX_ASM
	ld hl, Route19TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route19BattleText1: ; 55e50 (15:5e50)
	TX_FAR _Route19BattleText1
	db "@"

Route19EndBattleText1: ; 55e55 (15:5e55)
	TX_FAR _Route19EndBattleText1
	db "@"

Route19AfterBattleText1: ; 55e5a (15:5e5a)
	TX_FAR _Route19AfterBattleText1
	db "@"

Route19BattleText2: ; 55e5f (15:5e5f)
	TX_FAR _Route19BattleText2
	db "@"

Route19EndBattleText2: ; 55e64 (15:5e64)
	TX_FAR _Route19EndBattleText2
	db "@"

Route19AfterBattleText2: ; 55e69 (15:5e69)
	TX_FAR _Route19AfterBattleText2
	db "@"

Route19BattleText3: ; 55e6e (15:5e6e)
	TX_FAR _Route19BattleText3
	db "@"

Route19EndBattleText3: ; 55e73 (15:5e73)
	TX_FAR _Route19EndBattleText3
	db "@"

Route19AfterBattleText3: ; 55e78 (15:5e78)
	TX_FAR _Route19AfterBattleText3
	db "@"

Route19BattleText4: ; 55e7d (15:5e7d)
	TX_FAR _Route19BattleText4
	db "@"

Route19EndBattleText4: ; 55e82 (15:5e82)
	TX_FAR _Route19EndBattleText4
	db "@"

Route19AfterBattleText4: ; 55e87 (15:5e87)
	TX_FAR _Route19AfterBattleText4
	db "@"

Route19BattleText5: ; 55e8c (15:5e8c)
	TX_FAR _Route19BattleText5
	db "@"

Route19EndBattleText5: ; 55e91 (15:5e91)
	TX_FAR _Route19EndBattleText5
	db "@"

Route19AfterBattleText5: ; 55e96 (15:5e96)
	TX_FAR _Route19AfterBattleText5
	db "@"

Route19BattleText6: ; 55e9b (15:5e9b)
	TX_FAR _Route19BattleText6
	db "@"

Route19EndBattleText6: ; 55ea0 (15:5ea0)
	TX_FAR _Route19EndBattleText6
	db "@"

Route19AfterBattleText6: ; 55ea5 (15:5ea5)
	TX_FAR _Route19AfterBattleText6
	db "@"

Route19BattleText7: ; 55eaa (15:5eaa)
	TX_FAR _Route19BattleText7
	db "@"

Route19EndBattleText7: ; 55eaf (15:5eaf)
	TX_FAR _Route19EndBattleText7
	db "@"

Route19AfterBattleText7: ; 55eb4 (15:5eb4)
	TX_FAR _Route19AfterBattleText7
	db "@"

Route19BattleText8: ; 55eb9 (15:5eb9)
	TX_FAR _Route19BattleText8
	db "@"

Route19EndBattleText8: ; 55ebe (15:5ebe)
	TX_FAR _Route19EndBattleText8
	db "@"

Route19AfterBattleText8: ; 55ec3 (15:5ec3)
	TX_FAR _Route19AfterBattleText8
	db "@"

Route19BattleText9: ; 55ec8 (15:5ec8)
	TX_FAR _Route19BattleText9
	db "@"

Route19EndBattleText9: ; 55ecd (15:5ecd)
	TX_FAR _Route19EndBattleText9
	db "@"

Route19AfterBattleText9: ; 55ed2 (15:5ed2)
	TX_FAR _Route19AfterBattleText9
	db "@"

Route19BattleText10: ; 55ed7 (15:5ed7)
	TX_FAR _Route19BattleText10
	db "@"

Route19EndBattleText10: ; 55edc (15:5edc)
	TX_FAR _Route19EndBattleText10
	db "@"

Route19AfterBattleText10: ; 55ee1 (15:5ee1)
	TX_FAR _Route19AfterBattleText10
	db "@"

Route19Text11: ; 55ee6 (15:5ee6)
	TX_FAR _Route19Text11
	db "@"
