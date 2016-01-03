SilphCo2Script: ; 59cf1 (16:5cf1)
	call SilphCo2Script_59d07
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo2TrainerHeaders
	ld de, SilphCo2ScriptPointers
	ld a, [wSilphCo2CurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo2CurScript], a
	ret

SilphCo2Script_59d07: ; 59d07 (16:5d07)
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo2GateCoords
	call SilphCo2Script_59d43
	call SilphCo2Script_59d6f
	CheckEvent EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	jr nz, .asm_59d2e
	push af
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 2, 2
	predef ReplaceTileBlock
	pop af
.asm_59d2e
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_2_UNLOCKED_DOOR2, EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	ret nz
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 5, 2
	predef_jump ReplaceTileBlock

SilphCo2GateCoords: ; 59d3e (16:5d3e)
	db $02,$02
	db $05,$02
	db $FF

SilphCo2Script_59d43: ; 59d43 (16:5d43)
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ld [$ffe0], a
	pop hl
.asm_59d4f
	ld a, [hli]
	cp $ff
	jr z, .asm_59d6b
	push hl
	ld hl, $ffe0
	inc [hl]
	pop hl
	cp b
	jr z, .asm_59d60
	inc hl
	jr .asm_59d4f
.asm_59d60
	ld a, [hli]
	cp c
	jr nz, .asm_59d4f
	ld hl, wCardKeyDoorY
	xor a
	ld [hli], a
	ld [hl], a
	ret
.asm_59d6b
	xor a
	ld [$ffe0], a
	ret

SilphCo2Script_59d6f: ; 59d6f (16:5d6f)
	EventFlagAddress hl, EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	ld a, [$ffe0]
	and a
	ret z
	cp $1
	jr nz, .next
	SetEventReuseHL EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	ret
.next
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_2_UNLOCKED_DOOR2, EVENT_SILPH_CO_2_UNLOCKED_DOOR1
	ret

SilphCo2ScriptPointers: ; 59d80 (16:5d80)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo2TextPointers: ; 59d86 (16:5d86)
	dw SilphCo2Text1
	dw SilphCo2Text2
	dw SilphCo2Text3
	dw SilphCo2Text4
	dw SilphCo2Text5

SilphCo2TrainerHeaders: ; 59d90 (16:5d90)
SilphCo2TrainerHeader0: ; 59d90 (16:5d90)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_2F_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_2F_TRAINER_0
	dw SilphCo2BattleText1 ; TextBeforeBattle
	dw SilphCo2AfterBattleText1 ; TextAfterBattle
	dw SilphCo2EndBattleText1 ; TextEndBattle
	dw SilphCo2EndBattleText1 ; TextEndBattle

SilphCo2TrainerHeader1: ; 59d9c (16:5d9c)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_2F_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_2F_TRAINER_1
	dw SilphCo2BattleText2 ; TextBeforeBattle
	dw SilphCo2AfterBattleText2 ; TextAfterBattle
	dw SilphCo2EndBattleText2 ; TextEndBattle
	dw SilphCo2EndBattleText2 ; TextEndBattle

SilphCo2TrainerHeader2: ; 59da8 (16:5da8)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_2F_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_2F_TRAINER_2
	dw SilphCo2BattleText3 ; TextBeforeBattle
	dw SilphCo2AfterBattleText3 ; TextAfterBattle
	dw SilphCo2EndBattleText3 ; TextEndBattle
	dw SilphCo2EndBattleText3 ; TextEndBattle

SilphCo2TrainerHeader3: ; 59db4 (16:5db4)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_2F_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_2F_TRAINER_3
	dw SilphCo2BattleText4 ; TextBeforeBattle
	dw SilphCo2AfterBattleText4 ; TextAfterBattle
	dw SilphCo2EndBattleText4 ; TextEndBattle
	dw SilphCo2EndBattleText4 ; TextEndBattle

	db $ff

SilphCo2Text1: ; 59dc1 (16:5dc1)
	TX_ASM
	CheckEvent EVENT_GOT_TM36
	jr nz, .asm_59de4
	ld hl, SilphCo2Text_59ded
	call PrintText
	lb bc, TM_36, 1
	call GiveItem
	ld hl, TM36NoRoomText
	jr nc, .asm_59de7
	SetEvent EVENT_GOT_TM36
	ld hl, ReceivedTM36Text
	jr .asm_59de7
.asm_59de4
	ld hl, TM36ExplanationText
.asm_59de7
	call PrintText
	jp TextScriptEnd

SilphCo2Text_59ded: ; 59ded (16:5ded)
	TX_FAR _SilphCo2Text_59ded
	db "@"

ReceivedTM36Text: ; 59df2 (16:5df2)
	TX_FAR _ReceivedTM36Text
	db $0B, "@"

TM36ExplanationText: ; 59df8 (16:5df8)
	TX_FAR _TM36ExplanationText
	db "@"

TM36NoRoomText: ; 59dfd (16:5dfd)
	TX_FAR _TM36NoRoomText
	db "@"

SilphCo2Text2: ; 59e02 (16:5e02)
	TX_ASM
	ld hl, SilphCo2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2Text3: ; 59e0c (16:5e0c)
	TX_ASM
	ld hl, SilphCo2TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2Text4: ; 59e16 (16:5e16)
	TX_ASM
	ld hl, SilphCo2TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2Text5: ; 59e20 (16:5e20)
	TX_ASM
	ld hl, SilphCo2TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2BattleText1: ; 59e2a (16:5e2a)
	TX_FAR _SilphCo2BattleText1
	db "@"

SilphCo2EndBattleText1: ; 59e2f (16:5e2f)
	TX_FAR _SilphCo2EndBattleText1
	db "@"

SilphCo2AfterBattleText1: ; 59e34 (16:5e34)
	TX_FAR _SilphCo2AfterBattleText1
	db "@"

SilphCo2BattleText2: ; 59e39 (16:5e39)
	TX_FAR _SilphCo2BattleText2
	db "@"

SilphCo2EndBattleText2: ; 59e3e (16:5e3e)
	TX_FAR _SilphCo2EndBattleText2
	db "@"

SilphCo2AfterBattleText2: ; 59e43 (16:5e43)
	TX_FAR _SilphCo2AfterBattleText2
	db "@"

SilphCo2BattleText3: ; 59e48 (16:5e48)
	TX_FAR _SilphCo2BattleText3
	db "@"

SilphCo2EndBattleText3: ; 59e4d (16:5e4d)
	TX_FAR _SilphCo2EndBattleText3
	db "@"

SilphCo2AfterBattleText3: ; 59e52 (16:5e52)
	TX_FAR _SilphCo2AfterBattleText3
	db "@"

SilphCo2BattleText4: ; 59e57 (16:5e57)
	TX_FAR _SilphCo2BattleText4
	db "@"

SilphCo2EndBattleText4: ; 59e5c (16:5e5c)
	TX_FAR _SilphCo2EndBattleText4
	db "@"

SilphCo2AfterBattleText4: ; 59e61 (16:5e61)
	TX_FAR _SilphCo2AfterBattleText4
	db "@"
