PokemonTower4F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower4TrainerHeader0
	ld de, PokemonTower4F_ScriptPointers
	ld a, [wPokemonTower4FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower4FCurScript], a
	ret

PokemonTower4F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

PokemonTower4F_TextPointers:
	dw PokemonTower4Text1
	dw PokemonTower4Text2
	dw PokemonTower4Text3
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText

PokemonTower4TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_4_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_4_TRAINER_0
	dw PokemonTower4BattleText1 ; TextBeforeBattle
	dw PokemonTower4AfterBattleText1 ; TextAfterBattle
	dw PokemonTower4EndBattleText1 ; TextEndBattle
	dw PokemonTower4EndBattleText1 ; TextEndBattle

PokemonTower4TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_4_TRAINER_1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_4_TRAINER_1
	dw PokemonTower4BattleText2 ; TextBeforeBattle
	dw PokemonTower4AfterBattleText2 ; TextAfterBattle
	dw PokemonTower4EndBattleText2 ; TextEndBattle
	dw PokemonTower4EndBattleText2 ; TextEndBattle

PokemonTower4TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_4_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_4_TRAINER_2
	dw PokemonTower4BattleText3 ; TextBeforeBattle
	dw PokemonTower4AfterBattleText3 ; TextAfterBattle
	dw PokemonTower4EndBattleText3 ; TextEndBattle
	dw PokemonTower4EndBattleText3 ; TextEndBattle

	db $ff

PokemonTower4Text1:
	TX_ASM
	ld hl, PokemonTower4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower4Text2:
	TX_ASM
	ld hl, PokemonTower4TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower4Text3:
	TX_ASM
	ld hl, PokemonTower4TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower4BattleText1:
	TX_FAR _PokemonTower4BattleText1
	db "@"

PokemonTower4EndBattleText1:
	TX_FAR _PokemonTower4EndBattleText1
	db "@"

PokemonTower4AfterBattleText1:
	TX_FAR _PokemonTower4AfterBattleText1
	db "@"

PokemonTower4BattleText2:
	TX_FAR _PokemonTower4BattleText2
	db "@"

PokemonTower4EndBattleText2:
	TX_FAR _PokemonTower4EndBattleText2
	db "@"

PokemonTower4AfterBattleText2:
	TX_FAR _PokemonTower4AfterBattleText2
	db "@"

PokemonTower4BattleText3:
	TX_FAR _PokemonTower4BattleText3
	db "@"

PokemonTower4EndBattleText3:
	TX_FAR _PokemonTower4EndBattleText3
	db "@"

PokemonTower4AfterBattleText3:
	TX_FAR _PokemonTower4AfterBattleText3
	db "@"
