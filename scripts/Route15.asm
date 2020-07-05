Route15_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route15TrainerHeader0
	ld de, Route15_ScriptPointers
	ld a, [wRoute15CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute15CurScript], a
	ret

Route15_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route15_TextPointers:
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

Route15TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_0
	dw Route15BattleText1 ; TextBeforeBattle
	dw Route15AfterBattleText1 ; TextAfterBattle
	dw Route15EndBattleText1 ; TextEndBattle
	dw Route15EndBattleText1 ; TextEndBattle

Route15TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_1
	dw Route15BattleText2 ; TextBeforeBattle
	dw Route15AfterBattleText2 ; TextAfterBattle
	dw Route15EndBattleText2 ; TextEndBattle
	dw Route15EndBattleText2 ; TextEndBattle

Route15TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_2
	dw Route15BattleText3 ; TextBeforeBattle
	dw Route15AfterBattleText3 ; TextAfterBattle
	dw Route15EndBattleText3 ; TextEndBattle
	dw Route15EndBattleText3 ; TextEndBattle

Route15TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_3
	dw Route15BattleText4 ; TextBeforeBattle
	dw Route15AfterBattleText4 ; TextAfterBattle
	dw Route15EndBattleText4 ; TextEndBattle
	dw Route15EndBattleText4 ; TextEndBattle

Route15TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_4
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_4
	dw Route15BattleText5 ; TextBeforeBattle
	dw Route15AfterBattleText5 ; TextAfterBattle
	dw Route15EndBattleText5 ; TextEndBattle
	dw Route15EndBattleText5 ; TextEndBattle

Route15TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_5
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_5
	dw Route15BattleText6 ; TextBeforeBattle
	dw Route15AfterBattleText6 ; TextAfterBattle
	dw Route15EndBattleText6 ; TextEndBattle
	dw Route15EndBattleText6 ; TextEndBattle

Route15TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_6
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_6
	dw Route15BattleText7 ; TextBeforeBattle
	dw Route15AfterBattleText7 ; TextAfterBattle
	dw Route15EndBattleText7 ; TextEndBattle
	dw Route15EndBattleText7 ; TextEndBattle

Route15TrainerHeader7:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_7, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_7, 1
	dw Route15BattleText8 ; TextBeforeBattle
	dw Route15AfterBattleText8 ; TextAfterBattle
	dw Route15EndBattleText8 ; TextEndBattle
	dw Route15EndBattleText8 ; TextEndBattle

Route15TrainerHeader8:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_8, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_8, 1
	dw Route15BattleText9 ; TextBeforeBattle
	dw Route15AfterBattleText9 ; TextAfterBattle
	dw Route15EndBattleText9 ; TextEndBattle
	dw Route15EndBattleText9 ; TextEndBattle

Route15TrainerHeader9:
	dbEventFlagBit EVENT_BEAT_ROUTE_15_TRAINER_9, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_15_TRAINER_9, 1
	dw Route15BattleText10 ; TextBeforeBattle
	dw Route15AfterBattleText10 ; TextAfterBattle
	dw Route15EndBattleText10 ; TextEndBattle
	dw Route15EndBattleText10 ; TextEndBattle

	db $ff

Route15Text1:
	text_asm
	ld hl, Route15TrainerHeader0
	jr Route15TalkToTrainer

Route15Text2:
	text_asm
	ld hl, Route15TrainerHeader1
	jr Route15TalkToTrainer

Route15Text3:
	text_asm
	ld hl, Route15TrainerHeader2
	jr Route15TalkToTrainer

Route15Text4:
	text_asm
	ld hl, Route15TrainerHeader3
	jr Route15TalkToTrainer

Route15Text5:
	text_asm
	ld hl, Route15TrainerHeader4
	jr Route15TalkToTrainer

Route15Text6:
	text_asm
	ld hl, Route15TrainerHeader5
	jr Route15TalkToTrainer

Route15Text7:
	text_asm
	ld hl, Route15TrainerHeader6
	jr Route15TalkToTrainer

Route15Text8:
	text_asm
	ld hl, Route15TrainerHeader7
	jr Route15TalkToTrainer

Route15Text9:
	text_asm
	ld hl, Route15TrainerHeader8
	jr Route15TalkToTrainer

Route15Text10:
	text_asm
	ld hl, Route15TrainerHeader9
Route15TalkToTrainer:
	call TalkToTrainer
	jp TextScriptEnd

Route15BattleText1:
	text_far _Route15BattleText1
	text_end

Route15EndBattleText1:
	text_far _Route15EndBattleText1
	text_end

Route15AfterBattleText1:
	text_far _Route15AfterBattleText1
	text_end

Route15BattleText2:
	text_far _Route15BattleText2
	text_end

Route15EndBattleText2:
	text_far _Route15EndBattleText2
	text_end

Route15AfterBattleText2:
	text_far _Route15AfterBattleText2
	text_end

Route15BattleText3:
	text_far _Route15BattleText3
	text_end

Route15EndBattleText3:
	text_far _Route15EndBattleText3
	text_end

Route15AfterBattleText3:
	text_far _Route15AfterBattleText3
	text_end

Route15BattleText4:
	text_far _Route15BattleText4
	text_end

Route15EndBattleText4:
	text_far _Route15EndBattleText4
	text_end

Route15AfterBattleText4:
	text_far _Route15AfterBattleText4
	text_end

Route15BattleText5:
	text_far _Route15BattleText5
	text_end

Route15EndBattleText5:
	text_far _Route15EndBattleText5
	text_end

Route15AfterBattleText5:
	text_far _Route15AfterBattleText5
	text_end

Route15BattleText6:
	text_far _Route15BattleText6
	text_end

Route15EndBattleText6:
	text_far _Route15EndBattleText6
	text_end

Route15AfterBattleText6:
	text_far _Route15AfterBattleText6
	text_end

Route15BattleText7:
	text_far _Route15BattleText7
	text_end

Route15EndBattleText7:
	text_far _Route15EndBattleText7
	text_end

Route15AfterBattleText7:
	text_far _Route15AfterBattleText7
	text_end

Route15BattleText8:
	text_far _Route15BattleText8
	text_end

Route15EndBattleText8:
	text_far _Route15EndBattleText8
	text_end

Route15AfterBattleText8:
	text_far _Route15AfterBattleText8
	text_end

Route15BattleText9:
	text_far _Route15BattleText9
	text_end

Route15EndBattleText9:
	text_far _Route15EndBattleText9
	text_end

Route15AfterBattleText9:
	text_far _Route15AfterBattleText9
	text_end

Route15BattleText10:
	text_far _Route15BattleText10
	text_end

Route15EndBattleText10:
	text_far _Route15EndBattleText10
	text_end

Route15AfterBattleText10:
	text_far _Route15AfterBattleText10
	text_end

Route15Text12:
	text_far _Route15Text12
	text_end
