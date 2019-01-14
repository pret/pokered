Route19_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route19TrainerHeader0
	ld de, Route19_ScriptPointers
	ld a, [wRoute19CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute19CurScript], a
	ret

Route19_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route19_TextPointers:
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

Route19TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_0
	dw Route19BattleText1 ; TextBeforeBattle
	dw Route19AfterBattleText1 ; TextAfterBattle
	dw Route19EndBattleText1 ; TextEndBattle
	dw Route19EndBattleText1 ; TextEndBattle

Route19TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_1
	dw Route19BattleText2 ; TextBeforeBattle
	dw Route19AfterBattleText2 ; TextAfterBattle
	dw Route19EndBattleText2 ; TextEndBattle
	dw Route19EndBattleText2 ; TextEndBattle

Route19TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_2
	dw Route19BattleText3 ; TextBeforeBattle
	dw Route19AfterBattleText3 ; TextAfterBattle
	dw Route19EndBattleText3 ; TextEndBattle
	dw Route19EndBattleText3 ; TextEndBattle

Route19TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_3
	dw Route19BattleText4 ; TextBeforeBattle
	dw Route19AfterBattleText4 ; TextAfterBattle
	dw Route19EndBattleText4 ; TextEndBattle
	dw Route19EndBattleText4 ; TextEndBattle

Route19TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_4
	dw Route19BattleText5 ; TextBeforeBattle
	dw Route19AfterBattleText5 ; TextAfterBattle
	dw Route19EndBattleText5 ; TextEndBattle
	dw Route19EndBattleText5 ; TextEndBattle

Route19TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_5
	dw Route19BattleText6 ; TextBeforeBattle
	dw Route19AfterBattleText6 ; TextAfterBattle
	dw Route19EndBattleText6 ; TextEndBattle
	dw Route19EndBattleText6 ; TextEndBattle

Route19TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_6
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_6
	dw Route19BattleText7 ; TextBeforeBattle
	dw Route19AfterBattleText7 ; TextAfterBattle
	dw Route19EndBattleText7 ; TextEndBattle
	dw Route19EndBattleText7 ; TextEndBattle

Route19TrainerHeader7:
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_7, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_7, 1
	dw Route19BattleText8 ; TextBeforeBattle
	dw Route19AfterBattleText8 ; TextAfterBattle
	dw Route19EndBattleText8 ; TextEndBattle
	dw Route19EndBattleText8 ; TextEndBattle

Route19TrainerHeader8:
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_8, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_8, 1
	dw Route19BattleText9 ; TextBeforeBattle
	dw Route19AfterBattleText9 ; TextAfterBattle
	dw Route19EndBattleText9 ; TextEndBattle
	dw Route19EndBattleText9 ; TextEndBattle

Route19TrainerHeader9:
	dbEventFlagBit EVENT_BEAT_ROUTE_19_TRAINER_9, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_19_TRAINER_9, 1
	dw Route19BattleText10 ; TextBeforeBattle
	dw Route19AfterBattleText10 ; TextAfterBattle
	dw Route19EndBattleText10 ; TextEndBattle
	dw Route19EndBattleText10 ; TextEndBattle

	db $ff

Route19Text1:
	TX_ASM
	ld hl, Route19TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route19Text2:
	TX_ASM
	ld hl, Route19TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route19Text3:
	TX_ASM
	ld hl, Route19TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route19Text4:
	TX_ASM
	ld hl, Route19TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route19Text5:
	TX_ASM
	ld hl, Route19TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route19Text6:
	TX_ASM
	ld hl, Route19TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route19Text7:
	TX_ASM
	ld hl, Route19TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route19Text8:
	TX_ASM
	ld hl, Route19TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route19Text9:
	TX_ASM
	ld hl, Route19TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route19Text10:
	TX_ASM
	ld hl, Route19TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route19BattleText1:
	TX_FAR _Route19BattleText1
	db "@"

Route19EndBattleText1:
	TX_FAR _Route19EndBattleText1
	db "@"

Route19AfterBattleText1:
	TX_FAR _Route19AfterBattleText1
	db "@"

Route19BattleText2:
	TX_FAR _Route19BattleText2
	db "@"

Route19EndBattleText2:
	TX_FAR _Route19EndBattleText2
	db "@"

Route19AfterBattleText2:
	TX_FAR _Route19AfterBattleText2
	db "@"

Route19BattleText3:
	TX_FAR _Route19BattleText3
	db "@"

Route19EndBattleText3:
	TX_FAR _Route19EndBattleText3
	db "@"

Route19AfterBattleText3:
	TX_FAR _Route19AfterBattleText3
	db "@"

Route19BattleText4:
	TX_FAR _Route19BattleText4
	db "@"

Route19EndBattleText4:
	TX_FAR _Route19EndBattleText4
	db "@"

Route19AfterBattleText4:
	TX_FAR _Route19AfterBattleText4
	db "@"

Route19BattleText5:
	TX_FAR _Route19BattleText5
	db "@"

Route19EndBattleText5:
	TX_FAR _Route19EndBattleText5
	db "@"

Route19AfterBattleText5:
	TX_FAR _Route19AfterBattleText5
	db "@"

Route19BattleText6:
	TX_FAR _Route19BattleText6
	db "@"

Route19EndBattleText6:
	TX_FAR _Route19EndBattleText6
	db "@"

Route19AfterBattleText6:
	TX_FAR _Route19AfterBattleText6
	db "@"

Route19BattleText7:
	TX_FAR _Route19BattleText7
	db "@"

Route19EndBattleText7:
	TX_FAR _Route19EndBattleText7
	db "@"

Route19AfterBattleText7:
	TX_FAR _Route19AfterBattleText7
	db "@"

Route19BattleText8:
	TX_FAR _Route19BattleText8
	db "@"

Route19EndBattleText8:
	TX_FAR _Route19EndBattleText8
	db "@"

Route19AfterBattleText8:
	TX_FAR _Route19AfterBattleText8
	db "@"

Route19BattleText9:
	TX_FAR _Route19BattleText9
	db "@"

Route19EndBattleText9:
	TX_FAR _Route19EndBattleText9
	db "@"

Route19AfterBattleText9:
	TX_FAR _Route19AfterBattleText9
	db "@"

Route19BattleText10:
	TX_FAR _Route19BattleText10
	db "@"

Route19EndBattleText10:
	TX_FAR _Route19EndBattleText10
	db "@"

Route19AfterBattleText10:
	TX_FAR _Route19AfterBattleText10
	db "@"

Route19Text11:
	TX_FAR _Route19Text11
	db "@"
