SilphCo9F_Script:
	call SilphCo9Script_5d7d1
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo9TrainerHeaders
	ld de, SilphCo9F_ScriptPointers
	ld a, [wSilphCo9FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo9FCurScript], a
	ret

SilphCo9Script_5d7d1:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo9GateCoords
	call SilphCo9Script_5d837
	call SilphCo9Script_5d863
	CheckEvent EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	jr nz, .asm_5d7f8
	push af
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 4, 1
	predef ReplaceTileBlock
	pop af
.asm_5d7f8
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_9_UNLOCKED_DOOR2, EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	jr nz, .asm_5d80b
	push af
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 2, 9
	predef ReplaceTileBlock
	pop af
.asm_5d80b
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_9_UNLOCKED_DOOR3, EVENT_SILPH_CO_9_UNLOCKED_DOOR2
	jr nz, .asm_5d81e
	push af
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 5, 9
	predef ReplaceTileBlock
	pop af
.asm_5d81e
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_9_UNLOCKED_DOOR4, EVENT_SILPH_CO_9_UNLOCKED_DOOR3
	ret nz
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 6, 5
	predef_jump ReplaceTileBlock

SilphCo9GateCoords:
	dbmapcoord  1,  4
	dbmapcoord  9,  2
	dbmapcoord  9,  5
	dbmapcoord  5,  6
	db -1 ; end

SilphCo9Script_5d837:
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ldh [hUnlockedSilphCoDoors], a
	pop hl
.asm_5d843
	ld a, [hli]
	cp $ff
	jr z, .asm_5d85f
	push hl
	ld hl, hUnlockedSilphCoDoors
	inc [hl]
	pop hl
	cp b
	jr z, .asm_5d854
	inc hl
	jr .asm_5d843
.asm_5d854
	ld a, [hli]
	cp c
	jr nz, .asm_5d843
	ld hl, wCardKeyDoorY
	xor a
	ld [hli], a
	ld [hl], a
	ret
.asm_5d85f
	xor a
	ldh [hUnlockedSilphCoDoors], a
	ret

SilphCo9Script_5d863:
	EventFlagAddress hl, EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	cp $1
	jr nz, .next1
	SetEventReuseHL EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	ret
.next1
	cp $2
	jr nz, .next2
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_9_UNLOCKED_DOOR2, EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	ret
.next2
	cp $3
	jr nz, .next3
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_9_UNLOCKED_DOOR3, EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	ret
.next3
	cp $4
	ret nz
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_9_UNLOCKED_DOOR4, EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	ret

SilphCo9F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo9F_TextPointers:
	dw SilphCo9Text1
	dw SilphCo9Text2
	dw SilphCo9Text3
	dw SilphCo9Text4

SilphCo9TrainerHeaders:
	def_trainers 2
SilphCo9TrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_9F_TRAINER_0, 4, SilphCo9BattleText1, SilphCo9EndBattleText1, SilphCo9AfterBattleText1
SilphCo9TrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_9F_TRAINER_1, 2, SilphCo9BattleText2, SilphCo9EndBattleText2, SilphCo9AfterBattleText2
SilphCo9TrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_9F_TRAINER_2, 4, SilphCo9BattleText3, SilphCo9EndBattleText3, SilphCo9AfterBattleText3
	db -1 ; end

SilphCo9Text1:
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .asm_5d8dc
	ld hl, SilphCo9Text_5d8e5
	call PrintText
	predef HealParty
	call GBFadeOutToWhite
	call Delay3
	call GBFadeInFromWhite
	ld hl, SilphCo9Text_5d8ea
	call PrintText
	jr .asm_5d8e2
.asm_5d8dc
	ld hl, SilphCo9Text_5d8ef
	call PrintText
.asm_5d8e2
	jp TextScriptEnd

SilphCo9Text_5d8e5:
	text_far _SilphCo9Text_5d8e5
	text_end

SilphCo9Text_5d8ea:
	text_far _SilphCo9Text_5d8ea
	text_end

SilphCo9Text_5d8ef:
	text_far _SilphCo9Text_5d8ef
	text_end

SilphCo9Text2:
	text_asm
	ld hl, SilphCo9TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo9Text3:
	text_asm
	ld hl, SilphCo9TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo9Text4:
	text_asm
	ld hl, SilphCo9TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo9BattleText1:
	text_far _SilphCo9BattleText1
	text_end

SilphCo9EndBattleText1:
	text_far _SilphCo9EndBattleText1
	text_end

SilphCo9AfterBattleText1:
	text_far _SilphCo9AfterBattleText1
	text_end

SilphCo9BattleText2:
	text_far _SilphCo9BattleText2
	text_end

SilphCo9EndBattleText2:
	text_far _SilphCo9EndBattleText2
	text_end

SilphCo9AfterBattleText2:
	text_far _SilphCo9AfterBattleText2
	text_end

SilphCo9BattleText3:
	text_far _SilphCo9BattleText3
	text_end

SilphCo9EndBattleText3:
	text_far _SilphCo9EndBattleText3
	text_end

SilphCo9AfterBattleText3:
	text_far _SilphCo9AfterBattleText3
	text_end
