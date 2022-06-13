Route7_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route7TrainerHeaders
	ld de, Route7_ScriptPointers
	ld a, [wRoute7CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute7CurScript], a
	ret

Route7_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route7_TextPointers:
	dw Route7Gambler1Text
	dw Route7Gambler2Text
	dw Route7Text1

Route7TrainerHeaders:
	def_trainers 1
Route7TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_7_TRAINER_0, 1, Route7BattleText1, Route7EndBattleText1, Route7AfterBattleText1
Route7TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_7_TRAINER_1, 1, Route7BattleText2, Route7EndBattleText2, Route7AfterBattleText2
	db -1 ; end

Route7Gambler1Text:
	text_asm
	ld hl, Route7TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route7BattleText1:
	text_far _Route7BattleText1
	text_end

Route7EndBattleText1:
	text_far _Route7EndBattleText1
	text_end

Route7AfterBattleText1:
	text_far _Route7AfterBattleText1
	text_end

Route7Gambler2Text:
	text_asm
	ld hl, Route7TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route7BattleText2:
	text_far _Route7BattleText2
	text_end

Route7EndBattleText2:
	text_far _Route7EndBattleText2
	text_end

Route7AfterBattleText2:
	text_far _Route7AfterBattleText2
	text_end

Route7Text1:
	text_far _Route7Text1
	text_end
