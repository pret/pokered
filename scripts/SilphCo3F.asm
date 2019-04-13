SilphCo3F_Script:
	call SilphCo3Script_59f71
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo3TrainerHeader0
	ld de, SilphCo3F_ScriptPointers
	ld a, [wSilphCo3FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo3FCurScript], a
	ret

SilphCo3Script_59f71:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo3GateCoords
	call SilphCo2Script_59d43
	call SilphCo3Script_59fad
	CheckEvent EVENT_SILPH_CO_3_UNLOCKED_DOOR1
	jr nz, .asm_59f98
	push af
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 4, 4
	predef ReplaceTileBlock
	pop af
.asm_59f98
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_3_UNLOCKED_DOOR2, EVENT_SILPH_CO_3_UNLOCKED_DOOR1
	ret nz
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 4, 8
	predef_jump ReplaceTileBlock

SilphCo3GateCoords:
	db $04,$04
	db $04,$08
	db $FF

SilphCo3Script_59fad:
	EventFlagAddress hl, EVENT_SILPH_CO_3_UNLOCKED_DOOR1
	ld a, [$ffe0]
	and a
	ret z
	cp $1
	jr nz, .next
	SetEventReuseHL EVENT_SILPH_CO_3_UNLOCKED_DOOR1
	ret
.next
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_3_UNLOCKED_DOOR2, EVENT_SILPH_CO_3_UNLOCKED_DOOR1
	ret

SilphCo3F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo3F_TextPointers:
	dw SilphCo3Text1
	dw SilphCo3Text2
	dw SilphCo3Text3
	dw PickUpItemText

SilphCo3TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_3F_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_3F_TRAINER_0
	dw SilphCo3BattleText1 ; TextBeforeBattle
	dw SilphCo3AfterBattleText1 ; TextAfterBattle
	dw SilphCo3EndBattleText1 ; TextEndBattle
	dw SilphCo3EndBattleText1 ; TextEndBattle

SilphCo3TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_SILPH_CO_3F_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_3F_TRAINER_1
	dw SilphCo3BattleText2 ; TextBeforeBattle
	dw SilphCo3AfterBattleText2 ; TextAfterBattle
	dw SilphCo3EndBattleText2 ; TextEndBattle
	dw SilphCo3EndBattleText2 ; TextEndBattle

	db $ff

SilphCo3Text1:
	TX_ASM
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, SilphCo3Text_59ffe
	jr nz, .asm_59fee
	ld hl, SilphCo3Text_59ff9
.asm_59fee
	call PrintText
	jp TextScriptEnd

SilphCo3Text_59ff9:
	TX_FAR _SilphCo3Text_59ff9
	db "@"

SilphCo3Text_59ffe:
	TX_FAR _SilphCo3Text_59ffe
	db "@"

SilphCo3Text2:
	TX_ASM
	ld hl, SilphCo3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo3BattleText1:
	TX_FAR _SilphCo3BattleText1
	db "@"

SilphCo3EndBattleText1:
	TX_FAR _SilphCo3EndBattleText1
	db "@"

SilphCo3AfterBattleText1:
	TX_FAR _SilphCo3AfterBattleText1
	db "@"

SilphCo3Text3:
	TX_ASM
	ld hl, SilphCo3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo3BattleText2:
	TX_FAR _SilphCo3BattleText2
	db "@"

SilphCo3EndBattleText2:
	TX_FAR _SilphCo3EndBattleText2
	db "@"

SilphCo3AfterBattleText2:
	TX_FAR _SilphCo3AfterBattleText2
	db "@"
