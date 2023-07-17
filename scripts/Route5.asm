; PureRGBnote: ADDED: new trainers on this route.
Route5_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route5TrainerHeaders
	ld de, Route5_ScriptPointers
	ld a, [wRoute5CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute5CurScript], a
	ret

Route5_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE5_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE5_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE5_END_BATTLE

Route5_TextPointers:
	def_text_pointers
	dw_const Route5Rookie1Text,              TEXT_ROUTE5_ROOKIE1
	dw_const Route5Rookie2Text,              TEXT_ROUTE5_ROOKIE2
	dw_const Route5Rookie3Text,              TEXT_ROUTE5_ROOKIE3
	dw_const Route5TamerText,                TEXT_ROUTE5_TAMER
	dw_const PickUpItemText,                 TEXT_ROUTE5_ITEM1 ; PureRGBnote: ADDED: new item on this route.
	dw_const Route5UndergroundPathSignText,  TEXT_ROUTE5_UNDERGROUND_PATH_SIGN

Route5TrainerHeaders:
	def_trainers 1
Route5TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_5_TRAINER_0, 3, Route5BattleText1, Route5EndBattleText1, Route5AfterBattleText1
Route5TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_5_TRAINER_1, 3, Route5BattleText2, Route5EndBattleText2, Route5AfterBattleText2
Route5TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_5_TRAINER_2, 3, Route5BattleText3, Route5EndBattleText3, Route5AfterBattleText3
Route5TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_5_TRAINER_3, 3, Route5BattleText4, Route5EndBattleText4, Route5AfterBattleText4
	db -1 ; end

Route5Rookie1Text:
	text_asm
	ld hl, Route5TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

Route5BattleText1:
	text_far _Route5BattleText1
	text_end

Route5EndBattleText1:
	text_far _Route5EndBattleText1
	text_end

Route5AfterBattleText1:
	text_far _Route5AfterBattleText1
	text_end

Route5Rookie2Text:
	text_asm
	ld hl, Route5TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

Route5BattleText2:
	text_far _Route5BattleText2
	text_end

Route5EndBattleText2:
	text_far _Route5EndBattleText2
	text_end

Route5AfterBattleText2:
	text_far _Route5AfterBattleText2
	text_end

Route5Rookie3Text:
	text_asm
	ld hl, Route5TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

Route5BattleText3:
	text_far _Route5BattleText3
	text_end

Route5EndBattleText3:
	text_far _Route5EndBattleText3
	text_end

Route5AfterBattleText3:
	text_far _Route5AfterBattleText3
	text_end

Route5TamerText:
	text_asm
	ld hl, Route5TrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

Route5BattleText4:
	text_far _Route5BattleText4
	text_end

Route5EndBattleText4:
	text_far _Route5EndBattleText4
	text_end

Route5AfterBattleText4:
	text_far _Route5AfterBattleText4
	text_end

Route5UndergroundPathSignText:
	text_far _Route5UndergroundPathSignText
	text_end
