Route11_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route11TrainerHeaders
	ld de, Route11_ScriptPointers
	ld a, [wRoute11CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute11CurScript], a
	ret

Route11_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route11_TextPointers:
	dw Route11Text1
	dw Route11Text2
	dw Route11Text3
	dw Route11Text4
	dw Route11Text5
	dw Route11Text6
	dw Route11Text7
	dw Route11Text8
	dw Route11Text9
	dw Route11Text10
	dw Route11Text11

Route11TrainerHeaders:
	def_trainers
Route11TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_0, 3, Route11BattleText1, Route11EndBattleText1, Route11AfterBattleText1
Route11TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_1, 2, Route11BattleText2, Route11EndBattleText2, Route11AfterBattleText2
Route11TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_2, 3, Route11BattleText3, Route11EndBattleText3, Route11AfterBattleText3
Route11TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_3, 3, Route11BattleText4, Route11EndBattleText4, Route11AfterBattleText4
Route11TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_4, 4, Route11BattleText5, Route11EndBattleText5, Route11AfterBattleText5
Route11TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_5, 3, Route11BattleText6, Route11EndBattleText6, Route11AfterBattleText6
Route11TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_6, 3, Route11BattleText7, Route11EndBattleText7, Route11AfterBattleText7
Route11TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_7, 4, Route11BattleText8, Route11EndBattleText8, Route11AfterBattleText8
Route11TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_8, 3, Route11BattleText9, Route11EndBattleText9, Route11AfterBattleText9
Route11TrainerHeader9:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_9, 4, Route11BattleText10, Route11EndBattleText10, Route11AfterBattleText10
	db -1 ; end

Route11Text1:
	text_asm
	ld hl, Route11TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText1:
	text_far _Route11BattleText1
	text_end

Route11EndBattleText1:
	text_far _Route11EndBattleText1
	text_end

Route11AfterBattleText1:
	text_far _Route11AfterBattleText1
	text_end

Route11Text2:
	text_asm
	ld hl, Route11TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText2:
	text_far _Route11BattleText2
	text_end

Route11EndBattleText2:
	text_far _Route11EndBattleText2
	text_end

Route11AfterBattleText2:
	text_far _Route11AfterBattleText2
	text_end

Route11Text3:
	text_asm
	ld hl, Route11TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText3:
	text_far _Route11BattleText3
	text_end

Route11EndBattleText3:
	text_far _Route11EndBattleText3
	text_end

Route11AfterBattleText3:
	text_far _Route11AfterBattleText3
	text_end

Route11Text4:
	text_asm
	ld hl, Route11TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText4:
	text_far _Route11BattleText4
	text_end

Route11EndBattleText4:
	text_far _Route11EndBattleText4
	text_end

Route11AfterBattleText4:
	text_far _Route11AfterBattleText4
	text_end

Route11Text5:
	text_asm
	ld hl, Route11TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText5:
	text_far _Route11BattleText5
	text_end

Route11EndBattleText5:
	text_far _Route11EndBattleText5
	text_end

Route11AfterBattleText5:
	text_far _Route11AfterBattleText5
	text_end

Route11Text6:
	text_asm
	ld hl, Route11TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText6:
	text_far _Route11BattleText6
	text_end

Route11EndBattleText6:
	text_far _Route11EndBattleText6
	text_end

Route11AfterBattleText6:
	text_far _Route11AfterBattleText6
	text_end

Route11Text7:
	text_asm
	ld hl, Route11TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText7:
	text_far _Route11BattleText7
	text_end

Route11EndBattleText7:
	text_far _Route11EndBattleText7
	text_end

Route11AfterBattleText7:
	text_far _Route11AfterBattleText7
	text_end

Route11Text8:
	text_asm
	ld hl, Route11TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText8:
	text_far _Route11BattleText8
	text_end

Route11EndBattleText8:
	text_far _Route11EndBattleText8
	text_end

Route11AfterBattleText8:
	text_far _Route11AfterBattleText8
	text_end

Route11Text9:
	text_asm
	ld hl, Route11TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText9:
	text_far _Route11BattleText9
	text_end

Route11EndBattleText9:
	text_far _Route11EndBattleText9
	text_end

Route11AfterBattleText9:
	text_far _Route11AfterBattleText9
	text_end

Route11Text10:
	text_asm
	ld hl, Route11TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route11BattleText10:
	text_far _Route11BattleText10
	text_end

Route11EndBattleText10:
	text_far _Route11EndBattleText10
	text_end

Route11AfterBattleText10:
	text_far _Route11AfterBattleText10
	text_end

Route11Text11:
	text_far _Route11Text11
	text_end
