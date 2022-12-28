Route19_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route19TrainerHeaders
	ld de, Route19_ScriptPointers
	ld a, [wRoute19CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute19CurScript], a
	ret

Route19_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route19_TextPointers:
	dw Route19Text1
	dw Route19Text2
	dw Route19Text3
	dw Route19Text4
	dw Route19Text5
	dw Route19Text6
	dw Route19Text7
	dw Route19Text8
	dw Route19Text9
	dw Route19Text10
	dw Route19Text11

Route19TrainerHeaders:
	def_trainers
Route19TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_0, 4, Route19BattleText1, Route19EndBattleText1, Route19AfterBattleText1
Route19TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_1, 3, Route19BattleText2, Route19EndBattleText2, Route19AfterBattleText2
Route19TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_2, 3, Route19BattleText3, Route19EndBattleText3, Route19AfterBattleText3
Route19TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_3, 4, Route19BattleText4, Route19EndBattleText4, Route19AfterBattleText4
Route19TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_4, 4, Route19BattleText5, Route19EndBattleText5, Route19AfterBattleText5
Route19TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_5, 4, Route19BattleText6, Route19EndBattleText6, Route19AfterBattleText6
Route19TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_6, 3, Route19BattleText7, Route19EndBattleText7, Route19AfterBattleText7
Route19TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_7, 4, Route19BattleText8, Route19EndBattleText8, Route19AfterBattleText8
Route19TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_8, 4, Route19BattleText9, Route19EndBattleText9, Route19AfterBattleText9
Route19TrainerHeader9:
	trainer EVENT_BEAT_ROUTE_19_TRAINER_9, 4, Route19BattleText10, Route19EndBattleText10, Route19AfterBattleText10
	db -1 ; end

Route19Text1:
	text_asm
	ld hl, Route19TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route19Text2:
	text_asm
	ld hl, Route19TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route19Text3:
	text_asm
	ld hl, Route19TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route19Text4:
	text_asm
	ld hl, Route19TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route19Text5:
	text_asm
	ld hl, Route19TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route19Text6:
	text_asm
	ld hl, Route19TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route19Text7:
	text_asm
	ld hl, Route19TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route19Text8:
	text_asm
	ld hl, Route19TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route19Text9:
	text_asm
	ld hl, Route19TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route19Text10:
	text_asm
	ld hl, Route19TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route19BattleText1:
	text_far _Route19BattleText1
	text_end

Route19EndBattleText1:
	text_far _Route19EndBattleText1
	text_end

Route19AfterBattleText1:
	text_far _Route19AfterBattleText1
	text_end

Route19BattleText2:
	text_far _Route19BattleText2
	text_end

Route19EndBattleText2:
	text_far _Route19EndBattleText2
	text_end

Route19AfterBattleText2:
	text_far _Route19AfterBattleText2
	text_end

Route19BattleText3:
	text_far _Route19BattleText3
	text_end

Route19EndBattleText3:
	text_far _Route19EndBattleText3
	text_end

Route19AfterBattleText3:
	text_far _Route19AfterBattleText3
	text_end

Route19BattleText4:
	text_far _Route19BattleText4
	text_end

Route19EndBattleText4:
	text_far _Route19EndBattleText4
	text_end

Route19AfterBattleText4:
	text_far _Route19AfterBattleText4
	text_end

Route19BattleText5:
	text_far _Route19BattleText5
	text_end

Route19EndBattleText5:
	text_far _Route19EndBattleText5
	text_end

Route19AfterBattleText5:
	text_far _Route19AfterBattleText5
	text_end

Route19BattleText6:
	text_far _Route19BattleText6
	text_end

Route19EndBattleText6:
	text_far _Route19EndBattleText6
	text_end

Route19AfterBattleText6:
	text_far _Route19AfterBattleText6
	text_end

Route19BattleText7:
	text_far _Route19BattleText7
	text_end

Route19EndBattleText7:
	text_far _Route19EndBattleText7
	text_end

Route19AfterBattleText7:
	text_far _Route19AfterBattleText7
	text_end

Route19BattleText8:
	text_far _Route19BattleText8
	text_end

Route19EndBattleText8:
	text_far _Route19EndBattleText8
	text_end

Route19AfterBattleText8:
	text_far _Route19AfterBattleText8
	text_end

Route19BattleText9:
	text_far _Route19BattleText9
	text_end

Route19EndBattleText9:
	text_far _Route19EndBattleText9
	text_end

Route19AfterBattleText9:
	text_far _Route19AfterBattleText9
	text_end

Route19BattleText10:
	text_far _Route19BattleText10
	text_end

Route19EndBattleText10:
	text_far _Route19EndBattleText10
	text_end

Route19AfterBattleText10:
	text_far _Route19AfterBattleText10
	text_end

Route19Text11:
	text_far _Route19Text11
	text_end
