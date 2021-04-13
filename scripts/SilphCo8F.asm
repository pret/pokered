SilphCo8F_Script:
	call SilphCo8Script_5651a
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo8TrainerHeaders
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
	dbmapcoord  3,  4
	db -1 ; end

SilphCo8Script_56541:
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ldh [hUnlockedSilphCoDoors], a
	pop hl
.asm_5654d
	ld a, [hli]
	cp $ff
	jr z, .asm_56569
	push hl
	ld hl, hUnlockedSilphCoDoors
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
	ldh [hUnlockedSilphCoDoors], a
	ret

SilphCo8Script_5656d:
	ldh a, [hUnlockedSilphCoDoors]
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

SilphCo8TrainerHeaders:
	def_trainers 2
SilphCo8TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_8F_TRAINER_0, 4, SilphCo8BattleText1, SilphCo8EndBattleText1, SilphCo8AfterBattleText1
SilphCo8TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_8F_TRAINER_1, 4, SilphCo8BattleText2, SilphCo8EndBattleText2, SilphCo8AfterBattleText2
SilphCo8TrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_8F_TRAINER_2, 4, SilphCo8BattleText3, SilphCo8EndBattleText3, SilphCo8AfterBattleText3
	db -1 ; end

SilphCo8Text1:
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, SilphCo8Text_565c3
	jr nz, .asm_565b8
	ld hl, SilphCo8Text_565be
.asm_565b8
	call PrintText
	jp TextScriptEnd

SilphCo8Text_565be:
	text_far _SilphCo8Text_565be
	text_end

SilphCo8Text_565c3:
	text_far _SilphCo8Text_565c3
	text_end

SilphCo8Text2:
	text_asm
	ld hl, SilphCo8TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo8Text3:
	text_asm
	ld hl, SilphCo8TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo8Text4:
	text_asm
	ld hl, SilphCo8TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo8BattleText1:
	text_far _SilphCo8BattleText1
	text_end

SilphCo8EndBattleText1:
	text_far _SilphCo8EndBattleText1
	text_end

SilphCo8AfterBattleText1:
	text_far _SilphCo8AfterBattleText1
	text_end

SilphCo8BattleText2:
	text_far _SilphCo8BattleText2
	text_end

SilphCo8EndBattleText2:
	text_far _SilphCo8EndBattleText2
	text_end

SilphCo8AfterBattleText2:
	text_far _SilphCo8AfterBattleText2
	text_end

SilphCo8BattleText3:
	text_far _SilphCo8BattleText3
	text_end

SilphCo8EndBattleText3:
	text_far _SilphCo8EndBattleText3
	text_end

SilphCo8AfterBattleText3:
	text_far _SilphCo8AfterBattleText3
	text_end
