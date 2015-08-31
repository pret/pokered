SilphCo5Script: ; 19f37 (6:5f37)
	call SilphCo5Script_19f4d
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo5TrainerHeaders
	ld de, SilphCo5ScriptPointers
	ld a, [wSilphCo5CurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo5CurScript], a
	ret

SilphCo5Script_19f4d: ; 19f4d (6:5f4d)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, SilphCo5GateCoords
	call SilphCo4Script_19d5d
	call SilphCo5Script_19f9e
	CheckEvent EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	jr nz, .asm_19f74
	push af
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 2, 3
	predef ReplaceTileBlock
	pop af
.asm_19f74
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_5_UNLOCKED_DOOR2, EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	jr nz, .asm_19f87
	push af
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 6, 3
	predef ReplaceTileBlock
	pop af
.asm_19f87
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_5_UNLOCKED_DOOR3, EVENT_SILPH_CO_5_UNLOCKED_DOOR2
	ret nz
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 5, 7
	predef_jump ReplaceTileBlock

SilphCo5GateCoords: ; 19f97 (6:5f97)
	db $02,$03
	db $06,$03
	db $05,$07
	db $FF

SilphCo5Script_19f9e: ; 19f9e (6:5f9e)
	EventFlagAddress hl, EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	ld a, [$ffe0]
	and a
	ret z
	cp $1
	jr nz, .next1
	SetEventReuseHL EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	ret
.next1
	cp $2
	jr nz, .next2
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_5_UNLOCKED_DOOR2, EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	ret
.next2
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_5_UNLOCKED_DOOR3, EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	ret

SilphCo5ScriptPointers: ; 19fb6 (6:5fb6)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SilphCo5TextPointers: ; 19fbc (6:5fbc)
	dw SilphCo5Text1
	dw SilphCo5Text2
	dw SilphCo5Text3
	dw SilphCo5Text4
	dw SilphCo5Text5
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw SilphCo5Text9
	dw SilphCo5Text10
	dw SilphCo5Text11

SilphCo5TrainerHeaders: ; 19fd2 (6:5fd2)
Silphco5TrainerHeader0: ; 19fd2 (6:5fd2)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_5F_TRAINER_0
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_5F_TRAINER_0
	dw SilphCo5BattleText2 ; TextBeforeBattle
	dw SilphCo5AfterBattleText2 ; TextAfterBattle
	dw SilphCo5EndBattleText2 ; TextEndBattle
	dw SilphCo5EndBattleText2 ; TextEndBattle

Silphco5TrainerHeader2: ; 19fde (6:5fde)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_5F_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_5F_TRAINER_2
	dw SilphCo5BattleText3 ; TextBeforeBattle
	dw SilphCo5AfterBattleText3 ; TextAfterBattle
	dw SilphCo5EndBattleText3 ; TextEndBattle
	dw SilphCo5EndBattleText3 ; TextEndBattle

Silphco5TrainerHeader3: ; 19fea (6:5fea)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_5F_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_5F_TRAINER_3
	dw SilphCo5BattleText4 ; TextBeforeBattle
	dw SilphCo5AfterBattleText4 ; TextAfterBattle
	dw SilphCo5EndBattleText4 ; TextEndBattle
	dw SilphCo5EndBattleText4 ; TextEndBattle

Silphco5TrainerHeader4: ; 19ff6 (6:5ff6)
	dbEventFlagBit EVENT_BEAT_SILPH_CO_5F_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SILPH_CO_5F_TRAINER_4
	dw SilphCo5BattleText5 ; TextBeforeBattle
	dw SilphCo5AfterBattleText5 ; TextAfterBattle
	dw SilphCo5EndBattleText5 ; TextEndBattle
	dw SilphCo5EndBattleText5 ; TextEndBattle

	db $ff

SilphCo5Text1: ; 1a003 (6:6003)
	TX_ASM
	ld hl, SilphCo5Text_1a010
	ld de, SilphCo5Text_1a015
	call SilphCo6Script_1a22f
	jp TextScriptEnd

SilphCo5Text_1a010: ; 1a010 (6:6010)
	TX_FAR _SilphCo5Text_1a010
	db "@"

SilphCo5Text_1a015: ; 1a015 (6:6015)
	TX_FAR _SilphCo5Text_1a015
	db "@"

SilphCo5Text2: ; 1a01a (6:601a)
	TX_ASM
	ld hl, Silphco5TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo5BattleText2: ; 1a024 (6:6024)
	TX_FAR _SilphCo5BattleText2
	db "@"

SilphCo5EndBattleText2: ; 1a029 (6:6029)
	TX_FAR _SilphCo5EndBattleText2
	db "@"

SilphCo5AfterBattleText2: ; 1a02e (6:602e)
	TX_FAR _SilphCo5AfterBattleText2
	db "@"

SilphCo5Text3: ; 1a033 (6:6033)
	TX_ASM
	ld hl, Silphco5TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo5BattleText3: ; 1a03d (6:603d)
	TX_FAR _SilphCo5BattleText3
	db "@"

SilphCo5EndBattleText3: ; 1a042 (6:6042)
	TX_FAR _SilphCo5EndBattleText3
	db "@"

SilphCo5AfterBattleText3: ; 1a047 (6:6047)
	TX_FAR _SilphCo5AfterBattleText3
	db "@"

SilphCo5Text4: ; 1a04c (6:604c)
	TX_ASM
	ld hl, Silphco5TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SilphCo5BattleText4: ; 1a056 (6:6056)
	TX_FAR _SilphCo5BattleText4
	db "@"

SilphCo5EndBattleText4: ; 1a05b (6:605b)
	TX_FAR _SilphCo5EndBattleText4
	db "@"

SilphCo5AfterBattleText4: ; 1a060 (6:6060)
	TX_FAR _SilphCo5AfterBattleText4
	db "@"

SilphCo5Text5: ; 1a065 (6:6065)
	TX_ASM
	ld hl, Silphco5TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

SilphCo5BattleText5: ; 1a06f (6:606f)
	TX_FAR _SilphCo5BattleText5
	db "@"

SilphCo5EndBattleText5: ; 1a074 (6:6074)
	TX_FAR _SilphCo5EndBattleText5
	db "@"

SilphCo5AfterBattleText5: ; 1a079 (6:6079)
	TX_FAR _SilphCo5AfterBattleText5
	db "@"

SilphCo5Text9: ; 1a07e (6:607e)
	TX_FAR _SilphCo5Text9
	db "@"

SilphCo5Text10: ; 1a083 (6:6083)
	TX_FAR _SilphCo5Text10
	db "@"

SilphCo5Text11: ; 1a088 (6:6088)
	TX_FAR _SilphCo5Text11
	db "@"
