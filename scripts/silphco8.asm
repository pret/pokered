SilphCo8Script: ; 56504 (15:6504)
	call SilphCo8Script_5651a
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo8TrainerHeader0
	ld de, SilphCo8ScriptPointers
	ld a, [W_SILPHCO8CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_SILPHCO8CURSCRIPT], a
	ret

SilphCo8Script_5651a: ; 5651a (15:651a)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo8GateCoords
	call SilphCo8Script_56541
	call SilphCo8Script_5656d
	CheckEvent EVENT_SILPH_CO_8_UNLOCKED_DOOR
	ret nz
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 4, 3
	predef_jump ReplaceTileBlock

SilphCo8GateCoords: ; 5653e (15:653e)
	db $04,$03
	db $FF

SilphCo8Script_56541: ; 56541 (15:6541)
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ld [$ffe0], a
	pop hl
.asm_5654d
	ld a, [hli]
	cp $ff
	jr z, .asm_56569
	push hl
	ld hl, $ffe0
	inc [hl]
	pop hl
	cp b
	jr z, .asm_5655e
	inc hl
	jr .asm_5654d
.asm_5655e
	ld a, [hli]
	cp c
	jr nz, .asm_5654d
	ld hl, wCardKeyDoorY
	xor a
	ld [hli], a
	ld [hl], a
	ret
.asm_56569
	xor a
	ld [$ffe0], a
	ret

SilphCo8Script_5656d: ; 5656d (15:656d)
	ld a, [$ffe0]
	and a
	ret z
	SetEvent EVENT_SILPH_CO_8_UNLOCKED_DOOR
	ret

SilphCo8ScriptPointers: ; 56577 (15:6577)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo8TextPointers: ; 5657d (15:657d)
	dw SilphCo8Text1
	dw SilphCo8Text2
	dw SilphCo8Text3
	dw SilphCo8Text4

SilphCo8TrainerHeaders: ; 56585 (15:6585)
SilphCo8TrainerHeader0: ; 56585 (15:6585)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_8F_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_8F_TRAINER_0
	dw SilphCo8BattleText1 ; TextBeforeBattle
	dw SilphCo8AfterBattleText1 ; TextAfterBattle
	dw SilphCo8EndBattleText1 ; TextEndBattle
	dw SilphCo8EndBattleText1 ; TextEndBattle

SilphCo8TrainerHeader1: ; 56591 (15:6591)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_8F_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_8F_TRAINER_1
	dw SilphCo8BattleText2 ; TextBeforeBattle
	dw SilphCo8AfterBattleText2 ; TextAfterBattle
	dw SilphCo8EndBattleText2 ; TextEndBattle
	dw SilphCo8EndBattleText2 ; TextEndBattle

SilphCo8TrainerHeader2: ; 5659d (15:659d)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_8F_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_8F_TRAINER_2
	dw SilphCo8BattleText3 ; TextBeforeBattle
	dw SilphCo8AfterBattleText3 ; TextAfterBattle
	dw SilphCo8EndBattleText3 ; TextEndBattle
	dw SilphCo8EndBattleText3 ; TextEndBattle

	db $ff

SilphCo8Text1: ; 565aa (15:65aa)
	TX_ASM
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, SilphCo8Text_565c3
	jr nz, .asm_565b8
	ld hl, SilphCo8Text_565be
.asm_565b8
	call PrintText
	jp TextScriptEnd

SilphCo8Text_565be: ; 565be (15:65be)
	TX_FAR _SilphCo8Text_565be
	db "@"

SilphCo8Text_565c3: ; 565c3 (15:65c3)
	TX_FAR _SilphCo8Text_565c3
	db "@"

SilphCo8Text2: ; 565c8 (15:65c8)
	TX_ASM
	ld hl, SilphCo8TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo8Text3: ; 565d2 (15:65d2)
	TX_ASM
	ld hl, SilphCo8TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo8Text4: ; 565dc (15:65dc)
	TX_ASM
	ld hl, SilphCo8TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo8BattleText1: ; 565e6 (15:65e6)
	TX_FAR _SilphCo8BattleText1
	db "@"

SilphCo8EndBattleText1: ; 565eb (15:65eb)
	TX_FAR _SilphCo8EndBattleText1
	db "@"

SilphCo8AfterBattleText1: ; 565f0 (15:65f0)
	TX_FAR _SilphCo8AfterBattleText1
	db "@"

SilphCo8BattleText2: ; 565f5 (15:65f5)
	TX_FAR _SilphCo8BattleText2
	db "@"

SilphCo8EndBattleText2: ; 565fa (15:65fa)
	TX_FAR _SilphCo8EndBattleText2
	db "@"

SilphCo8AfterBattleText2: ; 565ff (15:65ff)
	TX_FAR _SilphCo8AfterBattleText2
	db "@"

SilphCo8BattleText3: ; 56604 (15:6604)
	TX_FAR _SilphCo8BattleText3
	db "@"

SilphCo8EndBattleText3: ; 56609 (15:6609)
	TX_FAR _SilphCo8EndBattleText3
	db "@"

SilphCo8AfterBattleText3: ; 5660e (15:660e)
	TX_FAR _SilphCo8AfterBattleText3
	db "@"
