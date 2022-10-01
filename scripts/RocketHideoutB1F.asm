RocketHideoutB1F_Script: ;all trainer references are commented out.
	;call RocketHideout1Script_44be0
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideout1TrainerHeaders
	ld de, RocketHideoutB1F_ScriptPointers
	ld a, [wRocketHideoutB1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRocketHideoutB1FCurScript], a
	ret

;RocketHideout1Script_44be0:
;	ld hl, wCurrentMapScriptFlags
;	bit 5, [hl]
;	res 5, [hl]
;	ret z
;	CheckEvent EVENT_677
;	jr nz, .asm_44c01
;	CheckEventReuseA EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_4
;	jr nz, .asm_44bf7
;	ld a, $54
;	jr .asm_44c03
;.asm_44bf7
;	ld a, SFX_GO_INSIDE
;	call PlaySound
;	CheckEventHL EVENT_677
;.asm_44c01
;	ld a, $e
;.asm_44c03
;	ld [wNewTileBlockID], a
;	lb bc, 8, 12
;	predef_jump ReplaceTileBlock

RocketHideoutB1F_ScriptPointers:
	dw RocketHideout1Script0
	dw RocketHideout1Script4
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

RocketHideout1Script0:
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	ld hl, RocketHideout1ArrowTilePlayerMovement
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

RocketHideout1ArrowTilePlayerMovement:
	map_coord_movement 12, 16, RocketHideout1ArrowMovement1
	map_coord_movement 14, 15, RocketHideout1ArrowMovement2
	map_coord_movement 10, 15, RocketHideout1ArrowMovement3
	map_coord_movement 11, 14, RocketHideout1ArrowMovement4
	map_coord_movement 13, 8, RocketHideout1ArrowMovement5
	map_coord_movement 15, 8, RocketHideout1ArrowMovement7
	map_coord_movement 12, 9, RocketHideout1ArrowMovement8
	map_coord_movement 14, 9, RocketHideout1ArrowMovement9
	map_coord_movement 13, 10, RocketHideout1ArrowMovement10
	map_coord_movement 15, 10, RocketHideout1ArrowMovement11
	map_coord_movement 12, 11, RocketHideout1ArrowMovement12
	map_coord_movement 14, 11, RocketHideout1ArrowMovement13
	db -1 ; end

RocketHideout1ArrowMovement1:
	db D_UP, 2
	db -1 ; end

RocketHideout1ArrowMovement2:
	db D_LEFT, 4
	db -1 ; end

RocketHideout1ArrowMovement3:
	db D_UP, 9
	db -1 ; end

RocketHideout1ArrowMovement4:
	db D_RIGHT, 2
	db -1 ; end

RocketHideout1ArrowMovement5:
	db D_RIGHT, 2
	db -1 ; end

RocketHideout1ArrowMovement7:
	db D_DOWN, 2
	db -1 ; end

RocketHideout1ArrowMovement8:
	db D_RIGHT, 2
	db -1 ; end

RocketHideout1ArrowMovement9:
	db D_UP, 1
	db -1 ; end

RocketHideout1ArrowMovement10:
	db D_RIGHT, 2
	db -1 ; end

RocketHideout1ArrowMovement11:
	db D_RIGHT, 3
	db -1 ; end

RocketHideout1ArrowMovement12:
	db D_UP, 2
	db -1 ; end

RocketHideout1ArrowMovement13:
	db D_UP, 2
	db -1 ; end

RocketHideout1Script4:
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

RocketHideoutB1F_TextPointers:
	dw RocketHideout1Text1
	dw RocketHideout1Text2
	dw RocketHideout1Text3
	dw RocketHideout1Text4
	dw PickUpItemText
	dw PickUpItemText

RocketHideout1TrainerHeaders:
	def_trainers
;RocketHideout1TrainerHeader0:
;	trainer EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_0, 3, RocketHideout1BattleText2, RocketHideout1EndBattleText2, RocketHideout1AfterBattleTxt2
;RocketHideout1TrainerHeader1:
;	trainer EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_1, 2, RocketHideout1BattleText3, RocketHideout1EndBattleText3, RocketHideout1AfterBattleTxt3
;RocketHideout1TrainerHeader2:
;	trainer EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_2, 2, RocketHideout1BattleText4, RocketHideout1EndBattleText4, RocketHideout1AfterBattleTxt4
;RocketHideout1TrainerHeader3:
;	trainer EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_3, 3, RocketHideout1BattleText5, RocketHideout1EndBattleText5, RocketHideout1AfterBattleTxt5
;RocketHideout1TrainerHeader4:
;	trainer EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_4, 3, RocketHideout1BattleText6, RocketHideout1EndBattleText6, RocketHideout1AfterBattleTxt6
	db -1 ; end

RocketHideout1Text1:
	text_far _RocketHideout1Text1
	text_end

RocketHideout1Text2:
	text_far _RocketHideout1Text2
	text_end

RocketHideout1Text3:
	text_far _RocketHideout1Text3
	text_end

RocketHideout1Text4:
	text_far _RocketHideout1Text4
	text_end