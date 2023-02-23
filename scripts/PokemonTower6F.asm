PokemonTower6F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower6TrainerHeaders
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
	ldh [hJoyHeld], a
	ld a, $6
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
;;;;;;;;;; PureRGBnote: ADDED: ghost marowak uses a special color palette if the feature is enabled
	ld a, 1
	ld [wIsAltPalettePkmnData], a
;;;;;;;;;;
	ld a, RESTLESS_SOUL
	ld [wCurOpponent], a
	ld a, 30
	ld [wCurEnemyLVL], a
	ld a, $4
	ld [wPokemonTower6FCurScript], a
	ld [wCurMapScript], a
	ret

CoordsData_60b45:
	dbmapcoord 10, 16
	db -1 ; end

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
;;;;;;;;;; PureRGBnote: ADDED: ghost marowak can be caught and the event will complete if you do so
	CheckEvent EVENT_CAUGHT_GHOST_MAROWAK
	jr nz, .success 
;;;;;;;;;;
	ld a, [wBattleResult]
	and a
	jr nz, .asm_60b82
.success
	SetEvent EVENT_BEAT_GHOST_MAROWAK
	ld a, $7
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld [wPokemonTower6FCurScript], a
	ld [wCurMapScript], a
	ret
.asm_60b82
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, $10
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
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
	dw PickUp2ItemText
	dw PokemonTower6Text6
	dw PokemonTower6Text7

PokemonTower6TrainerHeaders:
	def_trainers
PokemonTower6TrainerHeader0:
	trainer EVENT_BEAT_POKEMONTOWER_6_TRAINER_0, 3, PokemonTower6BattleText1, PokemonTower6EndBattleText1, PokemonTower6AfterBattleText1
PokemonTower6TrainerHeader1:
	trainer EVENT_BEAT_POKEMONTOWER_6_TRAINER_1, 3, PokemonTower6BattleText2, PokemonTower6EndBattleText2, PokemonTower6AfterBattleText2
PokemonTower6TrainerHeader2:
	trainer EVENT_BEAT_POKEMONTOWER_6_TRAINER_2, 2, PokemonTower6BattleText3, PokemonTower6EndBattleText3, PokemonTower6AfterBattleText3
	db -1 ; end

PokemonTower6Text1:
	text_asm
	ld hl, PokemonTower6TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

PokemonTower6Text2:
	text_asm
	ld hl, PokemonTower6TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

PokemonTower6Text3:
	text_asm
	ld hl, PokemonTower6TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

PokemonTower6Text7:
	text_asm
	ld hl, PokemonTower2Text_60c1f
	rst PrintTextRST
	ld a, RESTLESS_SOUL
	call PlayCry
	call WaitForSoundToFinish
	ld c, 30
	rst DelayFramesRST
	ld hl, PokemonTower2Text_60c24
	rst PrintTextRST
;;;;;;;;;; PureRGBnote: ADDED: ghost marowak can be caught and the event will complete if you do so
	CheckEvent EVENT_CAUGHT_GHOST_MAROWAK
	jr nz, .caughtGhostMarowak
	ld hl, PokemonTower2Text_toAfterlife
	jr .done
.caughtGhostMarowak
	ld hl, PokemonTower2Text_CaughtGhostMarowak	
.done
	rst PrintTextRST
;;;;;;;;;;
	rst TextScriptEnd

PokemonTower2Text_60c1f:
	text_far _PokemonTower2Text_60c1f
	text_end

PokemonTower2Text_60c24:
	text_far _PokemonTower2Text_60c24
	text_end

;;;;;;;;;; PureRGBnote: ADDED: ghost marowak can be caught and the event will complete if you do so
PokemonTower2Text_CaughtGhostMarowak:
	text_far _PokemonTower2Text_Caught
	text_end

PokemonTower2Text_toAfterlife:
	text_far _PokemonTower2Text_toAfterlife
	text_end
;;;;;;;;;;

PokemonTower6BattleText1:
	text_far _PokemonTower6BattleText1
	text_end

PokemonTower6EndBattleText1:
	text_far _PokemonTower6EndBattleText1
	text_end

PokemonTower6AfterBattleText1:
	text_far _PokemonTower6AfterBattleText1
	text_end

PokemonTower6BattleText2:
	text_far _PokemonTower6BattleText2
	text_end

PokemonTower6EndBattleText2:
	text_far _PokemonTower6EndBattleText2
	text_end

PokemonTower6AfterBattleText2:
	text_far _PokemonTower6AfterBattleText2
	text_end

PokemonTower6BattleText3:
	text_far _PokemonTower6BattleText3
	text_end

PokemonTower6EndBattleText3:
	text_far _PokemonTower6EndBattleText3
	text_end

PokemonTower6AfterBattleText3:
	text_far _PokemonTower6AfterBattleText3
	text_end

PokemonTower6Text6:
	text_far _PokemonTower6Text6
	text_end
