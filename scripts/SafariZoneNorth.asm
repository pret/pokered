; PureRGBnote: ADDED: new trainers in this location

SafariZoneNorth_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SafariZoneNorthTrainerHeaders
	ld de, SafariZoneNorth_ScriptPointers
	ld a, [wSafariZoneNorthCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSafariZoneNorthCurScript], a
	ret

SafariZoneNorth_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw RangerPostBattleNorth

SafariZoneNorth_TextPointers:
	def_text_pointers
	dw_const SafariZoneNorthRangerText0,       TEXT_SAFARIZONENORTH_RANGER_F
	dw_const SafariZoneNorthTrainerText0,      TEXT_SAFARIZONENORTH_JUGGLER
	dw_const SafariZoneNorthTrainerText1,      TEXT_SAFARIZONENORTH_COOLTRAINER_M
	dw_const SafariZoneNorthTrainerText2,      TEXT_SAFARIZONENORTH_SUPER_NERD
	dw_const SafariZoneNorthTrainerText3,      TEXT_SAFARIZONENORTH_ENGINEER
	dw_const SafariZoneNorthTrainerText4,      TEXT_SAFARIZONENORTH_POKEMANIAC
	dw_const PickUpItemText,                   TEXT_SAFARIZONENORTH_ITEM1
	dw_const PickUpItemText,                   TEXT_SAFARIZONENORTH_ITEM2
	dw_const SafariZoneNorthRestHouseSignText, TEXT_SAFARIZONENORTH_REST_HOUSE_SIGN
	dw_const SafariZoneNorthTrainerTips1Text,  TEXT_SAFARIZONENORTH_TRAINER_TIPS_1
	dw_const SafariZoneNorthSignText,          TEXT_SAFARIZONENORTH_SIGN
	dw_const SafariZoneNorthTrainerTips2Text,  TEXT_SAFARIZONENORTH_TRAINER_TIPS_2
	dw_const SafariZoneNorthTrainerTips3Text,  TEXT_SAFARIZONENORTH_TRAINER_TIPS_3

RangerPostBattleNorth:
	SetEvent EVENT_BEAT_SAFARI_ZONE_NORTH_RANGER_0
	jpfar RangerPostBattle

SafariZoneNorthRestHouseSignText:
	text_far _SafariZoneNorthRestHouseSignText
	text_end

SafariZoneNorthTrainerTips1Text:
	text_far _SafariZoneNorthTrainerTips1Text
	text_end

SafariZoneNorthSignText:
	text_far _SafariZoneNorthSignText
	text_end

SafariZoneNorthTrainerTips2Text:
	text_far _SafariZoneNorthTrainerTips2Text
	text_end

SafariZoneNorthTrainerTips3Text:
	text_far _SafariZoneNorthTrainerTips3Text
	text_end

SafariZoneNorthTrainerHeaders:
	def_trainers
SafariZoneNorthRangerHeader:
	trainer EVENT_BEAT_SAFARI_ZONE_NORTH_RANGER_0, 0, SafariZoneNorthRangerBattleText0, SafariZoneNorthRangerEndBattleText0, SafariZoneNorthRangerAfterBattleText0
SafariZoneNorthTrainerHeader0:
	trainer EVENT_BEAT_SAFARI_ZONE_NORTH_TRAINER_0, 4, SafariZoneNorthTrainerBattleText0, SafariZoneNorthTrainerEndBattleText0, SafariZoneNorthTrainerAfterBattleText0
SafariZoneNorthTrainerHeader1:
	trainer EVENT_BEAT_SAFARI_ZONE_NORTH_TRAINER_1, 4, SafariZoneNorthTrainerBattleText1, SafariZoneNorthTrainerEndBattleText1, SafariZoneNorthTrainerAfterBattleText1
SafariZoneNorthTrainerHeader2:
	trainer EVENT_BEAT_SAFARI_ZONE_NORTH_TRAINER_2, 1, SafariZoneNorthTrainerBattleText2, SafariZoneNorthTrainerEndBattleText2, SafariZoneNorthTrainerAfterBattleText2
SafariZoneNorthTrainerHeader3:
	trainer EVENT_BEAT_SAFARI_ZONE_NORTH_TRAINER_3, 0, SafariZoneNorthTrainerBattleText3, SafariZoneNorthTrainerEndBattleText3, SafariZoneNorthTrainerAfterBattleText3
SafariZoneNorthTrainerHeader4:
	trainer EVENT_BEAT_SAFARI_ZONE_NORTH_TRAINER_4, 4, SafariZoneNorthTrainerBattleText4, SafariZoneNorthTrainerEndBattleText4, SafariZoneNorthTrainerAfterBattleText4
	db -1 ; end

SafariZoneNorthRangerText0:
	text_asm
	ld hl, SafariZoneNorthRangerHeader
	call TalkToTrainer
	ld a, 3
	ld [wCurMapScript], a 
	rst TextScriptEnd

SafariZoneNorthTrainerText0:
	text_asm
	ld hl, SafariZoneNorthTrainerHeader0
	jr SafariZoneNorthTrainerTalk

SafariZoneNorthTrainerText1:
	text_asm
	ld hl, SafariZoneNorthTrainerHeader1
	jr SafariZoneNorthTrainerTalk

SafariZoneNorthTrainerText2:
	text_asm
	ld hl, SafariZoneNorthTrainerHeader2
	jr SafariZoneNorthTrainerTalk

SafariZoneNorthTrainerText3:
	text_asm
	ld hl, SafariZoneNorthTrainerHeader3
	jr SafariZoneNorthTrainerTalk

SafariZoneNorthTrainerText4:
	text_asm
	ld hl, SafariZoneNorthTrainerHeader4
SafariZoneNorthTrainerTalk:
	call TalkToTrainer
	rst TextScriptEnd

SafariZoneNorthRangerBattleText0:
	text_far _SafariZoneNorthRangerText
	text_end

SafariZoneNorthRangerEndBattleText0:
	text_far _SafariZoneNorthRangerEndBattleText
	text_end

SafariZoneNorthRangerAfterBattleText0:
	text_far _SafariZoneNorthRangerAfterBattleText
	text_end

SafariZoneNorthTrainerBattleText0:
	text_far _SafariZoneNorthJugglerText
	text_end

SafariZoneNorthTrainerEndBattleText0:
	text_far _SafariZoneNorthJugglerEndBattleText
	text_end

SafariZoneNorthTrainerAfterBattleText0:
	text_far _SafariZoneNorthJugglerAfterBattleText
	text_end

SafariZoneNorthTrainerBattleText1:
	text_far _SafariZoneNorthCooltrainerMText
	text_end

SafariZoneNorthTrainerEndBattleText1:
	text_far _SafariZoneNorthCooltrainerMEndBattleText
	text_end

SafariZoneNorthTrainerAfterBattleText1:
	text_far _SafariZoneNorthCooltrainerMAfterBattleText
	text_end

SafariZoneNorthTrainerBattleText2:
	text_far _SafariZoneNorthSuperNerdText
	text_end

SafariZoneNorthTrainerEndBattleText2:
	text_far _SafariZoneNorthSuperNerdEndBattleText
	text_end

SafariZoneNorthTrainerAfterBattleText2:
	text_far _SafariZoneNorthSuperNerdAfterBattleText
	text_end

SafariZoneNorthTrainerBattleText3:
	text_far _SafariZoneNorthEngineerText
	text_end

SafariZoneNorthTrainerEndBattleText3:
	text_far _SafariZoneNorthEngineerEndBattleText
	text_end

SafariZoneNorthTrainerAfterBattleText3:
	text_far _SafariZoneNorthEngineerAfterBattleText
	text_end

SafariZoneNorthTrainerBattleText4:
	text_far _SafariZoneNorthManiacText
	text_end

SafariZoneNorthTrainerEndBattleText4:
	text_far _SafariZoneNorthManiacEndBattleText
	text_end

SafariZoneNorthTrainerAfterBattleText4:
	text_far _SafariZoneNorthManiacAfterBattleText
	text_end