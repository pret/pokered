Route25_Script:
	call Route25Script_515e1
	call EnableAutoTextBoxDrawing
	ld hl, Route25TrainerHeader0
	ld de, Route25_ScriptPointers
	ld a, [wRoute25CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute25CurScript], a
	ret

Route25Script_515e1:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	ret z
	CheckEventHL EVENT_LEFT_BILLS_HOUSE_AFTER_HELPING
	ret nz
	CheckEventReuseHL EVENT_MET_BILL_2
	jr nz, .asm_515ff
	ResetEventReuseHL EVENT_BILL_SAID_USE_CELL_SEPARATOR
	ld a, HS_BILL_POKEMON
	ld [wMissableObjectIndex], a
	predef_jump ShowObject
.asm_515ff
	CheckEventAfterBranchReuseHL EVENT_GOT_SS_TICKET, EVENT_MET_BILL_2
	ret z
	SetEventReuseHL EVENT_LEFT_BILLS_HOUSE_AFTER_HELPING
	ld a, HS_NUGGET_BRIDGE_GUY
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_BILL_1
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_BILL_2
	ld [wMissableObjectIndex], a
	predef_jump ShowObject

Route25_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route25_TextPointers:
	dw Route25Text1
	dw Route25Text2
	dw Route25Text3
	dw Route25Text4
	dw Route25Text5
	dw Route25Text6
	dw Route25Text7
	dw Route25Text8
	dw Route25Text9
	dw PickUpItemText
	dw Route25Text11

Route25TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_0
	dw Route25BattleText1 ; TextBeforeBattle
	dw Route25AfterBattleText1 ; TextAfterBattle
	dw Route25EndBattleText1 ; TextEndBattle
	dw Route25EndBattleText1 ; TextEndBattle

Route25TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_1
	dw Route25BattleText2 ; TextBeforeBattle
	dw Route25AfterBattleText2 ; TextAfterBattle
	dw Route25EndBattleText2 ; TextEndBattle
	dw Route25EndBattleText2 ; TextEndBattle

Route25TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_2
	dw Route25BattleText3 ; TextBeforeBattle
	dw Route25AfterBattleText3 ; TextAfterBattle
	dw Route25EndBattleText3 ; TextEndBattle
	dw Route25EndBattleText3 ; TextEndBattle

Route25TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_3
	dw Route25BattleText4 ; TextBeforeBattle
	dw Route25AfterBattleText4 ; TextAfterBattle
	dw Route25EndBattleText4 ; TextEndBattle
	dw Route25EndBattleText4 ; TextEndBattle

Route25TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_4
	dw Route25BattleText5 ; TextBeforeBattle
	dw Route25AfterBattleText5 ; TextAfterBattle
	dw Route25EndBattleText5 ; TextEndBattle
	dw Route25EndBattleText5 ; TextEndBattle

Route25TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_5
	dw Route25BattleText6 ; TextBeforeBattle
	dw Route25AfterBattleText6 ; TextAfterBattle
	dw Route25EndBattleText6 ; TextEndBattle
	dw Route25EndBattleText6 ; TextEndBattle

Route25TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_6
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_6
	dw Route25BattleText7 ; TextBeforeBattle
	dw Route25AfterBattleText7 ; TextAfterBattle
	dw Route25EndBattleText7 ; TextEndBattle
	dw Route25EndBattleText7 ; TextEndBattle

Route25TrainerHeader7:
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_7, 1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_7, 1
	dw Route25BattleText8 ; TextBeforeBattle
	dw Route25AfterBattleText8 ; TextAfterBattle
	dw Route25EndBattleText8 ; TextEndBattle
	dw Route25EndBattleText8 ; TextEndBattle

Route25TrainerHeader8:
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_8, 1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_8, 1
	dw Route25BattleText9 ; TextBeforeBattle
	dw Route25AfterBattleText9 ; TextAfterBattle
	dw Route25EndBattleText9 ; TextEndBattle
	dw Route25EndBattleText9 ; TextEndBattle

	db $ff

Route25Text1:
	TX_ASM
	ld hl, Route25TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route25Text2:
	TX_ASM
	ld hl, Route25TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route25Text3:
	TX_ASM
	ld hl, Route25TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route25Text4:
	TX_ASM
	ld hl, Route25TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route25Text5:
	TX_ASM
	ld hl, Route25TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route25Text6:
	TX_ASM
	ld hl, Route25TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route25Text7:
	TX_ASM
	ld hl, Route25TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route25Text8:
	TX_ASM
	ld hl, Route25TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route25Text9:
	TX_ASM
	ld hl, Route25TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route25BattleText1:
	TX_FAR _Route25BattleText1
	db "@"

Route25EndBattleText1:
	TX_FAR _Route25EndBattleText1
	db "@"

Route25AfterBattleText1:
	TX_FAR _Route25AfterBattleText1
	db "@"

Route25BattleText2:
	TX_FAR _Route25BattleText2
	db "@"

Route25EndBattleText2:
	TX_FAR _Route25EndBattleText2
	db "@"

Route25AfterBattleText2:
	TX_FAR _Route25AfterBattleText2
	db "@"

Route25BattleText3:
	TX_FAR _Route25BattleText3
	db "@"

Route25EndBattleText3:
	TX_FAR _Route25EndBattleText3
	db "@"

Route25AfterBattleText3:
	TX_FAR _Route25AfterBattleText3
	db "@"

Route25BattleText4:
	TX_FAR _Route25BattleText4
	db "@"

Route25EndBattleText4:
	TX_FAR _Route25EndBattleText4
	db "@"

Route25AfterBattleText4:
	TX_FAR _Route25AfterBattleText4
	db "@"

Route25BattleText5:
	TX_FAR _Route25BattleText5
	db "@"

Route25EndBattleText5:
	TX_FAR _Route25EndBattleText5
	db "@"

Route25AfterBattleText5:
	TX_FAR _Route25AfterBattleText5
	db "@"

Route25BattleText6:
	TX_FAR _Route25BattleText6
	db "@"

Route25EndBattleText6:
	TX_FAR _Route25EndBattleText6
	db "@"

Route25AfterBattleText6:
	TX_FAR _Route25AfterBattleText6
	db "@"

Route25BattleText7:
	TX_FAR _Route25BattleText7
	db "@"

Route25EndBattleText7:
	TX_FAR _Route25EndBattleText7
	db "@"

Route25AfterBattleText7:
	TX_FAR _Route25AfterBattleText7
	db "@"

Route25BattleText8:
	TX_FAR _Route25BattleText8
	db "@"

Route25EndBattleText8:
	TX_FAR _Route25EndBattleText8
	db "@"

Route25AfterBattleText8:
	TX_FAR _Route25AfterBattleText8
	db "@"

Route25BattleText9:
	TX_FAR _Route25BattleText9
	db "@"

Route25EndBattleText9:
	TX_FAR _Route25EndBattleText9
	db "@"

Route25AfterBattleText9:
	TX_FAR _Route25AfterBattleText9
	db "@"

Route25Text11:
	TX_FAR _Route25Text11
	db "@"
