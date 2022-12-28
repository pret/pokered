Route17_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route17TrainerHeaders
	ld de, Route17_ScriptPointers
	ld a, [wRoute17CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute17CurScript], a
	ret

Route17_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route17_TextPointers:
	dw Route17Text1
	dw Route17Text2
	dw Route17Text3
	dw Route17Text4
	dw Route17Text5
	dw Route17Text6
	dw Route17Text7
	dw Route17Text8
	dw Route17Text9
	dw Route17Text10
	dw Route17Text11
	dw Route17Text12
	dw Route17Text13
	dw Route17Text14
	dw Route17Text15
	dw Route17Text16

Route17TrainerHeaders:
	def_trainers
Route17TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_0, 3, Route17BattleText1, Route17EndBattleText1, Route17AfterBattleText1
Route17TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_1, 4, Route17BattleText2, Route17EndBattleText2, Route17AfterBattleText2
Route17TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_2, 4, Route17BattleText3, Route17EndBattleText3, Route17AfterBattleText3
Route17TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_3, 4, Route17BattleText4, Route17EndBattleText4, Route17AfterBattleText4
Route17TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_4, 3, Route17BattleText5, Route17EndBattleText5, Route17AfterBattleText5
Route17TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_5, 2, Route17BattleText6, Route17EndBattleText6, Route17AfterBattleText6
Route17TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_6, 4, Route17BattleText7, Route17EndBattleText7, Route17AfterBattleText7
Route17TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_7, 2, Route17BattleText8, Route17EndBattleText8, Route17AfterBattleText8
Route17TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_8, 3, Route17BattleText9, Route17EndBattleText9, Route17AfterBattleText9
Route17TrainerHeader9:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_9, 4, Route17BattleText10, Route17EndBattleText10, Route17AfterBattleText10
	db -1 ; end

Route17Text1:
	text_asm
	ld hl, Route17TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText1:
	text_far _Route17BattleText1
	text_end

Route17EndBattleText1:
	text_far _Route17EndBattleText1
	text_end

Route17AfterBattleText1:
	text_far _Route17AfterBattleText1
	text_end

Route17Text2:
	text_asm
	ld hl, Route17TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText2:
	text_far _Route17BattleText2
	text_end

Route17EndBattleText2:
	text_far _Route17EndBattleText2
	text_end

Route17AfterBattleText2:
	text_far _Route17AfterBattleText2
	text_end

Route17Text3:
	text_asm
	ld hl, Route17TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText3:
	text_far _Route17BattleText3
	text_end

Route17EndBattleText3:
	text_far _Route17EndBattleText3
	text_end

Route17AfterBattleText3:
	text_far _Route17AfterBattleText3
	text_end

Route17Text4:
	text_asm
	ld hl, Route17TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText4:
	text_far _Route17BattleText4
	text_end

Route17EndBattleText4:
	text_far _Route17EndBattleText4
	text_end

Route17AfterBattleText4:
	text_far _Route17AfterBattleText4
	text_end

Route17Text5:
	text_asm
	ld hl, Route17TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText5:
	text_far _Route17BattleText5
	text_end

Route17EndBattleText5:
	text_far _Route17EndBattleText5
	text_end

Route17AfterBattleText5:
	text_far _Route17AfterBattleText5
	text_end

Route17Text6:
	text_asm
	ld hl, Route17TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText6:
	text_far _Route17BattleText6
	text_end

Route17EndBattleText6:
	text_far _Route17EndBattleText6
	text_end

Route17AfterBattleText6:
	text_far _Route17AfterBattleText6
	text_end

Route17Text7:
	text_asm
	ld hl, Route17TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText7:
	text_far _Route17BattleText7
	text_end

Route17EndBattleText7:
	text_far _Route17EndBattleText7
	text_end

Route17AfterBattleText7:
	text_far _Route17AfterBattleText7
	text_end

Route17Text8:
	text_asm
	ld hl, Route17TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText8:
	text_far _Route17BattleText8
	text_end

Route17EndBattleText8:
	text_far _Route17EndBattleText8
	text_end

Route17AfterBattleText8:
	text_far _Route17AfterBattleText8
	text_end

Route17Text9:
	text_asm
	ld hl, Route17TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText9:
	text_far _Route17BattleText9
	text_end

Route17EndBattleText9:
	text_far _Route17EndBattleText9
	text_end

Route17AfterBattleText9:
	text_far _Route17AfterBattleText9
	text_end

Route17Text10:
	text_asm
	ld hl, Route17TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route17BattleText10:
	text_far _Route17BattleText10
	text_end

Route17EndBattleText10:
	text_far _Route17EndBattleText10
	text_end

Route17AfterBattleText10:
	text_far _Route17AfterBattleText10
	text_end

Route17Text11:
	text_far _Route17Text11
	text_end

Route17Text12:
	text_far _Route17Text12
	text_end

Route17Text13:
	text_far _Route17Text13
	text_end

Route17Text14:
	text_far _Route17Text14
	text_end

Route17Text15:
	text_far _Route17Text15
	text_end

Route17Text16:
	text_far _Route17Text16
	text_end
