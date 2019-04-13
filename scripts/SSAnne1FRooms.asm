SSAnne1FRooms_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SSAnne8TrainerHeader0
	ld de, SSAnne1FRooms_ScriptPointers
	ld a, [wSSAnne1FRoomsCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnne1FRoomsCurScript], a
	ret

SSAnne1FRooms_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SSAnne1FRooms_TextPointers:
	dw SSAnne8Text1
	dw SSAnne8Text2
	dw SSAnne8Text3
	dw SSAnne8Text4
	dw SSAnne8Text5
	dw SSAnne8Text6
	dw SSAnne8Text7
	dw SSAnne8Text8
	dw SSAnne8Text9
	dw PickUpItemText
	dw SSAnne8Text11

SSAnne8TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_8_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_8_TRAINER_0
	dw SSAnne8BattleText1 ; TextBeforeBattle
	dw SSAnne8AfterBattleText1 ; TextAfterBattle
	dw SSAnne8EndBattleText1 ; TextEndBattle
	dw SSAnne8EndBattleText1 ; TextEndBattle

SSAnne8TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_8_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_8_TRAINER_1
	dw SSAnne8BattleText2 ; TextBeforeBattle
	dw SSAnne8AfterBattleText2 ; TextAfterBattle
	dw SSAnne8EndBattleText2 ; TextEndBattle
	dw SSAnne8EndBattleText2 ; TextEndBattle

SSAnne8TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_8_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_8_TRAINER_2
	dw SSAnne8BattleText3 ; TextBeforeBattle
	dw SSAnne8AfterBattleText3 ; TextAfterBattle
	dw SSAnne8EndBattleText3 ; TextEndBattle
	dw SSAnne8EndBattleText3 ; TextEndBattle

SSAnne8TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_8_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_8_TRAINER_3
	dw SSAnne8BattleText4 ; TextBeforeBattle
	dw SSAnne8AfterBattleText4 ; TextAfterBattle
	dw SSAnne8EndBattleText4 ; TextEndBattle
	dw SSAnne8EndBattleText4 ; TextEndBattle

	db $ff

SSAnne8Text1:
	TX_ASM
	ld hl, SSAnne8TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text2:
	TX_ASM
	ld hl, SSAnne8TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text3:
	TX_ASM
	ld hl, SSAnne8TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text4:
	TX_ASM
	ld hl, SSAnne8TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnne8Text8:
	TX_FAR _SSAnne8Text8
	TX_ASM
	ld a, WIGGLYTUFF
	call PlayCry
	jp TextScriptEnd

SSAnne8BattleText1:
	TX_FAR _SSAnne8BattleText1
	db "@"

SSAnne8EndBattleText1:
	TX_FAR _SSAnne8EndBattleText1
	db "@"

SSAnne8AfterBattleText1:
	TX_FAR _SSAnne8AfterBattleText1
	db "@"

SSAnne8BattleText2:
	TX_FAR _SSAnne8BattleText2
	db "@"

SSAnne8EndBattleText2:
	TX_FAR _SSAnne8EndBattleText2
	db "@"

SSAnne8AfterBattleText2:
	TX_FAR _SSAnne8AfterBattleText2
	db "@"

SSAnne8BattleText3:
	TX_FAR _SSAnne8BattleText3
	db "@"

SSAnne8EndBattleText3:
	TX_FAR _SSAnne8EndBattleText3
	db "@"

SSAnne8AfterBattleText3:
	TX_FAR _SSAnne8AfterBattleText3
	db "@"

SSAnne8BattleText4:
	TX_FAR _SSAnne8BattleText4
	db "@"

SSAnne8EndBattleText4:
	TX_FAR _SSAnne8EndBattleText4
	db "@"

SSAnne8AfterBattleText4:
	TX_FAR _SSAnne8AfterBattleText4
	db "@"

SSAnne8Text5:
	TX_FAR _SSAnne8Text5
	db "@"

SSAnne8Text6:
	TX_FAR _SSAnne8Text6
	db "@"

SSAnne8Text7:
	TX_FAR _SSAnne8Text7
	db "@"

SSAnne8Text9:
	TX_FAR _SSAnne8Text9
	db "@"

SSAnne8Text11:
	TX_FAR _SSAnne8Text11
	db "@"
