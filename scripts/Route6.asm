Route6_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route6TrainerHeader0
	ld de, Route6_ScriptPointers
	ld a, [wRoute6CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute6CurScript], a
	ret

Route6_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route6_TextPointers:
	dw Route6Text1
	dw Route6Text2
	dw Route6Text3
	dw Route6Text4
	dw Route6Text5
	dw Route6Text6
	dw Route6Text7

Route6TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_0
	dw Route6BattleText1 ; TextBeforeBattle
	dw Route6AfterBattleText1 ; TextAfterBattle
	dw Route6EndBattleText1 ; TextEndBattle
	dw Route6EndBattleText1 ; TextEndBattle

Route6TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_1
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_1
	dw Route6BattleText2 ; TextBeforeBattle
	dw Route6AfterBattleText1 ; TextAfterBattle
	dw Route6EndBattleText2 ; TextEndBattle
	dw Route6EndBattleText2 ; TextEndBattle

Route6TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_2
	dw Route6BattleText3 ; TextBeforeBattle
	dw Route6AfterBattleText3 ; TextAfterBattle
	dw Route6EndBattleText3 ; TextEndBattle
	dw Route6EndBattleText3 ; TextEndBattle

Route6TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_3
	dw Route6BattleText4 ; TextBeforeBattle
	dw Route6AfterBattleText4 ; TextAfterBattle
	dw Route6EndBattleText4 ; TextEndBattle
	dw Route6EndBattleText4 ; TextEndBattle

Route6TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_4
	dw Route6BattleText5 ; TextBeforeBattle
	dw Route6AfterBattleText5 ; TextAfterBattle
	dw Route6EndBattleText5 ; TextEndBattle
	dw Route6EndBattleText5 ; TextEndBattle

Route6TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_5
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_5
	dw Route6BattleText6 ; TextBeforeBattle
	dw Route6AfterBattleText6 ; TextAfterBattle
	dw Route6EndBattleText6 ; TextEndBattle
	dw Route6EndBattleText6 ; TextEndBattle

	db $ff

Route6Text1:
	TX_ASM
	ld hl, Route6TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText1:
	TX_FAR _Route6BattleText1
	db "@"

Route6EndBattleText1:
	TX_FAR _Route6EndBattleText1
	db "@"

Route6AfterBattleText1:
	TX_FAR _Route6AfterBattleText1
	db "@"

Route6Text2:
	TX_ASM
	ld hl, Route6TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText2:
	TX_FAR _Route6BattleText2
	db "@"

Route6EndBattleText2:
	TX_FAR _Route6EndBattleText2
	db "@"

Route6Text3:
	TX_ASM
	ld hl, Route6TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText3:
	TX_FAR _Route6BattleText3
	db "@"

Route6EndBattleText3:
	TX_FAR _Route6EndBattleText3
	db "@"

Route6AfterBattleText3:
	TX_FAR _Route6AfterBattleText3
	db "@"

Route6Text4:
	TX_ASM
	ld hl, Route6TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText4:
	TX_FAR _Route6BattleText4
	db "@"

Route6EndBattleText4:
	TX_FAR _Route6EndBattleText4
	db "@"

Route6AfterBattleText4:
	TX_FAR _Route6AfterBattleText4
	db "@"

Route6Text5:
	TX_ASM
	ld hl, Route6TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText5:
	TX_FAR _Route6BattleText5
	db "@"

Route6EndBattleText5:
	TX_FAR _Route6EndBattleText5
	db "@"

Route6AfterBattleText5:
	TX_FAR _Route6AfterBattleText5
	db "@"

Route6Text6:
	TX_ASM
	ld hl, Route6TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText6:
	TX_FAR _Route6BattleText6
	db "@"

Route6EndBattleText6:
	TX_FAR _Route6EndBattleText6
	db "@"

Route6AfterBattleText6:
	TX_FAR _Route6AfterBattleText6
	db "@"

Route6Text7:
	TX_FAR _Route6Text7
	db "@"
