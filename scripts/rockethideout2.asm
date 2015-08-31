RocketHideout2Script: ; 44e27 (11:4e27)
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideout2TrainerHeaders
	ld de, RocketHideout2ScriptPointers
	ld a, [wRocketHideout2CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRocketHideout2CurScript], a
	ret

RocketHideout2ScriptPointers: ; 44e3a (11:4e3a)
	dw RocketHideout2Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw RocketHideout2Script3

RocketHideout2Script0: ; 44e42 (11:4e42)
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	ld hl, RocketHideout2ArrowTilePlayerMovement
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

;format:
;db y,x
;dw pointer to movement
RocketHideout2ArrowTilePlayerMovement: ; 44e6d (11:4e6d)
	db $9,$4
	dw RocketHideout2ArrowMovement1
	db $b,$4
	dw RocketHideout2ArrowMovement2
	db $f,$4
	dw RocketHideout2ArrowMovement3
	db $10,$4
	dw RocketHideout2ArrowMovement4
	db $13,$4
	dw RocketHideout2ArrowMovement1
	db $16,$4
	dw RocketHideout2ArrowMovement5
	db $e,$5
	dw RocketHideout2ArrowMovement6
	db $16,$6
	dw RocketHideout2ArrowMovement7
	db $18,$6
	dw RocketHideout2ArrowMovement8
	db $9,$8
	dw RocketHideout2ArrowMovement9
	db $c,$8
	dw RocketHideout2ArrowMovement10
	db $f,$8
	dw RocketHideout2ArrowMovement8
	db $13,$8
	dw RocketHideout2ArrowMovement9
	db $17,$8
	dw RocketHideout2ArrowMovement11
	db $e,$9
	dw RocketHideout2ArrowMovement12
	db $16,$9
	dw RocketHideout2ArrowMovement12
	db $9,$a
	dw RocketHideout2ArrowMovement13
	db $a,$a
	dw RocketHideout2ArrowMovement14
	db $f,$a
	dw RocketHideout2ArrowMovement15
	db $11,$a
	dw RocketHideout2ArrowMovement16
	db $13,$a
	dw RocketHideout2ArrowMovement17
	db $19,$a
	dw RocketHideout2ArrowMovement2
	db $e,$b
	dw RocketHideout2ArrowMovement18
	db $10,$b
	dw RocketHideout2ArrowMovement19
	db $12,$b
	dw RocketHideout2ArrowMovement12
	db $9,$c
	dw RocketHideout2ArrowMovement20
	db $b,$c
	dw RocketHideout2ArrowMovement21
	db $d,$c
	dw RocketHideout2ArrowMovement22
	db $11,$c
	dw RocketHideout2ArrowMovement23
	db $a,$d
	dw RocketHideout2ArrowMovement24
	db $c,$d
	dw RocketHideout2ArrowMovement25
	db $10,$d
	dw RocketHideout2ArrowMovement26
	db $12,$d
	dw RocketHideout2ArrowMovement27
	db $13,$d
	dw RocketHideout2ArrowMovement28
	db $16,$d
	dw RocketHideout2ArrowMovement29
	db $17,$d
	dw RocketHideout2ArrowMovement30
	db $11,$e
	dw RocketHideout2ArrowMovement31
	db $10,$f
	dw RocketHideout2ArrowMovement12
	db $e,$10
	dw RocketHideout2ArrowMovement32
	db $10,$10
	dw RocketHideout2ArrowMovement33
	db $12,$10
	dw RocketHideout2ArrowMovement34
	db $a,$11
	dw RocketHideout2ArrowMovement35
	db $b,$11
	dw RocketHideout2ArrowMovement36
	db $FF

;format: direction, count
;each list is read starting from the $FF and working backwards
RocketHideout2ArrowMovement1: ; 44f1a (11:4f1a)
	db D_LEFT,$02
	db $FF

RocketHideout2ArrowMovement2: ; 44f1d (11:4f1d)
	db D_RIGHT,$04
	db $FF

RocketHideout2ArrowMovement3: ; 44f20 (11:4f20)
	db D_UP,$04
	db D_RIGHT,$04
	db $FF

RocketHideout2ArrowMovement4: ; 44f25 (11:4f25)
	db D_UP,$04
	db D_RIGHT,$04
	db D_UP,$01
	db $FF

RocketHideout2ArrowMovement5: ; 44f2c (11:4f2c)
	db D_LEFT,$02
	db D_UP,$03
	db $FF

RocketHideout2ArrowMovement6: ; 44f31 (11:4f31)
	db D_DOWN,$02
	db D_RIGHT,$04
	db $FF

RocketHideout2ArrowMovement7: ; 44f36 (11:4f36)
	db D_UP,$02
	db $FF

RocketHideout2ArrowMovement8: ; 44f39 (11:4f39)
	db D_UP,$04
	db $FF

RocketHideout2ArrowMovement9: ; 44f3c (11:4f3c)
	db D_LEFT,$06
	db $FF

RocketHideout2ArrowMovement10: ; 44f3f (11:4f3f)
	db D_UP,$01
	db $FF

RocketHideout2ArrowMovement11: ; 44f42 (11:4f42)
	db D_LEFT,$06
	db D_UP,$04
	db $FF

RocketHideout2ArrowMovement12: ; 44f47 (11:4f47)
	db D_DOWN,$02
	db $FF

RocketHideout2ArrowMovement13: ; 44f4a (11:4f4a)
	db D_LEFT,$08
	db $FF

RocketHideout2ArrowMovement14: ; 44f4d (11:4f4d)
	db D_LEFT,$08
	db D_UP,$01
	db $FF

RocketHideout2ArrowMovement15: ; 44f52 (11:4f52)
	db D_LEFT,$08
	db D_UP,$06
	db $FF

RocketHideout2ArrowMovement16: ; 44f57 (11:4f57)
	db D_UP,$02
	db D_RIGHT,$04
	db $FF

RocketHideout2ArrowMovement17: ; 44f5c (11:4f5c)
	db D_UP,$02
	db D_RIGHT,$04
	db D_UP,$02
	db $FF

RocketHideout2ArrowMovement18: ; 44f63 (11:4f63)
	db D_DOWN,$02
	db D_RIGHT,$04
	db D_DOWN,$02
	db $FF

RocketHideout2ArrowMovement19: ; 44f6a (11:4f6a)
	db D_DOWN,$02
	db D_RIGHT,$04
	db $FF

RocketHideout2ArrowMovement20: ; 44f6f (11:4f6f)
	db D_LEFT,$0A
	db $FF

RocketHideout2ArrowMovement21: ; 44f72 (11:4f72)
	db D_LEFT,$0A
	db D_UP,$02
	db $FF

RocketHideout2ArrowMovement22: ; 44f77 (11:4f77)
	db D_LEFT,$0A
	db D_UP,$04
	db $FF

RocketHideout2ArrowMovement23: ; 44f7c (11:4f7c)
	db D_UP,$02
	db D_RIGHT,$02
	db $FF

RocketHideout2ArrowMovement24: ; 44f81 (11:4f81)
	db D_RIGHT,$01
	db D_DOWN,$02
	db $FF

RocketHideout2ArrowMovement25: ; 44f86 (11:4f86)
	db D_RIGHT,$01
	db $FF

RocketHideout2ArrowMovement26: ; 44f89 (11:4f89)
	db D_DOWN,$02
	db D_RIGHT,$02
	db $FF

RocketHideout2ArrowMovement27: ; 44f8e (11:4f8e)
	db D_DOWN,$02
	db D_LEFT,$02
	db $FF

RocketHideout2ArrowMovement28: ; 44f93 (11:4f93)
	db D_UP,$02
	db D_RIGHT,$04
	db D_UP,$02
	db D_LEFT,$03
	db $FF

RocketHideout2ArrowMovement29: ; 44f9c (11:4f9c)
	db D_DOWN,$02
	db D_LEFT,$04
	db $FF

RocketHideout2ArrowMovement30: ; 44fa1 (11:4fa1)
	db D_LEFT,$06
	db D_UP,$04
	db D_LEFT,$05
	db $FF

RocketHideout2ArrowMovement31: ; 44fa8 (11:4fa8)
	db D_UP,$02
	db $FF

RocketHideout2ArrowMovement32: ; 44fab (11:4fab)
	db D_UP,$01
	db $FF

RocketHideout2ArrowMovement33: ; 44fae (11:4fae)
	db D_UP,$03
	db $FF

RocketHideout2ArrowMovement34: ; 44fb1 (11:4fb1)
	db D_UP,$05
	db $FF

RocketHideout2ArrowMovement35: ; 44fb4 (11:4fb4)
	db D_RIGHT,$01
	db D_DOWN,$02
	db D_LEFT,$04
	db $FF

RocketHideout2ArrowMovement36: ; 44fbb (11:4fbb)
	db D_LEFT,$0A
	db D_UP,$02
	db D_LEFT,$05
	db $FF

RocketHideout2Script3: ; 44fc2 (11:4fc2)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	jr nz, LoadSpinnerArrowTiles
	xor a
	ld [wJoyIgnore], a
	ld hl, wd736
	res 7, [hl]
	ld a, $0
	ld [wCurMapScript], a
	ret

LoadSpinnerArrowTiles: ; 44fd7 (11:4fd7)
	ld a, [wSpriteStateData1 + 2]
	srl a
	srl a
	ld hl, SpinnerPlayerFacingDirections
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [wSpriteStateData1 + 2], a
	ld a, [wCurMapTileset]
	cp FACILITY
	ld hl, FacilitySpinnerArrows
	jr z, .asm_44ff6
	ld hl, GymSpinnerArrows
.asm_44ff6
	ld a, [wSimulatedJoypadStatesIndex]
	bit 0, a
	jr nz, .asm_45001
	ld de, $18
	add hl, de
.asm_45001
	ld a, $4
	ld bc, $0
.asm_45006
	push af
	push hl
	push bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyVideoData
	pop bc
	ld a, $6
	add c
	ld c, a
	pop hl
	pop af
	dec a
	jr nz, .asm_45006
	ret

spinner: MACRO
; \1: source
; \2: offset (BANK() chokes on literals)
; \3: length
; \4: dest
	dw \1 + \2
	db \3, BANK(\1)
	dw \4
ENDM

FacilitySpinnerArrows:
FACILITY_SPINNER EQU $20 * $10
vFacilitySpinner EQU vTileset + FACILITY_SPINNER

	spinner SpinnerArrowAnimTiles, $00, 1, vFacilitySpinner
	spinner SpinnerArrowAnimTiles, $10, 1, vFacilitySpinner + $10
	spinner SpinnerArrowAnimTiles, $20, 1, vFacilitySpinner + $100
	spinner SpinnerArrowAnimTiles, $30, 1, vFacilitySpinner + $110
	spinner Facility_GFX, FACILITY_SPINNER + $000, 1, vFacilitySpinner
	spinner Facility_GFX, FACILITY_SPINNER + $010, 1, vFacilitySpinner + $10
	spinner Facility_GFX, FACILITY_SPINNER + $100, 1, vFacilitySpinner + $100
	spinner Facility_GFX, FACILITY_SPINNER + $110, 1, vFacilitySpinner + $110

GymSpinnerArrows:
GYM_SPINNER EQU $3c * $10
vGymSpinner EQU vTileset + GYM_SPINNER

	spinner SpinnerArrowAnimTiles, $10, 1, vGymSpinner
	spinner SpinnerArrowAnimTiles, $30, 1, vGymSpinner + $10
	spinner SpinnerArrowAnimTiles, $00, 1, vGymSpinner + $100
	spinner SpinnerArrowAnimTiles, $20, 1, vGymSpinner + $110
	spinner Gym_GFX, GYM_SPINNER + $000, 1, vGymSpinner
	spinner Gym_GFX, GYM_SPINNER + $010, 1, vGymSpinner + $10
	spinner Gym_GFX, GYM_SPINNER + $100, 1, vGymSpinner + $100
	spinner Gym_GFX, GYM_SPINNER + $110, 1, vGymSpinner + $110

SpinnerPlayerFacingDirections: ; 45083 (11:5083)
; This isn't the order of the facing directions.  Rather, it's a list of
; the facing directions that come next. For example, when the player is
; facing down (00), the next facing direction is left (08).
	db $08 ; down -> left
	db $0C ; up -> right
	db $04 ; left -> up
	db $00 ; right -> down

; these tiles are the animation for the tiles that push the player in dungeons like Rocket HQ
SpinnerArrowAnimTiles: ; 45087 (11:5087)
	INCBIN "gfx/spinner_arrow.2bpp"

RocketHideout2TextPointers: ; 450c7 (11:50c7)
	dw RocketHideout2Text1
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText

RocketHideout2TrainerHeaders: ; 450d1 (11:50d1)
RocketHideout2TrainerHeader0: ; 450d1 (11:50d1)
	dbEventFlagBit EVENT_BEAT_ROCKET_HIDEOUT_2_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCKET_HIDEOUT_2_TRAINER_0
	dw RocketHideout2BattleText2 ; TextBeforeBattle
	dw RocketHideout2AfterBattleTxt2 ; TextAfterBattle
	dw RocketHideout2EndBattleText2 ; TextEndBattle
	dw RocketHideout2EndBattleText2 ; TextEndBattle

	db $ff

RocketHideout2Text1: ; 450de (11:50de)
	TX_ASM
	ld hl, RocketHideout2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout2BattleText2: ; 450e8 (11:50e8)
	TX_FAR _RocketHideout2BattleText2
	db "@"

RocketHideout2EndBattleText2: ; 450ed (11:50ed)
	TX_FAR _RocketHideout2EndBattleText2
	db "@"

RocketHideout2AfterBattleTxt2: ; 450f2 (11:50f2)
	TX_FAR _RocketHideout2AfterBattleTxt2
	db "@"
