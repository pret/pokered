RocketHideoutB1F_Script:
	call RocketHideout1Script_44be0
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideout1TrainerHeader0
	ld de, RocketHideoutB1F_ScriptPointers
	ld a, [wRocketHideoutB1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRocketHideoutB1FCurScript], a
	ret

RocketHideout1Script_44be0:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_677
	jr nz, .asm_44c01
	CheckEventReuseA EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_4
	jr nz, .asm_44bf7
	ld a, $54
	jr .asm_44c03
.asm_44bf7
	ld a, SFX_GO_INSIDE
	call PlaySound
	CheckEventHL EVENT_677
.asm_44c01
	ld a, $e
.asm_44c03
	ld [wNewTileBlockID], a
	lb bc, 8, 12
	predef_jump ReplaceTileBlock

RocketHideoutB1F_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

RocketHideoutB1F_TextPointers:
	dw RocketHideout1Text1
	dw RocketHideout1Text2
	dw RocketHideout1Text3
	dw RocketHideout1Text4
	dw RocketHideout1Text5
	dw PickUpItemText
	dw PickUpItemText

RocketHideout1TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_0
	dw RocketHideout1BattleText2 ; TextBeforeBattle
	dw RocketHideout1AfterBattleTxt2 ; TextAfterBattle
	dw RocketHideout1EndBattleText2 ; TextEndBattle
	dw RocketHideout1EndBattleText2 ; TextEndBattle

RocketHideout1TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_1
	dw RocketHideout1BattleText3 ; TextBeforeBattle
	dw RocketHideout1AfterBattleTxt3 ; TextAfterBattle
	dw RocketHideout1EndBattleText3 ; TextEndBattle
	dw RocketHideout1EndBattleText3 ; TextEndBattle

RocketHideout1TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_2
	dw RocketHideout1BattleText4 ; TextBeforeBattle
	dw RocketHideout1AfterBattleTxt4 ; TextAfterBattle
	dw RocketHideout1EndBattleText4 ; TextEndBattle
	dw RocketHideout1EndBattleText4 ; TextEndBattle

RocketHideout1TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_3
	dw RocketHideout1BattleText5 ; TextBeforeBattle
	dw RocketHideout1AfterBattleTxt5 ; TextAfterBattle
	dw RocketHideout1EndBattleText5 ; TextEndBattle
	dw RocketHideout1EndBattleText5 ; TextEndBattle

RocketHideout1TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_4
	dw RocketHideout1BattleText6 ; TextBeforeBattle
	dw RocketHideout1AfterBattleTxt6 ; TextAfterBattle
	dw RocketHideout1EndBattleText6 ; TextEndBattle
	dw RocketHideout1EndBattleText6 ; TextEndBattle

	db $ff

RocketHideout1Text1:
	TX_ASM
	ld hl, RocketHideout1TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout1Text2:
	TX_ASM
	ld hl, RocketHideout1TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout1Text3:
	TX_ASM
	ld hl, RocketHideout1TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout1Text4:
	TX_ASM
	ld hl, RocketHideout1TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout1Text5:
	TX_ASM
	ld hl, RocketHideout1TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout1EndBattleText6:
	TX_FAR _RocketHideout1EndBattleText6
	TX_ASM
	SetEvent EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_4
	ld hl, RocketHideout1Text_44c9f
	ret

RocketHideout1Text_44c9f:
	TX_BLINK
	db "@"

RocketHideout1BattleText2:
	TX_FAR _RocketHideout1BattleText2
	db "@"

RocketHideout1EndBattleText2:
	TX_FAR _RocketHideout1EndBattleText2
	db "@"

RocketHideout1AfterBattleTxt2:
	TX_FAR _RocketHideout1AfterBattleTxt2
	db "@"

RocketHideout1BattleText3:
	TX_FAR _RocketHideout1BattleText3
	db "@"

RocketHideout1EndBattleText3:
	TX_FAR _RocketHideout1EndBattleText3
	db "@"

RocketHideout1AfterBattleTxt3:
	TX_FAR _RocketHideout1AfterBattleTxt3
	db "@"

RocketHideout1BattleText4:
	TX_FAR _RocketHideout1BattleText4
	db "@"

RocketHideout1EndBattleText4:
	TX_FAR _RocketHideout1EndBattleText4
	db "@"

RocketHideout1AfterBattleTxt4:
	TX_FAR _RocketHideout1AfterBattleTxt4
	db "@"

RocketHideout1BattleText5:
	TX_FAR _RocketHideout1BattleText5
	db "@"

RocketHideout1EndBattleText5:
	TX_FAR _RocketHideout1EndBattleText5
	db "@"

RocketHideout1AfterBattleTxt5:
	TX_FAR _RocketHideout1AfterBattleTxt5
	db "@"

RocketHideout1BattleText6:
	TX_FAR _RocketHideout1BattleText6
	db "@"

RocketHideout1AfterBattleTxt6:
	TX_FAR _RocketHideout1AfterBattleTxt6
	db "@"
