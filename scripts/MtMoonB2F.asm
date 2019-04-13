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
	ld [hJoyHeld], a
	ld a, $1
	ld [hSpriteIndexOrTextID], a
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
	ld [H_SPRITEINDEX], a
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
	ld [H_SPRITEINDEX], a
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
	ld [hSpriteIndexOrTextID], a
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
	dbEventFlagBit EVENT_BEAT_MT_MOON_3_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MT_MOON_3_TRAINER_0
	dw MtMoon3BattleText2 ; TextBeforeBattle
	dw MtMoon3AfterBattleText2 ; TextAfterBattle
	dw MtMoon3EndBattleText2 ; TextEndBattle
	dw MtMoon3EndBattleText2 ; TextEndBattle

MtMoon3TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_MT_MOON_3_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MT_MOON_3_TRAINER_1
	dw MtMoon3BattleText3 ; TextBeforeBattle
	dw MtMoon3AfterBattleText3 ; TextAfterBattle
	dw MtMoon3EndBattleText3 ; TextEndBattle
	dw MtMoon3EndBattleText3 ; TextEndBattle

MtMoon3TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_MT_MOON_3_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MT_MOON_3_TRAINER_2
	dw MtMoon3BattleText4 ; TextBeforeBattle
	dw MtMoon3AfterBattleText4 ; TextAfterBattle
	dw MtMoon3EndBattleText4 ; TextEndBattle
	dw MtMoon3EndBattleText4 ; TextEndBattle

MtMoon3TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_MT_MOON_3_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MT_MOON_3_TRAINER_3
	dw MtMoon3BattleText5 ; TextBeforeBattle
	dw MtMoon3AfterBattleText5 ; TextAfterBattle
	dw MtMoon3EndBattleText5 ; TextEndBattle
	dw MtMoon3EndBattleText5 ; TextEndBattle

	db $ff

MtMoon3Text1:
	TX_ASM
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
	ld a, [H_SPRITEINDEX]
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
	TX_ASM
	ld hl, MtMoon3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

MtMoon3Text3:
	TX_ASM
	ld hl, MtMoon3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

MtMoon3Text4:
	TX_ASM
	ld hl, MtMoon3TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

MtMoon3Text5:
	TX_ASM
	ld hl, MtMoon3TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

MtMoon3Text6:
	TX_ASM
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
	TX_FAR _MtMoon3Text_49f24
	db "@"

MtMoon3Text7:
	TX_ASM
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
	TX_FAR _MtMoon3Text_49f64
	db "@"

MtMoon3Script_49f69:
	ld hl, MtMoon3Text_49f6f
	jp PrintText

MtMoon3Text_49f6f:
	TX_FAR _MtMoon3Text_49f6f
	TX_SFX_KEY_ITEM
	TX_WAIT
	db "@"

MtMoon3Script_49f76:
	ld hl, MtMoon3Text_49f7f
	call PrintText
	jp TextScriptEnd

MtMoon3Text_49f7f:
	TX_FAR _MtMoon3Text_49f7f
	TX_WAIT
	db "@"

MtMoon3Text_49f85:
	TX_FAR _MtMoon3Text_49f85
	db "@"

MtMoon3Text_49f8a:
	TX_FAR _MtMoon3Text_49f8a
	db "@"

MtMoon3Text_49f8f:
	TX_FAR _MtMoon3Text_49f8f
	db "@"

MtMoon3Text_49f94:
	TX_FAR _MtMoon3Text_49f94
	db "@"

MtMoon3Text_49f99:
	TX_FAR _MtMoon3Text_49f99
	TX_SFX_KEY_ITEM
	db "@"

MtMoon3BattleText2:
	TX_FAR _MtMoon3BattleText2
	db "@"

MtMoon3EndBattleText2:
	TX_FAR _MtMoon3EndBattleText2
	db "@"

MtMoon3AfterBattleText2:
	TX_FAR _MtMoon3AfterBattleText2
	db "@"

MtMoon3BattleText3:
	TX_FAR _MtMoon3BattleText3
	db "@"

MtMoon3EndBattleText3:
	TX_FAR _MtMoon3EndBattleText3
	db "@"

MtMoon3AfterBattleText3:
	TX_FAR _MtMoon3AfterBattleText3
	db "@"

MtMoon3BattleText4:
	TX_FAR _MtMoon3BattleText4
	db "@"

MtMoon3EndBattleText4:
	TX_FAR _MtMoon3EndBattleText4
	db "@"

MtMoon3AfterBattleText4:
	TX_FAR _MtMoon3AfterBattleText4
	db "@"

MtMoon3BattleText5:
	TX_FAR _MtMoon3BattleText5
	db "@"

MtMoon3EndBattleText5:
	TX_FAR _MtMoon3EndBattleText5
	db "@"

MtMoon3AfterBattleText5:
	TX_FAR _MtMoon3AfterBattleText5
	db "@"
