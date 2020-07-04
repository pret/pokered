Route8_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route8TrainerHeader0
	ld de, Route8_ScriptPointers
	ld a, [wRoute8CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute8CurScript], a
	ret

Route8_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route8_TextPointers:
	dw Route8Text1
	dw Route8Text2
	dw Route8Text3
	dw Route8Text4
	dw Route8Text5
	dw Route8Text6
	dw Route8Text7
	dw Route8Text8
	dw Route8Text9
	dw Route8Text10

Route8TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_0
	dw Route8BattleText1 ; TextBeforeBattle
	dw Route8AfterBattleText1 ; TextAfterBattle
	dw Route8EndBattleText1 ; TextEndBattle
	dw Route8EndBattleText1 ; TextEndBattle

Route8TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_1
	dw Route8BattleText2 ; TextBeforeBattle
	dw Route8AfterBattleText2 ; TextAfterBattle
	dw Route8EndBattleText2 ; TextEndBattle
	dw Route8EndBattleText2 ; TextEndBattle

Route8TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_2
	dw Route8BattleText3 ; TextBeforeBattle
	dw Route8AfterBattleText3 ; TextAfterBattle
	dw Route8EndBattleText3 ; TextEndBattle
	dw Route8EndBattleText3 ; TextEndBattle

Route8TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_3
	dw Route8BattleText4 ; TextBeforeBattle
	dw Route8AfterBattleText4 ; TextAfterBattle
	dw Route8EndBattleText4 ; TextEndBattle
	dw Route8EndBattleText4 ; TextEndBattle

Route8TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_4
	dw Route8BattleText5 ; TextBeforeBattle
	dw Route8AfterBattleText5 ; TextAfterBattle
	dw Route8EndBattleText5 ; TextEndBattle
	dw Route8EndBattleText5 ; TextEndBattle

Route8TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_5
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_5
	dw Route8BattleText6 ; TextBeforeBattle
	dw Route8AfterBattleText6 ; TextAfterBattle
	dw Route8EndBattleText6 ; TextEndBattle
	dw Route8EndBattleText6 ; TextEndBattle

Route8TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_6
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_6
	dw Route8BattleText7 ; TextBeforeBattle
	dw Route8AfterBattleText7 ; TextAfterBattle
	dw Route8EndBattleText7 ; TextEndBattle
	dw Route8EndBattleText7 ; TextEndBattle

Route8TrainerHeader7:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_7, 1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_7, 1
	dw Route8BattleText8 ; TextBeforeBattle
	dw Route8AfterBattleText8 ; TextAfterBattle
	dw Route8EndBattleText8 ; TextEndBattle
	dw Route8EndBattleText8 ; TextEndBattle

Route8TrainerHeader8:
	dbEventFlagBit EVENT_BEAT_ROUTE_8_TRAINER_8, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_8_TRAINER_8, 1
	dw Route8BattleText9 ; TextBeforeBattle
	dw Route8AfterBattleText9 ; TextAfterBattle
	dw Route8EndBattleText9 ; TextEndBattle
	dw Route8EndBattleText9 ; TextEndBattle

	db $ff

Route8Text1:
	text_asm
	ld hl, Route8TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText1:
	text_far _Route8BattleText1
	text_end

Route8EndBattleText1:
	text_far _Route8EndBattleText1
	text_end

Route8AfterBattleText1:
	text_far _Route8AfterBattleText1
	text_end

Route8Text2:
	text_asm
	ld hl, Route8TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText2:
	text_far _Route8BattleText2
	text_end

Route8EndBattleText2:
	text_far _Route8EndBattleText2
	text_end

Route8AfterBattleText2:
	text_far _Route8AfterBattleText2
	text_end

Route8Text3:
	text_asm
	ld hl, Route8TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText3:
	text_far _Route8BattleText3
	text_end

Route8EndBattleText3:
	text_far _Route8EndBattleText3
	text_end

Route8AfterBattleText3:
	text_far _Route8AfterBattleText3
	text_end

Route8Text4:
	text_asm
	ld hl, Route8TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText4:
	text_far _Route8BattleText4
	text_end

Route8EndBattleText4:
	text_far _Route8EndBattleText4
	text_end

Route8AfterBattleText4:
	text_far _Route8AfterBattleText4
	text_end

Route8Text5:
	text_asm
	ld hl, Route8TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText5:
	text_far _Route8BattleText5
	text_end

Route8EndBattleText5:
	text_far _Route8EndBattleText5
	text_end

Route8AfterBattleText5:
	text_far _Route8AfterBattleText5
	text_end

Route8Text6:
	text_asm
	ld hl, Route8TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText6:
	text_far _Route8BattleText6
	text_end

Route8EndBattleText6:
	text_far _Route8EndBattleText6
	text_end

Route8AfterBattleText6:
	text_far _Route8AfterBattleText6
	text_end

Route8Text7:
	text_asm
	ld hl, Route8TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText7:
	text_far _Route8BattleText7
	text_end

Route8EndBattleText7:
	text_far _Route8EndBattleText7
	text_end

Route8AfterBattleText7:
	text_far _Route8AfterBattleText7
	text_end

Route8Text8:
	text_asm
	ld hl, Route8TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText8:
	text_far _Route8BattleText8
	text_end

Route8EndBattleText8:
	text_far _Route8EndBattleText8
	text_end

Route8AfterBattleText8:
	text_far _Route8AfterBattleText8
	text_end

Route8Text9:
	text_asm
	ld hl, Route8TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText9:
	text_far _Route8BattleText9
	text_end

Route8EndBattleText9:
	text_far _Route8EndBattleText9
	text_end

Route8AfterBattleText9:
	text_far _Route8AfterBattleText9
	text_end

Route8Text10:
	text_far _Route8Text10
	text_end
