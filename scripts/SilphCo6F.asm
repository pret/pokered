SilphCo6F_Script:
	call SilphCo6Script_1a1bf
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo6TrainerHeader0
	ld de, SilphCo6F_ScriptPointers
	ld a, [wSilphCo6FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo6FCurScript], a
	ret

SilphCo6Script_1a1bf:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo6GateCoords
	call SilphCo4Script_19d5d
	call SilphCo6Script_1a1e6
	CheckEvent EVENT_SILPH_CO_6_UNLOCKED_DOOR
	ret nz
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 6, 2
	predef_jump ReplaceTileBlock

SilphCo6GateCoords:
	db $06,$02
	db $FF

SilphCo6Script_1a1e6:
	ld a, [$ffe0]
	and a
	ret z
	SetEvent EVENT_SILPH_CO_6_UNLOCKED_DOOR
	ret

SilphCo6F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo6F_TextPointers:
	dw SilphCo6Text1
	dw SilphCo6Text2
	dw SilphCo6Text3
	dw SilphCo6Text4
	dw SilphCo6Text5
	dw SilphCo6Text6
	dw SilphCo6Text7
	dw SilphCo6Text8
	dw PickUpItemText
	dw PickUpItemText

SilphCo6TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_6F_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_6F_TRAINER_0
	dw SilphCo6BattleText2 ; TextBeforeBattle
	dw SilphCo6AfterBattleText2 ; TextAfterBattle
	dw SilphCo6EndBattleText2 ; TextEndBattle
	dw SilphCo6EndBattleText2 ; TextEndBattle

SilphCo6TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_6F_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_6F_TRAINER_1
	dw SilphCo6BattleText3 ; TextBeforeBattle
	dw SilphCo6AfterBattleText3 ; TextAfterBattle
	dw SilphCo6EndBattleText3 ; TextEndBattle
	dw SilphCo6EndBattleText3 ; TextEndBattle

SilphCo6TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_6F_TRAINER_2, 1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_6F_TRAINER_2, 1
	dw SilphCo6BattleText4 ; TextBeforeBattle
	dw SilphCo6AfterBattleText4 ; TextAfterBattle
	dw SilphCo6EndBattleText4 ; TextEndBattle
	dw SilphCo6EndBattleText4 ; TextEndBattle

	db $ff

SilphCo6Script_1a22f:
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .asm_1a238
	jr .asm_1a23a
.asm_1a238
	ld h, d
	ld l, e
.asm_1a23a
	jp PrintText

SilphCo6Text1:
	TX_ASM
	ld hl, SilphCo6Text_1a24a
	ld de, SilphCo6Text_1a24f
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo6Text_1a24a:
	TX_FAR _SilphCo6Text_1a24a
	db "@"

SilphCo6Text_1a24f:
	TX_FAR _SilphCo6Text_1a24f
	db "@"

SilphCo6Text2:
	TX_ASM
	ld hl, SilphCo6Text_1a261
	ld de, SilphCo6Text_1a266
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo6Text_1a261:
	TX_FAR _SilphCo6Text_1a261
	db "@"

SilphCo6Text_1a266:
	TX_FAR _SilphCo6Text_1a266
	db "@"

SilphCo6Text3:
	TX_ASM
	ld hl, SilphCo6Text_1a278
	ld de, SilphCo6Text_1a27d
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo6Text_1a278:
	TX_FAR _SilphCo6Text_1a278
	db "@"

SilphCo6Text_1a27d:
	TX_FAR _SilphCo6Text_1a27d
	db "@"

SilphCo6Text4:
	TX_ASM
	ld hl, SilphCo6Text_1a28f
	ld de, SilphCo6Text_1a294
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo6Text_1a28f:
	TX_FAR _SilphCo6Text_1a28f
	db "@"

SilphCo6Text_1a294:
	TX_FAR _SilphCo6Text_1a294
	db "@"

SilphCo6Text5:
	TX_ASM
	ld hl, SilphCo6Text_1a2a6
	ld de, SilphCo6Text_1a2ab
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo6Text_1a2a6:
	TX_FAR _SilphCo6Text_1a2a6
	db "@"

SilphCo6Text_1a2ab:
	TX_FAR _SilphCo6Text_1a2ab
	db "@"

SilphCo6Text6:
	TX_ASM
	ld hl, SilphCo6TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo6BattleText2:
	TX_FAR _SilphCo6BattleText2
	db "@"

SilphCo6EndBattleText2:
	TX_FAR _SilphCo6EndBattleText2
	db "@"

SilphCo6AfterBattleText2:
	TX_FAR _SilphCo6AfterBattleText2
	db "@"

SilphCo6Text7:
	TX_ASM
	ld hl, SilphCo6TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo6BattleText3:
	TX_FAR _SilphCo6BattleText3
	db "@"

SilphCo6EndBattleText3:
	TX_FAR _SilphCo6EndBattleText3
	db "@"

SilphCo6AfterBattleText3:
	TX_FAR _SilphCo6AfterBattleText3
	db "@"

SilphCo6Text8:
	TX_ASM
	ld hl, SilphCo6TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo6BattleText4:
	TX_FAR _SilphCo6BattleText4
	db "@"

SilphCo6EndBattleText4:
	TX_FAR _SilphCo6EndBattleText4
	db "@"

SilphCo6AfterBattleText4:
	TX_FAR _SilphCo6AfterBattleText4
	db "@"
