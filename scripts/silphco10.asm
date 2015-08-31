SilphCo10Script: ; 5a139 (16:6139)
	call SilphCo10Script_5a14f
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo10TrainerHeaders
	ld de, SilphCo10ScriptPointers
	ld a, [wSilphCo10CurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo10CurScript], a
	ret

SilphCo10Script_5a14f: ; 5a14f (16:614f)
	ld hl, wd126
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

SilphCo10GateCoords: ; 5a173 (16:6173)
	db $04,$05
	db $FF

SilphCo10Text_5a176: ; 5a176 (16:6176)
	ld a, [$ffe0]
	and a
	ret z
	SetEvent EVENT_SILPH_CO_10_UNLOCKED_DOOR
	ret

SilphCo10ScriptPointers: ; 5a180 (16:6180)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo10TextPointers: ; 5a186 (16:6186)
	dw SilphCo10Text1
	dw SilphCo10Text2
	dw SilphCo10Text3
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText

SilphCo10TrainerHeaders: ; 5a192 (16:6192)
SilphCo10TrainerHeader0: ; 5a192 (16:6192)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_10F_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_10F_TRAINER_0
	dw SilphCo10BattleText1 ; TextBeforeBattle
	dw SilphCo10AfterBattleText1 ; TextAfterBattle
	dw SilphCo10EndBattleText1 ; TextEndBattle
	dw SilphCo10EndBattleText1 ; TextEndBattle

SilphCo10TrainerHeader1: ; 5a19e (16:619e)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_10F_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_10F_TRAINER_1
	dw SilphCo10BattleText2 ; TextBeforeBattle
	dw SilphCo10AfterBattleText2 ; TextAfterBattle
	dw SilphCo10EndBattleText2 ; TextEndBattle
	dw SilphCo10EndBattleText2 ; TextEndBattle

	db $ff

SilphCo10Text1: ; 5a1ab (16:61ab)
	TX_ASM
	ld hl, SilphCo10TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo10Text2: ; 5a1b5 (16:61b5)
	TX_ASM
	ld hl, SilphCo10TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo10Text3: ; 5a1bf (16:61bf)
	TX_ASM
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, SilphCo10Text_5a1d8
	jr nz, .asm_cf85f
	ld hl, SilphCo10Text_5a1d3
.asm_cf85f
	call PrintText
	jp TextScriptEnd

SilphCo10Text_5a1d3: ; 5a1d3 (16:61d3)
	TX_FAR _SilphCo10Text_5a1d3
	db "@"

SilphCo10Text_5a1d8: ; 5a1d8 (16:61d8)
	TX_FAR _SilphCo10Text_5a1d8
	db "@"

SilphCo10BattleText1: ; 5a1dd (16:61dd)
	TX_FAR _SilphCo10BattleText1
	db "@"

SilphCo10EndBattleText1: ; 5a1e2 (16:61e2)
	TX_FAR _SilphCo10EndBattleText1
	db "@"

SilphCo10AfterBattleText1: ; 5a1e7 (16:61e7)
	TX_FAR _SilphCo10AfterBattleText1
	db "@"

SilphCo10BattleText2: ; 5a1ec (16:61ec)
	TX_FAR _SilphCo10BattleText2
	db "@"

SilphCo10EndBattleText2: ; 5a1f1 (16:61f1)
	TX_FAR _SilphCo10EndBattleText2
	db "@"

SilphCo10AfterBattleText2: ; 5a1f6 (16:61f6)
	TX_FAR _SilphCo10AfterBattleText2
	db "@"
