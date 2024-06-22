RocketHideoutB3F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideout3TrainerHeaders
	ld de, RocketHideoutB3F_ScriptPointers
	ld a, [wRocketHideoutB3FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRocketHideoutB3FCurScript], a
	ret

RocketHideoutB3F_ScriptPointers:
	def_script_pointers
	dw_const RocketHideoutB3FDefaultScript,         SCRIPT_ROCKETHIDEOUTB3F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROCKETHIDEOUTB3F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROCKETHIDEOUTB3F_END_BATTLE
	dw_const RocketHideoutB3FPlayerSpinningScript,  SCRIPT_ROCKETHIDEOUTB3F_PLAYER_SPINNING

RocketHideoutB3FDefaultScript:
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	ld hl, RocketHideout3ArrowTilePlayerMovement
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
	ld a, SCRIPT_ROCKETHIDEOUTB3F_PLAYER_SPINNING
	ld [wCurMapScript], a
	ret

RocketHideout3ArrowTilePlayerMovement:
	map_coord_movement 10, 13, RocketHideout3ArrowMovement6
	map_coord_movement 10, 19, RocketHideout3ArrowMovement1
	map_coord_movement 11, 18, RocketHideout3ArrowMovement2
	map_coord_movement 12, 11, RocketHideout3ArrowMovement3
	map_coord_movement 12, 17, RocketHideout3ArrowMovement4
	map_coord_movement 12, 20, RocketHideout3ArrowMovement5
	map_coord_movement 13, 16, RocketHideout3ArrowMovement6
	map_coord_movement 14, 11, RocketHideout3ArrowMovement7
	map_coord_movement 14, 15, RocketHideout3ArrowMovement6
	map_coord_movement 14, 17, RocketHideout3ArrowMovement8
	map_coord_movement 14, 19, RocketHideout3ArrowMovement9
	map_coord_movement 15, 16, RocketHideout3ArrowMovement7
	map_coord_movement 15, 18, RocketHideout3ArrowMovement10
	map_coord_movement 16, 13, RocketHideout3ArrowMovement11
	map_coord_movement 17, 12, RocketHideout3ArrowMovement10
	map_coord_movement 18, 16, RocketHideout3ArrowMovement12
	db -1 ; end

;format: direction, count
;each list is read starting from the $FF and working backwards
RocketHideout3ArrowMovement1:
	db D_RIGHT, 4
	db D_UP, 4
	db D_RIGHT, 4
	db -1 ; end

RocketHideout3ArrowMovement2:
	db D_DOWN, 4
	db D_RIGHT, 4
	db -1 ; end

RocketHideout3ArrowMovement3:
	db D_LEFT, 2
	db -1 ; end

RocketHideout3ArrowMovement4:
	db D_RIGHT, 4
	db D_UP, 2
	db D_RIGHT, 2
	db -1 ; end

RocketHideout3ArrowMovement5:
	db D_RIGHT, 4
	db D_UP, 2
	db D_RIGHT, 2
	db D_UP, 3
	db -1 ; end

RocketHideout3ArrowMovement6:
	db D_RIGHT, 4
	db -1 ; end

RocketHideout3ArrowMovement7:
	db D_RIGHT, 2
	db -1 ; end

RocketHideout3ArrowMovement8:
	db D_RIGHT, 4
	db D_UP, 2
	db -1 ; end

RocketHideout3ArrowMovement9:
	db D_RIGHT, 4
	db D_UP, 4
	db -1 ; end

RocketHideout3ArrowMovement10:
	db D_DOWN, 4
	db -1 ; end

RocketHideout3ArrowMovement11:
	db D_UP, 2
	db -1 ; end

RocketHideout3ArrowMovement12:
	db D_UP, 1
	db -1 ; end

RocketHideoutB3FPlayerSpinningScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	jp nz, LoadSpinnerArrowTiles
	xor a
	ld [wJoyIgnore], a
	ld hl, wMovementFlags
	res BIT_SPINNING, [hl]
	ld a, SCRIPT_ROCKETHIDEOUTB3F_DEFAULT
	ld [wCurMapScript], a
	ret

RocketHideoutB3F_TextPointers:
	def_text_pointers
	dw_const RocketHideoutB3FRocket1Text, TEXT_ROCKETHIDEOUTB3F_ROCKET1
	dw_const RocketHideoutB3FRocket2Text, TEXT_ROCKETHIDEOUTB3F_ROCKET2
	dw_const PickUpItemText,              TEXT_ROCKETHIDEOUTB3F_TM_DOUBLE_EDGE
	dw_const PickUpItemText,              TEXT_ROCKETHIDEOUTB3F_RARE_CANDY

RocketHideout3TrainerHeaders:
	def_trainers
RocketHideout3TrainerHeader0:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_3_TRAINER_0, 2, RocketHideoutB3FRocket1BattleText, RocketHideoutB3FRocket1EndBattleText, RocketHideoutB3FRocket1AfterBattleText
RocketHideout3TrainerHeader1:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_3_TRAINER_1, 4, RocketHideoutB3FRocket2BattleText, RocketHideoutB3FRocket2EndBattleText, RocketHideoutB3FRocket2AfterBattleText
	db -1 ; end

RocketHideoutB3FRocket1Text:
	text_asm
	ld hl, RocketHideout3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RocketHideoutB3FRocket1BattleText:
	text_far _RocketHideoutB3FRocket1BattleText
	text_end

RocketHideoutB3FRocket1EndBattleText:
	text_far _RocketHideoutB3FRocket1EndBattleText
	text_end

RocketHideoutB3FRocket1AfterBattleText:
	text_far _RocketHideoutB3FRocket1AfterBattleText
	text_end

RocketHideoutB3FRocket2Text:
	text_asm
	ld hl, RocketHideout3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

RocketHideoutB3FRocket2BattleText:
	text_far _RocketHideout3BattleText
	text_end

RocketHideoutB3FRocket2EndBattleText:
	text_far _RocketHideout3EndBattleText3
	text_end

RocketHideoutB3FRocket2AfterBattleText:
	text_far _RocketHide3AfterBattleText3
	text_end
