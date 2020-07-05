Route6_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route6TrainerHeader0
	ld de, Route6_ScriptPointers
	ld a, [wRoute6CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute6CurScript], a
	ret

Route6_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route6_TextPointers:
	dw Route6Text1
	dw Route6Text2
	dw Route6Text3
	dw Route6Text4
	dw Route6Text5
	dw Route6Text6
	dw Route6Text7

Route6TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_0
	dw Route6BattleText1 ; TextBeforeBattle
	dw Route6AfterBattleText1 ; TextAfterBattle
	dw Route6EndBattleText1 ; TextEndBattle
	dw Route6EndBattleText1 ; TextEndBattle

Route6TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_1
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_1
	dw Route6BattleText2 ; TextBeforeBattle
	dw Route6AfterBattleText1 ; TextAfterBattle
	dw Route6EndBattleText2 ; TextEndBattle
	dw Route6EndBattleText2 ; TextEndBattle

Route6TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_2
	dw Route6BattleText3 ; TextBeforeBattle
	dw Route6AfterBattleText3 ; TextAfterBattle
	dw Route6EndBattleText3 ; TextEndBattle
	dw Route6EndBattleText3 ; TextEndBattle

Route6TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_3
	dw Route6BattleText4 ; TextBeforeBattle
	dw Route6AfterBattleText4 ; TextAfterBattle
	dw Route6EndBattleText4 ; TextEndBattle
	dw Route6EndBattleText4 ; TextEndBattle

Route6TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_4
	dw Route6BattleText5 ; TextBeforeBattle
	dw Route6AfterBattleText5 ; TextAfterBattle
	dw Route6EndBattleText5 ; TextEndBattle
	dw Route6EndBattleText5 ; TextEndBattle

Route6TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_6_TRAINER_5
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_6_TRAINER_5
	dw Route6BattleText6 ; TextBeforeBattle
	dw Route6AfterBattleText6 ; TextAfterBattle
	dw Route6EndBattleText6 ; TextEndBattle
	dw Route6EndBattleText6 ; TextEndBattle

	db $ff

Route6Text1:
	text_asm
	ld hl, Route6TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText1:
	text_far _Route6BattleText1
	text_end

Route6EndBattleText1:
	text_far _Route6EndBattleText1
	text_end

Route6AfterBattleText1:
	text_far _Route6AfterBattleText1
	text_end

Route6Text2:
	text_asm
	ld hl, Route6TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText2:
	text_far _Route6BattleText2
	text_end

Route6EndBattleText2:
	text_far _Route6EndBattleText2
	text_end

Route6Text3:
	text_asm
	ld hl, Route6TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText3:
	text_far _Route6BattleText3
	text_end

Route6EndBattleText3:
	text_far _Route6EndBattleText3
	text_end

Route6AfterBattleText3:
	text_far _Route6AfterBattleText3
	text_end

Route6Text4:
	text_asm
	ld hl, Route6TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText4:
	text_far _Route6BattleText4
	text_end

Route6EndBattleText4:
	text_far _Route6EndBattleText4
	text_end

Route6AfterBattleText4:
	text_far _Route6AfterBattleText4
	text_end

Route6Text5:
	text_asm
	ld hl, Route6TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText5:
	text_far _Route6BattleText5
	text_end

Route6EndBattleText5:
	text_far _Route6EndBattleText5
	text_end

Route6AfterBattleText5:
	text_far _Route6AfterBattleText5
	text_end

Route6Text6:
	text_asm
	ld hl, Route6TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route6BattleText6:
	text_far _Route6BattleText6
	text_end

Route6EndBattleText6:
	text_far _Route6EndBattleText6
	text_end

Route6AfterBattleText6:
	text_far _Route6AfterBattleText6
	text_end

Route6Text7:
	text_far _Route6Text7
	text_end
