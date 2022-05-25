SafariZoneEast_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SafariZoneEastTrainerHeaders
	ld de, SafariZoneEast_ScriptPointers
	ld a, [wSafariZoneEastCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSafariZoneEastCurScript], a
	ret

SafariZoneEast_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw RangerPostBattleEast

SafariZoneEast_TextPointers:
	dw SafariZoneEastRangerText0
	dw SafariZoneEastTrainerText0
	dw SafariZoneEastTrainerText1
	dw SafariZoneEastTrainerText2
	dw SafariZoneEastTrainerText3
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw SafariZoneEastText5
	dw SafariZoneEastText6
	dw SafariZoneEastText7

RangerPostBattleEast:
	SetEvent EVENT_BEAT_SAFARI_ZONE_EAST_RANGER_0
	jpfar RangerPostBattle

SafariZoneEastText5:
	text_far _SafariZoneEastText5
	text_end

SafariZoneEastText6:
	text_far _SafariZoneEastText6
	text_end

SafariZoneEastText7:
	text_far _SafariZoneEastText7
	text_end

SafariZoneEastTrainerHeaders:
	def_trainers
SafariZoneEastRangerHeader:
	trainer EVENT_BEAT_SAFARI_ZONE_EAST_RANGER_0, 0, SafariZoneEastRangerBattleText0, SafariZoneEastRangerEndBattleText0, SafariZoneEastRangerAfterBattleText0
SafariZoneEastTrainerHeader0:
	trainer EVENT_BEAT_SAFARI_ZONE_EAST_TRAINER_0, 3, SafariZoneEastTrainerBattleText0, SafariZoneEastTrainerEndBattleText0, SafariZoneEastTrainerAfterBattleText0
SafariZoneEastTrainerHeader1:
	trainer EVENT_BEAT_SAFARI_ZONE_EAST_TRAINER_1, 4, SafariZoneEastTrainerBattleText1, SafariZoneEastTrainerEndBattleText1, SafariZoneEastTrainerAfterBattleText1
SafariZoneEastTrainerHeader2:
	trainer EVENT_BEAT_SAFARI_ZONE_EAST_TRAINER_2, 2, SafariZoneEastTrainerBattleText2, SafariZoneEastTrainerEndBattleText2, SafariZoneEastTrainerAfterBattleText2
SafariZoneEastTrainerHeader3:
	trainer EVENT_BEAT_SAFARI_ZONE_EAST_TRAINER_3, 0, SafariZoneEastTrainerBattleText3, SafariZoneEastTrainerEndBattleText3, SafariZoneEastTrainerAfterBattleText3
	db -1 ; end

SafariZoneEastRangerText0:
	text_asm
	ld hl, SafariZoneEastRangerHeader
	call TalkToTrainer
	ld a, 3
	ld [wCurMapScript], a 
	jp TextScriptEnd

SafariZoneEastTrainerText0:
	text_asm
	ld hl, SafariZoneEastTrainerHeader0
	jr SafariZoneEastTrainerTalk

SafariZoneEastTrainerText1:
	text_asm
	ld hl, SafariZoneEastTrainerHeader1
	jr SafariZoneEastTrainerTalk

SafariZoneEastTrainerText2:
	text_asm
	ld hl, SafariZoneEastTrainerHeader2
	jr SafariZoneEastTrainerTalk

SafariZoneEastTrainerText3:
	text_asm
	ld hl, SafariZoneEastTrainerHeader3
SafariZoneEastTrainerTalk:
	call TalkToTrainer
	jp TextScriptEnd

SafariZoneEastRangerBattleText0:
	text_far _SafariZoneEastRangerText
	text_end

SafariZoneEastRangerEndBattleText0:
	text_far _SafariZoneEastRangerEndBattleText
	text_end

SafariZoneEastRangerAfterBattleText0:
	text_far _SafariZoneEastRangerAfterBattleText
	text_end

SafariZoneEastTrainerBattleText0:
	text_far _SafariZoneEastPsychicText
	text_end

SafariZoneEastTrainerEndBattleText0:
	text_far _SafariZoneEastPsychicEndBattleText
	text_end

SafariZoneEastTrainerAfterBattleText0:
	text_far _SafariZoneEastPsychicAfterBattleText
	text_end

SafariZoneEastTrainerBattleText1:
	text_far _SafariZoneEastRockerText
	text_end

SafariZoneEastTrainerEndBattleText1:
	text_far _SafariZoneEastRockerEndBattleText
	text_end

SafariZoneEastTrainerAfterBattleText1:
	text_far _SafariZoneEastRockerAfterBattleText
	text_end

SafariZoneEastTrainerBattleText2:
	text_far _SafariZoneEastCooltrainerMText
	text_end

SafariZoneEastTrainerEndBattleText2:
	text_far _SafariZoneEastCooltrainerMEndBattleText
	text_end

SafariZoneEastTrainerAfterBattleText2:
	text_far _SafariZoneEastCooltrainerMAfterBattleText
	text_end

SafariZoneEastTrainerBattleText3:
	text_far _SafariZoneEastEngineerText
	text_end

SafariZoneEastTrainerEndBattleText3:
	text_far _SafariZoneEastEngineerEndBattleText
	text_end

SafariZoneEastTrainerAfterBattleText3:
	text_far _SafariZoneEastEngineerAfterBattleText
	text_end