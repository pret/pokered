Route25Script: ; 515cb (14:55cb)
	call Route25Script_515e1
	call EnableAutoTextBoxDrawing
	ld hl, Route25TrainerHeaders
	ld de, Route25ScriptPointers
	ld a, [W_ROUTE25CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROUTE25CURSCRIPT], a
	ret

Route25Script_515e1: ; 515e1 (14:55e1)
	ld hl, wd126
	bit 6, [hl]
	res 6, [hl]
	ret z
	CheckEventHL EVENT_LEFT_BILLS_HOUSE_AFTER_HELPING
	ret nz
	CheckEventReuseHL EVENT_MET_BILL_2
	jr nz, .asm_515ff
	ResetEventReuseHL EVENT_BILL_SAID_USE_CELL_SEPARATOR
	ld a, HS_BILL_POKEMON
	ld [wcc4d], a
	predef_jump ShowObject
.asm_515ff
	CheckEventAfterBranchReuseHL EVENT_GOT_SS_TICKET, EVENT_MET_BILL_2
	ret z
	SetEventReuseHL EVENT_LEFT_BILLS_HOUSE_AFTER_HELPING
	ld a, HS_NUGGET_BRIDGE_GUY
	ld [wcc4d], a
	predef HideObject
	ld a, HS_BILL_1
	ld [wcc4d], a
	predef HideObject
	ld a, HS_BILL_2
	ld [wcc4d], a
	predef_jump ShowObject

Route25ScriptPointers: ; 51622 (14:5622)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route25TextPointers: ; 51628 (14:5628)
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

Route25TrainerHeaders: ; 5163e (14:563e)
Route25TrainerHeader0: ; 5163e (14:563e)
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_0
	dw Route25BattleText1 ; TextBeforeBattle
	dw Route25AfterBattleText1 ; TextAfterBattle
	dw Route25EndBattleText1 ; TextEndBattle
	dw Route25EndBattleText1 ; TextEndBattle

Route25TrainerHeader2: ; 5164a (14:564a)
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_2
	dw Route25BattleText2 ; TextBeforeBattle
	dw Route25AfterBattleText2 ; TextAfterBattle
	dw Route25EndBattleText2 ; TextEndBattle
	dw Route25EndBattleText2 ; TextEndBattle

Route25TrainerHeader3: ; 51656 (14:5656)
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_3
	dw Route25BattleText3 ; TextBeforeBattle
	dw Route25AfterBattleText3 ; TextAfterBattle
	dw Route25EndBattleText3 ; TextEndBattle
	dw Route25EndBattleText3 ; TextEndBattle

Route25TrainerHeader4: ; 51662 (14:5662)
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_4
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_4
	dw Route25BattleText4 ; TextBeforeBattle
	dw Route25AfterBattleText4 ; TextAfterBattle
	dw Route25EndBattleText4 ; TextEndBattle
	dw Route25EndBattleText4 ; TextEndBattle

Route25TrainerHeader5: ; 5166e (14:566e)
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_5
	dw Route25BattleText5 ; TextBeforeBattle
	dw Route25AfterBattleText5 ; TextAfterBattle
	dw Route25EndBattleText5 ; TextEndBattle
	dw Route25EndBattleText5 ; TextEndBattle

Route25TrainerHeader6: ; 5167a (14:567a)
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_6
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_6
	dw Route25BattleText6 ; TextBeforeBattle
	dw Route25AfterBattleText6 ; TextAfterBattle
	dw Route25EndBattleText6 ; TextEndBattle
	dw Route25EndBattleText6 ; TextEndBattle

Route25TrainerHeader7: ; 51686 (14:5686)
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_7
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_7
	dw Route25BattleText7 ; TextBeforeBattle
	dw Route25AfterBattleText7 ; TextAfterBattle
	dw Route25EndBattleText7 ; TextEndBattle
	dw Route25EndBattleText7 ; TextEndBattle

Route25TrainerHeader8: ; 51692 (14:5692)
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_8, 1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_8, 1
	dw Route25BattleText8 ; TextBeforeBattle
	dw Route25AfterBattleText8 ; TextAfterBattle
	dw Route25EndBattleText8 ; TextEndBattle
	dw Route25EndBattleText8 ; TextEndBattle

Route25TrainerHeader9: ; 5169e (14:569e)
	dbEventFlagBit EVENT_BEAT_ROUTE_25_TRAINER_9, 1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_25_TRAINER_9, 1
	dw Route25BattleText9 ; TextBeforeBattle
	dw Route25AfterBattleText9 ; TextAfterBattle
	dw Route25EndBattleText9 ; TextEndBattle
	dw Route25EndBattleText9 ; TextEndBattle

	db $ff

Route25Text1: ; 516ab (14:56ab)
	TX_ASM
	ld hl, Route25TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route25Text2: ; 516b5 (14:56b5)
	TX_ASM
	ld hl, Route25TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route25Text3: ; 516bf (14:56bf)
	TX_ASM
	ld hl, Route25TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route25Text4: ; 516c9 (14:56c9)
	TX_ASM
	ld hl, Route25TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route25Text5: ; 516d3 (14:56d3)
	TX_ASM
	ld hl, Route25TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route25Text6: ; 516dd (14:56dd)
	TX_ASM
	ld hl, Route25TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route25Text7: ; 516e7 (14:56e7)
	TX_ASM
	ld hl, Route25TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route25Text8: ; 516f1 (14:56f1)
	TX_ASM
	ld hl, Route25TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route25Text9: ; 516fb (14:56fb)
	TX_ASM
	ld hl, Route25TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route25BattleText1: ; 51705 (14:5705)
	TX_FAR _Route25BattleText1
	db "@"

Route25EndBattleText1: ; 5170a (14:570a)
	TX_FAR _Route25EndBattleText1
	db "@"

Route25AfterBattleText1: ; 5170f (14:570f)
	TX_FAR _Route25AfterBattleText1
	db "@"

Route25BattleText2: ; 51714 (14:5714)
	TX_FAR _Route25BattleText2
	db "@"

Route25EndBattleText2: ; 51719 (14:5719)
	TX_FAR _Route25EndBattleText2
	db "@"

Route25AfterBattleText2: ; 5171e (14:571e)
	TX_FAR _Route25AfterBattleText2
	db "@"

Route25BattleText3: ; 51723 (14:5723)
	TX_FAR _Route25BattleText3
	db "@"

Route25EndBattleText3: ; 51728 (14:5728)
	TX_FAR _Route25EndBattleText3
	db "@"

Route25AfterBattleText3: ; 5172d (14:572d)
	TX_FAR _Route25AfterBattleText3
	db "@"

Route25BattleText4: ; 51732 (14:5732)
	TX_FAR _Route25BattleText4
	db "@"

Route25EndBattleText4: ; 51737 (14:5737)
	TX_FAR _Route25EndBattleText4
	db "@"

Route25AfterBattleText4: ; 5173c (14:573c)
	TX_FAR _Route25AfterBattleText4
	db "@"

Route25BattleText5: ; 51741 (14:5741)
	TX_FAR _Route25BattleText5
	db "@"

Route25EndBattleText5: ; 51746 (14:5746)
	TX_FAR _Route25EndBattleText5
	db "@"

Route25AfterBattleText5: ; 5174b (14:574b)
	TX_FAR _Route25AfterBattleText5
	db "@"

Route25BattleText6: ; 51750 (14:5750)
	TX_FAR _Route25BattleText6
	db "@"

Route25EndBattleText6: ; 51755 (14:5755)
	TX_FAR _Route25EndBattleText6
	db "@"

Route25AfterBattleText6: ; 5175a (14:575a)
	TX_FAR _Route25AfterBattleText6
	db "@"

Route25BattleText7: ; 5175f (14:575f)
	TX_FAR _Route25BattleText7
	db "@"

Route25EndBattleText7: ; 51764 (14:5764)
	TX_FAR _Route25EndBattleText7
	db "@"

Route25AfterBattleText7: ; 51769 (14:5769)
	TX_FAR _Route25AfterBattleText7
	db "@"

Route25BattleText8: ; 5176e (14:576e)
	TX_FAR _Route25BattleText8
	db "@"

Route25EndBattleText8: ; 51773 (14:5773)
	TX_FAR _Route25EndBattleText8
	db "@"

Route25AfterBattleText8: ; 51778 (14:5778)
	TX_FAR _Route25AfterBattleText8
	db "@"

Route25BattleText9: ; 5177d (14:577d)
	TX_FAR _Route25BattleText9
	db "@"

Route25EndBattleText9: ; 51782 (14:5782)
	TX_FAR _Route25EndBattleText9
	db "@"

Route25AfterBattleText9: ; 51787 (14:5787)
	TX_FAR _Route25AfterBattleText9
	db "@"

Route25Text11: ; 5178c (14:578c)
	TX_FAR _Route25Text11
	db "@"
