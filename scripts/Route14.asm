Route14_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route14TrainerHeaders
	ld de, Route14_ScriptPointers
	ld a, [wRoute14CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute14CurScript], a
	ret

Route14_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route14_TextPointers:
	dw Route14Text1
	dw Route14Text2
	dw Route14Text3
	dw Route14Text4
	dw Route14Text5
	dw Route14Text6
	dw Route14Text7
	dw Route14Text8
	dw Route14Text9
	dw Route14Text10
	dw Route14Text11

Route14TrainerHeaders:
	def_trainers
Route14TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_0, 2, Route14BattleText1, Route14EndBattleText1, Route14AfterBattleText1
Route14TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_1, 2, Route14BattleText2, Route14EndBattleText2, Route14AfterBattleText2
Route14TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_2, 4, Route14BattleText3, Route14EndBattleText3, Route14AfterBattleText3
Route14TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_3, 3, Route14BattleText4, Route14EndBattleText4, Route14AfterBattleText4
Route14TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_4, 3, Route14BattleText5, Route14EndBattleText5, Route14AfterBattleText5
Route14TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_5, 4, Route14BattleText6, Route14EndBattleText6, Route14AfterBattleText6
Route14TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_6, 4, Route14BattleText7, Route14EndBattleText7, Route14AfterBattleText7
Route14TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_7, 4, Route14BattleText8, Route14EndBattleText8, Route14AfterBattleText8
Route14TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_8, 3, Route14BattleText9, Route14EndBattleText9, Route14AfterBattleText9
Route14TrainerHeader9:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_9, 4, Route14BattleText10, Route14EndBattleText10, Route14AfterBattleText10
	db -1 ; end

Route14Text1:
	text_asm
	ld hl, Route14TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText1:
	text_far _Route14BattleText1
	text_end

Route14EndBattleText1:
	text_far _Route14EndBattleText1
	text_end

Route14AfterBattleText1:
	text_far _Route14AfterBattleText1
	text_end

Route14Text2:
	text_asm
	ld hl, Route14TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText2:
	text_far _Route14BattleText2
	text_end

Route14EndBattleText2:
	text_far _Route14EndBattleText2
	text_end

Route14AfterBattleText2:
	text_far _Route14AfterBattleText2
	text_end

Route14Text3:
	text_asm
	ld hl, Route14TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText3:
	text_far _Route14BattleText3
	text_end

Route14EndBattleText3:
	text_far _Route14EndBattleText3
	text_end

Route14AfterBattleText3:
	text_far _Route14AfterBattleText3
	text_end

Route14Text4:
	text_asm
	ld hl, Route14TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText4:
	text_far _Route14BattleText4
	text_end

Route14EndBattleText4:
	text_far _Route14EndBattleText4
	text_end

Route14AfterBattleText4:
	text_far _Route14AfterBattleText4
	text_end

Route14Text5:
	text_asm
	ld hl, Route14TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText5:
	text_far _Route14BattleText5
	text_end

Route14EndBattleText5:
	text_far _Route14EndBattleText5
	text_end

Route14AfterBattleText5:
	text_far _Route14AfterBattleText5
	text_end

Route14Text6:
	text_asm
	ld hl, Route14TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText6:
	text_far _Route14BattleText6
	text_end

Route14EndBattleText6:
	text_far _Route14EndBattleText6
	text_end

Route14AfterBattleText6:
	text_far _Route14AfterBattleText6
	text_end

Route14Text7:
	text_asm
	ld hl, Route14TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText7:
	text_far _Route14BattleText7
	text_end

Route14EndBattleText7:
	text_far _Route14EndBattleText7
	text_end

Route14AfterBattleText7:
	text_far _Route14AfterBattleText7
	text_end

Route14Text8:
	text_asm
	ld hl, Route14TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText8:
	text_far _Route14BattleText8
	text_end

Route14EndBattleText8:
	text_far _Route14EndBattleText8
	text_end

Route14AfterBattleText8:
	text_far _Route14AfterBattleText8
	text_end

Route14Text9:
	text_asm
	ld hl, Route14TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText9:
	text_far _Route14BattleText9
	text_end

Route14EndBattleText9:
	text_far _Route14EndBattleText9
	text_end

Route14AfterBattleText9:
	text_far _Route14AfterBattleText9
	text_end

Route14Text10:
	text_asm
	ld hl, Route14TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route14BattleText10:
	text_far _Route14BattleText10
	text_end

Route14EndBattleText10:
	text_far _Route14EndBattleText10
	text_end

Route14AfterBattleText10:
	text_far _Route14AfterBattleText10
	text_end

Route14Text11:
	text_far _Route14Text11
	text_end
