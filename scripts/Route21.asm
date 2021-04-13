Route21_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route21TrainerHeaders
	ld de, Route21_ScriptPointers
	ld a, [wRoute21CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute21CurScript], a
	ret

Route21_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route21_TextPointers:
	dw Route21Text1
	dw Route21Text2
	dw Route21Text3
	dw Route21Text4
	dw Route21Text5
	dw Route21Text6
	dw Route21Text7
	dw Route21Text8
	dw Route21Text9

Route21TrainerHeaders:
	def_trainers
Route21TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_0, 0, Route21BattleText1, Route21EndBattleText1, Route21AfterBattleText1
Route21TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_1, 0, Route21BattleText2, Route21EndBattleText2, Route21AfterBattleText2
Route21TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_2, 4, Route21BattleText3, Route21EndBattleText3, Route21AfterBattleText3
Route21TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_3, 4, Route21BattleText4, Route21EndBattleText4, Route21AfterBattleText4
Route21TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_4, 4, Route21BattleText5, Route21EndBattleText5, Route21AfterBattleText5
Route21TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_5, 4, Route21BattleText6, Route21EndBattleText6, Route21AfterBattleText6
Route21TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_6, 3, Route21BattleText7, Route21EndBattleText7, Route21AfterBattleText7
Route21TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_7, 0, Route21BattleText8, Route21EndBattleText8, Route21AfterBattleText8
Route21TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_8, 0, Route21BattleText9, Route21EndBattleText9, Route21AfterBattleText9
	db -1 ; end

Route21Text1:
	text_asm
	ld hl, Route21TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route21Text2:
	text_asm
	ld hl, Route21TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route21Text3:
	text_asm
	ld hl, Route21TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route21Text4:
	text_asm
	ld hl, Route21TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route21Text5:
	text_asm
	ld hl, Route21TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route21Text6:
	text_asm
	ld hl, Route21TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route21Text7:
	text_asm
	ld hl, Route21TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route21Text8:
	text_asm
	ld hl, Route21TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route21Text9:
	text_asm
	ld hl, Route21TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route21BattleText1:
	text_far _Route21BattleText1
	text_end

Route21EndBattleText1:
	text_far _Route21EndBattleText1
	text_end

Route21AfterBattleText1:
	text_far _Route21AfterBattleText1
	text_end

Route21BattleText2:
	text_far _Route21BattleText2
	text_end

Route21EndBattleText2:
	text_far _Route21EndBattleText2
	text_end

Route21AfterBattleText2:
	text_far _Route21AfterBattleText2
	text_end

Route21BattleText3:
	text_far _Route21BattleText3
	text_end

Route21EndBattleText3:
	text_far _Route21EndBattleText3
	text_end

Route21AfterBattleText3:
	text_far _Route21AfterBattleText3
	text_end

Route21BattleText4:
	text_far _Route21BattleText4
	text_end

Route21EndBattleText4:
	text_far _Route21EndBattleText4
	text_end

Route21AfterBattleText4:
	text_far _Route21AfterBattleText4
	text_end

Route21BattleText5:
	text_far _Route21BattleText5
	text_end

Route21EndBattleText5:
	text_far _Route21EndBattleText5
	text_end

Route21AfterBattleText5:
	text_far _Route21AfterBattleText5
	text_end

Route21BattleText6:
	text_far _Route21BattleText6
	text_end

Route21EndBattleText6:
	text_far _Route21EndBattleText6
	text_end

Route21AfterBattleText6:
	text_far _Route21AfterBattleText6
	text_end

Route21BattleText7:
	text_far _Route21BattleText7
	text_end

Route21EndBattleText7:
	text_far _Route21EndBattleText7
	text_end

Route21AfterBattleText7:
	text_far _Route21AfterBattleText7
	text_end

Route21BattleText8:
	text_far _Route21BattleText8
	text_end

Route21EndBattleText8:
	text_far _Route21EndBattleText8
	text_end

Route21AfterBattleText8:
	text_far _Route21AfterBattleText8
	text_end

Route21BattleText9:
	text_far _Route21BattleText9
	text_end

Route21EndBattleText9:
	text_far _Route21EndBattleText9
	text_end

Route21AfterBattleText9:
	text_far _Route21AfterBattleText9
	text_end
