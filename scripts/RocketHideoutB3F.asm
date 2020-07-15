RocketHideoutB3F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideout3TrainerHeader0
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

;format:
;db y,x
;dw pointer to movement
RocketHideout3ArrowTilePlayerMovement:
	db $d,$a
	dw RocketHideout3ArrowMovement6
	db $13,$a
	dw RocketHideout3ArrowMovement1
	db $12,$b
	dw RocketHideout3ArrowMovement2
	db $b,$c
	dw RocketHideout3ArrowMovement3
	db $11,$c
	dw RocketHideout3ArrowMovement4
	db $14,$c
	dw RocketHideout3ArrowMovement5
	db $10,$d
	dw RocketHideout3ArrowMovement6
	db $b,$e
	dw RocketHideout3ArrowMovement7
	db $f,$e
	dw RocketHideout3ArrowMovement6
	db $11,$e
	dw RocketHideout3ArrowMovement8
	db $13,$e
	dw RocketHideout3ArrowMovement9
	db $10,$f
	dw RocketHideout3ArrowMovement7
	db $12,$f
	dw RocketHideout3ArrowMovement10
	db $d,$10
	dw RocketHideout3ArrowMovement11
	db $c,$11
	dw RocketHideout3ArrowMovement10
	db $10,$12
	dw RocketHideout3ArrowMovement12
	db $FF

;format: direction, count
;each list is read starting from the $FF and working backwards
RocketHideout3ArrowMovement1:
	db D_RIGHT,$04
	db D_UP,$04
	db D_RIGHT,$04
	db $FF

RocketHideout3ArrowMovement2:
	db D_DOWN,$04
	db D_RIGHT,$04
	db $FF

RocketHideout3ArrowMovement3:
	db D_LEFT,$02
	db $FF

RocketHideout3ArrowMovement4:
	db D_RIGHT,$04
	db D_UP,$02
	db D_RIGHT,$02
	db $FF

RocketHideout3ArrowMovement5:
	db D_RIGHT,$04
	db D_UP,$02
	db D_RIGHT,$02
	db D_UP,$03
	db $FF

RocketHideout3ArrowMovement6:
	db D_RIGHT,$04
	db $FF

RocketHideout3ArrowMovement7:
	db D_RIGHT,$02
	db $FF

RocketHideout3ArrowMovement8:
	db D_RIGHT,$04
	db D_UP,$02
	db $FF

RocketHideout3ArrowMovement9:
	db D_RIGHT,$04
	db D_UP,$04
	db $FF

RocketHideout3ArrowMovement10:
	db D_DOWN,$04
	db $FF

RocketHideout3ArrowMovement11:
	db D_UP,$02
	db $FF

RocketHideout3ArrowMovement12:
	db D_UP,$01
	db $FF

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
