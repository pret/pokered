Route10_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route10TrainerHeader0
	ld de, Route10_ScriptPointers
	ld a, [wRoute10CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute10CurScript], a
	ret

Route10_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route10_TextPointers:
	dw Route10Text1
	dw Route10Text2
	dw Route10Text3
	dw Route10Text4
	dw Route10Text5
	dw Route10Text6
	dw Route10Text7
	dw PokeCenterSignText
	dw Route10Text9
	dw Route10Text10

Route10TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_10_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_10_TRAINER_0
	dw Route10BattleText1 ; TextBeforeBattle
	dw Route10AfterBattleText1 ; TextAfterBattle
	dw Route10EndBattleText1 ; TextEndBattle
	dw Route10EndBattleText1 ; TextEndBattle

Route10TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_10_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_10_TRAINER_1
	dw Route10BattleText2 ; TextBeforeBattle
	dw Route10AfterBattleText2 ; TextAfterBattle
	dw Route10EndBattleText2 ; TextEndBattle
	dw Route10EndBattleText2 ; TextEndBattle

Route10TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_10_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_10_TRAINER_2
	dw Route10BattleText3 ; TextBeforeBattle
	dw Route10AfterBattleText3 ; TextAfterBattle
	dw Route10EndBattleText3 ; TextEndBattle
	dw Route10EndBattleText3 ; TextEndBattle

Route10TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_10_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_10_TRAINER_3
	dw Route10BattleText4 ; TextBeforeBattle
	dw Route10AfterBattleText4 ; TextAfterBattle
	dw Route10EndBattleText4 ; TextEndBattle
	dw Route10EndBattleText4 ; TextEndBattle

Route10TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_10_TRAINER_4
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_10_TRAINER_4
	dw Route10BattleText5 ; TextBeforeBattle
	dw Route10AfterBattleText5 ; TextAfterBattle
	dw Route10EndBattleText5 ; TextEndBattle
	dw Route10EndBattleText5 ; TextEndBattle

Route10TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_10_TRAINER_5
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_10_TRAINER_5
	dw Route10BattleText6 ; TextBeforeBattle
	dw Route10AfterBattleText6 ; TextAfterBattle
	dw Route10EndBattleText6 ; TextEndBattle
	dw Route10EndBattleText6 ; TextEndBattle

	db $ff

Route10Text1:
	text_asm
	ld hl, Route10TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText1:
	text_far _Route10BattleText1
	text_end

Route10EndBattleText1:
	text_far _Route10EndBattleText1
	text_end

Route10AfterBattleText1:
	text_far _Route10AfterBattleText1
	text_end

Route10Text2:
	text_asm
	ld hl, Route10TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText2:
	text_far _Route10BattleText2
	text_end

Route10EndBattleText2:
	text_far _Route10EndBattleText2
	text_end

Route10AfterBattleText2:
	text_far _Route10AfterBattleText2
	text_end

Route10Text3:
	text_asm
	ld hl, Route10TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText3:
	text_far _Route10BattleText3
	text_end

Route10EndBattleText3:
	text_far _Route10EndBattleText3
	text_end

Route10AfterBattleText3:
	text_far _Route10AfterBattleText3
	text_end

Route10Text4:
	text_asm
	ld hl, Route10TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText4:
	text_far _Route10BattleText4
	text_end

Route10EndBattleText4:
	text_far _Route10EndBattleText4
	text_end

Route10AfterBattleText4:
	text_far _Route10AfterBattleText4
	text_end

Route10Text5:
	text_asm
	ld hl, Route10TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText5:
	text_far _Route10BattleText5
	text_end

Route10EndBattleText5:
	text_far _Route10EndBattleText5
	text_end

Route10AfterBattleText5:
	text_far _Route10AfterBattleText5
	text_end

Route10Text6:
	text_asm
	ld hl, Route10TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText6:
	text_far _Route10BattleText6
	text_end

Route10EndBattleText6:
	text_far _Route10EndBattleText6
	text_end

Route10AfterBattleText6:
	text_far _Route10AfterBattleText6
	text_end

Route10Text9:
Route10Text7:
	text_far _Route10Text7 ; _Route10Text9
	text_end

Route10Text10:
	text_far _Route10Text10
	text_end
