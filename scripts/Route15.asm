Route15_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route15TrainerHeaders
	ld de, Route15_ScriptPointers
	ld a, [wRoute15CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute15CurScript], a
	ret

Route15_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route15_TextPointers:
	dw Route15Text1
	dw Route15Text2
	dw Route15Text3
	dw Route15Text4
	dw Route15Text5
	dw Route15Text6
	dw Route15Text7
	dw Route15Text8
	dw Route15Text9
	dw Route15Text10
	dw PickUpItemText
	dw Route15Text12

Route15TrainerHeaders:
	def_trainers
Route15TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_0, 2, Route15BattleText1, Route15EndBattleText1, Route15AfterBattleText1
Route15TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_1, 3, Route15BattleText2, Route15EndBattleText2, Route15AfterBattleText2
Route15TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_2, 3, Route15BattleText3, Route15EndBattleText3, Route15AfterBattleText3
Route15TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_3, 3, Route15BattleText4, Route15EndBattleText4, Route15AfterBattleText4
Route15TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_4, 2, Route15BattleText5, Route15EndBattleText5, Route15AfterBattleText5
Route15TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_5, 3, Route15BattleText6, Route15EndBattleText6, Route15AfterBattleText6
Route15TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_6, 3, Route15BattleText7, Route15EndBattleText7, Route15AfterBattleText7
Route15TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_7, 3, Route15BattleText8, Route15EndBattleText8, Route15AfterBattleText8
Route15TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_8, 3, Route15BattleText9, Route15EndBattleText9, Route15AfterBattleText9
Route15TrainerHeader9:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_9, 3, Route15BattleText10, Route15EndBattleText10, Route15AfterBattleText10
	db -1 ; end

Route15Text1:
	text_asm
	ld hl, Route15TrainerHeader0
	jr Route15TalkToTrainer

Route15Text2:
	text_asm
	ld hl, Route15TrainerHeader1
	jr Route15TalkToTrainer

Route15Text3:
	text_asm
	ld hl, Route15TrainerHeader2
	jr Route15TalkToTrainer

Route15Text4:
	text_asm
	ld hl, Route15TrainerHeader3
	jr Route15TalkToTrainer

Route15Text5:
	text_asm
	ld hl, Route15TrainerHeader4
	jr Route15TalkToTrainer

Route15Text6:
	text_asm
	ld hl, Route15TrainerHeader5
	jr Route15TalkToTrainer

Route15Text7:
	text_asm
	ld hl, Route15TrainerHeader6
	jr Route15TalkToTrainer

Route15Text8:
	text_asm
	ld hl, Route15TrainerHeader7
	jr Route15TalkToTrainer

Route15Text9:
	text_asm
	ld hl, Route15TrainerHeader8
	jr Route15TalkToTrainer

Route15Text10:
	text_asm
	ld hl, Route15TrainerHeader9
Route15TalkToTrainer:
	call TalkToTrainer
	jp TextScriptEnd

Route15BattleText1:
	text_far _Route15BattleText1
	text_end

Route15EndBattleText1:
	text_far _Route15EndBattleText1
	text_end

Route15AfterBattleText1:
	text_far _Route15AfterBattleText1
	text_end

Route15BattleText2:
	text_far _Route15BattleText2
	text_end

Route15EndBattleText2:
	text_far _Route15EndBattleText2
	text_end

Route15AfterBattleText2:
	text_far _Route15AfterBattleText2
	text_end

Route15BattleText3:
	text_far _Route15BattleText3
	text_end

Route15EndBattleText3:
	text_far _Route15EndBattleText3
	text_end

Route15AfterBattleText3:
	text_far _Route15AfterBattleText3
	text_end

Route15BattleText4:
	text_far _Route15BattleText4
	text_end

Route15EndBattleText4:
	text_far _Route15EndBattleText4
	text_end

Route15AfterBattleText4:
	text_far _Route15AfterBattleText4
	text_end

Route15BattleText5:
	text_far _Route15BattleText5
	text_end

Route15EndBattleText5:
	text_far _Route15EndBattleText5
	text_end

Route15AfterBattleText5:
	text_far _Route15AfterBattleText5
	text_end

Route15BattleText6:
	text_far _Route15BattleText6
	text_end

Route15EndBattleText6:
	text_far _Route15EndBattleText6
	text_end

Route15AfterBattleText6:
	text_far _Route15AfterBattleText6
	text_end

Route15BattleText7:
	text_far _Route15BattleText7
	text_end

Route15EndBattleText7:
	text_far _Route15EndBattleText7
	text_end

Route15AfterBattleText7:
	text_far _Route15AfterBattleText7
	text_end

Route15BattleText8:
	text_far _Route15BattleText8
	text_end

Route15EndBattleText8:
	text_far _Route15EndBattleText8
	text_end

Route15AfterBattleText8:
	text_far _Route15AfterBattleText8
	text_end

Route15BattleText9:
	text_far _Route15BattleText9
	text_end

Route15EndBattleText9:
	text_far _Route15EndBattleText9
	text_end

Route15AfterBattleText9:
	text_far _Route15AfterBattleText9
	text_end

Route15BattleText10:
	text_far _Route15BattleText10
	text_end

Route15EndBattleText10:
	text_far _Route15EndBattleText10
	text_end

Route15AfterBattleText10:
	text_far _Route15AfterBattleText10
	text_end

Route15Text12:
	text_far _Route15Text12
	text_end
