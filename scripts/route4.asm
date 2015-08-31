Route4Script: ; 55658 (15:5658)
	call EnableAutoTextBoxDrawing
	ld hl, Route4TrainerHeaders
	ld de, Route4ScriptPointers
	ld a, [wRoute4CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute4CurScript], a
	ret

Route4ScriptPointers: ; 5566b (15:566b)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route4TextPointers: ; 55671 (15:5671)
	dw Route4Text1
	dw Route4Text2
	dw PickUpItemText
	dw PokeCenterSignText
	dw Route4Text5
	dw Route4Text6

Route4TrainerHeaders: ; 5567d (15:567d)
Route4TrainerHeader0: ; 5567d (15:567d)
	dbEventFlagBit EVENT_BEAT_ROUTE_4_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_4_TRAINER_0
	dw Route4BattleText1 ; TextBeforeBattle
	dw Route4AfterBattleText1 ; TextAfterBattle
	dw Route4EndBattleText1 ; TextEndBattle
	dw Route4EndBattleText1 ; TextEndBattle

	db $ff

Route4Text1: ; 5568a (15:568a)
	TX_FAR _Route4Text1
	db "@"

Route4Text2: ; 5568f (15:568f)
	TX_ASM
	ld hl, Route4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route4BattleText1: ; 55699 (15:5699)
	TX_FAR _Route4BattleText1
	db "@"

Route4EndBattleText1: ; 5569e (15:569e)
	TX_FAR _Route4EndBattleText1
	db "@"

Route4AfterBattleText1: ; 556a3 (15:56a3)
	TX_FAR _Route4AfterBattleText1
	db "@"

Route4Text5: ; 556a8 (15:56a8)
	TX_FAR _Route4Text5
	db "@"

Route4Text6: ; 556ad (15:56ad)
	TX_FAR _Route4Text6
	db "@"
