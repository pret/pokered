SilphCo3Script: ; 59f5b (16:5f5b)
	call SilphCo3Script_59f71
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo3TrainerHeaders
	ld de, SilphCo3ScriptPointers
	ld a, [W_SILPHCO3CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_SILPHCO3CURSCRIPT], a
	ret

SilphCo3Script_59f71: ; 59f71 (16:5f71)
	ld hl, wd126
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

SilphCo3GateCoords: ; 59fa8 (16:5fa8)
	db $04,$04
	db $04,$08
	db $FF

SilphCo3Script_59fad: ; 59fad (16:5fad)
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

SilphCo3ScriptPointers: ; 59fbe (16:5fbe)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo3TextPointers: ; 59fc4 (16:5fc4)
	dw SilphCo3Text1
	dw SilphCo3Text2
	dw SilphCo3Text3
	dw PickUpItemText

SilphCo3TrainerHeaders: ; 59fcc (16:5fcc)
SilphCo3TrainerHeader0: ; 59fcc (16:5fcc)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_3F_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_3F_TRAINER_0
	dw SilphCo3BattleText1 ; TextBeforeBattle
	dw SilphCo3AfterBattleText1 ; TextAfterBattle
	dw SilphCo3EndBattleText1 ; TextEndBattle
	dw SilphCo3EndBattleText1 ; TextEndBattle

SilphCo3TrainerHeader1: ; 59fd8 (16:5fd8)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_3F_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_3F_TRAINER_1
	dw SilphCo3BattleText2 ; TextBeforeBattle
	dw SilphCo3AfterBattleText2 ; TextAfterBattle
	dw SilphCo3EndBattleText2 ; TextEndBattle
	dw SilphCo3EndBattleText2 ; TextEndBattle

	db $ff

SilphCo3Text1: ; 59fe5 (16:5fe5)
	TX_ASM
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, SilphCo3Text_59ffe
	jr nz, .asm_59fee
	ld hl, SilphCo3Text_59ff9
.asm_59fee
	call PrintText
	jp TextScriptEnd

SilphCo3Text_59ff9: ; 59ff9 (16:5ff9)
	TX_FAR _SilphCo3Text_59ff9
	db "@"

SilphCo3Text_59ffe: ; 59ffe (16:5ffe)
	TX_FAR _SilphCo3Text_59ffe
	db "@"

SilphCo3Text2: ; 5a003 (16:6003)
	TX_ASM
	ld hl, SilphCo3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo3BattleText1: ; 5a00d (16:600d)
	TX_FAR _SilphCo3BattleText1
	db "@"

SilphCo3EndBattleText1: ; 5a012 (16:6012)
	TX_FAR _SilphCo3EndBattleText1
	db "@"

SilphCo3AfterBattleText1: ; 5a017 (16:6017)
	TX_FAR _SilphCo3AfterBattleText1
	db "@"

SilphCo3Text3: ; 5a01c (16:601c)
	TX_ASM
	ld hl, SilphCo3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo3BattleText2: ; 5a026 (16:6026)
	TX_FAR _SilphCo3BattleText2
	db "@"

SilphCo3EndBattleText2: ; 5a02b (16:602b)
	TX_FAR _SilphCo3EndBattleText2
	db "@"

SilphCo3AfterBattleText2: ; 5a030 (16:6030)
	TX_FAR _SilphCo3AfterBattleText2
	db "@"
