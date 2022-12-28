PokemonMansion3F_Script:
	call Mansion3Script_52204
	call EnableAutoTextBoxDrawing
	ld hl, Mansion3TrainerHeaders
	ld de, PokemonMansion3F_ScriptPointers
	ld a, [wPokemonMansion3FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonMansion3FCurScript], a
	ret

Mansion3Script_52204:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_MANSION_SWITCH_ON
	jr nz, .asm_52224
	ld a, $e
	lb bc, 2, 7
	call Mansion2Script_5202f
	ld a, $5f
	lb bc, 5, 7
	call Mansion2Script_5202f
	ret
.asm_52224
	ld a, $5f
	lb bc, 2, 7
	call Mansion2Script_5202f
	ld a, $e
	lb bc, 5, 7
	call Mansion2Script_5202f
	ret

PokemonMansion3F_ScriptPointers:
	dw Mansion3Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Mansion3Script0:
	ld hl, CoordsData_52254
	call Mansion3Script_5225b
	ld a, [wWhichDungeonWarp]
	and a
	jp z, CheckFightingMapTrainers
	cp $3
	ld a, POKEMON_MANSION_1F
	jr nz, .asm_52250
	ld a, POKEMON_MANSION_2F
.asm_52250
	ld [wDungeonWarpDestinationMap], a
	ret

CoordsData_52254:
	dbmapcoord 16, 14
	dbmapcoord 17, 14
	dbmapcoord 19, 14
	db -1 ; end

Mansion3Script_5225b:
	xor a
	ld [wWhichDungeonWarp], a
	ld a, [wd72d]
	bit 4, a
	ret nz
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wCoordIndex]
	ld [wWhichDungeonWarp], a
	ld hl, wd72d
	set 4, [hl]
	ld hl, wd732
	set 4, [hl]
	ret

Mansion3Script_Switches::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld a, $6
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID

PokemonMansion3F_TextPointers:
	dw Mansion3Text1
	dw Mansion3Text2
	dw PickUpItemText
	dw PickUpItemText
	dw Mansion3Text5
	dw Mansion3Text6

Mansion3TrainerHeaders:
	def_trainers
Mansion3TrainerHeader0:
	trainer EVENT_BEAT_MANSION_3_TRAINER_0, 0, Mansion3BattleText1, Mansion3EndBattleText1, Mansion3AfterBattleText1
Mansion3TrainerHeader1:
	trainer EVENT_BEAT_MANSION_3_TRAINER_1, 2, Mansion3BattleText2, Mansion3EndBattleText2, Mansion3AfterBattleText2
	db -1 ; end

Mansion3Text1:
	text_asm
	ld hl, Mansion3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Mansion3Text2:
	text_asm
	ld hl, Mansion3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Mansion3BattleText1:
	text_far _Mansion3BattleText1
	text_end

Mansion3EndBattleText1:
	text_far _Mansion3EndBattleText1
	text_end

Mansion3AfterBattleText1:
	text_far _Mansion3AfterBattleText1
	text_end

Mansion3BattleText2:
	text_far _Mansion3BattleText2
	text_end

Mansion3EndBattleText2:
	text_far _Mansion3EndBattleText2
	text_end

Mansion3AfterBattleText2:
	text_far _Mansion3AfterBattleText2
	text_end

Mansion3Text5:
	text_far _Mansion3Text5
	text_end
