; PureRGBnote: ADDED: new trainers on this route.

Route4_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route4TrainerHeaders
	ld de, Route4_ScriptPointers
	ld a, [wRoute4CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute4CurScript], a
	ret

Route4_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE4_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE4_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE4_END_BATTLE

Route4_TextPointers:
	def_text_pointers
	dw_const Route4CooltrainerF1Text, TEXT_ROUTE4_COOLTRAINER_F1
	dw_const Route4CooltrainerF2Text, TEXT_ROUTE4_COOLTRAINER_F2
	dw_const Route4Text3,             TEXT_ROUTE4_ROOKIE1
	dw_const Route4Text4,             TEXT_ROUTE4_ROOKIE2
	dw_const Route4Text5,             TEXT_ROUTE4_TAMER
	dw_const PickUpItemText,          TEXT_ROUTE4_ITEM1
	dw_const PickUpItemText,          TEXT_ROUTE4_ITEM2 ; PureRGBnote: ADDED: new item on this route.
	dw_const PokeCenterSignText,      TEXT_ROUTE4_POKECENTER_SIGN
	dw_const Route4MtMoonSignText,    TEXT_ROUTE4_MT_MOON_SIGN
	dw_const Route4SignText,          TEXT_ROUTE4_SIGN
	dw_const Route4Text8,             TEXT_ROUTE4_TRAINER_TIPS1 ; PureRGBnote: ADDED: new trainer tips sign on this route.
	dw_const Route4Text9,             TEXT_ROUTE4_TRAINER_TIPS2 ; PureRGBnote: ADDED: new trainer tips sign on this route.

Route4TrainerHeaders:
	def_trainers 2
Route4TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_4_TRAINER_0, 3, Route4CooltrainerF2BattleText, Route4CooltrainerF2EndBattleText, Route4CooltrainerF2AfterBattleText
Route4TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_4_TRAINER_1, 0, Route4BattleText2, Route4EndBattleText2, Route4AfterBattleText2
Route4TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_4_TRAINER_2, 0, Route4BattleText3, Route4EndBattleText3, Route4AfterBattleText3
Route4TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_4_TRAINER_3, 4, Route4BattleText4, Route4EndBattleText4, Route4AfterBattleText4
	db -1 ; end

Route4CooltrainerF1Text:
	text_far _Route4CooltrainerF1Text
	text_end

Route4CooltrainerF2Text:
	text_asm
	ld hl, Route4TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

Route4CooltrainerF2BattleText:
	text_far _Route4CooltrainerF2BattleText
	text_end

Route4CooltrainerF2EndBattleText:
	text_far _Route4CooltrainerF2EndBattleText
	text_end

Route4CooltrainerF2AfterBattleText:
	text_far _Route4CooltrainerF2AfterBattleText
	text_end

Route4Text3:
	text_asm
	ld hl, Route4TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

Route4BattleText2:
	text_far _Route4BattleText2
	text_end

Route4EndBattleText2:
	text_far _Route4EndBattleText2
	text_end

Route4AfterBattleText2:
	text_far _Route4AfterBattleText2
	text_end

Route4Text4:
	text_asm
	ld hl, Route4TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

Route4BattleText3:
	text_far _Route4BattleText3
	text_end

Route4EndBattleText3:
	text_far _Route4EndBattleText3
	text_end

Route4AfterBattleText3:
	text_far _Route4AfterBattleText3
	text_end

Route4Text5:
	text_asm
	ld hl, Route4TrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

Route4BattleText4:
	text_far _Route4BattleText4
	text_end

Route4EndBattleText4:
	text_far _Route4EndBattleText4
	text_end

Route4AfterBattleText4:
	text_far _Route4AfterBattleText4
	text_end

Route4MtMoonSignText:
	text_far _Route4MtMoonSignText
	text_end

Route4SignText:
	text_far _Route4SignText
	text_end

Route4Text8:
	text_far _Route4Text8
	text_end

Route4Text9:
	text_far _Route4Text9
	text_end