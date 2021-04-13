Route13_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route13TrainerHeaders
	ld de, Route13_ScriptPointers
	ld a, [wRoute13CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute13CurScript], a
	ret

Route13_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route13_TextPointers:
	dw Route13Text1
	dw Route13Text2
	dw Route13Text3
	dw Route13Text4
	dw Route13Text5
	dw Route13Text6
	dw Route13Text7
	dw Route13Text8
	dw Route13Text9
	dw Route13Text10
	dw Route13Text11
	dw Route13Text12
	dw Route13Text13

Route13TrainerHeaders:
	def_trainers
Route13TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_0, 2, Route13BattleText2, Route13EndBattleText2, Route13AfterBattleText2
Route13TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_1, 2, Route13BattleText3, Route13EndBattleText3, Route13AfterBattleText3
Route13TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_2, 2, Route13BattleText4, Route13EndBattleText4, Route13AfterBattleText4
Route13TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_3, 2, Route13BattleText5, Route13EndBattleText5, Route13AfterBattleText5
Route13TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_4, 4, Route13BattleText6, Route13EndBattleText6, Route13AfterBattleText6
Route13TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_5, 2, Route13BattleText7, Route13EndBattleText7, Route13AfterBattleText7
Route13TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_6, 4, Route13BattleText8, Route13EndBattleText8, Route13AfterBattleText8
Route13TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_7, 2, Route13BattleText9, Route13EndBattleText9, Route13AfterBattleText9
Route13TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_8, 2, Route13BattleText10, Route13EndBattleText10, Route13AfterBattleText10
Route13TrainerHeader9:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_9, 4, Route13BattleText11, Route13EndBattleText11, Route13AfterBattleText11
	db -1 ; end

Route13Text1:
	text_asm
	ld hl, Route13TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText2:
	text_far _Route13BattleText2
	text_end

Route13EndBattleText2:
	text_far _Route13EndBattleText2
	text_end

Route13AfterBattleText2:
	text_far _Route13AfterBattleText2
	text_end

Route13Text2:
	text_asm
	ld hl, Route13TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText3:
	text_far _Route13BattleText3
	text_end

Route13EndBattleText3:
	text_far _Route13EndBattleText3
	text_end

Route13AfterBattleText3:
	text_far _Route13AfterBattleText3
	text_end

Route13Text3:
	text_asm
	ld hl, Route13TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText4:
	text_far _Route13BattleText4
	text_end

Route13EndBattleText4:
	text_far _Route13EndBattleText4
	text_end

Route13AfterBattleText4:
	text_far _Route13AfterBattleText4
	text_end

Route13Text4:
	text_asm
	ld hl, Route13TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText5:
	text_far _Route13BattleText5
	text_end

Route13EndBattleText5:
	text_far _Route13EndBattleText5
	text_end

Route13AfterBattleText5:
	text_far _Route13AfterBattleText5
	text_end

Route13Text5:
	text_asm
	ld hl, Route13TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText6:
	text_far _Route13BattleText6
	text_end

Route13EndBattleText6:
	text_far _Route13EndBattleText6
	text_end

Route13AfterBattleText6:
	text_far _Route13AfterBattleText6
	text_end

Route13Text6:
	text_asm
	ld hl, Route13TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText7:
	text_far _Route13BattleText7
	text_end

Route13EndBattleText7:
	text_far _Route13EndBattleText7
	text_end

Route13AfterBattleText7:
	text_far _Route13AfterBattleText7
	text_end

Route13Text7:
	text_asm
	ld hl, Route13TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText8:
	text_far _Route13BattleText8
	text_end

Route13EndBattleText8:
	text_far _Route13EndBattleText8
	text_end

Route13AfterBattleText8:
	text_far _Route13AfterBattleText8
	text_end

Route13Text8:
	text_asm
	ld hl, Route13TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText9:
	text_far _Route13BattleText9
	text_end

Route13EndBattleText9:
	text_far _Route13EndBattleText9
	text_end

Route13AfterBattleText9:
	text_far _Route13AfterBattleText9
	text_end

Route13Text9:
	text_asm
	ld hl, Route13TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText10:
	text_far _Route13BattleText10
	text_end

Route13EndBattleText10:
	text_far _Route13EndBattleText10
	text_end

Route13AfterBattleText10:
	text_far _Route13AfterBattleText10
	text_end

Route13Text10:
	text_asm
	ld hl, Route13TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route13BattleText11:
	text_far _Route13BattleText11
	text_end

Route13EndBattleText11:
	text_far _Route13EndBattleText11
	text_end

Route13AfterBattleText11:
	text_far _Route13AfterBattleText11
	text_end

Route13Text11:
	text_far _Route13Text11
	text_end

Route13Text12:
	text_far _Route13Text12
	text_end

Route13Text13:
	text_far _Route13Text13
	text_end
