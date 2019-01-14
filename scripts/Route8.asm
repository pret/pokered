Route8_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route8TrainerHeader0
	ld de, Route8_ScriptPointers
	ld a, [wRoute8CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute8CurScript], a
	ret

Route8_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route8_TextPointers:
	dw Route8Text1
	dw Route8Text2
	dw Route8Text3
	dw Route8Text4
	dw Route8Text5
	dw Route8Text6
	dw Route8Text7
	dw Route8Text8
	dw Route8Text9
	dw Route8Text10

Route8TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_0
	dw Route8BattleText1 ; TextBeforeBattle
	dw Route8AfterBattleText1 ; TextAfterBattle
	dw Route8EndBattleText1 ; TextEndBattle
	dw Route8EndBattleText1 ; TextEndBattle

Route8TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_1
	dw Route8BattleText2 ; TextBeforeBattle
	dw Route8AfterBattleText2 ; TextAfterBattle
	dw Route8EndBattleText2 ; TextEndBattle
	dw Route8EndBattleText2 ; TextEndBattle

Route8TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_2
	dw Route8BattleText3 ; TextBeforeBattle
	dw Route8AfterBattleText3 ; TextAfterBattle
	dw Route8EndBattleText3 ; TextEndBattle
	dw Route8EndBattleText3 ; TextEndBattle

Route8TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_3
	dw Route8BattleText4 ; TextBeforeBattle
	dw Route8AfterBattleText4 ; TextAfterBattle
	dw Route8EndBattleText4 ; TextEndBattle
	dw Route8EndBattleText4 ; TextEndBattle

Route8TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_4
	dw Route8BattleText5 ; TextBeforeBattle
	dw Route8AfterBattleText5 ; TextAfterBattle
	dw Route8EndBattleText5 ; TextEndBattle
	dw Route8EndBattleText5 ; TextEndBattle

Route8TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_5
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_5
	dw Route8BattleText6 ; TextBeforeBattle
	dw Route8AfterBattleText6 ; TextAfterBattle
	dw Route8EndBattleText6 ; TextEndBattle
	dw Route8EndBattleText6 ; TextEndBattle

Route8TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_6
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_6
	dw Route8BattleText7 ; TextBeforeBattle
	dw Route8AfterBattleText7 ; TextAfterBattle
	dw Route8EndBattleText7 ; TextEndBattle
	dw Route8EndBattleText7 ; TextEndBattle

Route8TrainerHeader7:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_7, 1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_7, 1
	dw Route8BattleText8 ; TextBeforeBattle
	dw Route8AfterBattleText8 ; TextAfterBattle
	dw Route8EndBattleText8 ; TextEndBattle
	dw Route8EndBattleText8 ; TextEndBattle

Route8TrainerHeader8:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_8, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_8, 1
	dw Route8BattleText9 ; TextBeforeBattle
	dw Route8AfterBattleText9 ; TextAfterBattle
	dw Route8EndBattleText9 ; TextEndBattle
	dw Route8EndBattleText9 ; TextEndBattle

	db $ff

Route8Text1:
	TX_ASM
	ld hl, Route8TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText1:
	TX_FAR _Route8BattleText1
	db "@"

Route8EndBattleText1:
	TX_FAR _Route8EndBattleText1
	db "@"

Route8AfterBattleText1:
	TX_FAR _Route8AfterBattleText1
	db "@"

Route8Text2:
	TX_ASM
	ld hl, Route8TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText2:
	TX_FAR _Route8BattleText2
	db "@"

Route8EndBattleText2:
	TX_FAR _Route8EndBattleText2
	db "@"

Route8AfterBattleText2:
	TX_FAR _Route8AfterBattleText2
	db "@"

Route8Text3:
	TX_ASM
	ld hl, Route8TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText3:
	TX_FAR _Route8BattleText3
	db "@"

Route8EndBattleText3:
	TX_FAR _Route8EndBattleText3
	db "@"

Route8AfterBattleText3:
	TX_FAR _Route8AfterBattleText3
	db "@"

Route8Text4:
	TX_ASM
	ld hl, Route8TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText4:
	TX_FAR _Route8BattleText4
	db "@"

Route8EndBattleText4:
	TX_FAR _Route8EndBattleText4
	db "@"

Route8AfterBattleText4:
	TX_FAR _Route8AfterBattleText4
	db "@"

Route8Text5:
	TX_ASM
	ld hl, Route8TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText5:
	TX_FAR _Route8BattleText5
	db "@"

Route8EndBattleText5:
	TX_FAR _Route8EndBattleText5
	db "@"

Route8AfterBattleText5:
	TX_FAR _Route8AfterBattleText5
	db "@"

Route8Text6:
	TX_ASM
	ld hl, Route8TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText6:
	TX_FAR _Route8BattleText6
	db "@"

Route8EndBattleText6:
	TX_FAR _Route8EndBattleText6
	db "@"

Route8AfterBattleText6:
	TX_FAR _Route8AfterBattleText6
	db "@"

Route8Text7:
	TX_ASM
	ld hl, Route8TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText7:
	TX_FAR _Route8BattleText7
	db "@"

Route8EndBattleText7:
	TX_FAR _Route8EndBattleText7
	db "@"

Route8AfterBattleText7:
	TX_FAR _Route8AfterBattleText7
	db "@"

Route8Text8:
	TX_ASM
	ld hl, Route8TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText8:
	TX_FAR _Route8BattleText8
	db "@"

Route8EndBattleText8:
	TX_FAR _Route8EndBattleText8
	db "@"

Route8AfterBattleText8:
	TX_FAR _Route8AfterBattleText8
	db "@"

Route8Text9:
	TX_ASM
	ld hl, Route8TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText9:
	TX_FAR _Route8BattleText9
	db "@"

Route8EndBattleText9:
	TX_FAR _Route8EndBattleText9
	db "@"

Route8AfterBattleText9:
	TX_FAR _Route8AfterBattleText9
	db "@"

Route8Text10:
	TX_FAR _Route8Text10
	db "@"
