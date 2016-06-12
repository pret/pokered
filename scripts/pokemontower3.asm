PokemonTower3Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower3TrainerHeaders
	ld de, PokemonTower3ScriptPointers
	ld a, [wPokemonTower3CurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower3CurScript], a
	ret

PokemonTower3ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

PokemonTower3TextPointers:
	dw PokemonTower3Text1
	dw PokemonTower3Text2
	dw PokemonTower3Text3
	dw PickUpItemText

PokemonTower3TrainerHeaders:
PokemonTower3TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_3_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_3_TRAINER_0
	dw PokemonTower3BattleText1 ; TextBeforeBattle
	dw PokemonTower3AfterBattleText1 ; TextAfterBattle
	dw PokemonTower3EndBattleText1 ; TextEndBattle
	dw PokemonTower3EndBattleText1 ; TextEndBattle

PokemonTower3TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_3_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_3_TRAINER_1
	dw PokemonTower3BattleText2 ; TextBeforeBattle
	dw PokemonTower3AfterBattleText2 ; TextAfterBattle
	dw PokemonTower3EndBattleText2 ; TextEndBattle
	dw PokemonTower3EndBattleText2 ; TextEndBattle

PokemonTower3TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_3_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_3_TRAINER_2
	dw PokemonTower3BattleText3 ; TextBeforeBattle
	dw PokemonTower3AfterBattleText3 ; TextAfterBattle
	dw PokemonTower3EndBattleText3 ; TextEndBattle
	dw PokemonTower3EndBattleText3 ; TextEndBattle
	db $ff

PokemonTower3Text1:
	TX_ASM
	ld hl, PokemonTower3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower3Text2:
	TX_ASM
	ld hl, PokemonTower3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower3Text3:
	TX_ASM
	ld hl, PokemonTower3TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower3BattleText1:
	TX_FAR _PokemonTower3BattleText1
	db "@"

PokemonTower3EndBattleText1:
	TX_FAR _PokemonTower3EndBattleText1
	db "@"

PokemonTower3AfterBattleText1:
	TX_FAR _PokemonTower3AfterBattleText1
	db "@"

PokemonTower3BattleText2:
	TX_FAR _PokemonTower3BattleText2
	db "@"

PokemonTower3EndBattleText2:
	TX_FAR _PokemonTower3EndBattleText2
	db "@"

PokemonTower3AfterBattleText2:
	TX_FAR _PokemonTower3AfterBattleText2
	db "@"

PokemonTower3BattleText3:
	TX_FAR _PokemonTower3BattleText3
	db "@"

PokemonTower3EndBattleText3:
	TX_FAR _PokemonTower3EndBattleText3
	db "@"

PokemonTower3AfterBattleText3:
	TX_FAR _PokemonTower3AfterBattleText3
	db "@"
