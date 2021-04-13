Route9_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route9TrainerHeaders
	ld de, Route9_ScriptPointers
	ld a, [wRoute9CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute9CurScript], a
	ret

Route9_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route9_TextPointers:
	dw Route9Text1
	dw Route9Text2
	dw Route9Text3
	dw Route9Text4
	dw Route9Text5
	dw Route9Text6
	dw Route9Text7
	dw Route9Text8
	dw Route9Text9
	dw PickUpItemText
	dw Route9Text11

Route9TrainerHeaders:
	def_trainers
Route9TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_0, 3, Route9BattleText1, Route9EndBattleText1, Route9AfterBattleText1
Route9TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_1, 2, Route9BattleText2, Route9EndBattleText2, Route9AfterBattleText2
Route9TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_2, 4, Route9BattleText3, Route9EndBattleText3, Route9AfterBattleText3
Route9TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_3, 2, Route9BattleText4, Route9EndBattleText4, Route9AfterBattleText4
Route9TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_4, 2, Route9BattleText5, Route9EndBattleText5, Route9AfterBattleText5
Route9TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_5, 3, Route9BattleText6, Route9EndBattleText6, Route9AfterBattleText6
Route9TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_6, 4, Route9BattleText7, Route9EndBattleText7, Route9AfterBattleText7
Route9TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_7, 2, Route9BattleText8, Route9EndBattleText8, Route9AfterBattleText8
Route9TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_9_TRAINER_8, 2, Route9BattleText9, Route9EndBattleText9, Route9AfterBattleText9
	db -1 ; end

Route9Text1:
	text_asm
	ld hl, Route9TrainerHeader0
	jr Route9TalkToTrainer

Route9Text2:
	text_asm
	ld hl, Route9TrainerHeader1
	jr Route9TalkToTrainer

Route9Text3:
	text_asm
	ld hl, Route9TrainerHeader2
	jr Route9TalkToTrainer

Route9Text4:
	text_asm
	ld hl, Route9TrainerHeader3
	jr Route9TalkToTrainer

Route9Text5:
	text_asm
	ld hl, Route9TrainerHeader4
	jr Route9TalkToTrainer

Route9Text6:
	text_asm
	ld hl, Route9TrainerHeader5
	jr Route9TalkToTrainer

Route9Text7:
	text_asm
	ld hl, Route9TrainerHeader6
	jr Route9TalkToTrainer

Route9Text8:
	text_asm
	ld hl, Route9TrainerHeader7
	jr Route9TalkToTrainer

Route9Text9:
	text_asm
	ld hl, Route9TrainerHeader8
Route9TalkToTrainer:
	call TalkToTrainer
	jp TextScriptEnd

Route9BattleText1:
	text_far _Route9BattleText1
	text_end

Route9EndBattleText1:
	text_far _Route9EndBattleText1
	text_end

Route9AfterBattleText1:
	text_far _Route9AfterBattleText1
	text_end

Route9BattleText2:
	text_far _Route9BattleText2
	text_end

Route9EndBattleText2:
	text_far _Route9EndBattleText2
	text_end

Route9AfterBattleText2:
	text_far _Route9AfterBattleText2
	text_end

Route9BattleText3:
	text_far _Route9BattleText3
	text_end

Route9EndBattleText3:
	text_far _Route9EndBattleText3
	text_end

Route9AfterBattleText3:
	text_far _Route9AfterBattleText3
	text_end

Route9BattleText4:
	text_far _Route9BattleText4
	text_end

Route9EndBattleText4:
	text_far _Route9EndBattleText4
	text_end

Route9AfterBattleText4:
	text_far _Route9AfterBattleText4
	text_end

Route9BattleText5:
	text_far _Route9BattleText5
	text_end

Route9EndBattleText5:
	text_far _Route9EndBattleText5
	text_end

Route9AfterBattleText5:
	text_far _Route9AfterBattleText5
	text_end

Route9BattleText6:
	text_far _Route9BattleText6
	text_end

Route9EndBattleText6:
	text_far _Route9EndBattleText6
	text_end

Route9AfterBattleText6:
	text_far _Route9AfterBattleText6
	text_end

Route9BattleText7:
	text_far _Route9BattleText7
	text_end

Route9EndBattleText7:
	text_far _Route9EndBattleText7
	text_end

Route9AfterBattleText7:
	text_far _Route9AfterBattleText7
	text_end

Route9BattleText8:
	text_far _Route9BattleText8
	text_end

Route9EndBattleText8:
	text_far _Route9EndBattleText8
	text_end

Route9AfterBattleText8:
	text_far _Route9AfterBattleText8
	text_end

Route9BattleText9:
	text_far _Route9BattleText9
	text_end

Route9EndBattleText9:
	text_far _Route9EndBattleText9
	text_end

Route9AfterBattleText9:
	text_far _Route9AfterBattleText9
	text_end

Route9Text11:
	text_far _Route9Text11
	text_end
