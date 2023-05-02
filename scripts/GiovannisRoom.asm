GiovannisRoom_Script:
	call EnableAutoTextBoxDrawing
	ld hl, GiovannisRoomTrainerHeaders
	ld de, RocketHideoutB1F_ScriptPointers
	ld a, [wRocketHideoutB1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRocketHideoutB1FCurScript], a
	ret

GiovannisRoom_ScriptPointers:
	dw GiovannisRoomScript0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw GiovannisRoomScript4

GiovannisRoomScript0:
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	ld hl, GiovannisRoomArrowTilePlayerMovement
	call DecodeArrowMovementRLE
	cp $ff
	jp z, CheckFightingMapTrainers
	ld hl, wd736
	set 7, [hl]
	call StartSimulatingJoypadStates
	ld a, SFX_ARROW_TILES
	call PlaySound
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $3
	ld [wCurMapScript], a
	ret

GiovannisRoomArrowTilePlayerMovement:
	map_coord_movement 12, 16, GiovannisRoomArrowMovement1
	map_coord_movement 14, 15, GiovannisRoomArrowMovement2
	map_coord_movement 10, 15, GiovannisRoomArrowMovement3
	map_coord_movement 11, 14, GiovannisRoomArrowMovement4
	map_coord_movement 13, 8, GiovannisRoomArrowMovement5
	map_coord_movement 15, 8, GiovannisRoomArrowMovement7
	map_coord_movement 12, 9, GiovannisRoomArrowMovement8
	map_coord_movement 14, 9, GiovannisRoomArrowMovement9
	map_coord_movement 13, 10, GiovannisRoomArrowMovement10
	map_coord_movement 15, 10, GiovannisRoomArrowMovement11
	map_coord_movement 12, 11, GiovannisRoomArrowMovement12
	map_coord_movement 14, 11, GiovannisRoomArrowMovement13
	map_coord_movement 14, 5, GiovannisRoomArrowMovement14
	db -1 ; end

GiovannisRoomArrowMovement1:
	db D_UP, 2
	db -1 ; end

GiovannisRoomArrowMovement2:
	db D_UP, 9
	db D_LEFT, 4
	db -1 ; end

GiovannisRoomArrowMovement3:
	db D_UP, 9
	db -1 ; end

GiovannisRoomArrowMovement4:
	db D_RIGHT, 2
	db -1 ; end

GiovannisRoomArrowMovement5:
	db D_RIGHT, 3
	db D_DOWN, 2
	db D_RIGHT, 2
	db -1 ; end

GiovannisRoomArrowMovement7:
	db D_RIGHT, 3
	db D_DOWN, 2
	db -1 ; end

GiovannisRoomArrowMovement8:
	db D_UP, 1
	db D_RIGHT, 2
	db -1 ; end

GiovannisRoomArrowMovement9:
	db D_UP, 1
	db -1 ; end

GiovannisRoomArrowMovement10:
	db D_RIGHT, 5
	db -1 ; end

GiovannisRoomArrowMovement11:
	db D_RIGHT, 3
	db -1 ; end

GiovannisRoomArrowMovement12:
	db D_UP, 1
	db D_RIGHT, 2
	db D_UP, 2
	db -1 ; end

GiovannisRoomArrowMovement13:
	db D_UP, 3
	db -1 ; end
	
GiovannisRoomArrowMovement14:
	db D_RIGHT, 4
	db -1 ; end

GiovannisRoomScript4:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	jp nz, LoadSpinnerArrowTiles
	xor a
	ld [wJoyIgnore], a
	ld hl, wd736
	res 7, [hl]
	ld a, $0
	ld [wCurMapScript], a
	ret

GiovannisRoom_TextPointers:
	dw GiovannisRoomText1
	dw GiovannisRoomText2
	dw GiovannisRoomText3
	dw GiovannisRoomText4
	dw PickUpItemText
	dw PickUpItemText
	dw GiovannisRoomText7

GiovannisRoomTrainerHeaders:
	def_trainers
GiovannisRoomTrainerHeader0:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_0, 3, GiovannisRoomBattleText2, GiovannisRoomEndBattleText2, GiovannisRoomAfterBattleTxt2
	db -1 ; end

GiovannisRoomText1:
	text_far _GiovannisRoomText1
	text_end

GiovannisRoomText2:
	text_far _GiovannisRoomText2
	text_end

GiovannisRoomText3:
	text_far _GiovannisRoomText3
	text_end

GiovannisRoomText4:
	text_far _GiovannisRoomText4
	text_end

GiovannisRoomText7:
	text_asm
	ld hl, GiovannisRoomTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

GiovannisRoomBattleText2:
	text_far _GiovannisRoomBattleText2
	text_end

GiovannisRoomEndBattleText2:
	text_far _GiovannisRoomEndBattleText2
	text_end

GiovannisRoomAfterBattleTxt2:
	text_far _GiovannisRoomAfterBattleTxt2
	text_end