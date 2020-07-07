PokemonTower5F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower5TrainerHeader0
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
	db $08,$0A
	db $08,$0B
	db $09,$0A
	db $09,$0B
	db $FF

PokemonTower5F_TextPointers:
	dw PokemonTower5Text1
	dw PokemonTower5Text2
	dw PokemonTower5Text3
	dw PokemonTower5Text4
	dw PokemonTower5Text5
	dw PickUpItemText
	dw PokemonTower5Text7

PokemonTower5TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_5_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_5_TRAINER_0
	dw PokemonTower5BattleText1 ; TextBeforeBattle
	dw PokemonTower5AfterBattleText1 ; TextAfterBattle
	dw PokemonTower5EndBattleText1 ; TextEndBattle
	dw PokemonTower5EndBattleText1 ; TextEndBattle

PokemonTower5TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_5_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_5_TRAINER_1
	dw PokemonTower5BattleText2 ; TextBeforeBattle
	dw PokemonTower5AfterBattleText2 ; TextAfterBattle
	dw PokemonTower5EndBattleText2 ; TextEndBattle
	dw PokemonTower5EndBattleText2 ; TextEndBattle

PokemonTower5TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_5_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_5_TRAINER_2
	dw PokemonTower5BattleText3 ; TextBeforeBattle
	dw PokemonTower5AfterBattleText3 ; TextAfterBattle
	dw PokemonTower5EndBattleText3 ; TextEndBattle
	dw PokemonTower5EndBattleText3 ; TextEndBattle

PokemonTower5TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_5_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_5_TRAINER_3
	dw PokemonTower5BattleText4 ; TextBeforeBattle
	dw PokemonTower5AfterBattleText4 ; TextAfterBattle
	dw PokemonTower5EndBattleText4 ; TextEndBattle
	dw PokemonTower5EndBattleText4 ; TextEndBattle

	db $ff

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
