SilphCo10F_Script:
	call SilphCo10Script_5a14f
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo10TrainerHeader0
	ld de, SilphCo10F_ScriptPointers
	ld a, [wSilphCo10FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo10FCurScript], a
	ret

SilphCo10Script_5a14f:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo10GateCoords
	call SilphCo2Script_59d43
	call SilphCo10Text_5a176
	CheckEvent EVENT_SILPH_CO_10_UNLOCKED_DOOR
	ret nz
	ld a, $54
	ld [wNewTileBlockID], a
	lb bc, 4, 5
	predef_jump ReplaceTileBlock

SilphCo10GateCoords:
	db $04,$05
	db $FF

SilphCo10Text_5a176:
	ld a, [$ffe0]
	and a
	ret z
	SetEvent EVENT_SILPH_CO_10_UNLOCKED_DOOR
	ret

SilphCo10F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo10F_TextPointers:
	dw SilphCo10Text1
	dw SilphCo10Text2
	dw SilphCo10Text3
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText

SilphCo10TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_10F_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_10F_TRAINER_0
	dw SilphCo10BattleText1 ; TextBeforeBattle
	dw SilphCo10AfterBattleText1 ; TextAfterBattle
	dw SilphCo10EndBattleText1 ; TextEndBattle
	dw SilphCo10EndBattleText1 ; TextEndBattle

SilphCo10TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_10F_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_10F_TRAINER_1
	dw SilphCo10BattleText2 ; TextBeforeBattle
	dw SilphCo10AfterBattleText2 ; TextAfterBattle
	dw SilphCo10EndBattleText2 ; TextEndBattle
	dw SilphCo10EndBattleText2 ; TextEndBattle

	db $ff

SilphCo10Text1:
	TX_ASM
	ld hl, SilphCo10TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo10Text2:
	TX_ASM
	ld hl, SilphCo10TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo10Text3:
	TX_ASM
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, SilphCo10Text_5a1d8
	jr nz, .asm_cf85f
	ld hl, SilphCo10Text_5a1d3
.asm_cf85f
	call PrintText
	jp TextScriptEnd

SilphCo10Text_5a1d3:
	TX_FAR _SilphCo10Text_5a1d3
	db "@"

SilphCo10Text_5a1d8:
	TX_FAR _SilphCo10Text_5a1d8
	db "@"

SilphCo10BattleText1:
	TX_FAR _SilphCo10BattleText1
	db "@"

SilphCo10EndBattleText1:
	TX_FAR _SilphCo10EndBattleText1
	db "@"

SilphCo10AfterBattleText1:
	TX_FAR _SilphCo10AfterBattleText1
	db "@"

SilphCo10BattleText2:
	TX_FAR _SilphCo10BattleText2
	db "@"

SilphCo10EndBattleText2:
	TX_FAR _SilphCo10EndBattleText2
	db "@"

SilphCo10AfterBattleText2:
	TX_FAR _SilphCo10AfterBattleText2
	db "@"
