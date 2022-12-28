Route6_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route6TrainerHeaders
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

Route6TrainerHeaders:
	def_trainers
Route6TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_6_TRAINER_0, 0, Route6BattleText1, Route6EndBattleText1, Route6AfterBattleText1
Route6TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_6_TRAINER_1, 0, Route6BattleText2, Route6EndBattleText2, Route6AfterBattleText1
Route6TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_6_TRAINER_2, 4, Route6BattleText3, Route6EndBattleText3, Route6AfterBattleText3
Route6TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_6_TRAINER_3, 3, Route6BattleText4, Route6EndBattleText4, Route6AfterBattleText4
Route6TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_6_TRAINER_4, 3, Route6BattleText5, Route6EndBattleText5, Route6AfterBattleText5
Route6TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_6_TRAINER_5, 3, Route6BattleText6, Route6EndBattleText6, Route6AfterBattleText6
	db -1 ; end

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
