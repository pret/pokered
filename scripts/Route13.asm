Route13_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route13TrainerHeaders
	ld de, Route13_ScriptPointers
	ld a, [wRoute13CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute13CurScript], a
	ret

Route13_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE13_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE13_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE13_END_BATTLE

Route13_TextPointers:
	def_text_pointers
	dw_const Route13CooltrainerM1Text, TEXT_ROUTE13_COOLTRAINER_M1
	dw_const Route13CooltrainerF1Text, TEXT_ROUTE13_COOLTRAINER_F1
	dw_const Route13CooltrainerF2Text, TEXT_ROUTE13_COOLTRAINER_F2
	dw_const Route13CooltrainerF3Text, TEXT_ROUTE13_COOLTRAINER_F3
	dw_const Route13CooltrainerF4Text, TEXT_ROUTE13_COOLTRAINER_F4
	dw_const Route13CooltrainerM2Text, TEXT_ROUTE13_COOLTRAINER_M2
	dw_const Route13Beauty1Text,       TEXT_ROUTE13_BEAUTY1
	dw_const Route13Beauty2Text,       TEXT_ROUTE13_BEAUTY2
	dw_const Route13BikerText,         TEXT_ROUTE13_BIKER
	dw_const Route13CooltrainerM3Text, TEXT_ROUTE13_COOLTRAINER_M3
	dw_const Route13TrainerTips1Text,  TEXT_ROUTE13_TRAINER_TIPS1
	dw_const Route13TrainerTips2Text,  TEXT_ROUTE13_TRAINER_TIPS2
	dw_const Route13SignText,          TEXT_ROUTE13_SIGN

Route13TrainerHeaders:
	def_trainers
Route13TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_0, 2, Route13CooltrainerM1BattleText, Route13CooltrainerM1EndBattleText, Route13CooltrainerM1AfterBattleText
Route13TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_1, 2, Route13CooltrainerF1BattleText, Route13CooltrainerF1EndBattleText, Route13CooltrainerF1AfterBattleText
Route13TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_2, 2, Route13CooltrainerF2BattleText, Route13CooltrainerF2EndBattleText, Route13CooltrainerF2AfterBattleText
Route13TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_3, 2, Route13CooltrainerF3BattleText, Route13CooltrainerF3EndBattleText, Route13CooltrainerF3AfterBattleText
Route13TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_4, 4, Route13CooltrainerF4BattleText, Route13CooltrainerF4EndBattleText, Route13CooltrainerF4AfterBattleText
Route13TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_5, 2, Route13CooltrainerM2BattleText, Route13CooltrainerM2EndBattleText, Route13CooltrainerM2AfterBattleText
Route13TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_6, 4, Route13Beauty1BattleText, Route13Beauty1EndBattleText, Route13Beauty1AfterBattleText
Route13TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_7, 2, Route13Beauty2BattleText, Route13Beauty2EndBattleText, Route13Beauty2AfterBattleText
Route13TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_8, 2, Route13BikerBattleText, Route13BikerEndBattleText, Route13BikerAfterBattleText
Route13TrainerHeader9:
	trainer EVENT_BEAT_ROUTE_13_TRAINER_9, 4, Route13CooltrainerM3BattleText, Route13CooltrainerM3EndBattleText, Route13CooltrainerM3AfterBattleText
	db -1 ; end

Route13CooltrainerM1Text:
	text_asm
	ld hl, Route13TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerM1BattleText:
	text_far _Route13CooltrainerM1BattleText
	text_end

Route13CooltrainerM1EndBattleText:
	text_far _Route13CooltrainerM1EndBattleText
	text_end

Route13CooltrainerM1AfterBattleText:
	text_far _Route13CooltrainerM1AfterBattleText
	text_end

Route13CooltrainerF1Text:
	text_asm
	ld hl, Route13TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerF1BattleText:
	text_far _Route13CooltrainerF1BattleText
	text_end

Route13CooltrainerF1EndBattleText:
	text_far _Route13CooltrainerF1EndBattleText
	text_end

Route13CooltrainerF1AfterBattleText:
	text_far _Route13CooltrainerF1AfterBattleText
	text_end

Route13CooltrainerF2Text:
	text_asm
	ld hl, Route13TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerF2BattleText:
	text_far _Route13CooltrainerF2BattleText
	text_end

Route13CooltrainerF2EndBattleText:
	text_far _Route13CooltrainerF2EndBattleText
	text_end

Route13CooltrainerF2AfterBattleText:
	text_far _Route13CooltrainerF2AfterBattleText
	text_end

Route13CooltrainerF3Text:
	text_asm
	ld hl, Route13TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerF3BattleText:
	text_far _Route13CooltrainerF3BattleText
	text_end

Route13CooltrainerF3EndBattleText:
	text_far _Route13CooltrainerF3EndBattleText
	text_end

Route13CooltrainerF3AfterBattleText:
	text_far _Route13CooltrainerF3AfterBattleText
	text_end

Route13CooltrainerF4Text:
	text_asm
	ld hl, Route13TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerF4BattleText:
	text_far _Route13CooltrainerF4BattleText
	text_end

Route13CooltrainerF4EndBattleText:
	text_far _Route13CooltrainerF4EndBattleText
	text_end

Route13CooltrainerF4AfterBattleText:
	text_far _Route13CooltrainerF4AfterBattleText
	text_end

Route13CooltrainerM2Text:
	text_asm
	ld hl, Route13TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerM2BattleText:
	text_far _Route13CooltrainerM2BattleText
	text_end

Route13CooltrainerM2EndBattleText:
	text_far _Route13CooltrainerM2EndBattleText
	text_end

Route13CooltrainerM2AfterBattleText:
	text_far _Route13CooltrainerM2AfterBattleText
	text_end

Route13Beauty1Text:
	text_asm
	ld hl, Route13TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route13Beauty1BattleText:
	text_far _Route13Beauty1BattleText
	text_end

Route13Beauty1EndBattleText:
	text_far _Route13Beauty1EndBattleText
	text_end

Route13Beauty1AfterBattleText:
	text_far _Route13Beauty1AfterBattleText
	text_end

Route13Beauty2Text:
	text_asm
	ld hl, Route13TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route13Beauty2BattleText:
	text_far _Route13Beauty2BattleText
	text_end

Route13Beauty2EndBattleText:
	text_far _Route13Beauty2EndBattleText
	text_end

Route13Beauty2AfterBattleText:
	text_far _Route13Beauty2AfterBattleText
	text_end

Route13BikerText:
	text_asm
	ld hl, Route13TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route13BikerBattleText:
	text_far _Route13BikerBattleText
	text_end

Route13BikerEndBattleText:
	text_far _Route13BikerEndBattleText
	text_end

Route13BikerAfterBattleText:
	text_far _Route13BikerAfterBattleText
	text_end

Route13CooltrainerM3Text:
	text_asm
	ld hl, Route13TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerM3BattleText:
	text_far _Route13CooltrainerM3BattleText
	text_end

Route13CooltrainerM3EndBattleText:
	text_far _Route13CooltrainerM3EndBattleText
	text_end

Route13CooltrainerM3AfterBattleText:
	text_far _Route13CooltrainerM3AfterBattleText
	text_end

Route13TrainerTips1Text:
	text_far _Route13TrainerTips1Text
	text_end

Route13TrainerTips2Text:
	text_far _Route13TrainerTips2Text
	text_end

Route13SignText:
	text_far _Route13SignText
	text_end
