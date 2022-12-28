PokemonTower3F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower3TrainerHeaders
	ld de, PokemonTower3F_ScriptPointers
	ld a, [wPokemonTower3FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower3FCurScript], a
	ret

PokemonTower3F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

PokemonTower3F_TextPointers:
	dw PokemonTower3Text1
	dw PokemonTower3Text2
	dw PokemonTower3Text3
	dw PickUpItemText

PokemonTower3TrainerHeaders:
	def_trainers
PokemonTower3TrainerHeader0:
	trainer EVENT_BEAT_POKEMONTOWER_3_TRAINER_0, 2, PokemonTower3BattleText1, PokemonTower3EndBattleText1, PokemonTower3AfterBattleText1
PokemonTower3TrainerHeader1:
	trainer EVENT_BEAT_POKEMONTOWER_3_TRAINER_1, 3, PokemonTower3BattleText2, PokemonTower3EndBattleText2, PokemonTower3AfterBattleText2
PokemonTower3TrainerHeader2:
	trainer EVENT_BEAT_POKEMONTOWER_3_TRAINER_2, 2, PokemonTower3BattleText3, PokemonTower3EndBattleText3, PokemonTower3AfterBattleText3
	db -1 ; end

PokemonTower3Text1:
	text_asm
	ld hl, PokemonTower3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower3Text2:
	text_asm
	ld hl, PokemonTower3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower3Text3:
	text_asm
	ld hl, PokemonTower3TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower3BattleText1:
	text_far _PokemonTower3BattleText1
	text_end

PokemonTower3EndBattleText1:
	text_far _PokemonTower3EndBattleText1
	text_end

PokemonTower3AfterBattleText1:
	text_far _PokemonTower3AfterBattleText1
	text_end

PokemonTower3BattleText2:
	text_far _PokemonTower3BattleText2
	text_end

PokemonTower3EndBattleText2:
	text_far _PokemonTower3EndBattleText2
	text_end

PokemonTower3AfterBattleText2:
	text_far _PokemonTower3AfterBattleText2
	text_end

PokemonTower3BattleText3:
	text_far _PokemonTower3BattleText3
	text_end

PokemonTower3EndBattleText3:
	text_far _PokemonTower3EndBattleText3
	text_end

PokemonTower3AfterBattleText3:
	text_far _PokemonTower3AfterBattleText3
	text_end
