Route3_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route3TrainerHeaders
	ld de, Route3_ScriptPointers
	ld a, [wRoute3CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute3CurScript], a
	ret

Route3_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE3_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE3_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE3_END_BATTLE

Route3_TextPointers:
	def_text_pointers
	dw_const Route3SuperNerdText,     TEXT_ROUTE3_SUPER_NERD
	dw_const Route3Youngster1Text,    TEXT_ROUTE3_YOUNGSTER1
	dw_const Route3Youngster2Text,    TEXT_ROUTE3_YOUNGSTER2
	dw_const Route3CooltrainerF1Text, TEXT_ROUTE3_COOLTRAINER_F1
	dw_const Route3Youngster3Text,    TEXT_ROUTE3_YOUNGSTER3
	dw_const Route3CooltrainerF2Text, TEXT_ROUTE3_COOLTRAINER_F2
	dw_const Route3Youngster4Text,    TEXT_ROUTE3_YOUNGSTER4
	dw_const Route3Youngster5Text,    TEXT_ROUTE3_YOUNGSTER5
	dw_const Route3CooltrainerF3Text, TEXT_ROUTE3_COOLTRAINER_F3
	dw_const Route3SignText,          TEXT_ROUTE3_SIGN

Route3TrainerHeaders:
	def_trainers 2
Route3TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_0, 2, Route3Youngster1BattleText, Route3Youngster1EndBattleText, Route3Youngster1AfterBattleText
Route3TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_1, 3, Route3Youngster2BattleText, Route3Youngster2EndBattleText, Route3Youngster2AfterBattleText
Route3TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_2, 2, Route3CooltrainerF1BattleText, Route3CooltrainerF1EndBattleText, Route3CooltrainerF1AfterBattleText
Route3TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_3, 1, Route3Youngster3BattleText, Route3Youngster3EndBattleText, Route3Youngster3AfterBattleText
Route3TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_4, 4, Route3CooltrainerF2BattleText, Route3CooltrainerF2EndBattleText, Route3CooltrainerF2AfterBattleText
Route3TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_5, 3, Route3Youngster4BattleText, Route3Youngster4EndBattleText, Route3Youngster4AfterBattleText
Route3TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_6, 3, Route3Youngster5BattleText, Route3Youngster5EndBattleText, Route3Youngster5AfterBattleText
Route3TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_3_TRAINER_7, 2, Route3CooltrainerF3BattleText, Route3CooltrainerF3EndBattleText, Route3CooltrainerF3AfterBattleText
	db -1 ; end

Route3SuperNerdText:
	text_far _Route3Text1
	text_end

Route3Youngster1Text:
	text_asm
	ld hl, Route3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route3Youngster1BattleText:
	text_far _Route3Youngster1BattleText
	text_end

Route3Youngster1EndBattleText:
	text_far _Route3Youngster1EndBattleText
	text_end

Route3Youngster1AfterBattleText:
	text_far _Route3Youngster1AfterBattleText
	text_end

Route3Youngster2Text:
	text_asm
	ld hl, Route3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route3Youngster2BattleText:
	text_far _Route3Youngster2BattleText
	text_end

Route3Youngster2EndBattleText:
	text_far _Route3Youngster2EndBattleText
	text_end

Route3Youngster2AfterBattleText:
	text_far _Route3Youngster2AfterBattleText
	text_end

Route3CooltrainerF1Text:
	text_asm
	ld hl, Route3TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route3CooltrainerF1BattleText:
	text_far _Route3CooltrainerF1BattleText
	text_end

Route3CooltrainerF1EndBattleText:
	text_far _Route3CooltrainerF1EndBattleText
	text_end

Route3CooltrainerF1AfterBattleText:
	text_far _Route3CooltrainerF1AfterBattleText
	text_end

Route3Youngster3Text:
	text_asm
	ld hl, Route3TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route3Youngster3BattleText:
	text_far _Route3Youngster3BattleText
	text_end

Route3Youngster3EndBattleText:
	text_far _Route3Youngster3EndBattleText
	text_end

Route3Youngster3AfterBattleText:
	text_far _Route3Youngster3AfterBattleText
	text_end

Route3CooltrainerF2Text:
	text_asm
	ld hl, Route3TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route3CooltrainerF2BattleText:
	text_far _Route3CooltrainerF2BattleText
	text_end

Route3CooltrainerF2EndBattleText:
	text_far _Route3CooltrainerF2EndBattleText
	text_end

Route3CooltrainerF2AfterBattleText:
	text_far _Route3CooltrainerF2AfterBattleText
	text_end

Route3Youngster4Text:
	text_asm
	ld hl, Route3TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route3Youngster4BattleText:
	text_far _Route3Youngster4BattleText
	text_end

Route3Youngster4EndBattleText:
	text_far _Route3Youngster4EndBattleText
	text_end

Route3Youngster4AfterBattleText:
	text_far _Route3Youngster4AfterBattleText
	text_end

Route3Youngster5Text:
	text_asm
	ld hl, Route3TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route3Youngster5BattleText:
	text_far _Route3Youngster5BattleText
	text_end

Route3Youngster5EndBattleText:
	text_far _Route3Youngster5EndBattleText
	text_end

Route3Youngster5AfterBattleText:
	text_far _Route3Youngster5AfterBattleText
	text_end

Route3CooltrainerF3Text:
	text_asm
	ld hl, Route3TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route3CooltrainerF3BattleText:
	text_far _Route3CooltrainerF3BattleText
	text_end

Route3CooltrainerF3EndBattleText:
	text_far _Route3CooltrainerF3EndBattleText
	text_end

Route3CooltrainerF3AfterBattleText:
	text_far _Route3CooltrainerF3AfterBattleText
	text_end

Route3SignText:
	text_far _Route3SignText
	text_end
