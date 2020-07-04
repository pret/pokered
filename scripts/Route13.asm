Route13_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route13TrainerHeader0
	ld de, Route13_ScriptPointers
	ld a, [wRoute13CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute13CurScript], a
	ret

Route13_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route13_TextPointers:
	dw Route13Text1
	dw Route13Text2
	dw Route13Text3
	dw Route13Text4
	dw Route13Text5
	dw Route13Text6
	dw Route13Text7
	dw Route13Text8
	dw Route13Text9
	dw Route13Text10
	dw Route13Text11
	dw Route13Text12
	dw Route13Text13

Route13TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_0
	dw Route13BattleText2 ; TextBeforeBattle
	dw Route13AfterBattleText2 ; TextAfterBattle
	dw Route13EndBattleText2 ; TextEndBattle
	dw Route13EndBattleText2 ; TextEndBattle

Route13TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_1
	dw Route13BattleText3 ; TextBeforeBattle
	dw Route13AfterBattleText3 ; TextAfterBattle
	dw Route13EndBattleText3 ; TextEndBattle
	dw Route13EndBattleText3 ; TextEndBattle

Route13TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_2
	dw Route13BattleText4 ; TextBeforeBattle
	dw Route13AfterBattleText4 ; TextAfterBattle
	dw Route13EndBattleText4 ; TextEndBattle
	dw Route13EndBattleText4 ; TextEndBattle

Route13TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_3
	dw Route13BattleText5 ; TextBeforeBattle
	dw Route13AfterBattleText5 ; TextAfterBattle
	dw Route13EndBattleText5 ; TextEndBattle
	dw Route13EndBattleText5 ; TextEndBattle

Route13TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_4
	dw Route13BattleText6 ; TextBeforeBattle
	dw Route13AfterBattleText6 ; TextAfterBattle
	dw Route13EndBattleText6 ; TextEndBattle
	dw Route13EndBattleText6 ; TextEndBattle

Route13TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_5
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_5
	dw Route13BattleText7 ; TextBeforeBattle
	dw Route13AfterBattleText7 ; TextAfterBattle
	dw Route13EndBattleText7 ; TextEndBattle
	dw Route13EndBattleText7 ; TextEndBattle

Route13TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_6
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_6
	dw Route13BattleText8 ; TextBeforeBattle
	dw Route13AfterBattleText8 ; TextAfterBattle
	dw Route13EndBattleText8 ; TextEndBattle
	dw Route13EndBattleText8 ; TextEndBattle

Route13TrainerHeader7:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_7, 1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_7, 1
	dw Route13BattleText9 ; TextBeforeBattle
	dw Route13AfterBattleText9 ; TextAfterBattle
	dw Route13EndBattleText9 ; TextEndBattle
	dw Route13EndBattleText9 ; TextEndBattle

Route13TrainerHeader8:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_8, 1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_8, 1
	dw Route13BattleText10 ; TextBeforeBattle
	dw Route13AfterBattleText10 ; TextAfterBattle
	dw Route13EndBattleText10 ; TextEndBattle
	dw Route13EndBattleText10 ; TextEndBattle

Route13TrainerHeader9:
	dbEventFlagBit EVENT_BEAT_ROUTE_13_TRAINER_9, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_13_TRAINER_9, 1
	dw Route13BattleText11 ; TextBeforeBattle
	dw Route13AfterBattleText11 ; TextAfterBattle
	dw Route13EndBattleText11 ; TextEndBattle
	dw Route13EndBattleText11 ; TextEndBattle

	db $ff

Route13Text1:
	text_asm
	ld hl, Route13TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText2:
	text_far _Route13BattleText2
	text_end

Route13EndBattleText2:
	text_far _Route13EndBattleText2
	text_end

Route13AfterBattleText2:
	text_far _Route13AfterBattleText2
	text_end

Route13Text2:
	text_asm
	ld hl, Route13TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText3:
	text_far _Route13BattleText3
	text_end

Route13EndBattleText3:
	text_far _Route13EndBattleText3
	text_end

Route13AfterBattleText3:
	text_far _Route13AfterBattleText3
	text_end

Route13Text3:
	text_asm
	ld hl, Route13TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText4:
	text_far _Route13BattleText4
	text_end

Route13EndBattleText4:
	text_far _Route13EndBattleText4
	text_end

Route13AfterBattleText4:
	text_far _Route13AfterBattleText4
	text_end

Route13Text4:
	text_asm
	ld hl, Route13TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText5:
	text_far _Route13BattleText5
	text_end

Route13EndBattleText5:
	text_far _Route13EndBattleText5
	text_end

Route13AfterBattleText5:
	text_far _Route13AfterBattleText5
	text_end

Route13Text5:
	text_asm
	ld hl, Route13TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText6:
	text_far _Route13BattleText6
	text_end

Route13EndBattleText6:
	text_far _Route13EndBattleText6
	text_end

Route13AfterBattleText6:
	text_far _Route13AfterBattleText6
	text_end

Route13Text6:
	text_asm
	ld hl, Route13TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText7:
	text_far _Route13BattleText7
	text_end

Route13EndBattleText7:
	text_far _Route13EndBattleText7
	text_end

Route13AfterBattleText7:
	text_far _Route13AfterBattleText7
	text_end

Route13Text7:
	text_asm
	ld hl, Route13TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText8:
	text_far _Route13BattleText8
	text_end

Route13EndBattleText8:
	text_far _Route13EndBattleText8
	text_end

Route13AfterBattleText8:
	text_far _Route13AfterBattleText8
	text_end

Route13Text8:
	text_asm
	ld hl, Route13TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText9:
	text_far _Route13BattleText9
	text_end

Route13EndBattleText9:
	text_far _Route13EndBattleText9
	text_end

Route13AfterBattleText9:
	text_far _Route13AfterBattleText9
	text_end

Route13Text9:
	text_asm
	ld hl, Route13TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText10:
	text_far _Route13BattleText10
	text_end

Route13EndBattleText10:
	text_far _Route13EndBattleText10
	text_end

Route13AfterBattleText10:
	text_far _Route13AfterBattleText10
	text_end

Route13Text10:
	text_asm
	ld hl, Route13TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText11:
	text_far _Route13BattleText11
	text_end

Route13EndBattleText11:
	text_far _Route13EndBattleText11
	text_end

Route13AfterBattleText11:
	text_far _Route13AfterBattleText11
	text_end

Route13Text11:
	text_far _Route13Text11
	text_end

Route13Text12:
	text_far _Route13Text12
	text_end

Route13Text13:
	text_far _Route13Text13
	text_end
