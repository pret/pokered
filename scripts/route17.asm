Route17Script: ; 55b7a (15:5b7a)
	call EnableAutoTextBoxDrawing
	ld hl, Route17TrainerHeaders
	ld de, Route17ScriptPointers
	ld a, [W_ROUTE17CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROUTE17CURSCRIPT], a
	ret

Route17ScriptPointers: ; 55b8d (15:5b8d)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route17TextPointers: ; 55b93 (15:5b93)
	dw Route17Text1
	dw Route17Text2
	dw Route17Text3
	dw Route17Text4
	dw Route17Text5
	dw Route17Text6
	dw Route17Text7
	dw Route17Text8
	dw Route17Text9
	dw Route17Text10
	dw Route17Text11
	dw Route17Text12
	dw Route17Text13
	dw Route17Text14
	dw Route17Text15
	dw Route17Text16

Route17TrainerHeaders: ; 55bb3 (15:5bb3)
Route17TrainerHeader0: ; 55bb3 (15:5bb3)
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_0
	dw Route17BattleText1 ; TextBeforeBattle
	dw Route17AfterBattleText1 ; TextAfterBattle
	dw Route17EndBattleText1 ; TextEndBattle
	dw Route17EndBattleText1 ; TextEndBattle

Route17TrainerHeader1: ; 55bbf (15:5bbf)
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_1
	dw Route17BattleText2 ; TextBeforeBattle
	dw Route17AfterBattleText2 ; TextAfterBattle
	dw Route17EndBattleText2 ; TextEndBattle
	dw Route17EndBattleText2 ; TextEndBattle

Route17TrainerHeader2: ; 55bcb (15:5bcb)
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_2
	dw Route17BattleText3 ; TextBeforeBattle
	dw Route17AfterBattleText3 ; TextAfterBattle
	dw Route17EndBattleText3 ; TextEndBattle
	dw Route17EndBattleText3 ; TextEndBattle

Route17TrainerHeader3: ; 55bd7 (15:5bd7)
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_3
	dw Route17BattleText4 ; TextBeforeBattle
	dw Route17AfterBattleText4 ; TextAfterBattle
	dw Route17EndBattleText4 ; TextEndBattle
	dw Route17EndBattleText4 ; TextEndBattle

Route17TrainerHeader4: ; 55be3 (15:5be3)
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_4
	dw Route17BattleText5 ; TextBeforeBattle
	dw Route17AfterBattleText5 ; TextAfterBattle
	dw Route17EndBattleText5 ; TextEndBattle
	dw Route17EndBattleText5 ; TextEndBattle

Route17TrainerHeader5: ; 55bef (15:5bef)
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_5
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_5
	dw Route17BattleText6 ; TextBeforeBattle
	dw Route17AfterBattleText6 ; TextAfterBattle
	dw Route17EndBattleText6 ; TextEndBattle
	dw Route17EndBattleText6 ; TextEndBattle

Route17TrainerHeader6: ; 55bfb (15:5bfb)
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_6
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_6
	dw Route17BattleText7 ; TextBeforeBattle
	dw Route17AfterBattleText7 ; TextAfterBattle
	dw Route17EndBattleText7 ; TextEndBattle
	dw Route17EndBattleText7 ; TextEndBattle

Route17TrainerHeader7: ; 55c07 (15:5c07)
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_7, 1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_7, 1
	dw Route17BattleText8 ; TextBeforeBattle
	dw Route17AfterBattleText8 ; TextAfterBattle
	dw Route17EndBattleText8 ; TextEndBattle
	dw Route17EndBattleText8 ; TextEndBattle

Route17TrainerHeader8: ; 55c13 (15:5c13)
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_8, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_8, 1
	dw Route17BattleText9 ; TextBeforeBattle
	dw Route17AfterBattleText9 ; TextAfterBattle
	dw Route17EndBattleText9 ; TextEndBattle
	dw Route17EndBattleText9 ; TextEndBattle

Route17TrainerHeader9: ; 55c1f (15:5c1f)
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_9, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_9, 1
	dw Route17BattleText10 ; TextBeforeBattle
	dw Route17AfterBattleText10 ; TextAfterBattle
	dw Route17EndBattleText10 ; TextEndBattle
	dw Route17EndBattleText10 ; TextEndBattle

	db $ff

Route17Text1: ; 55c2c (15:5c2c)
	TX_ASM
	ld hl, Route17TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText1: ; 55c36 (15:5c36)
	TX_FAR _Route17BattleText1
	db "@"

Route17EndBattleText1: ; 55c3b (15:5c3b)
	TX_FAR _Route17EndBattleText1
	db "@"

Route17AfterBattleText1: ; 55c40 (15:5c40)
	TX_FAR _Route17AfterBattleText1
	db "@"

Route17Text2: ; 55c45 (15:5c45)
	TX_ASM
	ld hl, Route17TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText2: ; 55c4f (15:5c4f)
	TX_FAR _Route17BattleText2
	db "@"

Route17EndBattleText2: ; 55c54 (15:5c54)
	TX_FAR _Route17EndBattleText2
	db "@"

Route17AfterBattleText2: ; 55c59 (15:5c59)
	TX_FAR _Route17AfterBattleText2
	db "@"

Route17Text3: ; 55c5e (15:5c5e)
	TX_ASM
	ld hl, Route17TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText3: ; 55c68 (15:5c68)
	TX_FAR _Route17BattleText3
	db "@"

Route17EndBattleText3: ; 55c6d (15:5c6d)
	TX_FAR _Route17EndBattleText3
	db "@"

Route17AfterBattleText3: ; 55c72 (15:5c72)
	TX_FAR _Route17AfterBattleText3
	db "@"

Route17Text4: ; 55c77 (15:5c77)
	TX_ASM
	ld hl, Route17TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText4: ; 55c81 (15:5c81)
	TX_FAR _Route17BattleText4
	db "@"

Route17EndBattleText4: ; 55c86 (15:5c86)
	TX_FAR _Route17EndBattleText4
	db "@"

Route17AfterBattleText4: ; 55c8b (15:5c8b)
	TX_FAR _Route17AfterBattleText4
	db "@"

Route17Text5: ; 55c90 (15:5c90)
	TX_ASM
	ld hl, Route17TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText5: ; 55c9a (15:5c9a)
	TX_FAR _Route17BattleText5
	db "@"

Route17EndBattleText5: ; 55c9f (15:5c9f)
	TX_FAR _Route17EndBattleText5
	db "@"

Route17AfterBattleText5: ; 55ca4 (15:5ca4)
	TX_FAR _Route17AfterBattleText5
	db "@"

Route17Text6: ; 55ca9 (15:5ca9)
	TX_ASM
	ld hl, Route17TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText6: ; 55cb3 (15:5cb3)
	TX_FAR _Route17BattleText6
	db "@"

Route17EndBattleText6: ; 55cb8 (15:5cb8)
	TX_FAR _Route17EndBattleText6
	db "@"

Route17AfterBattleText6: ; 55cbd (15:5cbd)
	TX_FAR _Route17AfterBattleText6
	db "@"

Route17Text7: ; 55cc2 (15:5cc2)
	TX_ASM
	ld hl, Route17TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText7: ; 55ccc (15:5ccc)
	TX_FAR _Route17BattleText7
	db "@"

Route17EndBattleText7: ; 55cd1 (15:5cd1)
	TX_FAR _Route17EndBattleText7
	db "@"

Route17AfterBattleText7: ; 55cd6 (15:5cd6)
	TX_FAR _Route17AfterBattleText7
	db "@"

Route17Text8: ; 55cdb (15:5cdb)
	TX_ASM
	ld hl, Route17TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText8: ; 55ce5 (15:5ce5)
	TX_FAR _Route17BattleText8
	db "@"

Route17EndBattleText8: ; 55cea (15:5cea)
	TX_FAR _Route17EndBattleText8
	db "@"

Route17AfterBattleText8: ; 55cef (15:5cef)
	TX_FAR _Route17AfterBattleText8
	db "@"

Route17Text9: ; 55cf4 (15:5cf4)
	TX_ASM
	ld hl, Route17TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText9: ; 55cfe (15:5cfe)
	TX_FAR _Route17BattleText9
	db "@"

Route17EndBattleText9: ; 55d03 (15:5d03)
	TX_FAR _Route17EndBattleText9
	db "@"

Route17AfterBattleText9: ; 55d08 (15:5d08)
	TX_FAR _Route17AfterBattleText9
	db "@"

Route17Text10: ; 55d0d (15:5d0d)
	TX_ASM
	ld hl, Route17TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText10: ; 55d17 (15:5d17)
	TX_FAR _Route17BattleText10
	db "@"

Route17EndBattleText10: ; 55d1c (15:5d1c)
	TX_FAR _Route17EndBattleText10
	db "@"

Route17AfterBattleText10: ; 55d21 (15:5d21)
	TX_FAR _Route17AfterBattleText10
	db "@"

Route17Text11: ; 55d26 (15:5d26)
	TX_FAR _Route17Text11
	db "@"

Route17Text12: ; 55d2b (15:5d2b)
	TX_FAR _Route17Text12
	db "@"

Route17Text13: ; 55d30 (15:5d30)
	TX_FAR _Route17Text13
	db "@"

Route17Text14: ; 55d35 (15:5d35)
	TX_FAR _Route17Text14
	db "@"

Route17Text15: ; 55d3a (15:5d3a)
	TX_FAR _Route17Text15
	db "@"

Route17Text16: ; 55d3f (15:5d3f)
	TX_FAR _Route17Text16
	db "@"
