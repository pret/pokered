Route4_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route4TrainerHeaders
	ld de, Route4_ScriptPointers
	ld a, [wRoute4CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute4CurScript], a
	ret

Route4_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route4_TextPointers:
	dw Route4Text1
	dw Route4Text2
	dw Route4Text3
	dw Route4Text4
	dw Route4Text5
	dw PickUpItemText
	dw PickUpItemText
	dw PokeCenterSignText
	dw Route4Text6
	dw Route4Text7
	dw Route4Text8
	dw Route4Text9

Route4TrainerHeaders:
	def_trainers 2
Route4TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_4_TRAINER_0, 3, Route4BattleText1, Route4EndBattleText1, Route4AfterBattleText1
Route4TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_4_TRAINER_1, 0, Route4BattleText2, Route4EndBattleText2, Route4AfterBattleText2
Route4TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_4_TRAINER_2, 0, Route4BattleText3, Route4EndBattleText3, Route4AfterBattleText3
Route4TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_4_TRAINER_3, 4, Route4BattleText4, Route4EndBattleText4, Route4AfterBattleText4
	db -1 ; end

Route4Text1:
	text_far _Route4Text1
	text_end

Route4Text2:
	text_asm
	ld hl, Route4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route4BattleText1:
	text_far _Route4BattleText1
	text_end

Route4EndBattleText1:
	text_far _Route4EndBattleText1
	text_end

Route4AfterBattleText1:
	text_far _Route4AfterBattleText1
	text_end

Route4Text3:
	text_asm
	ld hl, Route4TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route4BattleText2:
	text_far _Route4BattleText2
	text_end

Route4EndBattleText2:
	text_far _Route4EndBattleText2
	text_end

Route4AfterBattleText2:
	text_far _Route4AfterBattleText2
	text_end

Route4Text4:
	text_asm
	ld hl, Route4TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route4BattleText3:
	text_far _Route4BattleText3
	text_end

Route4EndBattleText3:
	text_far _Route4EndBattleText3
	text_end

Route4AfterBattleText3:
	text_far _Route4AfterBattleText3
	text_end

Route4Text5:
	text_asm
	ld hl, Route4TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route4BattleText4:
	text_far _Route4BattleText4
	text_end

Route4EndBattleText4:
	text_far _Route4EndBattleText4
	text_end

Route4AfterBattleText4:
	text_far _Route4AfterBattleText4
	text_end

Route4Text6:
	text_far _Route4Text5
	text_end

Route4Text7:
	text_far _Route4Text6
	text_end

Route4Text8:
	text_far _Route4Text8
	text_end

Route4Text9:
	text_far _Route4Text9
	text_end