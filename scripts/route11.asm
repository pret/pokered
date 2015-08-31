Route11Script: ; 5944c (16:544c)
	call EnableAutoTextBoxDrawing
	ld hl, Route11TrainerHeaders
	ld de, Route11ScriptPointers
	ld a, [wRoute11CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute11CurScript], a
	ret

Route11ScriptPointers: ; 5945f (16:545f)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route11TextPointers: ; 59465 (16:5465)
	dw Route11Text1
	dw Route11Text2
	dw Route11Text3
	dw Route11Text4
	dw Route11Text5
	dw Route11Text6
	dw Route11Text7
	dw Route11Text8
	dw Route11Text9
	dw Route11Text10
	dw Route11Text11

Route11TrainerHeaders: ; 5947b (16:547b)
Route11TrainerHeader0: ; 5947b (16:547b)
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_0
	dw Route11BattleText1 ; TextBeforeBattle
	dw Route11AfterBattleText1 ; TextAfterBattle
	dw Route11EndBattleText1 ; TextEndBattle
	dw Route11EndBattleText1 ; TextEndBattle

Route11TrainerHeader1: ; 59487 (16:5487)
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_1
	dw Route11BattleText2 ; TextBeforeBattle
	dw Route11AfterBattleText2 ; TextAfterBattle
	dw Route11EndBattleText2 ; TextEndBattle
	dw Route11EndBattleText2 ; TextEndBattle

Route11TrainerHeader2: ; 59493 (16:5493)
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_2
	dw Route11BattleText3 ; TextBeforeBattle
	dw Route11AfterBattleText3 ; TextAfterBattle
	dw Route11EndBattleText3 ; TextEndBattle
	dw Route11EndBattleText3 ; TextEndBattle

Route11TrainerHeader3: ; 5949f (16:549f)
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_3
	dw Route11BattleText4 ; TextBeforeBattle
	dw Route11AfterBattleText4 ; TextAfterBattle
	dw Route11EndBattleText4 ; TextEndBattle
	dw Route11EndBattleText4 ; TextEndBattle

Route11TrainerHeader4: ; 594ab (16:54ab)
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_4
	dw Route11BattleText5 ; TextBeforeBattle
	dw Route11AfterBattleText5 ; TextAfterBattle
	dw Route11EndBattleText5 ; TextEndBattle
	dw Route11EndBattleText5 ; TextEndBattle

Route11TrainerHeader5: ; 594b7 (16:54b7)
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_5
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_5
	dw Route11BattleText6 ; TextBeforeBattle
	dw Route11AfterBattleText6 ; TextAfterBattle
	dw Route11EndBattleText6 ; TextEndBattle
	dw Route11EndBattleText6 ; TextEndBattle

Route11TrainerHeader6: ; 594c3 (16:54c3)
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_6
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_6
	dw Route11BattleText7 ; TextBeforeBattle
	dw Route11AfterBattleText7 ; TextAfterBattle
	dw Route11EndBattleText7 ; TextEndBattle
	dw Route11EndBattleText7 ; TextEndBattle

Route11TrainerHeader7: ; 594cf (16:54cf)
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_7, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_7, 1
	dw Route11BattleText8 ; TextBeforeBattle
	dw Route11AfterBattleText8 ; TextAfterBattle
	dw Route11EndBattleText8 ; TextEndBattle
	dw Route11EndBattleText8 ; TextEndBattle

Route11TrainerHeader8: ; 594db (16:54db)
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_8, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_8, 1
	dw Route11BattleText9 ; TextBeforeBattle
	dw Route11AfterBattleText9 ; TextAfterBattle
	dw Route11EndBattleText9 ; TextEndBattle
	dw Route11EndBattleText9 ; TextEndBattle

Route11TrainerHeader9: ; 594e7 (16:54e7)
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_9, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_9, 1
	dw Route11BattleText10 ; TextBeforeBattle
	dw Route11AfterBattleText10 ; TextAfterBattle
	dw Route11EndBattleText10 ; TextEndBattle
	dw Route11EndBattleText10 ; TextEndBattle

	db $ff

Route11Text1: ; 594f4 (16:54f4)
	TX_ASM
	ld hl, Route11TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText1: ; 594fe (16:54fe)
	TX_FAR _Route11BattleText1
	db "@"

Route11EndBattleText1: ; 59503 (16:5503)
	TX_FAR _Route11EndBattleText1
	db "@"

Route11AfterBattleText1: ; 59508 (16:5508)
	TX_FAR _Route11AfterBattleText1
	db "@"

Route11Text2: ; 5950d (16:550d)
	TX_ASM
	ld hl, Route11TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText2: ; 59517 (16:5517)
	TX_FAR _Route11BattleText2
	db "@"

Route11EndBattleText2: ; 5951c (16:551c)
	TX_FAR _Route11EndBattleText2
	db "@"

Route11AfterBattleText2: ; 59521 (16:5521)
	TX_FAR _Route11AfterBattleText2
	db "@"

Route11Text3: ; 59526 (16:5526)
	TX_ASM
	ld hl, Route11TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText3: ; 59530 (16:5530)
	TX_FAR _Route11BattleText3
	db "@"

Route11EndBattleText3: ; 59535 (16:5535)
	TX_FAR _Route11EndBattleText3
	db "@"

Route11AfterBattleText3: ; 5953a (16:553a)
	TX_FAR _Route11AfterBattleText3
	db "@"

Route11Text4: ; 5953f (16:553f)
	TX_ASM
	ld hl, Route11TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText4: ; 59549 (16:5549)
	TX_FAR _Route11BattleText4
	db "@"

Route11EndBattleText4: ; 5954e (16:554e)
	TX_FAR _Route11EndBattleText4
	db "@"

Route11AfterBattleText4: ; 59553 (16:5553)
	TX_FAR _Route11AfterBattleText4
	db "@"

Route11Text5: ; 59558 (16:5558)
	TX_ASM
	ld hl, Route11TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText5: ; 59562 (16:5562)
	TX_FAR _Route11BattleText5
	db "@"

Route11EndBattleText5: ; 59567 (16:5567)
	TX_FAR _Route11EndBattleText5
	db "@"

Route11AfterBattleText5: ; 5956c (16:556c)
	TX_FAR _Route11AfterBattleText5
	db "@"

Route11Text6: ; 59571 (16:5571)
	TX_ASM
	ld hl, Route11TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText6: ; 5957b (16:557b)
	TX_FAR _Route11BattleText6
	db "@"

Route11EndBattleText6: ; 59580 (16:5580)
	TX_FAR _Route11EndBattleText6
	db "@"

Route11AfterBattleText6: ; 59585 (16:5585)
	TX_FAR _Route11AfterBattleText6
	db "@"

Route11Text7: ; 5958a (16:558a)
	TX_ASM
	ld hl, Route11TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText7: ; 59594 (16:5594)
	TX_FAR _Route11BattleText7
	db "@"

Route11EndBattleText7: ; 59599 (16:5599)
	TX_FAR _Route11EndBattleText7
	db "@"

Route11AfterBattleText7: ; 5959e (16:559e)
	TX_FAR _Route11AfterBattleText7
	db "@"

Route11Text8: ; 595a3 (16:55a3)
	TX_ASM
	ld hl, Route11TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText8: ; 595ad (16:55ad)
	TX_FAR _Route11BattleText8
	db "@"

Route11EndBattleText8: ; 595b2 (16:55b2)
	TX_FAR _Route11EndBattleText8
	db "@"

Route11AfterBattleText8: ; 595b7 (16:55b7)
	TX_FAR _Route11AfterBattleText8
	db "@"

Route11Text9: ; 595bc (16:55bc)
	TX_ASM
	ld hl, Route11TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText9: ; 595c6 (16:55c6)
	TX_FAR _Route11BattleText9
	db "@"

Route11EndBattleText9: ; 595cb (16:55cb)
	TX_FAR _Route11EndBattleText9
	db "@"

Route11AfterBattleText9: ; 595d0 (16:55d0)
	TX_FAR _Route11AfterBattleText9
	db "@"

Route11Text10: ; 595d5 (16:55d5)
	TX_ASM
	ld hl, Route11TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText10: ; 595df (16:55df)
	TX_FAR _Route11BattleText10
	db "@"

Route11EndBattleText10: ; 595e4 (16:55e4)
	TX_FAR _Route11EndBattleText10
	db "@"

Route11AfterBattleText10: ; 595e9 (16:55e9)
	TX_FAR _Route11AfterBattleText10
	db "@"

Route11Text11: ; 595ee (16:55ee)
	TX_FAR _Route11Text11
	db "@"
