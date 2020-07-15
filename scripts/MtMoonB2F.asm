MtMoonB2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, MtMoon3TrainerHeader0
	ld de, MtMoonB2F_ScriptPointers
	ld a, [wMtMoonB2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wMtMoonB2FCurScript], a
	CheckEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	ret z
	ld hl, CoordsData_49d37
	call ArePlayerCoordsInArray
	jr nc, .asm_49d31
	ld hl, wd72e
	set 4, [hl]
	ret
.asm_49d31
	ld hl, wd72e
	res 4, [hl]
	ret

CoordsData_49d37:
	db $05,$0B
	db $05,$0C
	db $05,$0D
	db $05,$0E
	db $06,$0B
	db $06,$0C
	db $06,$0D
	db $06,$0E
	db $07,$0B
	db $07,$0C
	db $07,$0D
	db $07,$0E
	db $08,$0B
	db $08,$0C
	db $08,$0D
	db $08,$0E
	db $FF

MtMoon3Script_49d58:
	xor a
	ld [wJoyIgnore], a
	ld [wMtMoonB2FCurScript], a
	ld [wCurMapScript], a
	ret

MtMoonB2F_ScriptPointers:
	dw MtMoon3Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw MtMoon3Script3
	dw MtMoon3Script4
	dw MtMoon3Script5

MtMoon3Script0:
	CheckEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	jp nz, MtMoon3Script_49d91
	ld a, [wYCoord]
	cp $8
	jp nz, MtMoon3Script_49d91
	ld a, [wXCoord]
	cp $d
	jp nz, MtMoon3Script_49d91
	xor a
	ldh [hJoyHeld], a
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID

MtMoon3Script_49d91:
	CheckEitherEventSet EVENT_GOT_DOME_FOSSIL, EVENT_GOT_HELIX_FOSSIL
	jp z, CheckFightingMapTrainers
	ret

MtMoon3Script3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, MtMoon3Script_49d58
	call UpdateSprites
	call Delay3
	SetEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [wMtMoonB2FCurScript], a
	ld [wCurMapScript], a
	ret

MtMoon3Script4:
	ld a, $1
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld hl, CoordsData_49dea
	call ArePlayerCoordsInArray
	jr c, .asm_49dd7
	ld hl, CoordsData_49df1
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	ld de, MovementData_49df9
	jr .asm_49dda
.asm_49dd7
	ld de, MovementData_49df8
.asm_49dda
	ld a, $1
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, $5
	ld [wMtMoonB2FCurScript], a
	ld [wCurMapScript], a
	ret

CoordsData_49dea:
	db $07,$0C
	db $06,$0B
	db $05,$0C
	db $FF

CoordsData_49df1:
	db $07,$0D
	db $06,$0E
	db $05,$0E
	db $FF

MovementData_49df8:
	db NPC_MOVEMENT_RIGHT

MovementData_49df9:
	db NPC_MOVEMENT_UP,$FF

MtMoon3Script5:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, $a
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr z, .asm_49e1d
	ld a, HS_MT_MOON_B2F_FOSSIL_2
	jr .asm_49e1f
.asm_49e1d
	ld a, HS_MT_MOON_B2F_FOSSIL_1
.asm_49e1f
	ld [wMissableObjectIndex], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [wMtMoonB2FCurScript], a
	ld [wCurMapScript], a
	ret

MtMoonB2F_TextPointers:
	dw MtMoon3Text1
	dw MtMoon3Text2
	dw MtMoon3Text3
	dw MtMoon3Text4
	dw MtMoon3Text5
	dw MtMoon3Text6
	dw MtMoon3Text7
	dw PickUpItemText
	dw PickUpItemText
	dw MtMoon3Text_49f99

MtMoon3TrainerHeader0:
	trainer EVENT_BEAT_MT_MOON_3_TRAINER_0, 4, MtMoon3BattleText2, MtMoon3EndBattleText2, MtMoon3AfterBattleText2
MtMoon3TrainerHeader1:
	trainer EVENT_BEAT_MT_MOON_3_TRAINER_1, 4, MtMoon3BattleText3, MtMoon3EndBattleText3, MtMoon3AfterBattleText3
MtMoon3TrainerHeader2:
	trainer EVENT_BEAT_MT_MOON_3_TRAINER_2, 4, MtMoon3BattleText4, MtMoon3EndBattleText4, MtMoon3AfterBattleText4
MtMoon3TrainerHeader3:
	trainer EVENT_BEAT_MT_MOON_3_TRAINER_3, 4, MtMoon3BattleText5, MtMoon3EndBattleText5, MtMoon3AfterBattleText5
	db -1 ; end

MtMoon3Text1:
	text_asm
	CheckEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	jr z, .asm_49e8d
	and $c0
	jr nz, .asm_49eb8
	ld hl, MtMoon3Text_49f8f
	call PrintText
	jr .asm_49ebe
.asm_49e8d
	ld hl, MtMoon3Text_49f85
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, MtMoon3Text_49f8a
	ld de, MtMoon3Text_49f8a
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $3
	ld [wMtMoonB2FCurScript], a
	ld [wCurMapScript], a
	jr .asm_49ebe
.asm_49eb8
	ld hl, MtMoon3Text_49f94
	call PrintText
.asm_49ebe
	jp TextScriptEnd

MtMoon3Text2:
	text_asm
	ld hl, MtMoon3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

MtMoon3Text3:
	text_asm
	ld hl, MtMoon3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

MtMoon3Text4:
	text_asm
	ld hl, MtMoon3TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

MtMoon3Text5:
	text_asm
	ld hl, MtMoon3TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

MtMoon3Text6:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, MtMoon3Text_49f24
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_49f21
	lb bc, DOME_FOSSIL, 1
	call GiveItem
	jp nc, MtMoon3Script_49f76
	call MtMoon3Script_49f69
	ld a, HS_MT_MOON_B2F_FOSSIL_1
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvent EVENT_GOT_DOME_FOSSIL
	ld a, $4
	ld [wMtMoonB2FCurScript], a
	ld [wCurMapScript], a
.asm_49f21
	jp TextScriptEnd

MtMoon3Text_49f24:
	text_far _MtMoon3Text_49f24
	text_end

MtMoon3Text7:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, MtMoon3Text_49f64
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_49f61
	lb bc, HELIX_FOSSIL, 1
	call GiveItem
	jp nc, MtMoon3Script_49f76
	call MtMoon3Script_49f69
	ld a, HS_MT_MOON_B2F_FOSSIL_2
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvent EVENT_GOT_HELIX_FOSSIL
	ld a, $4
	ld [wMtMoonB2FCurScript], a
	ld [wCurMapScript], a
.asm_49f61
	jp TextScriptEnd

MtMoon3Text_49f64:
	text_far _MtMoon3Text_49f64
	text_end

MtMoon3Script_49f69:
	ld hl, MtMoon3Text_49f6f
	jp PrintText

MtMoon3Text_49f6f:
	text_far _MtMoon3Text_49f6f
	sound_get_key_item
	text_waitbutton
	text_end

MtMoon3Script_49f76:
	ld hl, MtMoon3Text_49f7f
	call PrintText
	jp TextScriptEnd

MtMoon3Text_49f7f:
	text_far _MtMoon3Text_49f7f
	text_waitbutton
	text_end

MtMoon3Text_49f85:
	text_far _MtMoon3Text_49f85
	text_end

MtMoon3Text_49f8a:
	text_far _MtMoon3Text_49f8a
	text_end

MtMoon3Text_49f8f:
	text_far _MtMoon3Text_49f8f
	text_end

MtMoon3Text_49f94:
	text_far _MtMoon3Text_49f94
	text_end

MtMoon3Text_49f99:
	text_far _MtMoon3Text_49f99
	sound_get_key_item
	text_end

MtMoon3BattleText2:
	text_far _MtMoon3BattleText2
	text_end

MtMoon3EndBattleText2:
	text_far _MtMoon3EndBattleText2
	text_end

MtMoon3AfterBattleText2:
	text_far _MtMoon3AfterBattleText2
	text_end

MtMoon3BattleText3:
	text_far _MtMoon3BattleText3
	text_end

MtMoon3EndBattleText3:
	text_far _MtMoon3EndBattleText3
	text_end

MtMoon3AfterBattleText3:
	text_far _MtMoon3AfterBattleText3
	text_end

MtMoon3BattleText4:
	text_far _MtMoon3BattleText4
	text_end

MtMoon3EndBattleText4:
	text_far _MtMoon3EndBattleText4
	text_end

MtMoon3AfterBattleText4:
	text_far _MtMoon3AfterBattleText4
	text_end

MtMoon3BattleText5:
	text_far _MtMoon3BattleText5
	text_end

MtMoon3EndBattleText5:
	text_far _MtMoon3EndBattleText5
	text_end

MtMoon3AfterBattleText5:
	text_far _MtMoon3AfterBattleText5
	text_end
