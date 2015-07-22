Route15Script: ; 597ae (16:57ae)
	call EnableAutoTextBoxDrawing
	ld hl, Route15TrainerHeaders
	ld de, Route15ScriptPointers
	ld a, [W_ROUTE15CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_ROUTE15CURSCRIPT], a
	ret

Route15ScriptPointers: ; 597c1 (16:57c1)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route15TextPointers: ; 597c7 (16:57c7)
	dw Route15Text1
	dw Route15Text2
	dw Route15Text3
	dw Route15Text4
	dw Route15Text5
	dw Route15Text6
	dw Route15Text7
	dw Route15Text8
	dw Route15Text9
	dw Route15Text10
	dw PickUpItemText
	dw Route15Text12

Route15TrainerHeaders: ; 597df (16:57df)
Route15TrainerHeader0: ; 597df (16:57df)
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_0
	dw Route15BattleText1 ; TextBeforeBattle
	dw Route15AfterBattleText1 ; TextAfterBattle
	dw Route15EndBattleText1 ; TextEndBattle
	dw Route15EndBattleText1 ; TextEndBattle

Route15TrainerHeader1: ; 597eb (16:57eb)
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_1
	dw Route15BattleText2 ; TextBeforeBattle
	dw Route15AfterBattleText2 ; TextAfterBattle
	dw Route15EndBattleText2 ; TextEndBattle
	dw Route15EndBattleText2 ; TextEndBattle

Route15TrainerHeader2: ; 597f7 (16:57f7)
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_2
	dw Route15BattleText3 ; TextBeforeBattle
	dw Route15AfterBattleText3 ; TextAfterBattle
	dw Route15EndBattleText3 ; TextEndBattle
	dw Route15EndBattleText3 ; TextEndBattle

Route15TrainerHeader3: ; 59803 (16:5803)
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_3
	dw Route15BattleText4 ; TextBeforeBattle
	dw Route15AfterBattleText4 ; TextAfterBattle
	dw Route15EndBattleText4 ; TextEndBattle
	dw Route15EndBattleText4 ; TextEndBattle

Route15TrainerHeader4: ; 5980f (16:580f)
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_4
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_4
	dw Route15BattleText5 ; TextBeforeBattle
	dw Route15AfterBattleText5 ; TextAfterBattle
	dw Route15EndBattleText5 ; TextEndBattle
	dw Route15EndBattleText5 ; TextEndBattle

Route15TrainerHeader5: ; 5981b (16:581b)
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_5
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_5
	dw Route15BattleText6 ; TextBeforeBattle
	dw Route15AfterBattleText6 ; TextAfterBattle
	dw Route15EndBattleText6 ; TextEndBattle
	dw Route15EndBattleText6 ; TextEndBattle

Route15TrainerHeader6: ; 59827 (16:5827)
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_6
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_6
	dw Route15BattleText7 ; TextBeforeBattle
	dw Route15AfterBattleText7 ; TextAfterBattle
	dw Route15EndBattleText7 ; TextEndBattle
	dw Route15EndBattleText7 ; TextEndBattle

Route15TrainerHeader7: ; 59833 (16:5833)
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_7, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_7, 1
	dw Route15BattleText8 ; TextBeforeBattle
	dw Route15AfterBattleText8 ; TextAfterBattle
	dw Route15EndBattleText8 ; TextEndBattle
	dw Route15EndBattleText8 ; TextEndBattle

Route15TrainerHeader8: ; 5983f (16:583f)
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_8, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_8, 1
	dw Route15BattleText9 ; TextBeforeBattle
	dw Route15AfterBattleText9 ; TextAfterBattle
	dw Route15EndBattleText9 ; TextEndBattle
	dw Route15EndBattleText9 ; TextEndBattle

Route15TrainerHeader9: ; 5984b (16:584b)
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_9, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_9, 1
	dw Route15BattleText10 ; TextBeforeBattle
	dw Route15AfterBattleText10 ; TextAfterBattle
	dw Route15EndBattleText10 ; TextEndBattle
	dw Route15EndBattleText10 ; TextEndBattle

	db $ff

Route15Text1: ; 59858 (16:5858)
	TX_ASM
	ld hl, Route15TrainerHeader0
	jr Route15TalkToTrainer

Route15Text2: ; 5985e (16:585e)
	TX_ASM
	ld hl, Route15TrainerHeader1
	jr Route15TalkToTrainer

Route15Text3: ; 59864 (16:5864)
	TX_ASM
	ld hl, Route15TrainerHeader2
	jr Route15TalkToTrainer

Route15Text4: ; 5986a (16:586a)
	TX_ASM
	ld hl, Route15TrainerHeader3
	jr Route15TalkToTrainer

Route15Text5: ; 59870 (16:5870)
	TX_ASM
	ld hl, Route15TrainerHeader4
	jr Route15TalkToTrainer

Route15Text6: ; 59876 (16:5876)
	TX_ASM
	ld hl, Route15TrainerHeader5
	jr Route15TalkToTrainer

Route15Text7: ; 5987c (16:587c)
	TX_ASM
	ld hl, Route15TrainerHeader6
	jr Route15TalkToTrainer

Route15Text8: ; 59882 (16:5882)
	TX_ASM
	ld hl, Route15TrainerHeader7
	jr Route15TalkToTrainer

Route15Text9: ; 59888 (16:5888)
	TX_ASM
	ld hl, Route15TrainerHeader8
	jr Route15TalkToTrainer

Route15Text10: ; 5988e (16:588e)
	TX_ASM
	ld hl, Route15TrainerHeader9
Route15TalkToTrainer: ; 59892 (16:5892)
	call TalkToTrainer
	jp TextScriptEnd

Route15BattleText1: ; 59898 (16:5898)
	TX_FAR _Route15BattleText1
	db "@"

Route15EndBattleText1: ; 5989d (16:589d)
	TX_FAR _Route15EndBattleText1
	db "@"

Route15AfterBattleText1: ; 598a2 (16:58a2)
	TX_FAR _Route15AfterBattleText1
	db "@"

Route15BattleText2: ; 598a7 (16:58a7)
	TX_FAR _Route15BattleText2
	db "@"

Route15EndBattleText2: ; 598ac (16:58ac)
	TX_FAR _Route15EndBattleText2
	db "@"

Route15AfterBattleText2: ; 598b1 (16:58b1)
	TX_FAR _Route15AfterBattleText2
	db "@"

Route15BattleText3: ; 598b6 (16:58b6)
	TX_FAR _Route15BattleText3
	db "@"

Route15EndBattleText3: ; 598bb (16:58bb)
	TX_FAR _Route15EndBattleText3
	db "@"

Route15AfterBattleText3: ; 598c0 (16:58c0)
	TX_FAR _Route15AfterBattleText3
	db "@"

Route15BattleText4: ; 598c5 (16:58c5)
	TX_FAR _Route15BattleText4
	db "@"

Route15EndBattleText4: ; 598ca (16:58ca)
	TX_FAR _Route15EndBattleText4
	db "@"

Route15AfterBattleText4: ; 598cf (16:58cf)
	TX_FAR _Route15AfterBattleText4
	db "@"

Route15BattleText5: ; 598d4 (16:58d4)
	TX_FAR _Route15BattleText5
	db "@"

Route15EndBattleText5: ; 598d9 (16:58d9)
	TX_FAR _Route15EndBattleText5
	db "@"

Route15AfterBattleText5: ; 598de (16:58de)
	TX_FAR _Route15AfterBattleText5
	db "@"

Route15BattleText6: ; 598e3 (16:58e3)
	TX_FAR _Route15BattleText6
	db "@"

Route15EndBattleText6: ; 598e8 (16:58e8)
	TX_FAR _Route15EndBattleText6
	db "@"

Route15AfterBattleText6: ; 598ed (16:58ed)
	TX_FAR _Route15AfterBattleText6
	db "@"

Route15BattleText7: ; 598f2 (16:58f2)
	TX_FAR _Route15BattleText7
	db "@"

Route15EndBattleText7: ; 598f7 (16:58f7)
	TX_FAR _Route15EndBattleText7
	db "@"

Route15AfterBattleText7: ; 598fc (16:58fc)
	TX_FAR _Route15AfterBattleText7
	db "@"

Route15BattleText8: ; 59901 (16:5901)
	TX_FAR _Route15BattleText8
	db "@"

Route15EndBattleText8: ; 59906 (16:5906)
	TX_FAR _Route15EndBattleText8
	db "@"

Route15AfterBattleText8: ; 5990b (16:590b)
	TX_FAR _Route15AfterBattleText8
	db "@"

Route15BattleText9: ; 59910 (16:5910)
	TX_FAR _Route15BattleText9
	db "@"

Route15EndBattleText9: ; 59915 (16:5915)
	TX_FAR _Route15EndBattleText9
	db "@"

Route15AfterBattleText9: ; 5991a (16:591a)
	TX_FAR _Route15AfterBattleText9
	db "@"

Route15BattleText10: ; 5991f (16:591f)
	TX_FAR _Route15BattleText10
	db "@"

Route15EndBattleText10: ; 59924 (16:5924)
	TX_FAR _Route15EndBattleText10
	db "@"

Route15AfterBattleText10: ; 59929 (16:5929)
	TX_FAR _Route15AfterBattleText10
	db "@"

Route15Text12: ; 5992e (16:592e)
	TX_FAR _Route15Text12
	db "@"
