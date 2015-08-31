MtMoon3Script: ; 49d0b (12:5d0b)
	call EnableAutoTextBoxDrawing
	ld hl, MtMoon3TrainerHeader0
	ld de, MtMoon3ScriptPointers
	ld a, [wMtMoon3CurScript]
	call ExecuteCurMapScriptInTable
	ld [wMtMoon3CurScript], a
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

CoordsData_49d37: ; 49d37 (12:5d37)
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

MtMoon3Script_49d58: ; 49d58 (12:5d58)
	xor a
	ld [wJoyIgnore], a
	ld [wMtMoon3CurScript], a
	ld [wCurMapScript], a
	ret

MtMoon3ScriptPointers: ; 49d63 (12:5d63)
	dw MtMoon3Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw MtMoon3Script3
	dw MtMoon3Script4
	dw MtMoon3Script5

MtMoon3Script0: ; 49d6f (12:5d6f)
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

MtMoon3Script_49d91: ; 49d91 (12:5d91)
	CheckEitherEventSet EVENT_GOT_DOME_FOSSIL, EVENT_GOT_HELIX_FOSSIL
	jp z, CheckFightingMapTrainers
	ret

MtMoon3Script3: ; 49d9a (12:5d9a)
	ld a, [wIsInBattle]
	cp $ff
	jp z, MtMoon3Script_49d58
	call UpdateSprites
	call Delay3
	SetEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [wMtMoon3CurScript], a
	ld [wCurMapScript], a
	ret

MtMoon3Script4: ; 49dba (12:5dba)
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
	ld [wMtMoon3CurScript], a
	ld [wCurMapScript], a
	ret

CoordsData_49dea: ; 49dea (12:5dea)
	db $07,$0C
	db $06,$0B
	db $05,$0C
	db $FF

CoordsData_49df1: ; 49df1 (12:5df1)
	db $07,$0D
	db $06,$0E
	db $05,$0E
	db $FF

MovementData_49df8: ; 49df8 (12:5df8)
	db NPC_MOVEMENT_RIGHT

MovementData_49df9: ; 49df9 (12:5df9)
	db NPC_MOVEMENT_UP,$FF

MtMoon3Script5: ; 49dfb (12:5dfb)
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
	ld a, HS_MT_MOON_3_FOSSIL_2
	jr .asm_49e1f
.asm_49e1d
	ld a, HS_MT_MOON_3_FOSSIL_1
.asm_49e1f
	ld [wMissableObjectIndex], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [wMtMoon3CurScript], a
	ld [wCurMapScript], a
	ret

MtMoon3TextPointers: ; 49e34 (12:5e34)
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

MtMoon3TrainerHeaders: ; 49e48 (12:5e48)
MtMoon3TrainerHeader0: ; 49e48 (12:5e48)
	dbEventFlagBit EVENT_BEAT_MT_MOON_3_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MT_MOON_3_TRAINER_0
	dw MtMoon3BattleText2 ; TextBeforeBattle
	dw MtMoon3AfterBattleText2 ; TextAfterBattle
	dw MtMoon3EndBattleText2 ; TextEndBattle
	dw MtMoon3EndBattleText2 ; TextEndBattle

MtMoon3TrainerHeader2: ; 49e54 (12:5e54)
	dbEventFlagBit EVENT_BEAT_MT_MOON_3_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MT_MOON_3_TRAINER_2
	dw MtMoon3BattleText3 ; TextBeforeBattle
	dw MtMoon3AfterBattleText3 ; TextAfterBattle
	dw MtMoon3EndBattleText3 ; TextEndBattle
	dw MtMoon3EndBattleText3 ; TextEndBattle

MtMoon3TrainerHeader3: ; 49e60 (12:5e60)
	dbEventFlagBit EVENT_BEAT_MT_MOON_3_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MT_MOON_3_TRAINER_3
	dw MtMoon3BattleText4 ; TextBeforeBattle
	dw MtMoon3AfterBattleText4 ; TextAfterBattle
	dw MtMoon3EndBattleText4 ; TextEndBattle
	dw MtMoon3EndBattleText4 ; TextEndBattle

MtMoon3TrainerHeader4: ; 49e6c (12:5e6c)
	dbEventFlagBit EVENT_BEAT_MT_MOON_3_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MT_MOON_3_TRAINER_4
	dw MtMoon3BattleText5 ; TextBeforeBattle
	dw MtMoon3AfterBattleText5 ; TextAfterBattle
	dw MtMoon3EndBattleText5 ; TextEndBattle
	dw MtMoon3EndBattleText5 ; TextEndBattle

	db $ff

MtMoon3Text1: ; 49e79 (12:5e79)
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
	ld [wMtMoon3CurScript], a
	ld [wCurMapScript], a
	jr .asm_49ebe
.asm_49eb8
	ld hl, MtMoon3Text_49f94
	call PrintText
.asm_49ebe
	jp TextScriptEnd

MtMoon3Text2: ; 49ec1 (12:5ec1)
	TX_ASM
	ld hl, MtMoon3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

MtMoon3Text3: ; 49ecb (12:5ecb)
	TX_ASM
	ld hl, MtMoon3TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

MtMoon3Text4: ; 49ed5 (12:5ed5)
	TX_ASM
	ld hl, MtMoon3TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

MtMoon3Text5: ; 49edf (12:5edf)
	TX_ASM
	ld hl, MtMoon3TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

MtMoon3Text6: ; 49ee9 (12:5ee9)
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
	ld a, HS_MT_MOON_3_FOSSIL_1
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvent EVENT_GOT_DOME_FOSSIL
	ld a, $4
	ld [wMtMoon3CurScript], a
	ld [wCurMapScript], a
.asm_49f21
	jp TextScriptEnd

MtMoon3Text_49f24: ; 49f24 (12:5f24)
	TX_FAR _MtMoon3Text_49f24
	db "@"

MtMoon3Text7: ; 49f29 (12:5f29)
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
	ld a, HS_MT_MOON_3_FOSSIL_2
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvent EVENT_GOT_HELIX_FOSSIL
	ld a, $4
	ld [wMtMoon3CurScript], a
	ld [wCurMapScript], a
.asm_49f61
	jp TextScriptEnd

MtMoon3Text_49f64: ; 49f64 (12:5f64)
	TX_FAR _MtMoon3Text_49f64
	db "@"

MtMoon3Script_49f69: ; 49f69 (12:5f69)
	ld hl, MtMoon3Text_49f6f
	jp PrintText

MtMoon3Text_49f6f: ; 49f6f (12:5f6f)
	TX_FAR _MtMoon3Text_49f6f
	db $11, $d, "@"

MtMoon3Script_49f76: ; 49f76 (12:5f76)
	ld hl, MtMoon3Text_49f7f
	call PrintText
	jp TextScriptEnd

MtMoon3Text_49f7f: ; 49f7f (12:5f7f)
	TX_FAR _MtMoon3Text_49f7f
	db $d, "@"

MtMoon3Text_49f85: ; 49f85 (12:5f85)
	TX_FAR _MtMoon3Text_49f85
	db "@"

MtMoon3Text_49f8a: ; 49f8a (12:5f8a)
	TX_FAR _MtMoon3Text_49f8a
	db "@"

MtMoon3Text_49f8f: ; 49f8f (12:5f8f)
	TX_FAR _MtMoon3Text_49f8f
	db "@"

MtMoon3Text_49f94: ; 49f94 (12:5f94)
	TX_FAR _MtMoon3Text_49f94
	db "@"

MtMoon3Text_49f99: ; 49f99 (12:5f99)
	TX_FAR _MtMoon3Text_49f99
	db $11, "@"

MtMoon3BattleText2: ; 49f9f (12:5f9f)
	TX_FAR _MtMoon3BattleText2
	db "@"

MtMoon3EndBattleText2: ; 49fa4 (12:5fa4)
	TX_FAR _MtMoon3EndBattleText2
	db "@"

MtMoon3AfterBattleText2: ; 49fa9 (12:5fa9)
	TX_FAR _MtMoon3AfterBattleText2
	db "@"

MtMoon3BattleText3: ; 49fae (12:5fae)
	TX_FAR _MtMoon3BattleText3
	db "@"

MtMoon3EndBattleText3: ; 49fb3 (12:5fb3)
	TX_FAR _MtMoon3EndBattleText3
	db "@"

MtMoon3AfterBattleText3: ; 49fb8 (12:5fb8)
	TX_FAR _MtMoon3AfterBattleText3
	db "@"

MtMoon3BattleText4: ; 49fbd (12:5fbd)
	TX_FAR _MtMoon3BattleText4
	db "@"

MtMoon3EndBattleText4: ; 49fc2 (12:5fc2)
	TX_FAR _MtMoon3EndBattleText4
	db "@"

MtMoon3AfterBattleText4: ; 49fc7 (12:5fc7)
	TX_FAR _MtMoon3AfterBattleText4
	db "@"

MtMoon3BattleText5: ; 49fcc (12:5fcc)
	TX_FAR _MtMoon3BattleText5
	db "@"

MtMoon3EndBattleText5: ; 49fd1 (12:5fd1)
	TX_FAR _MtMoon3EndBattleText5
	db "@"

MtMoon3AfterBattleText5: ; 49fd6 (12:5fd6)
	TX_FAR _MtMoon3AfterBattleText5
	db "@"
