Route3_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route3TrainerHeaders
	ld de, Route3_ScriptPointers
	ld a, [wRoute3CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute3CurScript], a
	ret

Route3_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route3_TextPointers:
	dw Route3Text1
	dw Route3Text2
	dw Route3Text3
	dw Route3Text4
	dw Route3Text5
	dw Route3Text6
	dw Route3Text7
	dw Route3Text8
	dw Route3Text9
	dw Route3Text10

Route3TrainerHeaders:
	def_trainers 2
Route3TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_0, 2, Route3BattleText1, Route3EndBattleText1, Route3AfterBattleText1
Route3TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_1, 3, Route3BattleText2, Route3EndBattleText2, Route3AfterBattleText2
Route3TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_2, 2, Route3BattleText3, Route3EndBattleText3, Route3AfterBattleText3
Route3TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_3, 1, Route3BattleText4, Route3EndBattleText4, Route3AfterBattleText4
Route3TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_4, 4, Route3BattleText5, Route3EndBattleText5, Route3AfterBattleText5
Route3TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_5, 3, Route3BattleText6, Route3EndBattleText6, Route3AfterBattleText6
Route3TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_6, 3, Route3BattleText7, Route3EndBattleText7, Route3AfterBattleText7
Route3TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_7, 2, Route3BattleText8, Route3EndBattleText8, Route3AfterBattleText8
	db -1 ; end

Route3Text1:
	text_far _Route3Text1
	text_end

Route3Text2:
	text_asm
	ld hl, Route3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText1:
	text_far _Route3BattleText1
	text_end

Route3EndBattleText1:
	text_far _Route3EndBattleText1
	text_end

Route3AfterBattleText1:
	text_far _Route3AfterBattleText1
	text_end

Route3Text3:
	text_asm
	ld hl, Route3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText2:
	text_far _Route3BattleText2
	text_end

Route3EndBattleText2:
	text_far _Route3EndBattleText2
	text_end

Route3AfterBattleText2:
	text_far _Route3AfterBattleText2
	text_end

Route3Text4:
	text_asm
	ld hl, Route3TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText3:
	text_far _Route3BattleText3
	text_end

Route3EndBattleText3:
	text_far _Route3EndBattleText3
	text_end

Route3AfterBattleText3:
	text_far _Route3AfterBattleText3
	text_end

Route3Text5:
	text_asm
	ld hl, Route3TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText4:
	text_far _Route3BattleText4
	text_end

Route3EndBattleText4:
	text_far _Route3EndBattleText4
	text_end

Route3AfterBattleText4:
	text_far _Route3AfterBattleText4
	text_end

Route3Text6:
	text_asm
	ld hl, Route3TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText5:
	text_far _Route3BattleText5
	text_end

Route3EndBattleText5:
	text_far _Route3EndBattleText5
	text_end

Route3AfterBattleText5:
	text_far _Route3AfterBattleText5
	text_end

Route3Text7:
	text_asm
	ld hl, Route3TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText6:
	text_far _Route3BattleText6
	text_end

Route3EndBattleText6:
	text_far _Route3EndBattleText6
	text_end

Route3AfterBattleText6:
	text_far _Route3AfterBattleText6
	text_end

Route3Text8:
	text_asm
	ld hl, Route3TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText7:
	text_far _Route3BattleText7
	text_end

Route3EndBattleText7:
	text_far _Route3EndBattleText7
	text_end

Route3AfterBattleText7:
	text_far _Route3AfterBattleText7
	text_end

Route3Text9:
	text_asm
	ld hl, Route3TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route3BattleText8:
	text_far _Route3BattleText8
	text_end

Route3EndBattleText8:
	text_far _Route3EndBattleText8
	text_end

Route3AfterBattleText8:
	text_far _Route3AfterBattleText8
	text_end

Route3Text10:
	text_far _Route3Text10
	text_end
