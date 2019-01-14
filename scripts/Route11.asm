Route11_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route11TrainerHeader0
	ld de, Route11_ScriptPointers
	ld a, [wRoute11CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute11CurScript], a
	ret

Route11_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route11_TextPointers:
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

Route11TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_0
	dw Route11BattleText1 ; TextBeforeBattle
	dw Route11AfterBattleText1 ; TextAfterBattle
	dw Route11EndBattleText1 ; TextEndBattle
	dw Route11EndBattleText1 ; TextEndBattle

Route11TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_1
	dw Route11BattleText2 ; TextBeforeBattle
	dw Route11AfterBattleText2 ; TextAfterBattle
	dw Route11EndBattleText2 ; TextEndBattle
	dw Route11EndBattleText2 ; TextEndBattle

Route11TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_2
	dw Route11BattleText3 ; TextBeforeBattle
	dw Route11AfterBattleText3 ; TextAfterBattle
	dw Route11EndBattleText3 ; TextEndBattle
	dw Route11EndBattleText3 ; TextEndBattle

Route11TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_3
	dw Route11BattleText4 ; TextBeforeBattle
	dw Route11AfterBattleText4 ; TextAfterBattle
	dw Route11EndBattleText4 ; TextEndBattle
	dw Route11EndBattleText4 ; TextEndBattle

Route11TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_4
	dw Route11BattleText5 ; TextBeforeBattle
	dw Route11AfterBattleText5 ; TextAfterBattle
	dw Route11EndBattleText5 ; TextEndBattle
	dw Route11EndBattleText5 ; TextEndBattle

Route11TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_5
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_5
	dw Route11BattleText6 ; TextBeforeBattle
	dw Route11AfterBattleText6 ; TextAfterBattle
	dw Route11EndBattleText6 ; TextEndBattle
	dw Route11EndBattleText6 ; TextEndBattle

Route11TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_6
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_6
	dw Route11BattleText7 ; TextBeforeBattle
	dw Route11AfterBattleText7 ; TextAfterBattle
	dw Route11EndBattleText7 ; TextEndBattle
	dw Route11EndBattleText7 ; TextEndBattle

Route11TrainerHeader7:
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_7, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_7, 1
	dw Route11BattleText8 ; TextBeforeBattle
	dw Route11AfterBattleText8 ; TextAfterBattle
	dw Route11EndBattleText8 ; TextEndBattle
	dw Route11EndBattleText8 ; TextEndBattle

Route11TrainerHeader8:
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_8, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_8, 1
	dw Route11BattleText9 ; TextBeforeBattle
	dw Route11AfterBattleText9 ; TextAfterBattle
	dw Route11EndBattleText9 ; TextEndBattle
	dw Route11EndBattleText9 ; TextEndBattle

Route11TrainerHeader9:
	dbEventFlagBit EVENT_BEAT_ROUTE_11_TRAINER_9, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_11_TRAINER_9, 1
	dw Route11BattleText10 ; TextBeforeBattle
	dw Route11AfterBattleText10 ; TextAfterBattle
	dw Route11EndBattleText10 ; TextEndBattle
	dw Route11EndBattleText10 ; TextEndBattle

	db $ff

Route11Text1:
	TX_ASM
	ld hl, Route11TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText1:
	TX_FAR _Route11BattleText1
	db "@"

Route11EndBattleText1:
	TX_FAR _Route11EndBattleText1
	db "@"

Route11AfterBattleText1:
	TX_FAR _Route11AfterBattleText1
	db "@"

Route11Text2:
	TX_ASM
	ld hl, Route11TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText2:
	TX_FAR _Route11BattleText2
	db "@"

Route11EndBattleText2:
	TX_FAR _Route11EndBattleText2
	db "@"

Route11AfterBattleText2:
	TX_FAR _Route11AfterBattleText2
	db "@"

Route11Text3:
	TX_ASM
	ld hl, Route11TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText3:
	TX_FAR _Route11BattleText3
	db "@"

Route11EndBattleText3:
	TX_FAR _Route11EndBattleText3
	db "@"

Route11AfterBattleText3:
	TX_FAR _Route11AfterBattleText3
	db "@"

Route11Text4:
	TX_ASM
	ld hl, Route11TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText4:
	TX_FAR _Route11BattleText4
	db "@"

Route11EndBattleText4:
	TX_FAR _Route11EndBattleText4
	db "@"

Route11AfterBattleText4:
	TX_FAR _Route11AfterBattleText4
	db "@"

Route11Text5:
	TX_ASM
	ld hl, Route11TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText5:
	TX_FAR _Route11BattleText5
	db "@"

Route11EndBattleText5:
	TX_FAR _Route11EndBattleText5
	db "@"

Route11AfterBattleText5:
	TX_FAR _Route11AfterBattleText5
	db "@"

Route11Text6:
	TX_ASM
	ld hl, Route11TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText6:
	TX_FAR _Route11BattleText6
	db "@"

Route11EndBattleText6:
	TX_FAR _Route11EndBattleText6
	db "@"

Route11AfterBattleText6:
	TX_FAR _Route11AfterBattleText6
	db "@"

Route11Text7:
	TX_ASM
	ld hl, Route11TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText7:
	TX_FAR _Route11BattleText7
	db "@"

Route11EndBattleText7:
	TX_FAR _Route11EndBattleText7
	db "@"

Route11AfterBattleText7:
	TX_FAR _Route11AfterBattleText7
	db "@"

Route11Text8:
	TX_ASM
	ld hl, Route11TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText8:
	TX_FAR _Route11BattleText8
	db "@"

Route11EndBattleText8:
	TX_FAR _Route11EndBattleText8
	db "@"

Route11AfterBattleText8:
	TX_FAR _Route11AfterBattleText8
	db "@"

Route11Text9:
	TX_ASM
	ld hl, Route11TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText9:
	TX_FAR _Route11BattleText9
	db "@"

Route11EndBattleText9:
	TX_FAR _Route11EndBattleText9
	db "@"

Route11AfterBattleText9:
	TX_FAR _Route11AfterBattleText9
	db "@"

Route11Text10:
	TX_ASM
	ld hl, Route11TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText10:
	TX_FAR _Route11BattleText10
	db "@"

Route11EndBattleText10:
	TX_FAR _Route11EndBattleText10
	db "@"

Route11AfterBattleText10:
	TX_FAR _Route11AfterBattleText10
	db "@"

Route11Text11:
	TX_FAR _Route11Text11
	db "@"
