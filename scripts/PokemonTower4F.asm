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
	text_asm
	ld hl, PokemonTower4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower4Text2:
	text_asm
	ld hl, PokemonTower4TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower4Text3:
	text_asm
	ld hl, PokemonTower4TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower4BattleText1:
	text_far _PokemonTower4BattleText1
	text_end

PokemonTower4EndBattleText1:
	text_far _PokemonTower4EndBattleText1
	text_end

PokemonTower4AfterBattleText1:
	text_far _PokemonTower4AfterBattleText1
	text_end

PokemonTower4BattleText2:
	text_far _PokemonTower4BattleText2
	text_end

PokemonTower4EndBattleText2:
	text_far _PokemonTower4EndBattleText2
	text_end

PokemonTower4AfterBattleText2:
	text_far _PokemonTower4AfterBattleText2
	text_end

PokemonTower4BattleText3:
	text_far _PokemonTower4BattleText3
	text_end

PokemonTower4EndBattleText3:
	text_far _PokemonTower4EndBattleText3
	text_end

PokemonTower4AfterBattleText3:
	text_far _PokemonTower4AfterBattleText3
	text_end
