PokemonTower3Script: ; 606cc (18:46cc)
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower3TrainerHeaders
	ld de, PokemonTower3ScriptPointers
	ld a, [W_POKEMONTOWER3CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_POKEMONTOWER3CURSCRIPT], a
	ret

PokemonTower3ScriptPointers: ; 606df (18:46df)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

PokemonTower3TextPointers: ; 606e5 (18:46e5)
	dw PokemonTower3Text1
	dw PokemonTower3Text2
	dw PokemonTower3Text3
	dw Predef5CText

PokemonTower3TrainerHeaders: ; 606ed (18:46ed)
PokemonTower3TrainerHeader0: ; 606ed (18:46ed)
	db $1 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd765 ; flag's byte
	dw PokemonTower3BattleText1 ; 0x4730 TextBeforeBattle
	dw PokemonTower3AfterBattleText1 ; 0x473a TextAfterBattle
	dw PokemonTower3EndBattleText1 ; 0x4735 TextEndBattle
	dw PokemonTower3EndBattleText1 ; 0x4735 TextEndBattle

PokemonTower3TrainerHeader1: ; 606f9 (18:46f9)
	db $2 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd765 ; flag's byte
	dw PokemonTower3BattleText2 ; 0x473f TextBeforeBattle
	dw PokemonTower3AfterBattleText2 ; 0x4749 TextAfterBattle
	dw PokemonTower3EndBattleText2 ; 0x4744 TextEndBattle
	dw PokemonTower3EndBattleText2 ; 0x4744 TextEndBattle

PokemonTower3TrainerHeader2: ; 60705 (18:4705)
	db $3 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd765 ; flag's byte
	dw PokemonTower3BattleText3 ; 0x474e TextBeforeBattle
	dw PokemonTower3AfterBattleText3 ; 0x4758 TextAfterBattle
	dw PokemonTower3EndBattleText3 ; 0x4753 TextEndBattle
	dw PokemonTower3EndBattleText3 ; 0x4753 TextEndBattle
	db $ff

PokemonTower3Text1: ; 60712 (18:4712)
	db $08 ; asm
	ld hl, PokemonTower3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower3Text2: ; 6071c (18:471c)
	db $08 ; asm
	ld hl, PokemonTower3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower3Text3: ; 60726 (18:4726)
	db $08 ; asm
	ld hl, PokemonTower3TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower3BattleText1: ; 60730 (18:4730)
	TX_FAR _PokemonTower3BattleText1
	db "@"

PokemonTower3EndBattleText1: ; 60735 (18:4735)
	TX_FAR _PokemonTower3EndBattleText1
	db "@"

PokemonTower3AfterBattleText1: ; 6073a (18:473a)
	TX_FAR _PokemonTower3AfterBattleText1
	db "@"

PokemonTower3BattleText2: ; 6073f (18:473f)
	TX_FAR _PokemonTower3BattleText2
	db "@"

PokemonTower3EndBattleText2: ; 60744 (18:4744)
	TX_FAR _PokemonTower3EndBattleText2
	db "@"

PokemonTower3AfterBattleText2: ; 60749 (18:4749)
	TX_FAR _PokemonTower3AfterBattleText2
	db "@"

PokemonTower3BattleText3: ; 6074e (18:474e)
	TX_FAR _PokemonTower3BattleText3
	db "@"

PokemonTower3EndBattleText3: ; 60753 (18:4753)
	TX_FAR _PokemonTower3EndBattleText3
	db "@"

PokemonTower3AfterBattleText3: ; 60758 (18:4758)
	TX_FAR _PokemonTower3AfterBattleText3
	db "@"
