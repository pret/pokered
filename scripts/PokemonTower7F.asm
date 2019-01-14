PokemonTower7F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower7TrainerHeader0
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
	ld [hSpriteIndexOrTextID], a
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
	ld [wSpriteStateData1 + 9], a
	ld a, MR_FUJIS_HOUSE
	ld [hWarpDestinationMap], a
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
	ld [H_SPRITEINDEX], a
	jp MoveSprite
.asm_60dde
	inc hl
.asm_60ddf
	inc hl
	inc hl
	jr .asm_60dcb

CoordsData_60de3:
	db $0C,$09
	dw MovementData_60e13
	db $0B,$0A
	dw MovementData_60e1b
	db $0B,$0B
	dw MovementData_60e22
	db $0B,$0C
	dw MovementData_60e22
	db $0A,$0C
	dw MovementData_60e28
	db $09,$0B
	dw MovementData_60e30
	db $09,$0A
	dw MovementData_60e22
	db $09,$09
	dw MovementData_60e22
	db $08,$09
	dw MovementData_60e37
	db $07,$0A
	dw MovementData_60e22
	db $07,$0B
	dw MovementData_60e22
	db $07,$0C
	dw MovementData_60e22

MovementData_60e13:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_LEFT
	db $FF

MovementData_60e1b:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

MovementData_60e22:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

MovementData_60e28:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

MovementData_60e30:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

MovementData_60e37:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db $FF

PokemonTower7F_TextPointers:
	dw PokemonTower7Text1
	dw PokemonTower7Text2
	dw PokemonTower7Text3
	dw PokemonTower7FujiText

PokemonTower7TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_7_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_7_TRAINER_0
	dw PokemonTower7BattleText1 ; TextBeforeBattle
	dw PokemonTower7AfterBattleText1 ; TextAfterBattle
	dw PokemonTower7EndBattleText1 ; TextEndBattle
	dw PokemonTower7EndBattleText1 ; TextEndBattle

PokemonTower7TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_7_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_7_TRAINER_1
	dw PokemonTower7BattleText2 ; TextBeforeBattle
	dw PokemonTower7AfterBattleText2 ; TextAfterBattle
	dw PokemonTower7EndBattleText2 ; TextEndBattle
	dw PokemonTower7EndBattleText2 ; TextEndBattle

PokemonTower7TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_7_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_7_TRAINER_2
	dw PokemonTower7BattleText3 ; TextBeforeBattle
	dw PokemonTower7AfterBattleText3 ; TextAfterBattle
	dw PokemonTower7EndBattleText3 ; TextEndBattle
	dw PokemonTower7EndBattleText3 ; TextEndBattle

	db $ff

PokemonTower7Text1:
	TX_ASM
	ld hl, PokemonTower7TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower7Text2:
	TX_ASM
	ld hl, PokemonTower7TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower7Text3:
	TX_ASM
	ld hl, PokemonTower7TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower7FujiText:
	TX_ASM
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
	TX_FAR _TowerRescueFujiText
	db "@"

PokemonTower7BattleText1:
	TX_FAR _PokemonTower7BattleText1
	db "@"

PokemonTower7EndBattleText1:
	TX_FAR _PokemonTower7EndBattleText1
	db "@"

PokemonTower7AfterBattleText1:
	TX_FAR _PokemonTower7AfterBattleText1
	db "@"

PokemonTower7BattleText2:
	TX_FAR _PokemonTower7BattleText2
	db "@"

PokemonTower7EndBattleText2:
	TX_FAR _PokemonTower7EndBattleText2
	db "@"

PokemonTower7AfterBattleText2:
	TX_FAR _PokemonTower7AfterBattleText2
	db "@"

PokemonTower7BattleText3:
	TX_FAR _PokemonTower7BattleText3
	db "@"

PokemonTower7EndBattleText3:
	TX_FAR _PokemonTower7EndBattleText3
	db "@"

PokemonTower7AfterBattleText3:
	TX_FAR _PokemonTower7AfterBattleText3
	db "@"
