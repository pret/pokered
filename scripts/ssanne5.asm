SSAnne5Script: ; 616ae (18:56ae)
	call EnableAutoTextBoxDrawing
	ld hl, SSAnne5TrainerHeader0
	ld de, SSAnne5ScriptPointers
	ld a, [wSSAnne5CurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnne5CurScript], a
	ret

SSAnne5ScriptPointers: ; 616c1 (18:56c1)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SSAnne5TextPointers: ; 616c7 (18:56c7)
	dw SSAnne5Text1
	dw SSAnne5Text2
	dw SSAnne5Text3
	dw SSAnne5Text4
	dw SSAnne5Text5

SSAnne5TrainerHeaders: ; 616d1 (18:56d1)
SSAnne5TrainerHeader0: ; 616d1 (18:56d1)
	dbEventFlagBit EVENT_BEAT_SS_ANNE_5_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_5_TRAINER_0
	dw SSAnne5BattleText1 ; TextBeforeBattle
	dw SSAnne5AfterBattleText1 ; TextAfterBattle
	dw SSAnne5EndBattleText1 ; TextEndBattle
	dw SSAnne5EndBattleText1 ; TextEndBattle

SSAnne5TrainerHeader1: ; 616dd (18:56dd)
	dbEventFlagBit EVENT_BEAT_SS_ANNE_5_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_5_TRAINER_1
	dw SSAnne5BattleText2 ; TextBeforeBattle
	dw SSAnne5AfterBattleText2 ; TextAfterBattle
	dw SSAnne5EndBattleText2 ; TextEndBattle
	dw SSAnne5EndBattleText2 ; TextEndBattle

	db $ff

SSAnne5Text1: ; 616ea (18:56ea)
	TX_FAR _SSAnne5Text1
	db "@"

SSAnne5Text2: ; 616ef (18:56ef)
	TX_FAR _SSAnne5Text2
	db "@"

SSAnne5Text3: ; 616f4 (18:56f4)
	TX_FAR _SSAnne5Text3
	db "@"

SSAnne5Text4: ; 616f9 (18:56f9)
	TX_ASM
	ld hl, SSAnne5TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne5BattleText1: ; 61703 (18:5703)
	TX_FAR _SSAnne5BattleText1
	db "@"

SSAnne5EndBattleText1: ; 61708 (18:5708)
	TX_FAR _SSAnne5EndBattleText1
	db "@"

SSAnne5AfterBattleText1: ; 6170d (18:570d)
	TX_FAR _SSAnne5AfterBattleText1
	db "@"

SSAnne5Text5: ; 61712 (18:5712)
	TX_ASM
	ld hl, SSAnne5TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne5BattleText2: ; 6171c (18:571c)
	TX_FAR _SSAnne5BattleText2
	db "@"

SSAnne5EndBattleText2: ; 61721 (18:5721)
	TX_FAR _SSAnne5EndBattleText2
	db "@"

SSAnne5AfterBattleText2: ; 61726 (18:5726)
	TX_FAR _SSAnne5AfterBattleText2
	db "@"
