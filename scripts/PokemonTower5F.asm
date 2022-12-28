PokemonTower5F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower5TrainerHeaders
	ld de, PokemonTower5F_ScriptPointers
	ld a, [wPokemonTower5FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower5FCurScript], a
	ret

PokemonTower5F_ScriptPointers:
	dw PokemonTower5Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

PokemonTower5Script0:
	ld hl, CoordsData_60992
	call ArePlayerCoordsInArray
	jr c, .asm_60960
	ld hl, wd72e
	res 4, [hl]
	ResetEvent EVENT_IN_PURIFIED_ZONE
	jp CheckFightingMapTrainers
.asm_60960
	CheckAndSetEvent EVENT_IN_PURIFIED_ZONE
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld hl, wd72e
	set 4, [hl]
	predef HealParty
	call GBFadeOutToWhite
	call Delay3
	call Delay3
	call GBFadeInFromWhite
	ld a, $7
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ret

CoordsData_60992:
	dbmapcoord 10,  8
	dbmapcoord 11,  8
	dbmapcoord 10,  9
	dbmapcoord 11,  9
	db -1 ; end

PokemonTower5F_TextPointers:
	dw PokemonTower5Text1
	dw PokemonTower5Text2
	dw PokemonTower5Text3
	dw PokemonTower5Text4
	dw PokemonTower5Text5
	dw PickUpItemText
	dw PokemonTower5Text7

PokemonTower5TrainerHeaders:
	def_trainers 2
PokemonTower5TrainerHeader0:
	trainer EVENT_BEAT_POKEMONTOWER_5_TRAINER_0, 2, PokemonTower5BattleText1, PokemonTower5EndBattleText1, PokemonTower5AfterBattleText1
PokemonTower5TrainerHeader1:
	trainer EVENT_BEAT_POKEMONTOWER_5_TRAINER_1, 3, PokemonTower5BattleText2, PokemonTower5EndBattleText2, PokemonTower5AfterBattleText2
PokemonTower5TrainerHeader2:
	trainer EVENT_BEAT_POKEMONTOWER_5_TRAINER_2, 2, PokemonTower5BattleText3, PokemonTower5EndBattleText3, PokemonTower5AfterBattleText3
PokemonTower5TrainerHeader3:
	trainer EVENT_BEAT_POKEMONTOWER_5_TRAINER_3, 2, PokemonTower5BattleText4, PokemonTower5EndBattleText4, PokemonTower5AfterBattleText4
	db -1 ; end

PokemonTower5Text1:
	text_far _PokemonTower5Text1
	text_end

PokemonTower5Text2:
	text_asm
	ld hl, PokemonTower5TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower5BattleText1:
	text_far _PokemonTower5BattleText1
	text_end

PokemonTower5EndBattleText1:
	text_far _PokemonTower5EndBattleText1
	text_end

PokemonTower5AfterBattleText1:
	text_far _PokemonTower5AfterBattleText1
	text_end

PokemonTower5Text3:
	text_asm
	ld hl, PokemonTower5TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower5BattleText2:
	text_far _PokemonTower5BattleText2
	text_end

PokemonTower5EndBattleText2:
	text_far _PokemonTower5EndBattleText2
	text_end

PokemonTower5AfterBattleText2:
	text_far _PokemonTower5AfterBattleText2
	text_end

PokemonTower5Text4:
	text_asm
	ld hl, PokemonTower5TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower5BattleText3:
	text_far _PokemonTower5BattleText3
	text_end

PokemonTower5EndBattleText3:
	text_far _PokemonTower5EndBattleText3
	text_end

PokemonTower5AfterBattleText3:
	text_far _PokemonTower5AfterBattleText3
	text_end

PokemonTower5Text5:
	text_asm
	ld hl, PokemonTower5TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower5BattleText4:
	text_far _PokemonTower5BattleText4
	text_end

PokemonTower5EndBattleText4:
	text_far _PokemonTower5EndBattleText4
	text_end

PokemonTower5AfterBattleText4:
	text_far _PokemonTower5AfterBattleText4
	text_end

PokemonTower5Text7:
	text_far _PokemonTower5Text7
	text_end
