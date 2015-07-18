PokemonTower4Script: ; 607f6 (18:47f6)
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower4TrainerHeaders
	ld de, PokemonTower4ScriptPointers
	ld a, [W_POKEMONTOWER4CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_POKEMONTOWER4CURSCRIPT], a
	ret

PokemonTower4ScriptPointers: ; 60809 (18:4809)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

PokemonTower4TextPointers: ; 6080f (18:480f)
	dw PokemonTower4Text1
	dw PokemonTower4Text2
	dw PokemonTower4Text3
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText

PokemonTower4TrainerHeaders: ; 6081b (18:481b)
PokemonTower4TrainerHeader0: ; 6081b (18:481b)
	db $1 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd766 ; flag's byte
	dw PokemonTower4BattleText1 ; TextBeforeBattle
	dw PokemonTower4AfterBattleText1 ; TextAfterBattle
	dw PokemonTower4EndBattleText1 ; TextEndBattle
	dw PokemonTower4EndBattleText1 ; TextEndBattle

PokemonTower4TrainerHeader1: ; 60827 (18:4827)
	db $2 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd766 ; flag's byte
	dw PokemonTower4BattleText2 ; TextBeforeBattle
	dw PokemonTower4AfterBattleText2 ; TextAfterBattle
	dw PokemonTower4EndBattleText2 ; TextEndBattle
	dw PokemonTower4EndBattleText2 ; TextEndBattle

PokemonTower4TrainerHeader2: ; 60833 (18:4833)
	db $3 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd766 ; flag's byte
	dw PokemonTower4BattleText3 ; TextBeforeBattle
	dw PokemonTower4AfterBattleText3 ; TextAfterBattle
	dw PokemonTower4EndBattleText3 ; TextEndBattle
	dw PokemonTower4EndBattleText3 ; TextEndBattle

	db $ff

PokemonTower4Text1: ; 60840 (18:4840)
	TX_ASM
	ld hl, PokemonTower4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower4Text2: ; 6084a (18:484a)
	TX_ASM
	ld hl, PokemonTower4TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower4Text3: ; 60854 (18:4854)
	TX_ASM
	ld hl, PokemonTower4TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower4BattleText1: ; 6085e (18:485e)
	TX_FAR _PokemonTower4BattleText1
	db "@"

PokemonTower4EndBattleText1: ; 60863 (18:4863)
	TX_FAR _PokemonTower4EndBattleText1
	db "@"

PokemonTower4AfterBattleText1: ; 60868 (18:4868)
	TX_FAR _PokemonTower4AfterBattleText1
	db "@"

PokemonTower4BattleText2: ; 6086d (18:486d)
	TX_FAR _PokemonTower4BattleText2
	db "@"

PokemonTower4EndBattleText2: ; 60872 (18:4872)
	TX_FAR _PokemonTower4EndBattleText2
	db "@"

PokemonTower4AfterBattleText2: ; 60877 (18:4877)
	TX_FAR _PokemonTower4AfterBattleText2
	db "@"

PokemonTower4BattleText3: ; 6087c (18:487c)
	TX_FAR _PokemonTower4BattleText3
	db "@"

PokemonTower4EndBattleText3: ; 60881 (18:4881)
	TX_FAR _PokemonTower4EndBattleText3
	db "@"

PokemonTower4AfterBattleText3: ; 60886 (18:4886)
	TX_FAR _PokemonTower4AfterBattleText3
	db "@"
