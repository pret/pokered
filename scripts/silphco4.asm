SilphCo4Script: ; 19d0b (6:5d0b)
	call SilphCo4Script_19d21
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo4TrainerHeaders
	ld de, SilphCo4ScriptPointers
	ld a, [wSilphCo4CurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo4CurScript], a
	ret

SilphCo4Script_19d21: ; 19d21 (6:5d21)
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

SilphCo4GateCoords: ; 19d58 (6:5d58)
	db $06,$02
	db $04,$06
	db $FF

SilphCo4Script_19d5d: ; 19d5d (6:5d5d)
	push hl
	ld hl, wCardKeyDoorY
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	xor a
	ld [$ffe0], a
	pop hl
.asm_19d69
	ld a, [hli]
	cp $ff
	jr z, .asm_19d85
	push hl
	ld hl, $ffe0
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
	ld [$ffe0], a
	ret

SilphCo4Script_19d89: ; 19d89 (6:5d89)
	EventFlagAddress hl, EVENT_SILPH_CO_4_UNLOCKED_DOOR1
	ld a, [$ffe0]
	and a
	ret z
	cp $1
	jr nz, .next
	SetEventReuseHL EVENT_SILPH_CO_4_UNLOCKED_DOOR1
	ret
.next
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_4_UNLOCKED_DOOR2, EVENT_SILPH_CO_4_UNLOCKED_DOOR1
	ret

SilphCo4ScriptPointers: ; 19d9a (6:5d9a)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo4TextPointers: ; 19da0 (6:5da0)
	dw SilphCo4Text1
	dw SilphCo4Text2
	dw SilphCo4Text3
	dw SilphCo4Text4
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText

SilphCo4TrainerHeaders: ; 19dae (6:5dae)
SilphCo4TrainerHeader0: ; 19dae (6:5dae)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_4F_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_4F_TRAINER_0
	dw SilphCo4BattleText2 ; TextBeforeBattle
	dw SilphCo4AfterBattleText2 ; TextAfterBattle
	dw SilphCo4EndBattleText2 ; TextEndBattle
	dw SilphCo4EndBattleText2 ; TextEndBattle

SilphCo4TrainerHeader2: ; 19dba (6:5dba)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_4F_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_4F_TRAINER_2
	dw SilphCo4BattleText3 ; TextBeforeBattle
	dw SilphCo4AfterBattleText3 ; TextAfterBattle
	dw SilphCo4EndBattleText3 ; TextEndBattle
	dw SilphCo4EndBattleText3 ; TextEndBattle

SilphCo4TrainerHeader3: ; 19dc6 (6:5dc6)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_4F_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_4F_TRAINER_3
	dw SilphCo4BattleText4 ; TextBeforeBattle
	dw SilphCo4AfterBattleText4 ; TextAfterBattle
	dw SilphCo4EndBattleText4 ; TextEndBattle
	dw SilphCo4EndBattleText4 ; TextEndBattle

	db $ff

SilphCo4Text1: ; 19dd3 (6:5dd3)
	TX_ASM
	ld hl, SilphCo4Text_19de0
	ld de, SilphCo4Text_19de5
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo4Text_19de0: ; 19de0 (6:5de0)
	TX_FAR _SilphCo4Text_19de0
	db "@"

SilphCo4Text_19de5: ; 19de5 (6:5de5)
	TX_FAR _SilphCo4Text_19de5
	db "@"

SilphCo4Text2: ; 19dea (6:5dea)
	TX_ASM
	ld hl, SilphCo4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo4BattleText2: ; 19df4 (6:5df4)
	TX_FAR _SilphCo4BattleText2
	db "@"

SilphCo4EndBattleText2: ; 19df9 (6:5df9)
	TX_FAR _SilphCo4EndBattleText2
	db "@"

SilphCo4AfterBattleText2: ; 19dfe (6:5dfe)
	TX_FAR _SilphCo4AfterBattleText2
	db "@"

SilphCo4Text3: ; 19e03 (6:5e03)
	TX_ASM
	ld hl, SilphCo4TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo4BattleText3: ; 19e0d (6:5e0d)
	TX_FAR _SilphCo4BattleText3
	db "@"

SilphCo4EndBattleText3: ; 19e12 (6:5e12)
	TX_FAR _SilphCo4EndBattleText3
	db "@"

SilphCo4AfterBattleText3: ; 19e17 (6:5e17)
	TX_FAR _SilphCo4AfterBattleText3
	db "@"

SilphCo4Text4: ; 19e1c (6:5e1c)
	TX_ASM
	ld hl, SilphCo4TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SilphCo4BattleText4: ; 19e26 (6:5e26)
	TX_FAR _SilphCo4BattleText4
	db "@"

SilphCo4EndBattleText4: ; 19e2b (6:5e2b)
	TX_FAR _SilphCo4EndBattleText4
	db "@"

SilphCo4AfterBattleText4: ; 19e30 (6:5e30)
	TX_FAR _SilphCo4AfterBattleText4
	db "@"
