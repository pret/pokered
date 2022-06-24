Route17_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route17TrainerHeaders
	ld de, Route17_ScriptPointers
	ld a, [wRoute17CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute17CurScript], a
	ret

Route17_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE17_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE17_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE17_END_BATTLE

Route17_TextPointers:
	def_text_pointers
	dw_const Route17Biker1Text,              TEXT_ROUTE17_BIKER1
	dw_const Route17Biker2Text,              TEXT_ROUTE17_BIKER2
	dw_const Route17Biker3Text,              TEXT_ROUTE17_BIKER3
	dw_const Route17Biker4Text,              TEXT_ROUTE17_BIKER4
	dw_const Route17Biker5Text,              TEXT_ROUTE17_BIKER5
	dw_const Route17Biker6Text,              TEXT_ROUTE17_BIKER6
	dw_const Route17Biker7Text,              TEXT_ROUTE17_BIKER7
	dw_const Route17Biker8Text,              TEXT_ROUTE17_BIKER8
	dw_const Route17Biker9Text,              TEXT_ROUTE17_BIKER9
	dw_const Route17Biker10Text,             TEXT_ROUTE17_BIKER10
	dw_const Route17NoticeSign1Text,         TEXT_ROUTE17_NOTICE_SIGN1
	dw_const Route17TrainerTips1Text,        TEXT_ROUTE17_TRAINER_TIPS1
	dw_const Route17TrainerTips2Text,        TEXT_ROUTE17_TRAINER_TIPS2
	dw_const Route17SignText,                TEXT_ROUTE17_SIGN
	dw_const Route17NoticeSign2Text,         TEXT_ROUTE17_NOTICE_SIGN2
	dw_const Route17CyclingRoadEndsSignText, TEXT_ROUTE17_CYCLING_ROAD_ENDS_SIGN

Route17TrainerHeaders:
	def_trainers
Route17TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_0, 3, Route17Biker1BattleText, Route17Biker1EndBattleText, Route17Biker1AfterBattleText
Route17TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_1, 4, Route17Biker2BattleText, Route17Biker2EndBattleText, Route17Biker2AfterBattleText
Route17TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_2, 4, Route17Biker3BattleText, Route17Biker3EndBattleText, Route17Biker3AfterBattleText
Route17TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_3, 4, Route17Biker4BattleText, Route17Biker4EndBattleText, Route17Biker4AfterBattleText
Route17TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_4, 3, Route17Biker5BattleText, Route17Biker5EndBattleText, Route17Biker5AfterBattleText
Route17TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_5, 2, Route17Biker6BattleText, Route17Biker6EndBattleText, Route17Biker6AfterBattleText
Route17TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_6, 4, Route17Biker7BattleText, Route17Biker7EndBattleText, Route17Biker7AfterBattleText
Route17TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_7, 2, Route17Biker8BattleText, Route17Biker8EndBattleText, Route17Biker8AfterBattleText
Route17TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_8, 3, Route17Biker9BattleText, Route17Biker9EndBattleText, Route17Biker9AfterBattleText
Route17TrainerHeader9:
	trainer EVENT_BEAT_ROUTE_17_TRAINER_9, 4, Route17Biker10BattleText, Route17Biker10EndBattleText, Route17Biker10AfterBattleText
	db -1 ; end

Route17Biker1Text:
	text_asm
	ld hl, Route17TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker1BattleText:
	text_far _Route17Biker1BattleText
	text_end

Route17Biker1EndBattleText:
	text_far _Route17Biker1EndBattleText
	text_end

Route17Biker1AfterBattleText:
	text_far _Route17Biker1AfterBattleText
	text_end

Route17Biker2Text:
	text_asm
	ld hl, Route17TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker2BattleText:
	text_far _Route17Biker2BattleText
	text_end

Route17Biker2EndBattleText:
	text_far _Route17Biker2EndBattleText
	text_end

Route17Biker2AfterBattleText:
	text_far _Route17Biker2AfterBattleText
	text_end

Route17Biker3Text:
	text_asm
	ld hl, Route17TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker3BattleText:
	text_far _Route17Biker3BattleText
	text_end

Route17Biker3EndBattleText:
	text_far _Route17Biker3EndBattleText
	text_end

Route17Biker3AfterBattleText:
	text_far _Route17Biker3AfterBattleText
	text_end

Route17Biker4Text:
	text_asm
	ld hl, Route17TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker4BattleText:
	text_far _Route17Biker4BattleText
	text_end

Route17Biker4EndBattleText:
	text_far _Route17Biker4EndBattleText
	text_end

Route17Biker4AfterBattleText:
	text_far _Route17Biker4AfterBattleText
	text_end

Route17Biker5Text:
	text_asm
	ld hl, Route17TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker5BattleText:
	text_far _Route17Biker5BattleText
	text_end

Route17Biker5EndBattleText:
	text_far _Route17Biker5EndBattleText
	text_end

Route17Biker5AfterBattleText:
	text_far _Route17Biker5AfterBattleText
	text_end

Route17Biker6Text:
	text_asm
	ld hl, Route17TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker6BattleText:
	text_far _Route17Biker6BattleText
	text_end

Route17Biker6EndBattleText:
	text_far _Route17Biker6EndBattleText
	text_end

Route17Biker6AfterBattleText:
	text_far _Route17Biker6AfterBattleText
	text_end

Route17Biker7Text:
	text_asm
	ld hl, Route17TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker7BattleText:
	text_far _Route17Biker7BattleText
	text_end

Route17Biker7EndBattleText:
	text_far _Route17Biker7EndBattleText
	text_end

Route17Biker7AfterBattleText:
	text_far _Route17Biker7AfterBattleText
	text_end

Route17Biker8Text:
	text_asm
	ld hl, Route17TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker8BattleText:
	text_far _Route17Biker8BattleText
	text_end

Route17Biker8EndBattleText:
	text_far _Route17Biker8EndBattleText
	text_end

Route17Biker8AfterBattleText:
	text_far _Route17Biker8AfterBattleText
	text_end

Route17Biker9Text:
	text_asm
	ld hl, Route17TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker9BattleText:
	text_far _Route17Biker9BattleText
	text_end

Route17Biker9EndBattleText:
	text_far _Route17Biker9EndBattleText
	text_end

Route17Biker9AfterBattleText:
	text_far _Route17Biker9AfterBattleText
	text_end

Route17Biker10Text:
	text_asm
	ld hl, Route17TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker10BattleText:
	text_far _Route17Biker10BattleText
	text_end

Route17Biker10EndBattleText:
	text_far _Route17Biker10EndBattleText
	text_end

Route17Biker10AfterBattleText:
	text_far _Route17Biker10AfterBattleText
	text_end

Route17NoticeSign1Text:
	text_far _Route17NoticeSign1Text
	text_end

Route17TrainerTips1Text:
	text_far _Route17TrainerTips1Text
	text_end

Route17TrainerTips2Text:
	text_far _Route17TrainerTips2Text
	text_end

Route17SignText:
	text_far _Route17SignText
	text_end

Route17NoticeSign2Text:
	text_far _Route17NoticeSign2Text
	text_end

Route17CyclingRoadEndsSignText:
	text_far _Route17CyclingRoadEndsSignText
	text_end
