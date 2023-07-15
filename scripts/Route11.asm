Route11_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route11TrainerHeaders
	ld de, Route11_ScriptPointers
	ld a, [wRoute11CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute11CurScript], a
	ret

Route11_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE11_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE11_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE11_END_BATTLE

Route11_TextPointers:
	def_text_pointers
	dw_const Route11Gambler1Text,         TEXT_ROUTE11_GAMBLER1
	dw_const Route11Gambler2Text,         TEXT_ROUTE11_GAMBLER2
	dw_const Route11Youngster1Text,       TEXT_ROUTE11_YOUNGSTER1
	dw_const Route11SuperNerd1Text,       TEXT_ROUTE11_SUPER_NERD1
	dw_const Route11Youngster2Text,       TEXT_ROUTE11_YOUNGSTER2
	dw_const Route11Gambler3Text,         TEXT_ROUTE11_GAMBLER3
	dw_const Route11Gambler4Text,         TEXT_ROUTE11_GAMBLER4
	dw_const Route11Youngster3Text,       TEXT_ROUTE11_YOUNGSTER3
	dw_const Route11SuperNerd2Text,       TEXT_ROUTE11_SUPER_NERD2
	dw_const Route11Youngster4Text,       TEXT_ROUTE11_YOUNGSTER4
	dw_const Route11DiglettsCaveSignText, TEXT_ROUTE11_DIGLETTSCAVE_SIGN

Route11TrainerHeaders:
	def_trainers
Route11TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_0, 3, Route11Gambler1BattleText, Route11Gambler1EndBattleText, Route11Gambler1AfterBattleText
Route11TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_1, 2, Route11Gambler2BattleText, Route11Gambler2EndBattleText, Route11Gambler2AfterBattleText
Route11TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_2, 3, Route11Youngster1BattleText, Route11Youngster1EndBattleText, Route11Youngster1AfterBattleText
Route11TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_3, 3, Route11SuperNerd1BattleText, Route11SuperNerd1EndBattleText, Route11SuperNerd1AfterBattleText
Route11TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_4, 4, Route11Youngster2BattleText, Route11Youngster2EndBattleText, Route11Youngster2AfterBattleText
Route11TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_5, 3, Route11Gambler3BattleText, Route11Gambler3EndBattleText, Route11Gambler3AfterBattleText
Route11TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_6, 3, Route11Gambler4BattleText, Route11Gambler4EndBattleText, Route11Gambler4AfterBattleText
Route11TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_7, 4, Route11Youngster3BattleText, Route11Youngster3EndBattleText, Route11Youngster3AfterBattleText
Route11TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_8, 3, Route11SuperNerd2BattleText, Route11SuperNerd2EndBattleText, Route11SuperNerd2AfterBattleText
Route11TrainerHeader9:
	trainer EVENT_BEAT_ROUTE_11_TRAINER_9, 4, Route11Youngster4BattleText, Route11Youngster4EndBattleText, Route11Youngster4AfterBattleText
	db -1 ; end

Route11Gambler1Text:
	text_asm
	ld hl, Route11TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route11Gambler1BattleText:
	text_far _Route11Gambler1BattleText
	text_end

Route11Gambler1EndBattleText:
	text_far _Route11Gambler1EndBattleText
	text_end

Route11Gambler1AfterBattleText:
	text_far _Route11Gambler1AfterBattleText
	text_end

Route11Gambler2Text:
	text_asm
	ld hl, Route11TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route11Gambler2BattleText:
	text_far _Route11Gambler2BattleText
	text_end

Route11Gambler2EndBattleText:
	text_far _Route11Gambler2EndBattleText
	text_end

Route11Gambler2AfterBattleText:
	text_far _Route11Gambler2AfterBattleText
	text_end

Route11Youngster1Text:
	text_asm
	ld hl, Route11TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route11Youngster1BattleText:
	text_far _Route11Youngster1BattleText
	text_end

Route11Youngster1EndBattleText:
	text_far _Route11Youngster1EndBattleText
	text_end

Route11Youngster1AfterBattleText:
	text_far _Route11Youngster1AfterBattleText
	text_end

Route11SuperNerd1Text:
	text_asm
	ld hl, Route11TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route11SuperNerd1BattleText:
	text_far _Route11SuperNerd1BattleText
	text_end

Route11SuperNerd1EndBattleText:
	text_far _Route11SuperNerd1EndBattleText
	text_end

Route11SuperNerd1AfterBattleText:
	text_far _Route11SuperNerd1AfterBattleText
	text_end

Route11Youngster2Text:
	text_asm
	ld hl, Route11TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route11Youngster2BattleText:
	text_far _Route11Youngster2BattleText
	text_end

Route11Youngster2EndBattleText:
	text_far _Route11Youngster2EndBattleText
	text_end

Route11Youngster2AfterBattleText:
	text_far _Route11Youngster2AfterBattleText5
	text_end

Route11Gambler3Text:
	text_asm
	ld hl, Route11TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route11Gambler3BattleText:
	text_far _Route11Gambler3BattleText
	text_end

Route11Gambler3EndBattleText:
	text_far _Route11Gambler3EndBattleText
	text_end

Route11Gambler3AfterBattleText:
	text_far _Route11Gambler3AfterBattleText
	text_end

Route11Gambler4Text:
	text_asm
	ld hl, Route11TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route11Gambler4BattleText:
	text_far _Route11Gambler4BattleText
	text_end

Route11Gambler4EndBattleText:
	text_far _Route11Gambler4EndBattleText
	text_end

Route11Gambler4AfterBattleText:
	text_far _Route11Gambler4AfterBattleText
	text_end

Route11Youngster3Text:
	text_asm
	ld hl, Route11TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route11Youngster3BattleText:
	text_far _Route11Youngster3BattleText
	text_end

Route11Youngster3EndBattleText:
	text_far _Route11Youngster3EndBattleText
	text_end

Route11Youngster3AfterBattleText:
	text_far _Route11Youngster3AfterBattleText
	text_end

Route11SuperNerd2Text:
	text_asm
	ld hl, Route11TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route11SuperNerd2BattleText:
	text_far _Route11SuperNerd2BattleText
	text_end

Route11SuperNerd2EndBattleText:
	text_far _Route11SuperNerd2EndBattleText
	text_end

Route11SuperNerd2AfterBattleText:
	text_far _Route11SuperNerd2AfterBattleText
	text_end

Route11Youngster4Text:
	text_asm
	ld hl, Route11TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route11Youngster4BattleText:
	text_far _Route11Youngster4BattleText
	text_end

Route11Youngster4EndBattleText:
	text_far _Route11Youngster4EndBattleText
	text_end

Route11Youngster4AfterBattleText:
	text_far _Route11Youngster4AfterBattleText
	text_end

Route11DiglettsCaveSignText:
	text_far _Route11DiglettsCaveSignText
	text_end
