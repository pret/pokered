SilphCo9F_Script:
	call SilphCo9Script_5d7d1
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo9TrainerHeader0
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
	db $04,$01
	db $02,$09
	db $05,$09
	db $06,$05
	db $FF

SilphCo9Script_5d837:
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ld [$ffe0], a
	pop hl
.asm_5d843
	ld a, [hli]
	cp $ff
	jr z, .asm_5d85f
	push hl
	ld hl, $ffe0
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
	ld [$ffe0], a
	ret

SilphCo9Script_5d863:
	EventFlagAddress hl, EVENT_SILPH_CO_9_UNLOCKED_DOOR1
	ld a, [$ffe0]
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

SilphCo9TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_9F_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_9F_TRAINER_0
	dw SilphCo9BattleText1 ; TextBeforeBattle
	dw SilphCo9AfterBattleText1 ; TextAfterBattle
	dw SilphCo9EndBattleText1 ; TextEndBattle
	dw SilphCo9EndBattleText1 ; TextEndBattle

SilphCo9TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_9F_TRAINER_1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_9F_TRAINER_1
	dw SilphCo9BattleText2 ; TextBeforeBattle
	dw SilphCo9AfterBattleText2 ; TextAfterBattle
	dw SilphCo9EndBattleText2 ; TextEndBattle
	dw SilphCo9EndBattleText2 ; TextEndBattle

SilphCo9TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_9F_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_9F_TRAINER_2
	dw SilphCo9BattleText3 ; TextBeforeBattle
	dw SilphCo9AfterBattleText3 ; TextAfterBattle
	dw SilphCo9EndBattleText3 ; TextEndBattle
	dw SilphCo9EndBattleText3 ; TextEndBattle

	db $ff

SilphCo9Text1:
	TX_ASM
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
	TX_FAR _SilphCo9Text_5d8e5
	db "@"

SilphCo9Text_5d8ea:
	TX_FAR _SilphCo9Text_5d8ea
	db "@"

SilphCo9Text_5d8ef:
	TX_FAR _SilphCo9Text_5d8ef
	db "@"

SilphCo9Text2:
	TX_ASM
	ld hl, SilphCo9TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo9Text3:
	TX_ASM
	ld hl, SilphCo9TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo9Text4:
	TX_ASM
	ld hl, SilphCo9TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo9BattleText1:
	TX_FAR _SilphCo9BattleText1
	db "@"

SilphCo9EndBattleText1:
	TX_FAR _SilphCo9EndBattleText1
	db "@"

SilphCo9AfterBattleText1:
	TX_FAR _SilphCo9AfterBattleText1
	db "@"

SilphCo9BattleText2:
	TX_FAR _SilphCo9BattleText2
	db "@"

SilphCo9EndBattleText2:
	TX_FAR _SilphCo9EndBattleText2
	db "@"

SilphCo9AfterBattleText2:
	TX_FAR _SilphCo9AfterBattleText2
	db "@"

SilphCo9BattleText3:
	TX_FAR _SilphCo9BattleText3
	db "@"

SilphCo9EndBattleText3:
	TX_FAR _SilphCo9EndBattleText3
	db "@"

SilphCo9AfterBattleText3:
	TX_FAR _SilphCo9AfterBattleText3
	db "@"
