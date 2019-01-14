SilphCo8F_Script:
	call SilphCo8Script_5651a
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo8TrainerHeader0
	ld de, SilphCo8F_ScriptPointers
	ld a, [wSilphCo8FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo8FCurScript], a
	ret

SilphCo8Script_5651a:
	ld hl, wCurrentMapScriptFlags
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

SilphCo8GateCoords:
	db $04,$03
	db $FF

SilphCo8Script_56541:
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

SilphCo8Script_5656d:
	ld a, [$ffe0]
	and a
	ret z
	SetEvent EVENT_SILPH_CO_8_UNLOCKED_DOOR
	ret

SilphCo8F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo8F_TextPointers:
	dw SilphCo8Text1
	dw SilphCo8Text2
	dw SilphCo8Text3
	dw SilphCo8Text4

SilphCo8TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_8F_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_8F_TRAINER_0
	dw SilphCo8BattleText1 ; TextBeforeBattle
	dw SilphCo8AfterBattleText1 ; TextAfterBattle
	dw SilphCo8EndBattleText1 ; TextEndBattle
	dw SilphCo8EndBattleText1 ; TextEndBattle

SilphCo8TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_8F_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_8F_TRAINER_1
	dw SilphCo8BattleText2 ; TextBeforeBattle
	dw SilphCo8AfterBattleText2 ; TextAfterBattle
	dw SilphCo8EndBattleText2 ; TextEndBattle
	dw SilphCo8EndBattleText2 ; TextEndBattle

SilphCo8TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_8F_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_8F_TRAINER_2
	dw SilphCo8BattleText3 ; TextBeforeBattle
	dw SilphCo8AfterBattleText3 ; TextAfterBattle
	dw SilphCo8EndBattleText3 ; TextEndBattle
	dw SilphCo8EndBattleText3 ; TextEndBattle

	db $ff

SilphCo8Text1:
	TX_ASM
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, SilphCo8Text_565c3
	jr nz, .asm_565b8
	ld hl, SilphCo8Text_565be
.asm_565b8
	call PrintText
	jp TextScriptEnd

SilphCo8Text_565be:
	TX_FAR _SilphCo8Text_565be
	db "@"

SilphCo8Text_565c3:
	TX_FAR _SilphCo8Text_565c3
	db "@"

SilphCo8Text2:
	TX_ASM
	ld hl, SilphCo8TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo8Text3:
	TX_ASM
	ld hl, SilphCo8TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo8Text4:
	TX_ASM
	ld hl, SilphCo8TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo8BattleText1:
	TX_FAR _SilphCo8BattleText1
	db "@"

SilphCo8EndBattleText1:
	TX_FAR _SilphCo8EndBattleText1
	db "@"

SilphCo8AfterBattleText1:
	TX_FAR _SilphCo8AfterBattleText1
	db "@"

SilphCo8BattleText2:
	TX_FAR _SilphCo8BattleText2
	db "@"

SilphCo8EndBattleText2:
	TX_FAR _SilphCo8EndBattleText2
	db "@"

SilphCo8AfterBattleText2:
	TX_FAR _SilphCo8AfterBattleText2
	db "@"

SilphCo8BattleText3:
	TX_FAR _SilphCo8BattleText3
	db "@"

SilphCo8EndBattleText3:
	TX_FAR _SilphCo8EndBattleText3
	db "@"

SilphCo8AfterBattleText3:
	TX_FAR _SilphCo8AfterBattleText3
	db "@"
