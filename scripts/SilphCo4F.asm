SilphCo4F_Script:
	call SilphCo4Script_19d21
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo4TrainerHeaders
	ld de, SilphCo4F_ScriptPointers
	ld a, [wSilphCo4FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo4FCurScript], a
	ret

SilphCo4Script_19d21:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo4GateCoords
	call SilphCo4Script_19d5d
	call SilphCo4Script_19d89
	CheckEvent EVENT_SILPH_CO_4_UNLOCKED_DOOR1
	jr nz, .asm_19d48
	push af
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 6, 2
	predef ReplaceTileBlock
	pop af
.asm_19d48
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_4_UNLOCKED_DOOR2, EVENT_SILPH_CO_4_UNLOCKED_DOOR1
	ret nz
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 4, 6
	predef_jump ReplaceTileBlock

SilphCo4GateCoords:
	dbmapcoord  2,  6
	dbmapcoord  6,  4
	db -1 ; end

SilphCo4Script_19d5d:
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ldh [hUnlockedSilphCoDoors], a
	pop hl
.asm_19d69
	ld a, [hli]
	cp $ff
	jr z, .asm_19d85
	push hl
	ld hl, hUnlockedSilphCoDoors
	inc [hl]
	pop hl
	cp b
	jr z, .asm_19d7a
	inc hl
	jr .asm_19d69
.asm_19d7a
	ld a, [hli]
	cp c
	jr nz, .asm_19d69
	ld hl, wCardKeyDoorY
	xor a
	ld [hli], a
	ld [hl], a
	ret
.asm_19d85
	xor a
	ldh [hUnlockedSilphCoDoors], a
	ret

SilphCo4Script_19d89:
	EventFlagAddress hl, EVENT_SILPH_CO_4_UNLOCKED_DOOR1
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	cp $1
	jr nz, .next
	SetEventReuseHL EVENT_SILPH_CO_4_UNLOCKED_DOOR1
	ret
.next
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_4_UNLOCKED_DOOR2, EVENT_SILPH_CO_4_UNLOCKED_DOOR1
	ret

SilphCo4F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo4F_TextPointers:
	dw SilphCo4Text1
	dw SilphCo4Text2
	dw SilphCo4Text3
	dw SilphCo4Text4
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText

SilphCo4TrainerHeaders:
	def_trainers 2
SilphCo4TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_4F_TRAINER_0, 4, SilphCo4BattleText2, SilphCo4EndBattleText2, SilphCo4AfterBattleText2
SilphCo4TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_4F_TRAINER_1, 3, SilphCo4BattleText3, SilphCo4EndBattleText3, SilphCo4AfterBattleText3
SilphCo4TrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_4F_TRAINER_2, 4, SilphCo4BattleText4, SilphCo4EndBattleText4, SilphCo4AfterBattleText4
	db -1 ; end

SilphCo4Text1:
	text_asm
	ld hl, SilphCo4Text_19de0
	ld de, SilphCo4Text_19de5
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo4Text_19de0:
	text_far _SilphCo4Text_19de0
	text_end

SilphCo4Text_19de5:
	text_far _SilphCo4Text_19de5
	text_end

SilphCo4Text2:
	text_asm
	ld hl, SilphCo4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo4BattleText2:
	text_far _SilphCo4BattleText2
	text_end

SilphCo4EndBattleText2:
	text_far _SilphCo4EndBattleText2
	text_end

SilphCo4AfterBattleText2:
	text_far _SilphCo4AfterBattleText2
	text_end

SilphCo4Text3:
	text_asm
	ld hl, SilphCo4TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo4BattleText3:
	text_far _SilphCo4BattleText3
	text_end

SilphCo4EndBattleText3:
	text_far _SilphCo4EndBattleText3
	text_end

SilphCo4AfterBattleText3:
	text_far _SilphCo4AfterBattleText3
	text_end

SilphCo4Text4:
	text_asm
	ld hl, SilphCo4TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo4BattleText4:
	text_far _SilphCo4BattleText4
	text_end

SilphCo4EndBattleText4:
	text_far _SilphCo4EndBattleText4
	text_end

SilphCo4AfterBattleText4:
	text_far _SilphCo4AfterBattleText4
	text_end
