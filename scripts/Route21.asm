Route21_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route21TrainerHeader0
	ld de, Route21_ScriptPointers
	ld a, [wRoute21CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute21CurScript], a
	ret

Route21_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route21_TextPointers:
	dw Route21Text1
	dw Route21Text2
	dw Route21Text3
	dw Route21Text4
	dw Route21Text5
	dw Route21Text6
	dw Route21Text7
	dw Route21Text8
	dw Route21Text9

Route21TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_0
	dw Route21BattleText1 ; TextBeforeBattle
	dw Route21AfterBattleText1 ; TextAfterBattle
	dw Route21EndBattleText1 ; TextEndBattle
	dw Route21EndBattleText1 ; TextEndBattle

Route21TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_1
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_1
	dw Route21BattleText2 ; TextBeforeBattle
	dw Route21AfterBattleText2 ; TextAfterBattle
	dw Route21EndBattleText2 ; TextEndBattle
	dw Route21EndBattleText2 ; TextEndBattle

Route21TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_2
	dw Route21BattleText3 ; TextBeforeBattle
	dw Route21AfterBattleText3 ; TextAfterBattle
	dw Route21EndBattleText3 ; TextEndBattle
	dw Route21EndBattleText3 ; TextEndBattle

Route21TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_3
	dw Route21BattleText4 ; TextBeforeBattle
	dw Route21AfterBattleText4 ; TextAfterBattle
	dw Route21EndBattleText4 ; TextEndBattle
	dw Route21EndBattleText4 ; TextEndBattle

Route21TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_4
	dw Route21BattleText5 ; TextBeforeBattle
	dw Route21AfterBattleText5 ; TextAfterBattle
	dw Route21EndBattleText5 ; TextEndBattle
	dw Route21EndBattleText5 ; TextEndBattle

Route21TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_5
	dw Route21BattleText6 ; TextBeforeBattle
	dw Route21AfterBattleText6 ; TextAfterBattle
	dw Route21EndBattleText6 ; TextEndBattle
	dw Route21EndBattleText6 ; TextEndBattle

Route21TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_6
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_6
	dw Route21BattleText7 ; TextBeforeBattle
	dw Route21AfterBattleText7 ; TextAfterBattle
	dw Route21EndBattleText7 ; TextEndBattle
	dw Route21EndBattleText7 ; TextEndBattle

Route21TrainerHeader7:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_7, 1
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_7, 1
	dw Route21BattleText8 ; TextBeforeBattle
	dw Route21AfterBattleText8 ; TextAfterBattle
	dw Route21EndBattleText8 ; TextEndBattle
	dw Route21EndBattleText8 ; TextEndBattle

Route21TrainerHeader8:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_8, 1
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_8, 1
	dw Route21BattleText9 ; TextBeforeBattle
	dw Route21AfterBattleText9 ; TextAfterBattle
	dw Route21EndBattleText9 ; TextEndBattle
	dw Route21EndBattleText9 ; TextEndBattle

	db $ff

Route21Text1:
	TX_ASM
	ld hl, Route21TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route21Text2:
	TX_ASM
	ld hl, Route21TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route21Text3:
	TX_ASM
	ld hl, Route21TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route21Text4:
	TX_ASM
	ld hl, Route21TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route21Text5:
	TX_ASM
	ld hl, Route21TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route21Text6:
	TX_ASM
	ld hl, Route21TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route21Text7:
	TX_ASM
	ld hl, Route21TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route21Text8:
	TX_ASM
	ld hl, Route21TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route21Text9:
	TX_ASM
	ld hl, Route21TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route21BattleText1:
	TX_FAR _Route21BattleText1
	db "@"

Route21EndBattleText1:
	TX_FAR _Route21EndBattleText1
	db "@"

Route21AfterBattleText1:
	TX_FAR _Route21AfterBattleText1
	db "@"

Route21BattleText2:
	TX_FAR _Route21BattleText2
	db "@"

Route21EndBattleText2:
	TX_FAR _Route21EndBattleText2
	db "@"

Route21AfterBattleText2:
	TX_FAR _Route21AfterBattleText2
	db "@"

Route21BattleText3:
	TX_FAR _Route21BattleText3
	db "@"

Route21EndBattleText3:
	TX_FAR _Route21EndBattleText3
	db "@"

Route21AfterBattleText3:
	TX_FAR _Route21AfterBattleText3
	db "@"

Route21BattleText4:
	TX_FAR _Route21BattleText4
	db "@"

Route21EndBattleText4:
	TX_FAR _Route21EndBattleText4
	db "@"

Route21AfterBattleText4:
	TX_FAR _Route21AfterBattleText4
	db "@"

Route21BattleText5:
	TX_FAR _Route21BattleText5
	db "@"

Route21EndBattleText5:
	TX_FAR _Route21EndBattleText5
	db "@"

Route21AfterBattleText5:
	TX_FAR _Route21AfterBattleText5
	db "@"

Route21BattleText6:
	TX_FAR _Route21BattleText6
	db "@"

Route21EndBattleText6:
	TX_FAR _Route21EndBattleText6
	db "@"

Route21AfterBattleText6:
	TX_FAR _Route21AfterBattleText6
	db "@"

Route21BattleText7:
	TX_FAR _Route21BattleText7
	db "@"

Route21EndBattleText7:
	TX_FAR _Route21EndBattleText7
	db "@"

Route21AfterBattleText7:
	TX_FAR _Route21AfterBattleText7
	db "@"

Route21BattleText8:
	TX_FAR _Route21BattleText8
	db "@"

Route21EndBattleText8:
	TX_FAR _Route21EndBattleText8
	db "@"

Route21AfterBattleText8:
	TX_FAR _Route21AfterBattleText8
	db "@"

Route21BattleText9:
	TX_FAR _Route21BattleText9
	db "@"

Route21EndBattleText9:
	TX_FAR _Route21EndBattleText9
	db "@"

Route21AfterBattleText9:
	TX_FAR _Route21AfterBattleText9
	db "@"
