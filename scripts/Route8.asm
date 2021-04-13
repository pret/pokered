Route8_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route8TrainerHeaders
	ld de, Route8_ScriptPointers
	ld a, [wRoute8CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute8CurScript], a
	ret

Route8_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route8_TextPointers:
	dw Route8Text1
	dw Route8Text2
	dw Route8Text3
	dw Route8Text4
	dw Route8Text5
	dw Route8Text6
	dw Route8Text7
	dw Route8Text8
	dw Route8Text9
	dw Route8Text10

Route8TrainerHeaders:
	def_trainers
Route8TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_0, 4, Route8BattleText1, Route8EndBattleText1, Route8AfterBattleText1
Route8TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_1, 4, Route8BattleText2, Route8EndBattleText2, Route8AfterBattleText2
Route8TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_2, 4, Route8BattleText3, Route8EndBattleText3, Route8AfterBattleText3
Route8TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_3, 2, Route8BattleText4, Route8EndBattleText4, Route8AfterBattleText4
Route8TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_4, 3, Route8BattleText5, Route8EndBattleText5, Route8AfterBattleText5
Route8TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_5, 3, Route8BattleText6, Route8EndBattleText6, Route8AfterBattleText6
Route8TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_6, 2, Route8BattleText7, Route8EndBattleText7, Route8AfterBattleText7
Route8TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_7, 2, Route8BattleText8, Route8EndBattleText8, Route8AfterBattleText8
Route8TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_8_TRAINER_8, 4, Route8BattleText9, Route8EndBattleText9, Route8AfterBattleText9
	db -1 ; end

Route8Text1:
	text_asm
	ld hl, Route8TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText1:
	text_far _Route8BattleText1
	text_end

Route8EndBattleText1:
	text_far _Route8EndBattleText1
	text_end

Route8AfterBattleText1:
	text_far _Route8AfterBattleText1
	text_end

Route8Text2:
	text_asm
	ld hl, Route8TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText2:
	text_far _Route8BattleText2
	text_end

Route8EndBattleText2:
	text_far _Route8EndBattleText2
	text_end

Route8AfterBattleText2:
	text_far _Route8AfterBattleText2
	text_end

Route8Text3:
	text_asm
	ld hl, Route8TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText3:
	text_far _Route8BattleText3
	text_end

Route8EndBattleText3:
	text_far _Route8EndBattleText3
	text_end

Route8AfterBattleText3:
	text_far _Route8AfterBattleText3
	text_end

Route8Text4:
	text_asm
	ld hl, Route8TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText4:
	text_far _Route8BattleText4
	text_end

Route8EndBattleText4:
	text_far _Route8EndBattleText4
	text_end

Route8AfterBattleText4:
	text_far _Route8AfterBattleText4
	text_end

Route8Text5:
	text_asm
	ld hl, Route8TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText5:
	text_far _Route8BattleText5
	text_end

Route8EndBattleText5:
	text_far _Route8EndBattleText5
	text_end

Route8AfterBattleText5:
	text_far _Route8AfterBattleText5
	text_end

Route8Text6:
	text_asm
	ld hl, Route8TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText6:
	text_far _Route8BattleText6
	text_end

Route8EndBattleText6:
	text_far _Route8EndBattleText6
	text_end

Route8AfterBattleText6:
	text_far _Route8AfterBattleText6
	text_end

Route8Text7:
	text_asm
	ld hl, Route8TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText7:
	text_far _Route8BattleText7
	text_end

Route8EndBattleText7:
	text_far _Route8EndBattleText7
	text_end

Route8AfterBattleText7:
	text_far _Route8AfterBattleText7
	text_end

Route8Text8:
	text_asm
	ld hl, Route8TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText8:
	text_far _Route8BattleText8
	text_end

Route8EndBattleText8:
	text_far _Route8EndBattleText8
	text_end

Route8AfterBattleText8:
	text_far _Route8AfterBattleText8
	text_end

Route8Text9:
	text_asm
	ld hl, Route8TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route8BattleText9:
	text_far _Route8BattleText9
	text_end

Route8EndBattleText9:
	text_far _Route8EndBattleText9
	text_end

Route8AfterBattleText9:
	text_far _Route8AfterBattleText9
	text_end

Route8Text10:
	text_far _Route8Text10
	text_end
