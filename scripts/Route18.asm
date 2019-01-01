Route18_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route18TrainerHeader0
	ld de, Route18_ScriptPointers
	ld a, [wRoute18CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute18CurScript], a
	ret

Route18_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route18_TextPointers:
	dw Route18Text1
	dw Route18Text2
	dw Route18Text3
	dw Route18Text4
	dw Route18Text5

Route18TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_18_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_18_TRAINER_0
	dw Route18BattleText1 ; TextBeforeBattle
	dw Route18AfterBattleText1 ; TextAfterBattle
	dw Route18EndBattleText1 ; TextEndBattle
	dw Route18EndBattleText1 ; TextEndBattle

Route18TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_18_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_18_TRAINER_1
	dw Route18BattleText2 ; TextBeforeBattle
	dw Route18AfterBattleText2 ; TextAfterBattle
	dw Route18EndBattleText2 ; TextEndBattle
	dw Route18EndBattleText2 ; TextEndBattle

Route18TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_18_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_18_TRAINER_2
	dw Route18BattleText3 ; TextBeforeBattle
	dw Route18AfterBattleText3 ; TextAfterBattle
	dw Route18EndBattleText3 ; TextEndBattle
	dw Route18EndBattleText3 ; TextEndBattle

	db $ff

Route18Text1:
	TX_ASM
	ld hl, Route18TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route18BattleText1:
	TX_FAR _Route18BattleText1
	db "@"

Route18EndBattleText1:
	TX_FAR _Route18EndBattleText1
	db "@"

Route18AfterBattleText1:
	TX_FAR _Route18AfterBattleText1
	db "@"

Route18Text2:
	TX_ASM
	ld hl, Route18TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route18BattleText2:
	TX_FAR _Route18BattleText2
	db "@"

Route18EndBattleText2:
	TX_FAR _Route18EndBattleText2
	db "@"

Route18AfterBattleText2:
	TX_FAR _Route18AfterBattleText2
	db "@"

Route18Text3:
	TX_ASM
	ld hl, Route18TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route18BattleText3:
	TX_FAR _Route18BattleText3
	db "@"

Route18EndBattleText3:
	TX_FAR _Route18EndBattleText3
	db "@"

Route18AfterBattleText3:
	TX_FAR _Route18AfterBattleText3
	db "@"

Route18Text4:
	TX_FAR _Route18Text4
	db "@"

Route18Text5:
	TX_FAR _Route18Text5
	db "@"
