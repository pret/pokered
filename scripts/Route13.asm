Route13_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route13TrainerHeader0
	ld de, Route13_ScriptPointers
	ld a, [wRoute13CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute13CurScript], a
	ret

Route13_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route13_TextPointers:
	dw Route13Text1
	dw Route13Text2
	dw Route13Text3
	dw Route13Text4
	dw Route13Text5
	dw Route13Text6
	dw Route13Text7
	dw Route13Text8
	dw Route13Text9
	dw Route13Text10
	dw Route13Text11
	dw Route13Text12
	dw Route13Text13

Route13TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_0
	dw Route13BattleText2 ; TextBeforeBattle
	dw Route13AfterBattleText2 ; TextAfterBattle
	dw Route13EndBattleText2 ; TextEndBattle
	dw Route13EndBattleText2 ; TextEndBattle

Route13TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_1
	dw Route13BattleText3 ; TextBeforeBattle
	dw Route13AfterBattleText3 ; TextAfterBattle
	dw Route13EndBattleText3 ; TextEndBattle
	dw Route13EndBattleText3 ; TextEndBattle

Route13TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_2
	dw Route13BattleText4 ; TextBeforeBattle
	dw Route13AfterBattleText4 ; TextAfterBattle
	dw Route13EndBattleText4 ; TextEndBattle
	dw Route13EndBattleText4 ; TextEndBattle

Route13TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_3
	dw Route13BattleText5 ; TextBeforeBattle
	dw Route13AfterBattleText5 ; TextAfterBattle
	dw Route13EndBattleText5 ; TextEndBattle
	dw Route13EndBattleText5 ; TextEndBattle

Route13TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_4
	dw Route13BattleText6 ; TextBeforeBattle
	dw Route13AfterBattleText6 ; TextAfterBattle
	dw Route13EndBattleText6 ; TextEndBattle
	dw Route13EndBattleText6 ; TextEndBattle

Route13TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_5
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_5
	dw Route13BattleText7 ; TextBeforeBattle
	dw Route13AfterBattleText7 ; TextAfterBattle
	dw Route13EndBattleText7 ; TextEndBattle
	dw Route13EndBattleText7 ; TextEndBattle

Route13TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_6
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_6
	dw Route13BattleText8 ; TextBeforeBattle
	dw Route13AfterBattleText8 ; TextAfterBattle
	dw Route13EndBattleText8 ; TextEndBattle
	dw Route13EndBattleText8 ; TextEndBattle

Route13TrainerHeader7:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_7, 1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_7, 1
	dw Route13BattleText9 ; TextBeforeBattle
	dw Route13AfterBattleText9 ; TextAfterBattle
	dw Route13EndBattleText9 ; TextEndBattle
	dw Route13EndBattleText9 ; TextEndBattle

Route13TrainerHeader8:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_8, 1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_8, 1
	dw Route13BattleText10 ; TextBeforeBattle
	dw Route13AfterBattleText10 ; TextAfterBattle
	dw Route13EndBattleText10 ; TextEndBattle
	dw Route13EndBattleText10 ; TextEndBattle

Route13TrainerHeader9:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_9, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_9, 1
	dw Route13BattleText11 ; TextBeforeBattle
	dw Route13AfterBattleText11 ; TextAfterBattle
	dw Route13EndBattleText11 ; TextEndBattle
	dw Route13EndBattleText11 ; TextEndBattle

	db $ff

Route13Text1:
	TX_ASM
	ld hl, Route13TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText2:
	TX_FAR _Route13BattleText2
	db "@"

Route13EndBattleText2:
	TX_FAR _Route13EndBattleText2
	db "@"

Route13AfterBattleText2:
	TX_FAR _Route13AfterBattleText2
	db "@"

Route13Text2:
	TX_ASM
	ld hl, Route13TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText3:
	TX_FAR _Route13BattleText3
	db "@"

Route13EndBattleText3:
	TX_FAR _Route13EndBattleText3
	db "@"

Route13AfterBattleText3:
	TX_FAR _Route13AfterBattleText3
	db "@"

Route13Text3:
	TX_ASM
	ld hl, Route13TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText4:
	TX_FAR _Route13BattleText4
	db "@"

Route13EndBattleText4:
	TX_FAR _Route13EndBattleText4
	db "@"

Route13AfterBattleText4:
	TX_FAR _Route13AfterBattleText4
	db "@"

Route13Text4:
	TX_ASM
	ld hl, Route13TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText5:
	TX_FAR _Route13BattleText5
	db "@"

Route13EndBattleText5:
	TX_FAR _Route13EndBattleText5
	db "@"

Route13AfterBattleText5:
	TX_FAR _Route13AfterBattleText5
	db "@"

Route13Text5:
	TX_ASM
	ld hl, Route13TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText6:
	TX_FAR _Route13BattleText6
	db "@"

Route13EndBattleText6:
	TX_FAR _Route13EndBattleText6
	db "@"

Route13AfterBattleText6:
	TX_FAR _Route13AfterBattleText6
	db "@"

Route13Text6:
	TX_ASM
	ld hl, Route13TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText7:
	TX_FAR _Route13BattleText7
	db "@"

Route13EndBattleText7:
	TX_FAR _Route13EndBattleText7
	db "@"

Route13AfterBattleText7:
	TX_FAR _Route13AfterBattleText7
	db "@"

Route13Text7:
	TX_ASM
	ld hl, Route13TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText8:
	TX_FAR _Route13BattleText8
	db "@"

Route13EndBattleText8:
	TX_FAR _Route13EndBattleText8
	db "@"

Route13AfterBattleText8:
	TX_FAR _Route13AfterBattleText8
	db "@"

Route13Text8:
	TX_ASM
	ld hl, Route13TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText9:
	TX_FAR _Route13BattleText9
	db "@"

Route13EndBattleText9:
	TX_FAR _Route13EndBattleText9
	db "@"

Route13AfterBattleText9:
	TX_FAR _Route13AfterBattleText9
	db "@"

Route13Text9:
	TX_ASM
	ld hl, Route13TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText10:
	TX_FAR _Route13BattleText10
	db "@"

Route13EndBattleText10:
	TX_FAR _Route13EndBattleText10
	db "@"

Route13AfterBattleText10:
	TX_FAR _Route13AfterBattleText10
	db "@"

Route13Text10:
	TX_ASM
	ld hl, Route13TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText11:
	TX_FAR _Route13BattleText11
	db "@"

Route13EndBattleText11:
	TX_FAR _Route13EndBattleText11
	db "@"

Route13AfterBattleText11:
	TX_FAR _Route13AfterBattleText11
	db "@"

Route13Text11:
	TX_FAR _Route13Text11
	db "@"

Route13Text12:
	TX_FAR _Route13Text12
	db "@"

Route13Text13:
	TX_FAR _Route13Text13
	db "@"
