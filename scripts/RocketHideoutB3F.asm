RocketHideoutB3F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideout3TrainerHeaders
	ld de, RocketHideoutB3F_ScriptPointers
	ld a, [wRocketHideoutB3FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRocketHideoutB3FCurScript], a
	ret

RocketHideoutB3F_ScriptPointers:
	dw RocketHideout3Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw RocketHideout3Script3

RocketHideout3Script0:
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	ld hl, RocketHideout3ArrowTilePlayerMovement
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

RocketHideout3Script3:
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

RocketHideoutB3F_TextPointers:
	dw RocketHideout3Text1
	dw RocketHideout3Text2
	dw PickUpItemText
	dw PickUpItemText

RocketHideout3TrainerHeaders:
	def_trainers
RocketHideout3TrainerHeader0:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_3_TRAINER_0, 2, RocketHideout3BattleText2, RocketHideout3EndBattleText2, RocketHideout3AfterBattleTxt2
RocketHideout3TrainerHeader1:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_3_TRAINER_1, 4, RocketHideout3BattleTxt, RocketHideout3EndBattleText3, RocketHideout3AfterBattleText3
	db -1 ; end

RocketHideout3Text1:
	text_asm
	ld hl, RocketHideout3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout3BattleText2:
	text_far _RocketHideout3BattleText2
	text_end

RocketHideout3EndBattleText2:
	text_far _RocketHideout3EndBattleText2
	text_end

RocketHideout3AfterBattleTxt2:
	text_far _RocketHideout3AfterBattleTxt2
	text_end

RocketHideout3Text2:
	text_asm
	ld hl, RocketHideout3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout3BattleTxt:
	text_far _RocketHideout3BattleTxt
	text_end

RocketHideout3EndBattleText3:
	text_far _RocketHideout3EndBattleText3
	text_end

RocketHideout3AfterBattleText3:
	text_far _RocketHide3AfterBattleText3
	text_end
