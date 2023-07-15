Route21_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route21TrainerHeaders
	ld de, Route21_ScriptPointers
	ld a, [wRoute21CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute21CurScript], a
	ret

Route21_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE21_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE21_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE21_END_BATTLE

Route21_TextPointers:
	def_text_pointers
	dw_const Route21Fisher1Text,  TEXT_ROUTE21_FISHER1
	dw_const Route21Fisher2Text,  TEXT_ROUTE21_FISHER2
	dw_const Route21Swimmer1Text, TEXT_ROUTE21_SWIMMER1
	dw_const Route21Swimmer2Text, TEXT_ROUTE21_SWIMMER2
	dw_const Route21Swimmer3Text, TEXT_ROUTE21_SWIMMER3
	dw_const Route21Swimmer4Text, TEXT_ROUTE21_SWIMMER4
	dw_const Route21Swimmer5Text, TEXT_ROUTE21_SWIMMER5
	dw_const Route21Fisher3Text,  TEXT_ROUTE21_FISHER3
	dw_const Route21Fisher4Text,  TEXT_ROUTE21_FISHER4

Route21TrainerHeaders:
	def_trainers
Route21TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_0, 0, Route21Fisher1BattleText, Route21Fisher1EndBattleText, Route21Fisher1AfterBattleText
Route21TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_1, 0, Route21Fisher2BattleText, Route21Fisher2EndBattleText, Route21Fisher2AfterBattleText
Route21TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_2, 4, Route21Swimmer1BattleText, Route21Swimmer1EndBattleText, Route21Swimmer1AfterBattleText
Route21TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_3, 4, Route21Swimmer2BattleText, Route21Swimmer2EndBattleText, Route21Swimmer2AfterBattleText
Route21TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_4, 4, Route21Swimmer3BattleText, Route21Swimmer3EndBattleText, Route21Swimmer3AfterBattleText
Route21TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_5, 4, Route21Swimmer4BattleText, Route21Swimmer4EndBattleText, Route21Swimmer4AfterBattleText
Route21TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_6, 3, Route21Swimmer5BattleText, Route21Swimmer5EndBattleText, Route21Swimmer5AfterBattleText
Route21TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_7, 0, Route21Fisher3BattleText, Route21Fisher3EndBattleText, Route21Fisher3AfterBattleText
Route21TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_21_TRAINER_8, 0, Route21Fisher4BattleText, Route21Fisher4EndBattleText, Route21Fisher4AfterBattleText
	db -1 ; end

Route21Fisher1Text:
	text_asm
	ld hl, Route21TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route21Fisher2Text:
	text_asm
	ld hl, Route21TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route21Swimmer1Text:
	text_asm
	ld hl, Route21TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route21Swimmer2Text:
	text_asm
	ld hl, Route21TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route21Swimmer3Text:
	text_asm
	ld hl, Route21TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route21Swimmer4Text:
	text_asm
	ld hl, Route21TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route21Swimmer5Text:
	text_asm
	ld hl, Route21TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route21Fisher3Text:
	text_asm
	ld hl, Route21TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route21Fisher4Text:
	text_asm
	ld hl, Route21TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route21Fisher1BattleText:
	text_far _Route21Fisher1BattleText
	text_end

Route21Fisher1EndBattleText:
	text_far _Route21Fisher1EndBattleText
	text_end

Route21Fisher1AfterBattleText:
	text_far _Route21Fisher1AfterBattleText
	text_end

Route21Fisher2BattleText:
	text_far _Route21Fisher2BattleText
	text_end

Route21Fisher2EndBattleText:
	text_far _Route21Fisher2EndBattleText
	text_end

Route21Fisher2AfterBattleText:
	text_far _Route21Fisher2AfterBattleText
	text_end

Route21Swimmer1BattleText:
	text_far _Route21Swimmer1BattleText
	text_end

Route21Swimmer1EndBattleText:
	text_far _Route21Swimmer1EndBattleText
	text_end

Route21Swimmer1AfterBattleText:
	text_far _Route21Swimmer1AfterBattleText
	text_end

Route21Swimmer2BattleText:
	text_far _Route21Swimmer2BattleText
	text_end

Route21Swimmer2EndBattleText:
	text_far _Route21Swimmer2EndBattleText
	text_end

Route21Swimmer2AfterBattleText:
	text_far _Route21Swimmer2AfterBattleText
	text_end

Route21Swimmer3BattleText:
	text_far _Route21Swimmer3BattleText
	text_end

Route21Swimmer3EndBattleText:
	text_far _Route21Swimmer3EndBattleText
	text_end

Route21Swimmer3AfterBattleText:
	text_far _Route21Swimmer3AfterBattleText
	text_end

Route21Swimmer4BattleText:
	text_far _Route21Swimmer4BattleText
	text_end

Route21Swimmer4EndBattleText:
	text_far _Route21Swimmer4EndBattleText
	text_end

Route21Swimmer4AfterBattleText:
	text_far _Route21Swimmer4AfterBattleText
	text_end

Route21Swimmer5BattleText:
	text_far _Route21Swimmer5BattleText
	text_end

Route21Swimmer5EndBattleText:
	text_far _Route21Swimmer5EndBattleText
	text_end

Route21Swimmer5AfterBattleText:
	text_far _Route21Swimmer5AfterBattleText
	text_end

Route21Fisher3BattleText:
	text_far _Route21Fisher3BattleText
	text_end

Route21Fisher3EndBattleText:
	text_far _Route21Fisher3EndBattleText
	text_end

Route21Fisher3AfterBattleText:
	text_far _Route21Fisher3AfterBattleText
	text_end

Route21Fisher4BattleText:
	text_far _Route21Fisher4BattleText
	text_end

Route21Fisher4EndBattleText:
	text_far _Route21Fisher4EndBattleText
	text_end

Route21Fisher4AfterBattleText:
	text_far _Route21Fisher4AfterBattleText
	text_end
