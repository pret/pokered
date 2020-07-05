Route17_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route17TrainerHeader0
	ld de, Route17_ScriptPointers
	ld a, [wRoute17CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute17CurScript], a
	ret

Route17_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route17_TextPointers:
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

Route17TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_0
	dw Route17BattleText1 ; TextBeforeBattle
	dw Route17AfterBattleText1 ; TextAfterBattle
	dw Route17EndBattleText1 ; TextEndBattle
	dw Route17EndBattleText1 ; TextEndBattle

Route17TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_1
	dw Route17BattleText2 ; TextBeforeBattle
	dw Route17AfterBattleText2 ; TextAfterBattle
	dw Route17EndBattleText2 ; TextEndBattle
	dw Route17EndBattleText2 ; TextEndBattle

Route17TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_2
	dw Route17BattleText3 ; TextBeforeBattle
	dw Route17AfterBattleText3 ; TextAfterBattle
	dw Route17EndBattleText3 ; TextEndBattle
	dw Route17EndBattleText3 ; TextEndBattle

Route17TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_3
	dw Route17BattleText4 ; TextBeforeBattle
	dw Route17AfterBattleText4 ; TextAfterBattle
	dw Route17EndBattleText4 ; TextEndBattle
	dw Route17EndBattleText4 ; TextEndBattle

Route17TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_4
	dw Route17BattleText5 ; TextBeforeBattle
	dw Route17AfterBattleText5 ; TextAfterBattle
	dw Route17EndBattleText5 ; TextEndBattle
	dw Route17EndBattleText5 ; TextEndBattle

Route17TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_5
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_5
	dw Route17BattleText6 ; TextBeforeBattle
	dw Route17AfterBattleText6 ; TextAfterBattle
	dw Route17EndBattleText6 ; TextEndBattle
	dw Route17EndBattleText6 ; TextEndBattle

Route17TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_6
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_6
	dw Route17BattleText7 ; TextBeforeBattle
	dw Route17AfterBattleText7 ; TextAfterBattle
	dw Route17EndBattleText7 ; TextEndBattle
	dw Route17EndBattleText7 ; TextEndBattle

Route17TrainerHeader7:
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_7, 1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_7, 1
	dw Route17BattleText8 ; TextBeforeBattle
	dw Route17AfterBattleText8 ; TextAfterBattle
	dw Route17EndBattleText8 ; TextEndBattle
	dw Route17EndBattleText8 ; TextEndBattle

Route17TrainerHeader8:
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_8, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_8, 1
	dw Route17BattleText9 ; TextBeforeBattle
	dw Route17AfterBattleText9 ; TextAfterBattle
	dw Route17EndBattleText9 ; TextEndBattle
	dw Route17EndBattleText9 ; TextEndBattle

Route17TrainerHeader9:
	dbEventFlagBit EVENT_BEAT_ROUTE_17_TRAINER_9, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_17_TRAINER_9, 1
	dw Route17BattleText10 ; TextBeforeBattle
	dw Route17AfterBattleText10 ; TextAfterBattle
	dw Route17EndBattleText10 ; TextEndBattle
	dw Route17EndBattleText10 ; TextEndBattle

	db $ff

Route17Text1:
	text_asm
	ld hl, Route17TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText1:
	text_far _Route17BattleText1
	text_end

Route17EndBattleText1:
	text_far _Route17EndBattleText1
	text_end

Route17AfterBattleText1:
	text_far _Route17AfterBattleText1
	text_end

Route17Text2:
	text_asm
	ld hl, Route17TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText2:
	text_far _Route17BattleText2
	text_end

Route17EndBattleText2:
	text_far _Route17EndBattleText2
	text_end

Route17AfterBattleText2:
	text_far _Route17AfterBattleText2
	text_end

Route17Text3:
	text_asm
	ld hl, Route17TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText3:
	text_far _Route17BattleText3
	text_end

Route17EndBattleText3:
	text_far _Route17EndBattleText3
	text_end

Route17AfterBattleText3:
	text_far _Route17AfterBattleText3
	text_end

Route17Text4:
	text_asm
	ld hl, Route17TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText4:
	text_far _Route17BattleText4
	text_end

Route17EndBattleText4:
	text_far _Route17EndBattleText4
	text_end

Route17AfterBattleText4:
	text_far _Route17AfterBattleText4
	text_end

Route17Text5:
	text_asm
	ld hl, Route17TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText5:
	text_far _Route17BattleText5
	text_end

Route17EndBattleText5:
	text_far _Route17EndBattleText5
	text_end

Route17AfterBattleText5:
	text_far _Route17AfterBattleText5
	text_end

Route17Text6:
	text_asm
	ld hl, Route17TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText6:
	text_far _Route17BattleText6
	text_end

Route17EndBattleText6:
	text_far _Route17EndBattleText6
	text_end

Route17AfterBattleText6:
	text_far _Route17AfterBattleText6
	text_end

Route17Text7:
	text_asm
	ld hl, Route17TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText7:
	text_far _Route17BattleText7
	text_end

Route17EndBattleText7:
	text_far _Route17EndBattleText7
	text_end

Route17AfterBattleText7:
	text_far _Route17AfterBattleText7
	text_end

Route17Text8:
	text_asm
	ld hl, Route17TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText8:
	text_far _Route17BattleText8
	text_end

Route17EndBattleText8:
	text_far _Route17EndBattleText8
	text_end

Route17AfterBattleText8:
	text_far _Route17AfterBattleText8
	text_end

Route17Text9:
	text_asm
	ld hl, Route17TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText9:
	text_far _Route17BattleText9
	text_end

Route17EndBattleText9:
	text_far _Route17EndBattleText9
	text_end

Route17AfterBattleText9:
	text_far _Route17AfterBattleText9
	text_end

Route17Text10:
	text_asm
	ld hl, Route17TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText10:
	text_far _Route17BattleText10
	text_end

Route17EndBattleText10:
	text_far _Route17EndBattleText10
	text_end

Route17AfterBattleText10:
	text_far _Route17AfterBattleText10
	text_end

Route17Text11:
	text_far _Route17Text11
	text_end

Route17Text12:
	text_far _Route17Text12
	text_end

Route17Text13:
	text_far _Route17Text13
	text_end

Route17Text14:
	text_far _Route17Text14
	text_end

Route17Text15:
	text_far _Route17Text15
	text_end

Route17Text16:
	text_far _Route17Text16
	text_end
