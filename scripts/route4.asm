Route4Script: ; 55658 (15:5658)
	call EnableAutoTextBoxDrawing
	ld hl, Route4TrainerHeaders
	ld de, Route4ScriptPointers
	ld a, [W_ROUTE4CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROUTE4CURSCRIPT], a
	ret

Route4ScriptPointers: ; 5566b (15:566b)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route4TextPointers: ; 55671 (15:5671)
	dw Route4Text1
	dw Route4Text2
	dw Predef5CText
	dw PokeCenterSignText
	dw Route4Text5
	dw Route4Text6

Route4TrainerHeaders: ; 5567d (15:567d)
Route4TrainerHeader0: ; 5567d (15:567d)
	db $2 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd7c5 ; flag's byte
	dw Route4BattleText1 ; 0x5699 TextBeforeBattle
	dw Route4AfterBattleText1 ; 0x56a3 TextAfterBattle
	dw Route4EndBattleText1 ; 0x569e TextEndBattle
	dw Route4EndBattleText1 ; 0x569e TextEndBattle

	db $ff

Route4Text1: ; 5568a (15:568a)
	TX_FAR _Route4Text1
	db "@"

Route4Text2: ; 5568f (15:568f)
	db $08 ; asm
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
