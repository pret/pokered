Route14_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route14TrainerHeader0
	ld de, Route14_ScriptPointers
	ld a, [wRoute14CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute14CurScript], a
	ret

Route14_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route14_TextPointers:
	dw Route14Text1
	dw Route14Text2
	dw Route14Text3
	dw Route14Text4
	dw Route14Text5
	dw Route14Text6
	dw Route14Text7
	dw Route14Text8
	dw Route14Text9
	dw Route14Text10
	dw Route14Text11

Route14TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_0
	dw Route14BattleText1 ; TextBeforeBattle
	dw Route14AfterBattleText1 ; TextAfterBattle
	dw Route14EndBattleText1 ; TextEndBattle
	dw Route14EndBattleText1 ; TextEndBattle

Route14TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_1
	dw Route14BattleText2 ; TextBeforeBattle
	dw Route14AfterBattleText2 ; TextAfterBattle
	dw Route14EndBattleText2 ; TextEndBattle
	dw Route14EndBattleText2 ; TextEndBattle

Route14TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_2
	dw Route14BattleText3 ; TextBeforeBattle
	dw Route14AfterBattleText3 ; TextAfterBattle
	dw Route14EndBattleText3 ; TextEndBattle
	dw Route14EndBattleText3 ; TextEndBattle

Route14TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_3
	dw Route14BattleText4 ; TextBeforeBattle
	dw Route14AfterBattleText4 ; TextAfterBattle
	dw Route14EndBattleText4 ; TextEndBattle
	dw Route14EndBattleText4 ; TextEndBattle

Route14TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_4
	dw Route14BattleText5 ; TextBeforeBattle
	dw Route14AfterBattleText5 ; TextAfterBattle
	dw Route14EndBattleText5 ; TextEndBattle
	dw Route14EndBattleText5 ; TextEndBattle

Route14TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_5
	dw Route14BattleText6 ; TextBeforeBattle
	dw Route14AfterBattleText6 ; TextAfterBattle
	dw Route14EndBattleText6 ; TextEndBattle
	dw Route14EndBattleText6 ; TextEndBattle

Route14TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_6
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_6
	dw Route14BattleText7 ; TextBeforeBattle
	dw Route14AfterBattleText7 ; TextAfterBattle
	dw Route14EndBattleText7 ; TextEndBattle
	dw Route14EndBattleText7 ; TextEndBattle

Route14TrainerHeader7:
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_7, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_7, 1
	dw Route14BattleText8 ; TextBeforeBattle
	dw Route14AfterBattleText8 ; TextAfterBattle
	dw Route14EndBattleText8 ; TextEndBattle
	dw Route14EndBattleText8 ; TextEndBattle

Route14TrainerHeader8:
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_8, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_8, 1
	dw Route14BattleText9 ; TextBeforeBattle
	dw Route14AfterBattleText9 ; TextAfterBattle
	dw Route14EndBattleText9 ; TextEndBattle
	dw Route14EndBattleText9 ; TextEndBattle

Route14TrainerHeader9:
	dbEventFlagBit EVENT_BEAT_ROUTE_14_TRAINER_9, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_14_TRAINER_9, 1
	dw Route14BattleText10 ; TextBeforeBattle
	dw Route14AfterBattleText10 ; TextAfterBattle
	dw Route14EndBattleText10 ; TextEndBattle
	dw Route14EndBattleText10 ; TextEndBattle

	db $ff

Route14Text1:
	text_asm
	ld hl, Route14TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText1:
	text_far _Route14BattleText1
	text_end

Route14EndBattleText1:
	text_far _Route14EndBattleText1
	text_end

Route14AfterBattleText1:
	text_far _Route14AfterBattleText1
	text_end

Route14Text2:
	text_asm
	ld hl, Route14TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText2:
	text_far _Route14BattleText2
	text_end

Route14EndBattleText2:
	text_far _Route14EndBattleText2
	text_end

Route14AfterBattleText2:
	text_far _Route14AfterBattleText2
	text_end

Route14Text3:
	text_asm
	ld hl, Route14TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText3:
	text_far _Route14BattleText3
	text_end

Route14EndBattleText3:
	text_far _Route14EndBattleText3
	text_end

Route14AfterBattleText3:
	text_far _Route14AfterBattleText3
	text_end

Route14Text4:
	text_asm
	ld hl, Route14TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText4:
	text_far _Route14BattleText4
	text_end

Route14EndBattleText4:
	text_far _Route14EndBattleText4
	text_end

Route14AfterBattleText4:
	text_far _Route14AfterBattleText4
	text_end

Route14Text5:
	text_asm
	ld hl, Route14TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText5:
	text_far _Route14BattleText5
	text_end

Route14EndBattleText5:
	text_far _Route14EndBattleText5
	text_end

Route14AfterBattleText5:
	text_far _Route14AfterBattleText5
	text_end

Route14Text6:
	text_asm
	ld hl, Route14TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText6:
	text_far _Route14BattleText6
	text_end

Route14EndBattleText6:
	text_far _Route14EndBattleText6
	text_end

Route14AfterBattleText6:
	text_far _Route14AfterBattleText6
	text_end

Route14Text7:
	text_asm
	ld hl, Route14TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText7:
	text_far _Route14BattleText7
	text_end

Route14EndBattleText7:
	text_far _Route14EndBattleText7
	text_end

Route14AfterBattleText7:
	text_far _Route14AfterBattleText7
	text_end

Route14Text8:
	text_asm
	ld hl, Route14TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText8:
	text_far _Route14BattleText8
	text_end

Route14EndBattleText8:
	text_far _Route14EndBattleText8
	text_end

Route14AfterBattleText8:
	text_far _Route14AfterBattleText8
	text_end

Route14Text9:
	text_asm
	ld hl, Route14TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText9:
	text_far _Route14BattleText9
	text_end

Route14EndBattleText9:
	text_far _Route14EndBattleText9
	text_end

Route14AfterBattleText9:
	text_far _Route14AfterBattleText9
	text_end

Route14Text10:
	text_asm
	ld hl, Route14TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText10:
	text_far _Route14BattleText10
	text_end

Route14EndBattleText10:
	text_far _Route14EndBattleText10
	text_end

Route14AfterBattleText10:
	text_far _Route14AfterBattleText10
	text_end

Route14Text11:
	text_far _Route14Text11
	text_end
