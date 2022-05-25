SafariZoneWest_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SafariZoneWestTrainerHeaders
	ld de, SafariZoneWest_ScriptPointers
	ld a, [wSafariZoneWestCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSafariZoneWestCurScript], a
	ret

SafariZoneWest_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw RangerPostBattleWest
	dw RangerPostBattleWest1

SafariZoneWest_TextPointers:
	dw SafariZoneWestRangerText0
	dw SafariZoneWestRangerText1
	dw SafariZoneWestTrainerText0
	dw SafariZoneWestTrainerText1
	dw SafariZoneWestTrainerText2
	dw SafariZoneWestTrainerText3
	dw SafariZoneWestTrainerText4
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw SafariZoneWestText5
	dw SafariZoneWestText6
	dw SafariZoneWestText7
	dw SafariZoneWestText8

RangerPostBattleWest:
	SetEvent EVENT_BEAT_SAFARI_ZONE_WEST_RANGER_0
	jpfar RangerPostBattle

RangerPostBattleWest1:
	SetEvent EVENT_BEAT_SAFARI_ZONE_WEST_RANGER_1
	jpfar RangerPostBattle

SafariZoneWestText5:
	text_far _SafariZoneWestText5
	text_end

SafariZoneWestText6:
	text_far _SafariZoneWestText6
	text_end

SafariZoneWestText7:
	text_far _SafariZoneWestText7
	text_end

SafariZoneWestText8:
	text_far _SafariZoneWestText8
	text_end

SafariZoneWestTrainerHeaders:
	def_trainers
SafariZoneWestRangerHeader:
	trainer EVENT_BEAT_SAFARI_ZONE_WEST_RANGER_0, 0, SafariZoneWestRangerBattleText0, SafariZoneWestRangerEndBattleText0, SafariZoneWestRangerAfterBattleText0
SafariZoneWestRangerHeader1:
	trainer EVENT_BEAT_SAFARI_ZONE_WEST_RANGER_1, 0, SafariZoneWestRangerBattleText1, SafariZoneWestRangerEndBattleText1, SafariZoneWestRangerAfterBattleText1
SafariZoneWestTrainerHeader0:
	trainer EVENT_BEAT_SAFARI_ZONE_WEST_TRAINER_0, 3, SafariZoneWestTrainerBattleText0, SafariZoneWestTrainerEndBattleText0, SafariZoneWestTrainerAfterBattleText0
SafariZoneWestTrainerHeader1:
	trainer EVENT_BEAT_SAFARI_ZONE_WEST_TRAINER_1, 3, SafariZoneWestTrainerBattleText1, SafariZoneWestTrainerEndBattleText1, SafariZoneWestTrainerAfterBattleText1
SafariZoneWestTrainerHeader2:
	trainer EVENT_BEAT_SAFARI_ZONE_WEST_TRAINER_2, 3, SafariZoneWestTrainerBattleText2, SafariZoneWestTrainerEndBattleText2, SafariZoneWestTrainerAfterBattleText2
SafariZoneWestTrainerHeader3:
	trainer EVENT_BEAT_SAFARI_ZONE_WEST_TRAINER_3, 3, SafariZoneWestTrainerBattleText3, SafariZoneWestTrainerEndBattleText3, SafariZoneWestTrainerAfterBattleText3
SafariZoneWestTrainerHeader4:
	trainer EVENT_BEAT_SAFARI_ZONE_WEST_TRAINER_4, 3, SafariZoneWestTrainerBattleText4, SafariZoneWestTrainerEndBattleText4, SafariZoneWestTrainerAfterBattleText4
	db -1 ; end

SafariZoneWestRangerText0:
	text_asm
	ld hl, SafariZoneWestRangerHeader
	call TalkToTrainer
	ld a, 3
	ld [wCurMapScript], a 
	jp TextScriptEnd

SafariZoneWestRangerText1:
	text_asm
	ld hl, SafariZoneWestRangerHeader1
	call TalkToTrainer
	ld a, 4
	ld [wCurMapScript], a 
	jp TextScriptEnd

SafariZoneWestTrainerText0:
	text_asm
	ld hl, SafariZoneWestTrainerHeader0
	jr SafariZoneWestTrainerTalk

SafariZoneWestTrainerText1:
	text_asm
	ld hl, SafariZoneWestTrainerHeader1
	jr SafariZoneWestTrainerTalk

SafariZoneWestTrainerText2:
	text_asm
	ld hl, SafariZoneWestTrainerHeader2
	jr SafariZoneWestTrainerTalk

SafariZoneWestTrainerText3:
	text_asm
	ld hl, SafariZoneWestTrainerHeader3
	jr SafariZoneWestTrainerTalk

SafariZoneWestTrainerText4:
	text_asm
	ld hl, SafariZoneWestTrainerHeader4
SafariZoneWestTrainerTalk:
	call TalkToTrainer
	jp TextScriptEnd

SafariZoneWestRangerBattleText0:
	text_far _SafariZoneWestRanger0Text
	text_end

SafariZoneWestRangerEndBattleText0:
	text_far _SafariZoneWestRanger0EndBattleText
	text_end

SafariZoneWestRangerAfterBattleText0:
	text_far _SafariZoneWestRanger0AfterBattleText
	text_end

SafariZoneWestRangerBattleText1:
	text_far _SafariZoneWestRanger1Text
	text_end

SafariZoneWestRangerEndBattleText1:
	text_far _SafariZoneWestRanger1EndBattleText
	text_end

SafariZoneWestRangerAfterBattleText1:
	text_far _SafariZoneWestRanger1AfterBattleText
	text_end

SafariZoneWestTrainerBattleText0:
	text_far _SafariZoneWestBurglarText
	text_end

SafariZoneWestTrainerEndBattleText0:
	text_far _SafariZoneWestBurglarEndBattleText
	text_end

SafariZoneWestTrainerAfterBattleText0:
	text_far _SafariZoneWestBurglarAfterBattleText
	text_end

SafariZoneWestTrainerBattleText1:
	text_far _SafariZoneWestManiacText
	text_end

SafariZoneWestTrainerEndBattleText1:
	text_far _SafariZoneWestManiacEndBattleText
	text_end

SafariZoneWestTrainerAfterBattleText1:
	text_far _SafariZoneWestManiacAfterBattleText
	text_end

SafariZoneWestTrainerBattleText2:
	text_far _SafariZoneWestRockerText
	text_end

SafariZoneWestTrainerEndBattleText2:
	text_far _SafariZoneWestRockerEndBattleText
	text_end

SafariZoneWestTrainerAfterBattleText2:
	text_far _SafariZoneWestRockerAfterBattleText
	text_end

SafariZoneWestTrainerBattleText3:
	text_far _SafariZoneWestJugglerText
	text_end

SafariZoneWestTrainerEndBattleText3:
	text_far _SafariZoneWestJugglerEndBattleText
	text_end

SafariZoneWestTrainerAfterBattleText3:
	text_far _SafariZoneWestJugglerAfterBattleText
	text_end

SafariZoneWestTrainerBattleText4:
	text_far _SafariZoneWestPsychicText
	text_end

SafariZoneWestTrainerEndBattleText4:
	text_far _SafariZoneWestPsychicEndBattleText
	text_end

SafariZoneWestTrainerAfterBattleText4:
	text_far _SafariZoneWestPsychicAfterBattleText
	text_end