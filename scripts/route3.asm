Route3Script: ; 554f8 (15:54f8)
	call EnableAutoTextBoxDrawing
	ld hl, Route3TrainerHeader0
	ld de, Route3ScriptPointers
	ld a, [wRoute3CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute3CurScript], a
	ret

Route3ScriptPointers: ; 5550b (15:550b)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route3TextPointers: ; 55511 (15:5511)
	dw Route3Text1
	dw Route3Text2
	dw Route3Text3
	dw Route3Text4
	dw Route3Text5
	dw Route3Text6
	dw Route3Text7
	dw Route3Text8
	dw Route3Text9
	dw Route3Text10

Route3TrainerHeaders: ; 55525 (15:5525)
Route3TrainerHeader0: ; 55525 (15:5525)
	dbEventFlagBit EVENT_BEAT_ROUTE_3_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_3_TRAINER_0
	dw Route3BattleText1 ; TextBeforeBattle
	dw Route3AfterBattleText1 ; TextAfterBattle
	dw Route3EndBattleText1 ; TextEndBattle
	dw Route3EndBattleText1 ; TextEndBattle

Route3TrainerHeader2: ; 55531 (15:5531)
	dbEventFlagBit EVENT_BEAT_ROUTE_3_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_3_TRAINER_2
	dw Route3BattleText2 ; TextBeforeBattle
	dw Route3AfterBattleText2 ; TextAfterBattle
	dw Route3EndBattleText2 ; TextEndBattle
	dw Route3EndBattleText2 ; TextEndBattle

Route3TrainerHeader3: ; 5553d (15:553d)
	dbEventFlagBit EVENT_BEAT_ROUTE_3_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_3_TRAINER_3
	dw Route3BattleText3 ; TextBeforeBattle
	dw Route3AfterBattleText3 ; TextAfterBattle
	dw Route3EndBattleText3 ; TextEndBattle
	dw Route3EndBattleText3 ; TextEndBattle

Route3TrainerHeader4: ; 55549 (15:5549)
	dbEventFlagBit EVENT_BEAT_ROUTE_3_TRAINER_4
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_3_TRAINER_4
	dw Route3BattleText4 ; TextBeforeBattle
	dw Route3AfterBattleText4 ; TextAfterBattle
	dw Route3EndBattleText4 ; TextEndBattle
	dw Route3EndBattleText4 ; TextEndBattle

Route3TrainerHeader5: ; 55555 (15:5555)
	dbEventFlagBit EVENT_BEAT_ROUTE_3_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_3_TRAINER_5
	dw Route3BattleText5 ; TextBeforeBattle
	dw Route3AfterBattleText5 ; TextAfterBattle
	dw Route3EndBattleText5 ; TextEndBattle
	dw Route3EndBattleText5 ; TextEndBattle

Route3TrainerHeader6: ; 55561 (15:5561)
	dbEventFlagBit EVENT_BEAT_ROUTE_3_TRAINER_6
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_3_TRAINER_6
	dw Route3BattleText6 ; TextBeforeBattle
	dw Route3AfterBattleText6 ; TextAfterBattle
	dw Route3EndBattleText6 ; TextEndBattle
	dw Route3EndBattleText6 ; TextEndBattle

Route3TrainerHeader7: ; 5556d (15:556d)
	dbEventFlagBit EVENT_BEAT_ROUTE_3_TRAINER_7, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_3_TRAINER_7, 1
	dw Route3BattleText7 ; TextBeforeBattle
	dw Route3AfterBattleText7 ; TextAfterBattle
	dw Route3EndBattleText7 ; TextEndBattle
	dw Route3EndBattleText7 ; TextEndBattle

Route3TrainerHeader8: ; 55579 (15:5579)
	dbEventFlagBit EVENT_BEAT_ROUTE_3_TRAINER_8, 1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_3_TRAINER_8, 1
	dw Route3BattleText8 ; TextBeforeBattle
	dw Route3AfterBattleText8 ; TextAfterBattle
	dw Route3EndBattleText8 ; TextEndBattle
	dw Route3EndBattleText8 ; TextEndBattle

	db $ff

Route3Text1: ; 55586 (15:5586)
	TX_FAR _Route3Text1
	db "@"

Route3Text2: ; 5558b (15:558b)
	TX_ASM
	ld hl, Route3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText1: ; 55595 (15:5595)
	TX_FAR _Route3BattleText1
	db "@"

Route3EndBattleText1: ; 5559a (15:559a)
	TX_FAR _Route3EndBattleText1
	db "@"

Route3AfterBattleText1: ; 5559f (15:559f)
	TX_FAR _Route3AfterBattleText1
	db "@"

Route3Text3: ; 555a4 (15:55a4)
	TX_ASM
	ld hl, Route3TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText2: ; 555ae (15:55ae)
	TX_FAR _Route3BattleText2
	db "@"

Route3EndBattleText2: ; 555b3 (15:55b3)
	TX_FAR _Route3EndBattleText2
	db "@"

Route3AfterBattleText2: ; 555b8 (15:55b8)
	TX_FAR _Route3AfterBattleText2
	db "@"

Route3Text4: ; 555bd (15:55bd)
	TX_ASM
	ld hl, Route3TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText3: ; 555c7 (15:55c7)
	TX_FAR _Route3BattleText3
	db "@"

Route3EndBattleText3: ; 555cc (15:55cc)
	TX_FAR _Route3EndBattleText3
	db "@"

Route3AfterBattleText3: ; 555d1 (15:55d1)
	TX_FAR _Route3AfterBattleText3
	db "@"

Route3Text5: ; 555d6 (15:55d6)
	TX_ASM
	ld hl, Route3TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText4: ; 555e0 (15:55e0)
	TX_FAR _Route3BattleText4
	db "@"

Route3EndBattleText4: ; 555e5 (15:55e5)
	TX_FAR _Route3EndBattleText4
	db "@"

Route3AfterBattleText4: ; 555ea (15:55ea)
	TX_FAR _Route3AfterBattleText4
	db "@"

Route3Text6: ; 555ef (15:55ef)
	TX_ASM
	ld hl, Route3TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText5: ; 555f9 (15:55f9)
	TX_FAR _Route3BattleText5
	db "@"

Route3EndBattleText5: ; 555fe (15:55fe)
	TX_FAR _Route3EndBattleText5
	db "@"

Route3AfterBattleText5: ; 55603 (15:5603)
	TX_FAR _Route3AfterBattleText5
	db "@"

Route3Text7: ; 55608 (15:5608)
	TX_ASM
	ld hl, Route3TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText6: ; 55612 (15:5612)
	TX_FAR _Route3BattleText6
	db "@"

Route3EndBattleText6: ; 55617 (15:5617)
	TX_FAR _Route3EndBattleText6
	db "@"

Route3AfterBattleText6: ; 5561c (15:561c)
	TX_FAR _Route3AfterBattleText6
	db "@"

Route3Text8: ; 55621 (15:5621)
	TX_ASM
	ld hl, Route3TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText7: ; 5562b (15:562b)
	TX_FAR _Route3BattleText7
	db "@"

Route3EndBattleText7: ; 55630 (15:5630)
	TX_FAR _Route3EndBattleText7
	db "@"

Route3AfterBattleText7: ; 55635 (15:5635)
	TX_FAR _Route3AfterBattleText7
	db "@"

Route3Text9: ; 5563a (15:563a)
	TX_ASM
	ld hl, Route3TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText8: ; 55644 (15:5644)
	TX_FAR _Route3BattleText8
	db "@"

Route3EndBattleText8: ; 55649 (15:5649)
	TX_FAR _Route3EndBattleText8
	db "@"

Route3AfterBattleText8: ; 5564e (15:564e)
	TX_FAR _Route3AfterBattleText8
	db "@"

Route3Text10: ; 55653 (15:5653)
	TX_FAR _Route3Text10
	db "@"
