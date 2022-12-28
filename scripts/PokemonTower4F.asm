PokemonTower4F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower4TrainerHeaders
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

PokemonTower4TrainerHeaders:
	def_trainers
PokemonTower4TrainerHeader0:
	trainer EVENT_BEAT_POKEMONTOWER_4_TRAINER_0, 2, PokemonTower4BattleText1, PokemonTower4EndBattleText1, PokemonTower4AfterBattleText1
PokemonTower4TrainerHeader1:
	trainer EVENT_BEAT_POKEMONTOWER_4_TRAINER_1, 2, PokemonTower4BattleText2, PokemonTower4EndBattleText2, PokemonTower4AfterBattleText2
PokemonTower4TrainerHeader2:
	trainer EVENT_BEAT_POKEMONTOWER_4_TRAINER_2, 2, PokemonTower4BattleText3, PokemonTower4EndBattleText3, PokemonTower4AfterBattleText3
	db -1 ; end

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
