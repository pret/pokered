Route15_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route15TrainerHeaders
	ld de, Route15_ScriptPointers
	ld a, [wRoute15CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute15CurScript], a
	ret

Route15_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE15_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE15_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE15_END_BATTLE

Route15_TextPointers:
	def_text_pointers
	dw_const Route15CooltrainerF1Text, TEXT_ROUTE15_COOLTRAINER_F1
	dw_const Route15CooltrainerF2Text, TEXT_ROUTE15_COOLTRAINER_F2
	dw_const Route15CooltrainerM1Text, TEXT_ROUTE15_COOLTRAINER_M1
	dw_const Route15CooltrainerM2Text, TEXT_ROUTE15_COOLTRAINER_M2
	dw_const Route15Beauty1Text,       TEXT_ROUTE15_BEAUTY1
	dw_const Route15Beauty2Text,       TEXT_ROUTE15_BEAUTY2
	dw_const Route15Biker1Text,        TEXT_ROUTE15_BIKER1
	dw_const Route15Biker2Text,        TEXT_ROUTE15_BIKER2
	dw_const Route15CooltrainerF3Text, TEXT_ROUTE15_COOLTRAINER_F3
	dw_const Route15CooltrainerF4Text, TEXT_ROUTE15_COOLTRAINER_F4
	dw_const PickUpItemText,           TEXT_ROUTE15_TM_RAGE
	dw_const Route15SignText,          TEXT_ROUTE15_SIGN

Route15TrainerHeaders:
	def_trainers
Route15TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_0, 2, Route15CooltrainerF1BattleText, Route15CooltrainerF1EndBattleText, Route15CooltrainerF1AfterBattleText
Route15TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_1, 3, Route15CooltrainerF2BattleText, Route15CooltrainerF2EndBattleText, Route15CooltrainerF2AfterBattleText
Route15TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_2, 3, Route15CooltrainerM1BattleText, Route15CooltrainerM1EndBattleText, Route15CooltrainerM1AfterBattleText
Route15TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_3, 3, Route15CooltrainerM2BattleText, Route15CooltrainerM2EndBattleText, Route15CooltrainerM2AfterBattleText
Route15TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_4, 2, Route15Beauty1BattleText, Route15Beauty1EndBattleText, Route15Beauty1AfterBattleText
Route15TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_5, 3, Route15Beauty2BattleText, Route15Beauty2EndBattleText, Route15Beauty2AfterBattleText
Route15TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_6, 3, Route15Biker1BattleText, Route15Biker1EndBattleText, Route15Biker1AfterBattleText
Route15TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_7, 3, Route15Biker2BattleText, Route15Biker2EndBattleText, Route15Biker2AfterBattleText
Route15TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_8, 3, Route15CooltrainerF3BattleText, Route15CooltrainerF3EndBattleText, Route15CooltrainerF3AfterBattleText
Route15TrainerHeader9:
	trainer EVENT_BEAT_ROUTE_15_TRAINER_9, 3, Route15CooltrainerF4BattleText, Route15CooltrainerF4EndBattleText, Route15CooltrainerF4AfterBattleText
	db -1 ; end

Route15CooltrainerF1Text:
	text_asm
	ld hl, Route15TrainerHeader0
	jr Route15TalkToTrainer

Route15CooltrainerF2Text:
	text_asm
	ld hl, Route15TrainerHeader1
	jr Route15TalkToTrainer

Route15CooltrainerM1Text:
	text_asm
	ld hl, Route15TrainerHeader2
	jr Route15TalkToTrainer

Route15CooltrainerM2Text:
	text_asm
	ld hl, Route15TrainerHeader3
	jr Route15TalkToTrainer

Route15Beauty1Text:
	text_asm
	ld hl, Route15TrainerHeader4
	jr Route15TalkToTrainer

Route15Beauty2Text:
	text_asm
	ld hl, Route15TrainerHeader5
	jr Route15TalkToTrainer

Route15Biker1Text:
	text_asm
	ld hl, Route15TrainerHeader6
	jr Route15TalkToTrainer

Route15Biker2Text:
	text_asm
	ld hl, Route15TrainerHeader7
	jr Route15TalkToTrainer

Route15CooltrainerF3Text:
	text_asm
	ld hl, Route15TrainerHeader8
	jr Route15TalkToTrainer

Route15CooltrainerF4Text:
	text_asm
	ld hl, Route15TrainerHeader9
Route15TalkToTrainer:
	call TalkToTrainer
	jp TextScriptEnd

Route15CooltrainerF1BattleText:
	text_far _Route15CooltrainerF1BattleText
	text_end

Route15CooltrainerF1EndBattleText:
	text_far _Route15CooltrainerF1EndBattleText
	text_end

Route15CooltrainerF1AfterBattleText:
	text_far _Route15CooltrainerF1AfterBattleText
	text_end

Route15CooltrainerF2BattleText:
	text_far _Route15CooltrainerF2BattleText
	text_end

Route15CooltrainerF2EndBattleText:
	text_far _Route15CooltrainerF2EndBattleText
	text_end

Route15CooltrainerF2AfterBattleText:
	text_far _Route15CooltrainerF2AfterBattleText
	text_end

Route15CooltrainerM1BattleText:
	text_far _Route15CooltrainerM1BattleText
	text_end

Route15CooltrainerM1EndBattleText:
	text_far _Route15CooltrainerM1EndBattleText
	text_end

Route15CooltrainerM1AfterBattleText:
	text_far _Route15CooltrainerM1AfterBattleText
	text_end

Route15CooltrainerM2BattleText:
	text_far _Route15CooltrainerM2BattleText
	text_end

Route15CooltrainerM2EndBattleText:
	text_far _Route15CooltrainerM2EndBattleText
	text_end

Route15CooltrainerM2AfterBattleText:
	text_far _Route15CooltrainerM2AfterBattleText
	text_end

Route15Beauty1BattleText:
	text_far _Route15Beauty1BattleText
	text_end

Route15Beauty1EndBattleText:
	text_far _Route15Beauty1EndBattleText
	text_end

Route15Beauty1AfterBattleText:
	text_far _Route15Beauty1AfterBattleText
	text_end

Route15Beauty2BattleText:
	text_far _Route15Beauty2BattleText
	text_end

Route15Beauty2EndBattleText:
	text_far _Route15Beauty2EndBattleText
	text_end

Route15Beauty2AfterBattleText:
	text_far _Route15Beauty2AfterBattleText
	text_end

Route15Biker1BattleText:
	text_far _Route15Biker1BattleText
	text_end

Route15Biker1EndBattleText:
	text_far _Route15Biker1EndBattleText
	text_end

Route15Biker1AfterBattleText:
	text_far _Route15Biker1AfterBattleText
	text_end

Route15Biker2BattleText:
	text_far _Route15Biker2BattleText
	text_end

Route15Biker2EndBattleText:
	text_far _Route15Biker2EndBattleText
	text_end

Route15Biker2AfterBattleText:
	text_far _Route15Biker2AfterBattleText
	text_end

Route15CooltrainerF3BattleText:
	text_far _Route15CooltrainerF3BattleText
	text_end

Route15CooltrainerF3EndBattleText:
	text_far _Route15CooltrainerF3EndBattleText
	text_end

Route15CooltrainerF3AfterBattleText:
	text_far _Route15CooltrainerF3AfterBattleText
	text_end

Route15CooltrainerF4BattleText:
	text_far _Route15CooltrainerF4BattleText
	text_end

Route15CooltrainerF4EndBattleText:
	text_far _Route15CooltrainerF4EndBattleText
	text_end

Route15CooltrainerF4AfterBattleText:
	text_far _Route15CooltrainerF4AfterBattleText
	text_end

Route15SignText:
	text_far _Route15SignText
	text_end
