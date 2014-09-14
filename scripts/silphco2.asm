SilphCo2Script: ; 59cf1 (16:5cf1)
	call SilphCo2Script_59d07
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo2TrainerHeaders
	ld de, SilphCo2ScriptPointers
	ld a, [W_SILPHCO2CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_SILPHCO2CURSCRIPT], a
	ret

SilphCo2Script_59d07: ; 59d07 (16:5d07)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, DataTable_59d3e
	call SilphCo2Script_59d43
	call SilphCo2Script_59d6f
	ld a, [wd826]
	bit 5, a
	jr nz, .asm_59d2e
	push af
	ld a, $54
	ld [wd09f], a
	ld bc, $0202
	predef ReplaceTileBlock
	pop af
.asm_59d2e
	bit 6, a
	ret nz
	ld a, $54
	ld [wd09f], a
	ld bc, $0502
	predef_jump ReplaceTileBlock

DataTable_59d3e: ; 59d3e (16:5d3e)
	db $02,$02,$05,$02,$FF

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
	ld hl, wd826
	ld a, [$ffe0]
	and a
	ret z
	cp $1
	jr nz, .asm_59d7d
	set 5, [hl]
	ret
.asm_59d7d
	set 6, [hl]
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
	db $2 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd825 ; flag's byte
	dw SilphCo2BattleText1 ; 0x5e2a TextBeforeBattle
	dw SilphCo2AfterBattleText1 ; 0x5e34 TextAfterBattle
	dw SilphCo2EndBattleText1 ; 0x5e2f TextEndBattle
	dw SilphCo2EndBattleText1 ; 0x5e2f TextEndBattle

SilphCo2TrainerHeader1: ; 59d9c (16:5d9c)
	db $3 ; flag's bit
	db ($4 << 4) ; trainer's view range
	dw wd825 ; flag's byte
	dw SilphCo2BattleText2 ; 0x5e39 TextBeforeBattle
	dw SilphCo2AfterBattleText2 ; 0x5e43 TextAfterBattle
	dw SilphCo2EndBattleText2 ; 0x5e3e TextEndBattle
	dw SilphCo2EndBattleText2 ; 0x5e3e TextEndBattle

SilphCo2TrainerHeader2: ; 59da8 (16:5da8)
	db $4 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd825 ; flag's byte
	dw SilphCo2BattleText3 ; 0x5e48 TextBeforeBattle
	dw SilphCo2AfterBattleText3 ; 0x5e52 TextAfterBattle
	dw SilphCo2EndBattleText3 ; 0x5e4d TextEndBattle
	dw SilphCo2EndBattleText3 ; 0x5e4d TextEndBattle

SilphCo2TrainerHeader3: ; 59db4 (16:5db4)
	db $5 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd825 ; flag's byte
	dw SilphCo2BattleText4 ; 0x5e57 TextBeforeBattle
	dw SilphCo2AfterBattleText4 ; 0x5e61 TextAfterBattle
	dw SilphCo2EndBattleText4 ; 0x5e5c TextEndBattle
	dw SilphCo2EndBattleText4 ; 0x5e5c TextEndBattle

	db $ff

SilphCo2Text1: ; 59dc1 (16:5dc1)
	db $08 ; asm
	ld a, [wd826]
	bit 7, a
	jr nz, asm_b8a0d ; 0x59dc7
	ld hl, SilphCo2Text_59ded
	call PrintText
	ld bc, (TM_36 << 8) | 1
	call GiveItem
	ld hl, TM36NoRoomText
	jr nc, asm_2c1e0 ; 0x59dd8
	ld hl, wd826
	set 7, [hl]
	ld hl, ReceivedTM36Text
	jr asm_2c1e0 ; 0x59de2
asm_b8a0d ; 0x59de4
	ld hl, TM36ExplanationText
asm_2c1e0 ; 0x59de7
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
	db $08 ; asm
	ld hl, SilphCo2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2Text3: ; 59e0c (16:5e0c)
	db $08 ; asm
	ld hl, SilphCo2TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2Text4: ; 59e16 (16:5e16)
	db $08 ; asm
	ld hl, SilphCo2TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2Text5: ; 59e20 (16:5e20)
	db $08 ; asm
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
