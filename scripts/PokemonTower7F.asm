PokemonTower7F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower7TrainerHeaders
	ld de, PokemonTower7F_ScriptPointers
	ld a, [wPokemonTower7FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower7FCurScript], a
	ret

PokemonTower7Script_60d18:
	xor a
	ld [wJoyIgnore], a
	ld [wPokemonTower7FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower7F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw PokemonTower7Script2
	dw PokemonTower7Script3
	dw PokemonTower7Script4

PokemonTower7Script2:
	ld hl, wFlags_0xcd60
	res 0, [hl]
	ld a, [wIsInBattle]
	cp $ff
	jp z, PokemonTower7Script_60d18
	call EndTrainerBattle
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, [wSpriteIndex]
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	call PokemonTower7Script_60db6
	ld a, $3
	ld [wPokemonTower7FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower7Script3:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld hl, wMissableObjectList
	ld a, [wSpriteIndex]
	ld b, a
.missableObjectsListLoop
	ld a, [hli]
	cp b            ; search for sprite ID in missing objects list
	ld a, [hli]
	jr nz, .missableObjectsListLoop
	ld [wMissableObjectIndex], a   ; remove missable object
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	ld [wSpriteIndex], a
	ld [wTrainerHeaderFlagBit], a
	ld [wUnusedDA38], a
	ld a, $0
	ld [wPokemonTower7FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower7Script4:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, HS_POKEMON_TOWER_7F_MR_FUJI
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, SPRITE_FACING_UP
	ld [wSpritePlayerStateData1FacingDirection], a
	ld a, MR_FUJIS_HOUSE
	ldh [hWarpDestinationMap], a
	ld a, $1
	ld [wDestinationWarpID], a
	ld a, LAVENDER_TOWN
	ld [wLastMap], a
	ld hl, wd72d
	set 3, [hl]
	ld a, $0
	ld [wPokemonTower7FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower7Script_60db6:
	ld hl, CoordsData_60de3
	ld a, [wSpriteIndex]
	dec a
	swap a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
.asm_60dcb
	ld a, [hli]
	cp b
	jr nz, .asm_60dde
	ld a, [hli]
	cp c
	jr nz, .asm_60ddf
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wSpriteIndex]
	ldh [hSpriteIndex], a
	jp MoveSprite
.asm_60dde
	inc hl
.asm_60ddf
	inc hl
	inc hl
	jr .asm_60dcb

CoordsData_60de3:
	map_coord_movement  9, 12, MovementData_60e13
	map_coord_movement 10, 11, MovementData_60e1b
	map_coord_movement 11, 11, MovementData_60e22
	map_coord_movement 12, 11, MovementData_60e22
	map_coord_movement 12, 10, MovementData_60e28
	map_coord_movement 11,  9, MovementData_60e30
	map_coord_movement 10,  9, MovementData_60e22
	map_coord_movement  9,  9, MovementData_60e22
	map_coord_movement  9,  8, MovementData_60e37
	map_coord_movement 10,  7, MovementData_60e22
	map_coord_movement 11,  7, MovementData_60e22
	map_coord_movement 12,  7, MovementData_60e22

MovementData_60e13:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_LEFT
	db -1 ; end

MovementData_60e1b:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

MovementData_60e22:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

MovementData_60e28:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

MovementData_60e30:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

MovementData_60e37:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

PokemonTower7F_TextPointers:
	dw PokemonTower7Text1
	dw PokemonTower7Text2
	dw PokemonTower7Text3
	dw PokemonTower7FujiText

PokemonTower7TrainerHeaders:
	def_trainers
PokemonTower7TrainerHeader0:
	trainer EVENT_BEAT_POKEMONTOWER_7_TRAINER_0, 3, PokemonTower7BattleText1, PokemonTower7EndBattleText1, PokemonTower7AfterBattleText1
PokemonTower7TrainerHeader1:
	trainer EVENT_BEAT_POKEMONTOWER_7_TRAINER_1, 3, PokemonTower7BattleText2, PokemonTower7EndBattleText2, PokemonTower7AfterBattleText2
PokemonTower7TrainerHeader2:
	trainer EVENT_BEAT_POKEMONTOWER_7_TRAINER_2, 3, PokemonTower7BattleText3, PokemonTower7EndBattleText3, PokemonTower7AfterBattleText3
	db -1 ; end

PokemonTower7Text1:
	text_asm
	ld hl, PokemonTower7TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower7Text2:
	text_asm
	ld hl, PokemonTower7TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower7Text3:
	text_asm
	ld hl, PokemonTower7TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower7FujiText:
	text_asm
	ld hl, TowerRescueFujiText
	call PrintText
	SetEvent EVENT_RESCUED_MR_FUJI
	SetEvent EVENT_RESCUED_MR_FUJI_2
	ld a, HS_MR_FUJIS_HOUSE_MR_FUJI
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_SAFFRON_CITY_E
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_SAFFRON_CITY_F
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, $4
	ld [wPokemonTower7FCurScript], a
	ld [wCurMapScript], a
	jp TextScriptEnd

TowerRescueFujiText:
	text_far _TowerRescueFujiText
	text_end

PokemonTower7BattleText1:
	text_far _PokemonTower7BattleText1
	text_end

PokemonTower7EndBattleText1:
	text_far _PokemonTower7EndBattleText1
	text_end

PokemonTower7AfterBattleText1:
	text_far _PokemonTower7AfterBattleText1
	text_end

PokemonTower7BattleText2:
	text_far _PokemonTower7BattleText2
	text_end

PokemonTower7EndBattleText2:
	text_far _PokemonTower7EndBattleText2
	text_end

PokemonTower7AfterBattleText2:
	text_far _PokemonTower7AfterBattleText2
	text_end

PokemonTower7BattleText3:
	text_far _PokemonTower7BattleText3
	text_end

PokemonTower7EndBattleText3:
	text_far _PokemonTower7EndBattleText3
	text_end

PokemonTower7AfterBattleText3:
	text_far _PokemonTower7AfterBattleText3
	text_end
