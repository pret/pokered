Route18_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route18TrainerHeaders
	ld de, Route18_ScriptPointers
	ld a, [wRoute18CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute18CurScript], a
	ret

Route18_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route18_TextPointers:
	dw Route18Text1
	dw Route18Text2
	dw Route18Text3
	dw Route18Text4
	dw Route18Text5
	dw Route18Text6
	dw Route18Text7

Route18TrainerHeaders:
	def_trainers
Route18TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_18_TRAINER_0, 3, Route18BattleText1, Route18EndBattleText1, Route18AfterBattleText1
Route18TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_18_TRAINER_1, 3, Route18BattleText2, Route18EndBattleText2, Route18AfterBattleText2
Route18TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_18_TRAINER_2, 4, Route18BattleText3, Route18EndBattleText3, Route18AfterBattleText3
Route18TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_18_TRAINER_3, 3, Route18BattleText4, Route18EndBattleText4, Route18AfterBattleText4
Route18TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_18_TRAINER_4, 2, Route18BattleText5, Route18EndBattleText5, Route18AfterBattleText5
	db -1 ; end

Route18Text1:
	text_asm
	ld hl, Route18TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route18BattleText1:
	text_far _Route18BattleText1
	text_end

Route18EndBattleText1:
	text_far _Route18EndBattleText1
	text_end

Route18AfterBattleText1:
	text_far _Route18AfterBattleText1
	text_end

Route18Text2:
	text_asm
	ld hl, Route18TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route18BattleText2:
	text_far _Route18BattleText2
	text_end

Route18EndBattleText2:
	text_far _Route18EndBattleText2
	text_end

Route18AfterBattleText2:
	text_far _Route18AfterBattleText2
	text_end

Route18Text3:
	text_asm
	ld hl, Route18TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route18BattleText3:
	text_far _Route18BattleText3
	text_end

Route18EndBattleText3:
	text_far _Route18EndBattleText3
	text_end

Route18AfterBattleText3:
	text_far _Route18AfterBattleText3
	text_end

Route18Text4:
	text_asm
	ld hl, Route18TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route18BattleText4:
	text_far _Route18BattleText4
	text_end

Route18EndBattleText4:
	text_far _Route18EndBattleText4
	text_end

Route18AfterBattleText4:
	text_far _Route18AfterBattleText4
	text_end

Route18Text5:
	text_asm
	ld hl, Route18TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route18BattleText5:
	text_far _Route18BattleText5
	text_end

Route18EndBattleText5:
	text_far _Route18EndBattleText5
	text_end

Route18AfterBattleText5:
	text_far _Route18AfterBattleText5
	text_end

Route18Text6:
	text_far _Route18Text4
	text_end

Route18Text7:
	text_far _Route18Text5
	text_end
