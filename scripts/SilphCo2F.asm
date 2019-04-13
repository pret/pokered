SilphCo2F_Script:
	call SilphCo2Script_59d07
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo2TrainerHeader0
	ld de, SilphCo2F_ScriptPointers
	ld a, [wSilphCo2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo2FCurScript], a
	ret

SilphCo2Script_59d07:
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

SilphCo2GateCoords:
	db $02,$02
	db $05,$02
	db $FF

SilphCo2Script_59d43:
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

SilphCo2Script_59d6f:
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

SilphCo2F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo2F_TextPointers:
	dw SilphCo2Text1
	dw SilphCo2Text2
	dw SilphCo2Text3
	dw SilphCo2Text4
	dw SilphCo2Text5

SilphCo2TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_2F_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_2F_TRAINER_0
	dw SilphCo2BattleText1 ; TextBeforeBattle
	dw SilphCo2AfterBattleText1 ; TextAfterBattle
	dw SilphCo2EndBattleText1 ; TextEndBattle
	dw SilphCo2EndBattleText1 ; TextEndBattle

SilphCo2TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_2F_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_2F_TRAINER_1
	dw SilphCo2BattleText2 ; TextBeforeBattle
	dw SilphCo2AfterBattleText2 ; TextAfterBattle
	dw SilphCo2EndBattleText2 ; TextEndBattle
	dw SilphCo2EndBattleText2 ; TextEndBattle

SilphCo2TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_2F_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_2F_TRAINER_2
	dw SilphCo2BattleText3 ; TextBeforeBattle
	dw SilphCo2AfterBattleText3 ; TextAfterBattle
	dw SilphCo2EndBattleText3 ; TextEndBattle
	dw SilphCo2EndBattleText3 ; TextEndBattle

SilphCo2TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_2F_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_2F_TRAINER_3
	dw SilphCo2BattleText4 ; TextBeforeBattle
	dw SilphCo2AfterBattleText4 ; TextAfterBattle
	dw SilphCo2EndBattleText4 ; TextEndBattle
	dw SilphCo2EndBattleText4 ; TextEndBattle

	db $ff

SilphCo2Text1:
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

SilphCo2Text_59ded:
	TX_FAR _SilphCo2Text_59ded
	db "@"

ReceivedTM36Text:
	TX_FAR _ReceivedTM36Text
	TX_SFX_ITEM_1
	db "@"

TM36ExplanationText:
	TX_FAR _TM36ExplanationText
	db "@"

TM36NoRoomText:
	TX_FAR _TM36NoRoomText
	db "@"

SilphCo2Text2:
	TX_ASM
	ld hl, SilphCo2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2Text3:
	TX_ASM
	ld hl, SilphCo2TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2Text4:
	TX_ASM
	ld hl, SilphCo2TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2Text5:
	TX_ASM
	ld hl, SilphCo2TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SilphCo2BattleText1:
	TX_FAR _SilphCo2BattleText1
	db "@"

SilphCo2EndBattleText1:
	TX_FAR _SilphCo2EndBattleText1
	db "@"

SilphCo2AfterBattleText1:
	TX_FAR _SilphCo2AfterBattleText1
	db "@"

SilphCo2BattleText2:
	TX_FAR _SilphCo2BattleText2
	db "@"

SilphCo2EndBattleText2:
	TX_FAR _SilphCo2EndBattleText2
	db "@"

SilphCo2AfterBattleText2:
	TX_FAR _SilphCo2AfterBattleText2
	db "@"

SilphCo2BattleText3:
	TX_FAR _SilphCo2BattleText3
	db "@"

SilphCo2EndBattleText3:
	TX_FAR _SilphCo2EndBattleText3
	db "@"

SilphCo2AfterBattleText3:
	TX_FAR _SilphCo2AfterBattleText3
	db "@"

SilphCo2BattleText4:
	TX_FAR _SilphCo2BattleText4
	db "@"

SilphCo2EndBattleText4:
	TX_FAR _SilphCo2EndBattleText4
	db "@"

SilphCo2AfterBattleText4:
	TX_FAR _SilphCo2AfterBattleText4
	db "@"
