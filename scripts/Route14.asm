Route14_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route14TrainerHeaders
	ld de, Route14_ScriptPointers
	ld a, [wRoute14CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute14CurScript], a
	ret

Route14_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE14_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE14_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE14_END_BATTLE

Route14_TextPointers:
	def_text_pointers
	dw_const Route14CooltrainerM1Text, TEXT_ROUTE14_COOLTRAINER_M1
	dw_const Route14CooltrainerM2Text, TEXT_ROUTE14_COOLTRAINER_M2
	dw_const Route14CooltrainerM3Text, TEXT_ROUTE14_COOLTRAINER_M3
	dw_const Route14CooltrainerM4Text, TEXT_ROUTE14_COOLTRAINER_M4
	dw_const Route14CooltrainerM5Text, TEXT_ROUTE14_COOLTRAINER_M5
	dw_const Route14CooltrainerM6Text, TEXT_ROUTE14_COOLTRAINER_M6
	dw_const Route14Biker1Text,        TEXT_ROUTE14_BIKER1
	dw_const Route14Biker2Text,        TEXT_ROUTE14_BIKER2
	dw_const Route14Biker3Text,        TEXT_ROUTE14_BIKER3
	dw_const Route14Biker4Text,        TEXT_ROUTE14_BIKER4
	dw_const Route14SignText,          TEXT_ROUTE14_SIGN

Route14TrainerHeaders:
	def_trainers
Route14TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_0, 2, Route14CooltrainerM1BattleText, Route14CooltrainerM1EndBattleText, Route14CooltrainerM1AfterBattleText
Route14TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_1, 2, Route14CooltrainerM2BattleText, Route14CooltrainerM2EndBattleText, Route14CooltrainerM2AfterBattleText
Route14TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_2, 4, Route14CooltrainerM3BattleText, Route14CooltrainerM3EndBattleText, Route14CooltrainerM3AfterBattleText
Route14TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_3, 3, Route14CooltrainerM4BattleText, Route14CooltrainerM4EndBattleText, Route14CooltrainerM4AfterBattleText
Route14TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_4, 3, Route14CooltrainerM5BattleText, Route14CooltrainerM5EndBattleText, Route14CooltrainerM5AfterBattleText
Route14TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_5, 4, Route14CooltrainerM6BattleText, Route14CooltrainerM6EndBattleText, Route14CooltrainerM6AfterBattleText
Route14TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_6, 4, Route14Biker1BattleText, Route14Biker1EndBattleText, Route14Biker1AfterBattleText
Route14TrainerHeader7:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_7, 4, Route14Biker2BattleText, Route14Biker2EndBattleText, Route14Biker2AfterBattleText
Route14TrainerHeader8:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_8, 3, Route14Biker3BattleText, Route14Biker3EndBattleText, Route14Biker3AfterBattleText
Route14TrainerHeader9:
	trainer EVENT_BEAT_ROUTE_14_TRAINER_9, 4, Route14Biker4BattleText, Route14Biker4EndBattleText, Route14Biker4AfterBattleText
	db -1 ; end

Route14CooltrainerM1Text:
	text_asm
	ld hl, Route14TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route14CooltrainerM1BattleText:
	text_far _Route14CooltrainerM1BattleText
	text_end

Route14CooltrainerM1EndBattleText:
	text_far _Route14CooltrainerM1EndBattleText
	text_end

Route14CooltrainerM1AfterBattleText:
	text_far _Route14CooltrainerM1AfterBattleText
	text_end

Route14CooltrainerM2Text:
	text_asm
	ld hl, Route14TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route14CooltrainerM2BattleText:
	text_far _Route14CooltrainerM2BattleText
	text_end

Route14CooltrainerM2EndBattleText:
	text_far _Route14CooltrainerM2EndBattleText
	text_end

Route14CooltrainerM2AfterBattleText:
	text_far _Route14CooltrainerM2AfterBattleText
	text_end

Route14CooltrainerM3Text:
	text_asm
	ld hl, Route14TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route14CooltrainerM3BattleText:
	text_far _Route14CooltrainerM3BattleText
	text_end

Route14CooltrainerM3EndBattleText:
	text_far _Route14CooltrainerM3EndBattleText
	text_end

Route14CooltrainerM3AfterBattleText:
	text_far _Route14CooltrainerM3AfterBattleText
	text_end

Route14CooltrainerM4Text:
	text_asm
	ld hl, Route14TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route14CooltrainerM4BattleText:
	text_far _Route14CooltrainerM4BattleText
	text_end

Route14CooltrainerM4EndBattleText:
	text_far _Route14CooltrainerM4EndBattleText
	text_end

Route14CooltrainerM4AfterBattleText:
	text_far _Route14CooltrainerM4AfterBattleText
	text_end

Route14CooltrainerM5Text:
	text_asm
	ld hl, Route14TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route14CooltrainerM5BattleText:
	text_far _Route14CooltrainerM5BattleText
	text_end

Route14CooltrainerM5EndBattleText:
	text_far _Route14CooltrainerM5EndBattleText
	text_end

Route14CooltrainerM5AfterBattleText:
	text_far _Route14CooltrainerM5AfterBattleText
	text_end

Route14CooltrainerM6Text:
	text_asm
	ld hl, Route14TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route14CooltrainerM6BattleText:
	text_far _Route14CooltrainerM6BattleText
	text_end

Route14CooltrainerM6EndBattleText:
	text_far _Route14CooltrainerM6EndBattleText
	text_end

Route14CooltrainerM6AfterBattleText:
	text_far _Route14CooltrainerM6AfterBattleText
	text_end

Route14Biker1Text:
	text_asm
	ld hl, Route14TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route14Biker1BattleText:
	text_far _Route14Biker1BattleText
	text_end

Route14Biker1EndBattleText:
	text_far _Route14Biker1EndBattleText
	text_end

Route14Biker1AfterBattleText:
	text_far _Route14Biker1AfterBattleText
	text_end

Route14Biker2Text:
	text_asm
	ld hl, Route14TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route14Biker2BattleText:
	text_far _Route14Biker2BattleText
	text_end

Route14Biker2EndBattleText:
	text_far _Route14Biker2EndBattleText
	text_end

Route14Biker2AfterBattleText:
	text_far _Route14Biker2AfterBattleText
	text_end

Route14Biker3Text:
	text_asm
	ld hl, Route14TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route14Biker3BattleText:
	text_far _Route14Biker3BattleText
	text_end

Route14Biker3EndBattleText:
	text_far _Route14Biker3EndBattleText
	text_end

Route14Biker3AfterBattleText:
	text_far _Route14Biker3AfterBattleText
	text_end

Route14Biker4Text:
	text_asm
	ld hl, Route14TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route14Biker4BattleText:
	text_far _Route14Biker4BattleText
	text_end

Route14Biker4EndBattleText:
	text_far _Route14Biker4EndBattleText
	text_end

Route14Biker4AfterBattleText:
	text_far _Route14Biker4AfterBattleText
	text_end

Route14SignText:
	text_far _Route14SignText
	text_end
