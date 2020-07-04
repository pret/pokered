Route21_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route21TrainerHeader0
	ld de, Route21_ScriptPointers
	ld a, [wRoute21CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute21CurScript], a
	ret

Route21_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route21_TextPointers:
	dw Route21Text1
	dw Route21Text2
	dw Route21Text3
	dw Route21Text4
	dw Route21Text5
	dw Route21Text6
	dw Route21Text7
	dw Route21Text8
	dw Route21Text9

Route21TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_0
	dw Route21BattleText1 ; TextBeforeBattle
	dw Route21AfterBattleText1 ; TextAfterBattle
	dw Route21EndBattleText1 ; TextEndBattle
	dw Route21EndBattleText1 ; TextEndBattle

Route21TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_1
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_1
	dw Route21BattleText2 ; TextBeforeBattle
	dw Route21AfterBattleText2 ; TextAfterBattle
	dw Route21EndBattleText2 ; TextEndBattle
	dw Route21EndBattleText2 ; TextEndBattle

Route21TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_2
	dw Route21BattleText3 ; TextBeforeBattle
	dw Route21AfterBattleText3 ; TextAfterBattle
	dw Route21EndBattleText3 ; TextEndBattle
	dw Route21EndBattleText3 ; TextEndBattle

Route21TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_3
	dw Route21BattleText4 ; TextBeforeBattle
	dw Route21AfterBattleText4 ; TextAfterBattle
	dw Route21EndBattleText4 ; TextEndBattle
	dw Route21EndBattleText4 ; TextEndBattle

Route21TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_4
	dw Route21BattleText5 ; TextBeforeBattle
	dw Route21AfterBattleText5 ; TextAfterBattle
	dw Route21EndBattleText5 ; TextEndBattle
	dw Route21EndBattleText5 ; TextEndBattle

Route21TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_5
	dw Route21BattleText6 ; TextBeforeBattle
	dw Route21AfterBattleText6 ; TextAfterBattle
	dw Route21EndBattleText6 ; TextEndBattle
	dw Route21EndBattleText6 ; TextEndBattle

Route21TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_6
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_6
	dw Route21BattleText7 ; TextBeforeBattle
	dw Route21AfterBattleText7 ; TextAfterBattle
	dw Route21EndBattleText7 ; TextEndBattle
	dw Route21EndBattleText7 ; TextEndBattle

Route21TrainerHeader7:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_7, 1
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_7, 1
	dw Route21BattleText8 ; TextBeforeBattle
	dw Route21AfterBattleText8 ; TextAfterBattle
	dw Route21EndBattleText8 ; TextEndBattle
	dw Route21EndBattleText8 ; TextEndBattle

Route21TrainerHeader8:
	dbEventFlagBit EVENT_BEAT_ROUTE_21_TRAINER_8, 1
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_21_TRAINER_8, 1
	dw Route21BattleText9 ; TextBeforeBattle
	dw Route21AfterBattleText9 ; TextAfterBattle
	dw Route21EndBattleText9 ; TextEndBattle
	dw Route21EndBattleText9 ; TextEndBattle

	db $ff

Route21Text1:
	text_asm
	ld hl, Route21TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route21Text2:
	text_asm
	ld hl, Route21TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route21Text3:
	text_asm
	ld hl, Route21TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route21Text4:
	text_asm
	ld hl, Route21TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route21Text5:
	text_asm
	ld hl, Route21TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route21Text6:
	text_asm
	ld hl, Route21TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route21Text7:
	text_asm
	ld hl, Route21TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route21Text8:
	text_asm
	ld hl, Route21TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route21Text9:
	text_asm
	ld hl, Route21TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route21BattleText1:
	text_far _Route21BattleText1
	text_end

Route21EndBattleText1:
	text_far _Route21EndBattleText1
	text_end

Route21AfterBattleText1:
	text_far _Route21AfterBattleText1
	text_end

Route21BattleText2:
	text_far _Route21BattleText2
	text_end

Route21EndBattleText2:
	text_far _Route21EndBattleText2
	text_end

Route21AfterBattleText2:
	text_far _Route21AfterBattleText2
	text_end

Route21BattleText3:
	text_far _Route21BattleText3
	text_end

Route21EndBattleText3:
	text_far _Route21EndBattleText3
	text_end

Route21AfterBattleText3:
	text_far _Route21AfterBattleText3
	text_end

Route21BattleText4:
	text_far _Route21BattleText4
	text_end

Route21EndBattleText4:
	text_far _Route21EndBattleText4
	text_end

Route21AfterBattleText4:
	text_far _Route21AfterBattleText4
	text_end

Route21BattleText5:
	text_far _Route21BattleText5
	text_end

Route21EndBattleText5:
	text_far _Route21EndBattleText5
	text_end

Route21AfterBattleText5:
	text_far _Route21AfterBattleText5
	text_end

Route21BattleText6:
	text_far _Route21BattleText6
	text_end

Route21EndBattleText6:
	text_far _Route21EndBattleText6
	text_end

Route21AfterBattleText6:
	text_far _Route21AfterBattleText6
	text_end

Route21BattleText7:
	text_far _Route21BattleText7
	text_end

Route21EndBattleText7:
	text_far _Route21EndBattleText7
	text_end

Route21AfterBattleText7:
	text_far _Route21AfterBattleText7
	text_end

Route21BattleText8:
	text_far _Route21BattleText8
	text_end

Route21EndBattleText8:
	text_far _Route21EndBattleText8
	text_end

Route21AfterBattleText8:
	text_far _Route21AfterBattleText8
	text_end

Route21BattleText9:
	text_far _Route21BattleText9
	text_end

Route21EndBattleText9:
	text_far _Route21EndBattleText9
	text_end

Route21AfterBattleText9:
	text_far _Route21AfterBattleText9
	text_end
