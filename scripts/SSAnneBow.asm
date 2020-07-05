SSAnneBow_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SSAnne5TrainerHeader0
	ld de, SSAnneBow_ScriptPointers
	ld a, [wSSAnneBowCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnneBowCurScript], a
	ret

SSAnneBow_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SSAnneBow_TextPointers:
	dw SSAnne5Text1
	dw SSAnne5Text2
	dw SSAnne5Text3
	dw SSAnne5Text4
	dw SSAnne5Text5

SSAnne5TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_5_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_5_TRAINER_0
	dw SSAnne5BattleText1 ; TextBeforeBattle
	dw SSAnne5AfterBattleText1 ; TextAfterBattle
	dw SSAnne5EndBattleText1 ; TextEndBattle
	dw SSAnne5EndBattleText1 ; TextEndBattle

SSAnne5TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_SS_ANNE_5_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_5_TRAINER_1
	dw SSAnne5BattleText2 ; TextBeforeBattle
	dw SSAnne5AfterBattleText2 ; TextAfterBattle
	dw SSAnne5EndBattleText2 ; TextEndBattle
	dw SSAnne5EndBattleText2 ; TextEndBattle

	db $ff

SSAnne5Text1:
	text_far _SSAnne5Text1
	text_end

SSAnne5Text2:
	text_far _SSAnne5Text2
	text_end

SSAnne5Text3:
	text_far _SSAnne5Text3
	text_end

SSAnne5Text4:
	text_asm
	ld hl, SSAnne5TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne5BattleText1:
	text_far _SSAnne5BattleText1
	text_end

SSAnne5EndBattleText1:
	text_far _SSAnne5EndBattleText1
	text_end

SSAnne5AfterBattleText1:
	text_far _SSAnne5AfterBattleText1
	text_end

SSAnne5Text5:
	text_asm
	ld hl, SSAnne5TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne5BattleText2:
	text_far _SSAnne5BattleText2
	text_end

SSAnne5EndBattleText2:
	text_far _SSAnne5EndBattleText2
	text_end

SSAnne5AfterBattleText2:
	text_far _SSAnne5AfterBattleText2
	text_end
