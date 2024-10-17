; PureRGBnote: ADDED: new trainers on this route.

Route6_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route6TrainerHeaders
	ld de, Route6_ScriptPointers
	ld a, [wRoute6CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute6CurScript], a
	ret

Route6_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE6_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE6_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE6_END_BATTLE

Route6_TextPointers:
	def_text_pointers
	dw_const Route6CooltrainerM1Text,       TEXT_ROUTE6_COOLTRAINER_M1
	dw_const Route6CooltrainerF1Text,       TEXT_ROUTE6_COOLTRAINER_F1
	dw_const Route6Youngster1Text,          TEXT_ROUTE6_YOUNGSTER1
	dw_const Route6CooltrainerM2Text,       TEXT_ROUTE6_COOLTRAINER_M2
	dw_const Route6CooltrainerF2Text,       TEXT_ROUTE6_COOLTRAINER_F2
	dw_const Route6Youngster2Text,          TEXT_ROUTE6_YOUNGSTER2
	dw_const Route6Text7,                   TEXT_ROUTE6_ROOKIE
	dw_const Route6Text8,                   TEXT_ROUTE6_BURGLAR
	dw_const PickUp3ItemText,               TEXT_ROUTE6_ITEM1 ; PureRGBnote: ADDED: new item on this route.
	dw_const Route6UndergroundPathSignText, TEXT_ROUTE6_UNDERGROUND_PATH_SIGN
	dw_const Route6TrainerTipsText,         TEXT_ROUTE6_TRAINER_TIPS

Route6TrainerHeaders:
	def_trainers
Route6TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_6_TRAINER_0, 0, Route6CooltrainerM1BattleText, Route6CooltrainerM1EndBattleText, Route6CooltrainerAfterBattleText
Route6TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_6_TRAINER_1, 0, Route6CooltrainerF1BattleText, Route6CooltrainerF1EndBattleText, Route6CooltrainerAfterBattleText
Route6TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_6_TRAINER_2, 4, Route6Youngster1BattleText, Route6Youngster1EndBattleText, Route6Youngster1AfterBattleText
Route6TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_6_TRAINER_3, 3, Route6CooltrainerM2BattleText, Route6CooltrainerM2EndBattleText, Route6CooltrainerM2AfterBattleText
Route6TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_6_TRAINER_4, 3, Route6CooltrainerF2BattleText, Route6CooltrainerF2EndBattleText, Route6CooltrainerF2AfterBattleText
Route6TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_6_TRAINER_5, 3, Route6Youngster2BattleText, Route6Youngster2EndBattleText, Route6Youngster2AfterBattleText
Route6TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_6_TRAINER_6, 2, Route6BattleText7, Route6EndBattleText7, Route6AfterBattleText7
Route6TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_6_TRAINER_7, 3, Route6BattleText8, Route6EndBattleText8, Route6AfterBattleText8
	db -1 ; end

Route6CooltrainerM1Text:
	text_asm
	ld hl, Route6TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

Route6CooltrainerM1BattleText:
	text_far _Route6CooltrainerM1BattleText
	text_end

Route6CooltrainerM1EndBattleText:
	text_far _Route6CooltrainerM1EndBattleText
	text_end

Route6CooltrainerAfterBattleText: ; used by both COOLTRAINER_M1 and COOLTRAINER_F1
	text_far _Route6CooltrainerAfterBattleText
	text_end

Route6CooltrainerF1Text:
	text_asm
	ld hl, Route6TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

Route6CooltrainerF1BattleText:
	text_far _Route6CooltrainerF1BattleText
	text_end

Route6CooltrainerF1EndBattleText:
	text_far _Route6CooltrainerF1EndBattleText
	text_end

Route6Youngster1Text:
	text_asm
	ld hl, Route6TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

Route6Youngster1BattleText:
	text_far _Route6Youngster1BattleText
	text_end

Route6Youngster1EndBattleText:
	text_far _Route6Youngster1EndBattleText
	text_end

Route6Youngster1AfterBattleText:
	text_far _Route6Youngster1AfterBattleText
	text_end

Route6CooltrainerM2Text:
	text_asm
	ld hl, Route6TrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

Route6CooltrainerM2BattleText:
	text_far _Route6CooltrainerM2BattleText
	text_end

Route6CooltrainerM2EndBattleText:
	text_far _Route6CooltrainerM2EndBattleText
	text_end

Route6CooltrainerM2AfterBattleText:
	text_far _Route6CooltrainerM2AfterBattleText
	text_end

Route6CooltrainerF2Text:
	text_asm
	ld hl, Route6TrainerHeader4
	call TalkToTrainer
	rst TextScriptEnd

Route6CooltrainerF2BattleText:
	text_far _Route6CooltrainerF2BattleText
	text_end

Route6CooltrainerF2EndBattleText:
	text_far _Route6CooltrainerF2EndBattleText
	text_end

Route6CooltrainerF2AfterBattleText:
	text_far _Route6CooltrainerF2AfterBattleText
	text_end

Route6Youngster2Text:
	text_asm
	ld hl, Route6TrainerHeader5
	call TalkToTrainer
	rst TextScriptEnd

Route6Youngster2BattleText:
	text_far _Route6Youngster2BattleText
	text_end

Route6Youngster2EndBattleText:
	text_far _Route6Youngster2EndBattleText
	text_end

Route6Youngster2AfterBattleText:
	text_far _Route6Youngster2AfterBattleText
	text_end

Route6Text7:
	text_asm
	ld hl, Route6TrainerHeader6
	call TalkToTrainer
	rst TextScriptEnd

Route6BattleText7:
	text_far _Route6BattleText7
	text_end

Route6EndBattleText7:
	text_far _Route6EndBattleText7
	text_end

Route6AfterBattleText7:
	text_far _Route6AfterBattleText7
	text_end

Route6Text8:
	text_asm
	ld hl, Route6TrainerHeader7
	call TalkToTrainer
	rst TextScriptEnd

Route6BattleText8:
	text_far _Route6BattleText8
	text_end

Route6EndBattleText8:
	text_far _Route6EndBattleText8
	text_end

Route6AfterBattleText8:
	text_far _Route6AfterBattleText8
	text_end

Route6UndergroundPathSignText:
	text_far _Route6UndergroundPathSignText
	text_end

 ; PureRGBnote: ADDED: New trainer tips sign
Route6TrainerTipsText:
	text_far _Route6TrainerTipsText
	text_end