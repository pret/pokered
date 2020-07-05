SSAnneB1FRooms_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SSAnne10TrainerHeader0
	ld de, SSAnneB1FRooms_ScriptPointers
	ld a, [wSSAnneB1FRoomsCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnneB1FRoomsCurScript], a
	ret

SSAnneB1FRooms_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SSAnneB1FRooms_TextPointers:
	dw SSAnne10Text1
	dw SSAnne10Text2
	dw SSAnne10Text3
	dw SSAnne10Text4
	dw SSAnne10Text5
	dw SSAnne10Text6
	dw SSAnne10Text7
	dw SSAnne10Text8
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText

SSAnne10TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_10_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_10_TRAINER_0
	dw SSAnne10BattleText1 ; TextBeforeBattle
	dw SSAnne10AfterBattleText1 ; TextAfterBattle
	dw SSAnne10EndBattleText1 ; TextEndBattle
	dw SSAnne10EndBattleText1 ; TextEndBattle

SSAnne10TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_10_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_10_TRAINER_1
	dw SSAnne10BattleText2 ; TextBeforeBattle
	dw SSAnne10AfterBattleText2 ; TextAfterBattle
	dw SSAnne10EndBattleText2 ; TextEndBattle
	dw SSAnne10EndBattleText2 ; TextEndBattle

SSAnne10TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_10_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_10_TRAINER_2
	dw SSAnne10BattleText3 ; TextBeforeBattle
	dw SSAnne10AfterBattleText3 ; TextAfterBattle
	dw SSAnne10EndBattleText3 ; TextEndBattle
	dw SSAnne10EndBattleText3 ; TextEndBattle

SSAnne10TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_10_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_10_TRAINER_3
	dw SSAnne10BattleText4 ; TextBeforeBattle
	dw SSAnne10AfterBattleText4 ; TextAfterBattle
	dw SSAnne10EndBattleText4 ; TextEndBattle
	dw SSAnne10EndBattleText4 ; TextEndBattle

SSAnne10TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_10_TRAINER_4
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_10_TRAINER_4
	dw SSAnne10BattleText5 ; TextBeforeBattle
	dw SSAnne10AfterBattleText5 ; TextAfterBattle
	dw SSAnne10EndBattleText5 ; TextEndBattle
	dw SSAnne10EndBattleText5 ; TextEndBattle

SSAnne10TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_10_TRAINER_5
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_10_TRAINER_5
	dw SSAnne10BattleText6 ; TextBeforeBattle
	dw SSAnne10AfterBattleText6 ; TextAfterBattle
	dw SSAnne10EndBattleText6 ; TextEndBattle
	dw SSAnne10EndBattleText6 ; TextEndBattle

	db $ff

SSAnne10Text1:
	text_asm
	ld hl, SSAnne10TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne10Text2:
	text_asm
	ld hl, SSAnne10TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne10Text3:
	text_asm
	ld hl, SSAnne10TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnne10Text4:
	text_asm
	ld hl, SSAnne10TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnne10Text5:
	text_asm
	ld hl, SSAnne10TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

SSAnne10Text6:
	text_asm
	ld hl, SSAnne10TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

SSAnne10Text8:
	text_far _SSAnne10Text8
	text_asm
	ld a, MACHOKE
	call PlayCry
	jp TextScriptEnd

SSAnne10BattleText1:
	text_far _SSAnne10BattleText1
	text_end

SSAnne10EndBattleText1:
	text_far _SSAnne10EndBattleText1
	text_end

SSAnne10AfterBattleText1:
	text_far _SSAnne10AfterBattleText1
	text_end

SSAnne10BattleText2:
	text_far _SSAnne10BattleText2
	text_end

SSAnne10EndBattleText2:
	text_far _SSAnne10EndBattleText2
	text_end

SSAnne10AfterBattleText2:
	text_far _SSAnne10AfterBattleText2
	text_end

SSAnne10BattleText3:
	text_far _SSAnne10BattleText3
	text_end

SSAnne10EndBattleText3:
	text_far _SSAnne10EndBattleText3
	text_end

SSAnne10AfterBattleText3:
	text_far _SSAnne10AfterBattleText3
	text_end

SSAnne10BattleText4:
	text_far _SSAnne10BattleText4
	text_end

SSAnne10EndBattleText4:
	text_far _SSAnne10EndBattleText4
	text_end

SSAnne10AfterBattleText4:
	text_far _SSAnne10AfterBattleText4
	text_end

SSAnne10BattleText5:
	text_far _SSAnne10BattleText5
	text_end

SSAnne10EndBattleText5:
	text_far _SSAnne10EndBattleText5
	text_end

SSAnne10AfterBattleText5:
	text_far _SSAnne10AfterBattleText5
	text_end

SSAnne10BattleText6:
	text_far _SSAnne10BattleText6
	text_end

SSAnne10EndBattleText6:
	text_far _SSAnne10EndBattleText6
	text_end

SSAnne10AfterBattleText6:
	text_far _SSAnne10AfterBattleText6
	text_end

SSAnne10Text7:
	text_far _SSAnne10Text7
	text_end
