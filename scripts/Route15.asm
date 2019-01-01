Route15_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route15TrainerHeader0
	ld de, Route15_ScriptPointers
	ld a, [wRoute15CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute15CurScript], a
	ret

Route15_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route15_TextPointers:
	dw Route15Text1
	dw Route15Text2
	dw Route15Text3
	dw Route15Text4
	dw Route15Text5
	dw Route15Text6
	dw Route15Text7
	dw Route15Text8
	dw Route15Text9
	dw Route15Text10
	dw PickUpItemText
	dw Route15Text12

Route15TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_0
	dw Route15BattleText1 ; TextBeforeBattle
	dw Route15AfterBattleText1 ; TextAfterBattle
	dw Route15EndBattleText1 ; TextEndBattle
	dw Route15EndBattleText1 ; TextEndBattle

Route15TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_1
	dw Route15BattleText2 ; TextBeforeBattle
	dw Route15AfterBattleText2 ; TextAfterBattle
	dw Route15EndBattleText2 ; TextEndBattle
	dw Route15EndBattleText2 ; TextEndBattle

Route15TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_2
	dw Route15BattleText3 ; TextBeforeBattle
	dw Route15AfterBattleText3 ; TextAfterBattle
	dw Route15EndBattleText3 ; TextEndBattle
	dw Route15EndBattleText3 ; TextEndBattle

Route15TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_3
	dw Route15BattleText4 ; TextBeforeBattle
	dw Route15AfterBattleText4 ; TextAfterBattle
	dw Route15EndBattleText4 ; TextEndBattle
	dw Route15EndBattleText4 ; TextEndBattle

Route15TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_4
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_4
	dw Route15BattleText5 ; TextBeforeBattle
	dw Route15AfterBattleText5 ; TextAfterBattle
	dw Route15EndBattleText5 ; TextEndBattle
	dw Route15EndBattleText5 ; TextEndBattle

Route15TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_5
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_5
	dw Route15BattleText6 ; TextBeforeBattle
	dw Route15AfterBattleText6 ; TextAfterBattle
	dw Route15EndBattleText6 ; TextEndBattle
	dw Route15EndBattleText6 ; TextEndBattle

Route15TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_6
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_6
	dw Route15BattleText7 ; TextBeforeBattle
	dw Route15AfterBattleText7 ; TextAfterBattle
	dw Route15EndBattleText7 ; TextEndBattle
	dw Route15EndBattleText7 ; TextEndBattle

Route15TrainerHeader7:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_7, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_7, 1
	dw Route15BattleText8 ; TextBeforeBattle
	dw Route15AfterBattleText8 ; TextAfterBattle
	dw Route15EndBattleText8 ; TextEndBattle
	dw Route15EndBattleText8 ; TextEndBattle

Route15TrainerHeader8:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_8, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_8, 1
	dw Route15BattleText9 ; TextBeforeBattle
	dw Route15AfterBattleText9 ; TextAfterBattle
	dw Route15EndBattleText9 ; TextEndBattle
	dw Route15EndBattleText9 ; TextEndBattle

Route15TrainerHeader9:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_9, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_9, 1
	dw Route15BattleText10 ; TextBeforeBattle
	dw Route15AfterBattleText10 ; TextAfterBattle
	dw Route15EndBattleText10 ; TextEndBattle
	dw Route15EndBattleText10 ; TextEndBattle

	db $ff

Route15Text1:
	TX_ASM
	ld hl, Route15TrainerHeader0
	jr Route15TalkToTrainer

Route15Text2:
	TX_ASM
	ld hl, Route15TrainerHeader1
	jr Route15TalkToTrainer

Route15Text3:
	TX_ASM
	ld hl, Route15TrainerHeader2
	jr Route15TalkToTrainer

Route15Text4:
	TX_ASM
	ld hl, Route15TrainerHeader3
	jr Route15TalkToTrainer

Route15Text5:
	TX_ASM
	ld hl, Route15TrainerHeader4
	jr Route15TalkToTrainer

Route15Text6:
	TX_ASM
	ld hl, Route15TrainerHeader5
	jr Route15TalkToTrainer

Route15Text7:
	TX_ASM
	ld hl, Route15TrainerHeader6
	jr Route15TalkToTrainer

Route15Text8:
	TX_ASM
	ld hl, Route15TrainerHeader7
	jr Route15TalkToTrainer

Route15Text9:
	TX_ASM
	ld hl, Route15TrainerHeader8
	jr Route15TalkToTrainer

Route15Text10:
	TX_ASM
	ld hl, Route15TrainerHeader9
Route15TalkToTrainer:
	call TalkToTrainer
	jp TextScriptEnd

Route15BattleText1:
	TX_FAR _Route15BattleText1
	db "@"

Route15EndBattleText1:
	TX_FAR _Route15EndBattleText1
	db "@"

Route15AfterBattleText1:
	TX_FAR _Route15AfterBattleText1
	db "@"

Route15BattleText2:
	TX_FAR _Route15BattleText2
	db "@"

Route15EndBattleText2:
	TX_FAR _Route15EndBattleText2
	db "@"

Route15AfterBattleText2:
	TX_FAR _Route15AfterBattleText2
	db "@"

Route15BattleText3:
	TX_FAR _Route15BattleText3
	db "@"

Route15EndBattleText3:
	TX_FAR _Route15EndBattleText3
	db "@"

Route15AfterBattleText3:
	TX_FAR _Route15AfterBattleText3
	db "@"

Route15BattleText4:
	TX_FAR _Route15BattleText4
	db "@"

Route15EndBattleText4:
	TX_FAR _Route15EndBattleText4
	db "@"

Route15AfterBattleText4:
	TX_FAR _Route15AfterBattleText4
	db "@"

Route15BattleText5:
	TX_FAR _Route15BattleText5
	db "@"

Route15EndBattleText5:
	TX_FAR _Route15EndBattleText5
	db "@"

Route15AfterBattleText5:
	TX_FAR _Route15AfterBattleText5
	db "@"

Route15BattleText6:
	TX_FAR _Route15BattleText6
	db "@"

Route15EndBattleText6:
	TX_FAR _Route15EndBattleText6
	db "@"

Route15AfterBattleText6:
	TX_FAR _Route15AfterBattleText6
	db "@"

Route15BattleText7:
	TX_FAR _Route15BattleText7
	db "@"

Route15EndBattleText7:
	TX_FAR _Route15EndBattleText7
	db "@"

Route15AfterBattleText7:
	TX_FAR _Route15AfterBattleText7
	db "@"

Route15BattleText8:
	TX_FAR _Route15BattleText8
	db "@"

Route15EndBattleText8:
	TX_FAR _Route15EndBattleText8
	db "@"

Route15AfterBattleText8:
	TX_FAR _Route15AfterBattleText8
	db "@"

Route15BattleText9:
	TX_FAR _Route15BattleText9
	db "@"

Route15EndBattleText9:
	TX_FAR _Route15EndBattleText9
	db "@"

Route15AfterBattleText9:
	TX_FAR _Route15AfterBattleText9
	db "@"

Route15BattleText10:
	TX_FAR _Route15BattleText10
	db "@"

Route15EndBattleText10:
	TX_FAR _Route15EndBattleText10
	db "@"

Route15AfterBattleText10:
	TX_FAR _Route15AfterBattleText10
	db "@"

Route15Text12:
	TX_FAR _Route15Text12
	db "@"
