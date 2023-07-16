; PureRGBnote: ADDED: the 2 trainers that were added in pokemon yellow were added.

ViridianForest_Script:
	call EnableAutoTextBoxDrawing
	ld hl, ViridianForestTrainerHeaders
	ld de, ViridianForest_ScriptPointers
	ld a, [wViridianForestCurScript]
	call ExecuteCurMapScriptInTable
	ld [wViridianForestCurScript], a
	ret

ViridianForest_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_VIRIDIANFOREST_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_VIRIDIANFOREST_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_VIRIDIANFOREST_END_BATTLE

ViridianForest_TextPointers:
	def_text_pointers
	dw_const ViridianForestYoungster1Text,      TEXT_VIRIDIANFOREST_YOUNGSTER1
	dw_const ViridianForestYoungster2Text,      TEXT_VIRIDIANFOREST_YOUNGSTER2
	dw_const ViridianForestYoungster3Text,      TEXT_VIRIDIANFOREST_YOUNGSTER3
	dw_const ViridianForestYoungster4Text,      TEXT_VIRIDIANFOREST_YOUNGSTER4
	dw_const ViridianForestText5,               TEXT_VIRIDIANFOREST_LASS
	dw_const ViridianForestText6,               TEXT_VIRIDIANFOREST_YOUNGSTER5
	dw_const PickUp3ItemText,                   TEXT_VIRIDIANFOREST_ANTIDOTE
	dw_const PickUp2ItemText,                   TEXT_VIRIDIANFOREST_POTION
	dw_const PickUp5ItemText,                   TEXT_VIRIDIANFOREST_POKE_BALL
	dw_const ViridianForestYoungster5Text,      TEXT_VIRIDIANFOREST_YOUNGSTER6
	dw_const ViridianForestTrainerTips1Text,    TEXT_VIRIDIANFOREST_TRAINER_TIPS1
	dw_const ViridianForestUseAntidoteSignText, TEXT_VIRIDIANFOREST_USE_ANTIDOTE_SIGN
	dw_const ViridianForestTrainerTips2Text,    TEXT_VIRIDIANFOREST_TRAINER_TIPS2
	dw_const ViridianForestTrainerTips3Text,    TEXT_VIRIDIANFOREST_TRAINER_TIPS3
	dw_const ViridianForestTrainerTips4Text,    TEXT_VIRIDIANFOREST_TRAINER_TIPS4
	dw_const ViridianForestLeavingSignText,     TEXT_VIRIDIANFOREST_LEAVING_SIGN

ViridianForestTrainerHeaders:
	def_trainers 2
ViridianForestTrainerHeader0:
	trainer EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_0, 4, ViridianForestYoungster2BattleText, ViridianForestYoungster2EndBattleText, ViridianForestYoungster2AfterBattleText
ViridianForestTrainerHeader1:
	trainer EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_1, 4, ViridianForestYoungster3BattleText, ViridianForestYoungster3EndBattleText, ViridianForestYoungster3AfterBattleText
ViridianForestTrainerHeader2:
	trainer EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_2, 1, ViridianForestYoungster4BattleText, ViridianForestYoungster4EndBattleText, ViridianForestYoungster4AfterBattleText
ViridianForestTrainerHeader3:
	trainer EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_3, 0, ViridianForestBattleText4, ViridianForestEndBattleText4, ViridianForestAfterBattleText4
ViridianForestTrainerHeader4:
	trainer EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_4, 4, ViridianForestBattleText5, ViridianForestEndBattleText5, ViridianForestAfterBattleText5
	db -1 ; end

ViridianForestYoungster1Text:
	text_far _ViridianForestYoungster1Text
	text_end

ViridianForestYoungster2Text:
	text_asm
	ld hl, ViridianForestTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

ViridianForestYoungster3Text:
	text_asm
	ld hl, ViridianForestTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

ViridianForestYoungster4Text:
	text_asm
	ld hl, ViridianForestTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

ViridianForestText5:
	text_asm
	ld hl, ViridianForestTrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

ViridianForestText6:
	text_asm
	ld hl, ViridianForestTrainerHeader4
	call TalkToTrainer
	rst TextScriptEnd

ViridianForestYoungster2BattleText:
	text_far _ViridianForestYoungster2BattleText
	text_end

ViridianForestYoungster2EndBattleText:
	text_far _ViridianForestYoungster2EndBattleText
	text_end

ViridianForestYoungster2AfterBattleText:
	text_far _ViridianForestYoungster2AfterBattleText
	text_end

ViridianForestYoungster3BattleText:
	text_far _ViridianForestYoungster3BattleText
	text_end

ViridianForestYoungster3EndBattleText:
	text_far _ViridianForestYoungster3EndBattleText
	text_end

ViridianForestYoungster3AfterBattleText:
	text_far _ViridianForestYoungster3AfterBattleText
	text_end

ViridianForestYoungster4BattleText:
	text_far _ViridianForestYoungster4BattleText
	text_end

ViridianForestYoungster4EndBattleText:
	text_far _ViridianForestYoungster4EndBattleText
	text_end

ViridianForestYoungster4AfterBattleText:
	text_far _ViridianForestYoungster4AfterBattleText
	text_end

ViridianForestBattleText4:
	text_far _ViridianForestBattleTextPikaGirl
	text_end

ViridianForestEndBattleText4:
	text_far _ViridianForestEndBattleTextPikaGirl
	text_end

ViridianForestAfterBattleText4:
	text_far _ViridianForestAfterBattleTextPikaGirl
	text_end

ViridianForestBattleText5:
	text_far _ViridianForestBattleTextSamurai
	text_end

ViridianForestEndBattleText5:
	text_far _ViridianForestEndBattleTextSamurai
	text_end

ViridianForestAfterBattleText5:
	text_far _ViridianForestAfterBattleTextSamurai
	text_end

ViridianForestYoungster5Text:
	text_far _ViridianForestYoungster5Text
	text_end

ViridianForestTrainerTips1Text:
	text_far _ViridianForestTrainerTips1Text
	text_end

ViridianForestUseAntidoteSignText:
	text_far _ViridianForestUseAntidoteSignText
	text_end

ViridianForestTrainerTips2Text:
	text_far _ViridianForestTrainerTips2Text
	text_end

ViridianForestTrainerTips3Text:
	text_far _ViridianForestTrainerTips3Text
	text_end

ViridianForestTrainerTips4Text:
	text_far _ViridianForestTrainerTips4Text
	text_end

ViridianForestLeavingSignText:
	text_far _ViridianForestLeavingSignText
	text_end
