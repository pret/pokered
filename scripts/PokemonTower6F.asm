PokemonTower6F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower6TrainerHeader0
	ld de, PokemonTower6F_ScriptPointers
	ld a, [wPokemonTower6FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower6FCurScript], a
	ret

PokemonTower6Script_60b02:
	xor a
	ld [wJoyIgnore], a
	ld [wPokemonTower6FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower6F_ScriptPointers:
	dw PokemonTower6Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw PokemonTower6Script3
	dw PokemonTower6Script4

PokemonTower6Script0:
	CheckEvent EVENT_BEAT_GHOST_MAROWAK
	jp nz, CheckFightingMapTrainers
	ld hl, CoordsData_60b45
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ld [hJoyHeld], a
	ld a, $6
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, MAROWAK
	ld [wCurOpponent], a
	ld a, 30
	ld [wCurEnemyLVL], a
	ld a, $4
	ld [wPokemonTower6FCurScript], a
	ld [wCurMapScript], a
	ret

CoordsData_60b45:
	db $10,$0A,$FF

PokemonTower6Script4:
	ld a, [wIsInBattle]
	cp $ff
	jp z, PokemonTower6Script_60b02
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wd72d]
	bit 6, a
	ret nz
	call UpdateSprites
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, [wBattleResult]
	and a
	jr nz, .asm_60b82
	SetEvent EVENT_BEAT_GHOST_MAROWAK
	ld a, $7
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [wPokemonTower6FCurScript], a
	ld [wCurMapScript], a
	ret
.asm_60b82
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, $10
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpriteStateData2 + $06], a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ld hl, wd730
	set 7, [hl]
	ld a, $3
	ld [wPokemonTower6FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower6Script3:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wPokemonTower6FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower6F_TextPointers:
	dw PokemonTower6Text1
	dw PokemonTower6Text2
	dw PokemonTower6Text3
	dw PickUpItemText
	dw PickUpItemText
	dw PokemonTower6Text6
	dw PokemonTower6Text7

PokemonTower6TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_6_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_6_TRAINER_0
	dw PokemonTower6BattleText1 ; TextBeforeBattle
	dw PokemonTower6AfterBattleText1 ; TextAfterBattle
	dw PokemonTower6EndBattleText1 ; TextEndBattle
	dw PokemonTower6EndBattleText1 ; TextEndBattle

PokemonTower6TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_6_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_6_TRAINER_1
	dw PokemonTower6BattleText2 ; TextBeforeBattle
	dw PokemonTower6AfterBattleText2 ; TextAfterBattle
	dw PokemonTower6EndBattleText2 ; TextEndBattle
	dw PokemonTower6EndBattleText2 ; TextEndBattle

PokemonTower6TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_6_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_6_TRAINER_2
	dw PokemonTower6BattleText3 ; TextBeforeBattle
	dw PokemonTower6AfterBattleText3 ; TextAfterBattle
	dw PokemonTower6EndBattleText3 ; TextEndBattle
	dw PokemonTower6EndBattleText3 ; TextEndBattle

	db $ff

PokemonTower6Text1:
	TX_ASM
	ld hl, PokemonTower6TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower6Text2:
	TX_ASM
	ld hl, PokemonTower6TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower6Text3:
	TX_ASM
	ld hl, PokemonTower6TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower6Text7:
	TX_ASM
	ld hl, PokemonTower2Text_60c1f
	call PrintText
	ld a, MAROWAK
	call PlayCry
	call WaitForSoundToFinish
	ld c, 30
	call DelayFrames
	ld hl, PokemonTower2Text_60c24
	call PrintText
	jp TextScriptEnd

PokemonTower2Text_60c1f:
	TX_FAR _PokemonTower2Text_60c1f
	db "@"

PokemonTower2Text_60c24:
	TX_FAR _PokemonTower2Text_60c24
	db "@"

PokemonTower6BattleText1:
	TX_FAR _PokemonTower6BattleText1
	db "@"

PokemonTower6EndBattleText1:
	TX_FAR _PokemonTower6EndBattleText1
	db "@"

PokemonTower6AfterBattleText1:
	TX_FAR _PokemonTower6AfterBattleText1
	db "@"

PokemonTower6BattleText2:
	TX_FAR _PokemonTower6BattleText2
	db "@"

PokemonTower6EndBattleText2:
	TX_FAR _PokemonTower6EndBattleText2
	db "@"

PokemonTower6AfterBattleText2:
	TX_FAR _PokemonTower6AfterBattleText2
	db "@"

PokemonTower6BattleText3:
	TX_FAR _PokemonTower6BattleText3
	db "@"

PokemonTower6EndBattleText3:
	TX_FAR _PokemonTower6EndBattleText3
	db "@"

PokemonTower6AfterBattleText3:
	TX_FAR _PokemonTower6AfterBattleText3
	db "@"

PokemonTower6Text6:
	TX_FAR _PokemonTower6Text6
	db "@"
