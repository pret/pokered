Route18_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route18TrainerHeaders
	ld de, Route18_ScriptPointers
	ld a, [wRoute18CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute18CurScript], a
	ret

Route18_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE18_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE18_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE18_END_BATTLE

Route18_TextPointers:
	def_text_pointers
	dw_const Route18CooltrainerM1Text,   TEXT_ROUTE18_COOLTRAINER_M1
	dw_const Route18CooltrainerM2Text,   TEXT_ROUTE18_COOLTRAINER_M2
	dw_const Route18CooltrainerM3Text,   TEXT_ROUTE18_COOLTRAINER_M3
	dw_const Route18SignText,            TEXT_ROUTE18_SIGN
	dw_const Route18CyclingRoadSignText, TEXT_ROUTE18_CYCLING_ROAD_SIGN

Route18TrainerHeaders:
	def_trainers
Route18TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_18_TRAINER_0, 3, Route18CooltrainerM1BattleText, Route18CooltrainerM1EndBattleText, Route18CooltrainerM1AfterBattleText
Route18TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_18_TRAINER_1, 3, Route18CooltrainerM2BattleText, Route18CooltrainerM2EndBattleText, Route18CooltrainerM2AfterBattleText
Route18TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_18_TRAINER_2, 4, Route18CooltrainerM3BattleText, Route18CooltrainerM3EndBattleText, Route18CooltrainerM3AfterBattleText
	db -1 ; end

Route18CooltrainerM1Text:
	text_asm
	ld hl, Route18TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route18CooltrainerM1BattleText:
	text_far _Route18CooltrainerM1BattleText
	text_end

Route18CooltrainerM1EndBattleText:
	text_far _Route18CooltrainerM1EndBattleText
	text_end

Route18CooltrainerM1AfterBattleText:
	text_far _Route18CooltrainerM1AfterBattleText
	text_end

Route18CooltrainerM2Text:
	text_asm
	ld hl, Route18TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route18CooltrainerM2BattleText:
	text_far _Route18CooltrainerM2BattleText
	text_end

Route18CooltrainerM2EndBattleText:
	text_far _Route18CooltrainerM2EndBattleText
	text_end

Route18CooltrainerM2AfterBattleText:
	text_far _Route18CooltrainerM2AfterBattleText
	text_end

Route18CooltrainerM3Text:
	text_asm
	ld hl, Route18TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route18CooltrainerM3BattleText:
	text_far _Route18CooltrainerM3BattleText
	text_end

Route18CooltrainerM3EndBattleText:
	text_far _Route18CooltrainerM3EndBattleText
	text_end

Route18CooltrainerM3AfterBattleText:
	text_far _Route18CooltrainerM3AfterBattleText
	text_end

Route18SignText:
	text_far _Route18SignText
	text_end

Route18CyclingRoadSignText:
	text_far _Route18CyclingRoadSignText
	text_end
