RocketHideoutB2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideout2TrainerHeaders
	ld de, RocketHideoutB2F_ScriptPointers
	ld a, [wRocketHideoutB2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRocketHideoutB2FCurScript], a
	ret

RocketHideoutB2F_ScriptPointers:
	def_script_pointers
	dw_const RocketHideoutB2FDefaultScript,         SCRIPT_ROCKETHIDEOUTB2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROCKETHIDEOUTB2F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROCKETHIDEOUTB2F_END_BATTLE
	dw_const RocketHideoutB2FPlayerSpinningScript,  SCRIPT_ROCKETHIDEOUTB2F_PLAYER_SPINNING

RocketHideoutB2FDefaultScript:
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	ld hl, RocketHideout2ArrowTilePlayerMovement
	call DecodeArrowMovementRLE
	cp $ff
	jp z, CheckFightingMapTrainers
	ld hl, wMovementFlags
	set BIT_SPINNING, [hl]
	call StartSimulatingJoypadStates
	ld a, SFX_ARROW_TILES
	call PlaySound
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, SCRIPT_ROCKETHIDEOUTB2F_PLAYER_SPINNING
	ld [wCurMapScript], a
	ret

RocketHideout2ArrowTilePlayerMovement:
	map_coord_movement  4,  9, RocketHideout2ArrowMovement1
	map_coord_movement  4, 11, RocketHideout2ArrowMovement2
	map_coord_movement  4, 15, RocketHideout2ArrowMovement3
	map_coord_movement  4, 16, RocketHideout2ArrowMovement4
	map_coord_movement  4, 19, RocketHideout2ArrowMovement1
	map_coord_movement  4, 22, RocketHideout2ArrowMovement5
	map_coord_movement  5, 14, RocketHideout2ArrowMovement6
	map_coord_movement  6, 22, RocketHideout2ArrowMovement7
	map_coord_movement  6, 24, RocketHideout2ArrowMovement8
	map_coord_movement  8,  9, RocketHideout2ArrowMovement9
	map_coord_movement  8, 12, RocketHideout2ArrowMovement10
	map_coord_movement  8, 15, RocketHideout2ArrowMovement8
	map_coord_movement  8, 19, RocketHideout2ArrowMovement9
	map_coord_movement  8, 23, RocketHideout2ArrowMovement11
	map_coord_movement  9, 14, RocketHideout2ArrowMovement12
	map_coord_movement  9, 22, RocketHideout2ArrowMovement12
	map_coord_movement 10,  9, RocketHideout2ArrowMovement13
	map_coord_movement 10, 10, RocketHideout2ArrowMovement14
	map_coord_movement 10, 15, RocketHideout2ArrowMovement15
	map_coord_movement 10, 17, RocketHideout2ArrowMovement16
	map_coord_movement 10, 19, RocketHideout2ArrowMovement17
	map_coord_movement 10, 25, RocketHideout2ArrowMovement2
	map_coord_movement 11, 14, RocketHideout2ArrowMovement18
	map_coord_movement 11, 16, RocketHideout2ArrowMovement19
	map_coord_movement 11, 18, RocketHideout2ArrowMovement12
	map_coord_movement 12,  9, RocketHideout2ArrowMovement20
	map_coord_movement 12, 11, RocketHideout2ArrowMovement21
	map_coord_movement 12, 13, RocketHideout2ArrowMovement22
	map_coord_movement 12, 17, RocketHideout2ArrowMovement23
	map_coord_movement 13, 10, RocketHideout2ArrowMovement24
	map_coord_movement 13, 12, RocketHideout2ArrowMovement25
	map_coord_movement 13, 16, RocketHideout2ArrowMovement26
	map_coord_movement 13, 18, RocketHideout2ArrowMovement27
	map_coord_movement 13, 19, RocketHideout2ArrowMovement28
	map_coord_movement 13, 22, RocketHideout2ArrowMovement29
	map_coord_movement 13, 23, RocketHideout2ArrowMovement30
	map_coord_movement 14, 17, RocketHideout2ArrowMovement31
	map_coord_movement 15, 16, RocketHideout2ArrowMovement12
	map_coord_movement 16, 14, RocketHideout2ArrowMovement32
	map_coord_movement 16, 16, RocketHideout2ArrowMovement33
	map_coord_movement 16, 18, RocketHideout2ArrowMovement34
	map_coord_movement 17, 10, RocketHideout2ArrowMovement35
	map_coord_movement 17, 11, RocketHideout2ArrowMovement36
	db -1 ; end

;format: direction, count
;each list is read starting from the $FF and working backwards
RocketHideout2ArrowMovement1:
	db D_LEFT, 2
	db -1 ; end

RocketHideout2ArrowMovement2:
	db D_RIGHT, 4
	db -1 ; end

RocketHideout2ArrowMovement3:
	db D_UP, 4
	db D_RIGHT, 4
	db -1 ; end

RocketHideout2ArrowMovement4:
	db D_UP, 4
	db D_RIGHT, 4
	db D_UP, 1
	db -1 ; end

RocketHideout2ArrowMovement5:
	db D_LEFT, 2
	db D_UP, 3
	db -1 ; end

RocketHideout2ArrowMovement6:
	db D_DOWN, 2
	db D_RIGHT, 4
	db -1 ; end

RocketHideout2ArrowMovement7:
	db D_UP, 2
	db -1 ; end

RocketHideout2ArrowMovement8:
	db D_UP, 4
	db -1 ; end

RocketHideout2ArrowMovement9:
	db D_LEFT, 6
	db -1 ; end

RocketHideout2ArrowMovement10:
	db D_UP, 1
	db -1 ; end

RocketHideout2ArrowMovement11:
	db D_LEFT, 6
	db D_UP, 4
	db -1 ; end

RocketHideout2ArrowMovement12:
	db D_DOWN, 2
	db -1 ; end

RocketHideout2ArrowMovement13:
	db D_LEFT, 8
	db -1 ; end

RocketHideout2ArrowMovement14:
	db D_LEFT, 8
	db D_UP, 1
	db -1 ; end

RocketHideout2ArrowMovement15:
	db D_LEFT, 8
	db D_UP, 6
	db -1 ; end

RocketHideout2ArrowMovement16:
	db D_UP, 2
	db D_RIGHT, 4
	db -1 ; end

RocketHideout2ArrowMovement17:
	db D_UP, 2
	db D_RIGHT, 4
	db D_UP, 2
	db -1 ; end

RocketHideout2ArrowMovement18:
	db D_DOWN, 2
	db D_RIGHT, 4
	db D_DOWN, 2
	db -1 ; end

RocketHideout2ArrowMovement19:
	db D_DOWN, 2
	db D_RIGHT, 4
	db -1 ; end

RocketHideout2ArrowMovement20:
	db D_LEFT, 10
	db -1 ; end

RocketHideout2ArrowMovement21:
	db D_LEFT, 10
	db D_UP, 2
	db -1 ; end

RocketHideout2ArrowMovement22:
	db D_LEFT, 10
	db D_UP, 4
	db -1 ; end

RocketHideout2ArrowMovement23:
	db D_UP, 2
	db D_RIGHT, 2
	db -1 ; end

RocketHideout2ArrowMovement24:
	db D_RIGHT, 1
	db D_DOWN, 2
	db -1 ; end

RocketHideout2ArrowMovement25:
	db D_RIGHT, 1
	db -1 ; end

RocketHideout2ArrowMovement26:
	db D_DOWN, 2
	db D_RIGHT, 2
	db -1 ; end

RocketHideout2ArrowMovement27:
	db D_DOWN, 2
	db D_LEFT, 2
	db -1 ; end

RocketHideout2ArrowMovement28:
	db D_UP, 2
	db D_RIGHT, 4
	db D_UP, 2
	db D_LEFT, 3
	db -1 ; end

RocketHideout2ArrowMovement29:
	db D_DOWN, 2
	db D_LEFT, 4
	db -1 ; end

RocketHideout2ArrowMovement30:
	db D_LEFT, 6
	db D_UP, 4
	db D_LEFT, 5
	db -1 ; end

RocketHideout2ArrowMovement31:
	db D_UP, 2
	db -1 ; end

RocketHideout2ArrowMovement32:
	db D_UP, 1
	db -1 ; end

RocketHideout2ArrowMovement33:
	db D_UP, 3
	db -1 ; end

RocketHideout2ArrowMovement34:
	db D_UP, 5
	db -1 ; end

RocketHideout2ArrowMovement35:
	db D_RIGHT, 1
	db D_DOWN, 2
	db D_LEFT, 4
	db -1 ; end

RocketHideout2ArrowMovement36:
	db D_LEFT, 10
	db D_UP, 2
	db D_LEFT, 5
	db -1 ; end

RocketHideoutB2FPlayerSpinningScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	jr nz, LoadSpinnerArrowTiles
	xor a
	ld [wJoyIgnore], a
	ld hl, wMovementFlags
	res BIT_SPINNING, [hl]
	ld a, SCRIPT_ROCKETHIDEOUTB2F_DEFAULT
	ld [wCurMapScript], a
	ret

INCLUDE "engine/overworld/spinners.asm"

RocketHideoutB2F_TextPointers:
	def_text_pointers
	dw_const RocketHideoutB2FRocketText, TEXT_ROCKETHIDEOUTB2F_ROCKET
	dw_const PickUpItemText,             TEXT_ROCKETHIDEOUTB2F_MOON_STONE
	dw_const PickUpItemText,             TEXT_ROCKETHIDEOUTB2F_NUGGET
	dw_const PickUpItemText,             TEXT_ROCKETHIDEOUTB2F_TM_HORN_DRILL
	dw_const PickUpItemText,             TEXT_ROCKETHIDEOUTB2F_SUPER_POTION

RocketHideout2TrainerHeaders:
	def_trainers
RocketHideout2TrainerHeader0:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_2_TRAINER_0, 4, RocketHideoutB2FRocketBattleText, RocketHideoutB2FRocketEndBattleText, RocketHideoutB2FRocketAfterBattleText
	db -1 ; end

RocketHideoutB2FRocketText:
	text_asm
	ld hl, RocketHideout2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RocketHideoutB2FRocketBattleText:
	text_far _RocketHideoutB2FRocketBattleText
	text_end

RocketHideoutB2FRocketEndBattleText:
	text_far _RocketHideoutB2FRocketEndBattleText
	text_end

RocketHideoutB2FRocketAfterBattleText:
	text_far _RocketHideoutB2FRocketAfterBattleText
	text_end
