PokemonTower7F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower7TrainerHeaders
	ld de, PokemonTower7F_ScriptPointers
	ld a, [wPokemonTower7FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower7FCurScript], a
	ret

PokemonTower7FSetDefaultScript:
	xor a
	ld [wJoyIgnore], a
	ld [wPokemonTower7FCurScript], a ; SCRIPT_POKEMONTOWER7F_DEFAULT
	ld [wCurMapScript], a ; SCRIPT_POKEMONTOWER7F_DEFAULT
	ret

PokemonTower7F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_POKEMONTOWER7F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POKEMONTOWER7F_START_BATTLE
	dw_const PokemonTower7FEndBattleScript,         SCRIPT_POKEMONTOWER7F_END_BATTLE
	dw_const PokemonTower7FHideNPCScript,           SCRIPT_POKEMONTOWER7F_HIDE_NPC
	dw_const PokemonTower7FWarpToMrFujiHouseScript, SCRIPT_POKEMONTOWER7F_WARP_TO_MR_FUJI_HOUSE

PokemonTower7FEndBattleScript:
	ld hl, wMiscFlags
	res BIT_SEEN_BY_TRAINER, [hl]
	ld a, [wIsInBattle]
	cp $ff
	jp z, PokemonTower7FSetDefaultScript
	call EndTrainerBattle
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, [wSpriteIndex]
	ldh [hSpriteIndex], a
	call DisplayTextID
	call PokemonTower7FRocketLeaveMovementScript
	ld a, SCRIPT_POKEMONTOWER7F_HIDE_NPC
	ld [wPokemonTower7FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower7FHideNPCScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
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
	ld [wOpponentAfterWrongAnswer], a ; not used here; likely a mistake copied from maps/CinnabarGym.asm
	ld a, SCRIPT_POKEMONTOWER7F_DEFAULT
	ld [wPokemonTower7FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower7FWarpToMrFujiHouseScript:
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
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
	ld hl, wStatusFlags3
	set BIT_WARP_FROM_CUR_SCRIPT, [hl]
	ld a, SCRIPT_POKEMONTOWER7F_DEFAULT
	ld [wPokemonTower7FCurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower7FRocketLeaveMovementScript:
	ld hl, PokemonTower7FNPCCoordMovementTable
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
.loop
	ld a, [hli]
	cp b
	jr nz, .inc_and_skip
	ld a, [hli]
	cp c
	jr nz, .skip
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wSpriteIndex]
	ldh [hSpriteIndex], a
	jp MoveSprite
.inc_and_skip
	inc hl
.skip
	inc hl
	inc hl
	jr .loop

PokemonTower7FNPCCoordMovementTable:
	map_coord_movement  9, 12, PokemonTower7FRocket1ExitRightDownMovement
	map_coord_movement 10, 11, PokemonTower7FRocket1ExitDownRightMovement
	map_coord_movement 11, 11, PokemonTower7FRocketExitDownMovement
	map_coord_movement 12, 11, PokemonTower7FRocketExitDownMovement
	map_coord_movement 12, 10, PokemonTower7FRocket2ExitLeftDownMovement
	map_coord_movement 11,  9, PokemonTower7FRocket2ExitDownLeftMovement
	map_coord_movement 10,  9, PokemonTower7FRocketExitDownMovement
	map_coord_movement  9,  9, PokemonTower7FRocketExitDownMovement
	map_coord_movement  9,  8, PokemonTower7FRocket3ExitRightDownMovement
	map_coord_movement 10,  7, PokemonTower7FRocketExitDownMovement
	map_coord_movement 11,  7, PokemonTower7FRocketExitDownMovement
	map_coord_movement 12,  7, PokemonTower7FRocketExitDownMovement

PokemonTower7FRocket1ExitRightDownMovement:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_LEFT
	db -1 ; end

PokemonTower7FRocket1ExitDownRightMovement:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

PokemonTower7FRocketExitDownMovement:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

PokemonTower7FRocket2ExitLeftDownMovement:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

PokemonTower7FRocket2ExitDownLeftMovement:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

PokemonTower7FRocket3ExitRightDownMovement:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

PokemonTower7F_TextPointers:
	def_text_pointers
	dw_const PokemonTower7FRocket1Text, TEXT_POKEMONTOWER7F_ROCKET1
	dw_const PokemonTower7FRocket2Text, TEXT_POKEMONTOWER7F_ROCKET2
	dw_const PokemonTower7FRocket3Text, TEXT_POKEMONTOWER7F_ROCKET3
	dw_const PokemonTower7FMrFujiText,  TEXT_POKEMONTOWER7F_MR_FUJI

PokemonTower7TrainerHeaders:
	def_trainers
PokemonTower7TrainerHeader0:
	trainer EVENT_BEAT_POKEMONTOWER_7_TRAINER_0, 3, PokemonTower7FRocket1BattleText, PokemonTower7FRocket1EndBattleText, PokemonTower7FRocket1AfterBattleText
PokemonTower7TrainerHeader1:
	trainer EVENT_BEAT_POKEMONTOWER_7_TRAINER_1, 3, PokemonTower7FRocket2BattleText, PokemonTower7FRocket2EndBattleText, PokemonTower7FRocket2AfterBattleText
PokemonTower7TrainerHeader2:
	trainer EVENT_BEAT_POKEMONTOWER_7_TRAINER_2, 3, PokemonTower7FRocket3BattleText, PokemonTower7FRocket3EndBattleText, PokemonTower7FRocket3AfterBattleText
	db -1 ; end

PokemonTower7FRocket1Text:
	text_asm
	ld hl, PokemonTower7TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower7FRocket2Text:
	text_asm
	ld hl, PokemonTower7TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower7FRocket3Text:
	text_asm
	ld hl, PokemonTower7TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower7FMrFujiText:
	text_asm
	ld hl, .RescueText
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
	ld a, SCRIPT_POKEMONTOWER7F_WARP_TO_MR_FUJI_HOUSE
	ld [wPokemonTower7FCurScript], a
	ld [wCurMapScript], a
	jp TextScriptEnd

.RescueText:
	text_far _PokemonTower7FMrFujiRescueText
	text_end

PokemonTower7FRocket1BattleText:
	text_far _PokemonTower7FRocket1BattleText
	text_end

PokemonTower7FRocket1EndBattleText:
	text_far _PokemonTower7FRocket1EndBattleText
	text_end

PokemonTower7FRocket1AfterBattleText:
	text_far _PokemonTower7FRocket1AfterBattleText
	text_end

PokemonTower7FRocket2BattleText:
	text_far _PokemonTower7FRocket2BattleText
	text_end

PokemonTower7FRocket2EndBattleText:
	text_far _PokemonTower7FRocket2EndBattleText
	text_end

PokemonTower7FRocket2AfterBattleText:
	text_far _PokemonTower7FRocket2AfterBattleText
	text_end

PokemonTower7FRocket3BattleText:
	text_far _PokemonTower7FRocket3BattleText
	text_end

PokemonTower7FRocket3EndBattleText:
	text_far _PokemonTower7FRocket3EndBattleText
	text_end

PokemonTower7FRocket3AfterBattleText:
	text_far _PokemonTower7FRocket3AfterBattleText
	text_end
