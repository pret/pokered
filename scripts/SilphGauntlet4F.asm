SilphGauntlet4F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SilphGauntlet4FTrainerHeaders
	ld de, SilphGauntlet4F_ScriptPointers
	ld a, [wSilphGauntlet4FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphGauntlet4FCurScript], a
	ret
	
SilphGauntlet4F_ScriptPointers:
	dw PurifiedZoneScript
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	
PurifiedZoneScript:
	ld hl, CoordsData_PureZone
	call ArePlayerCoordsInArray
	jr c, .asm_60960
	ld hl, wd72e
	res 4, [hl]
	ResetEvent EVENT_IN_PURIFIED_ZONE
	jp CheckFightingMapTrainers
.asm_60960
	CheckAndSetEvent EVENT_IN_PURIFIED_ZONE
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld hl, wd72e
	set 4, [hl]
	predef HealParty
	call GBFadeOutToWhite
	call Delay3
	call Delay3
	call GBFadeInFromWhite
	ld a, $7
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ret

CoordsData_PureZone:
	dbmapcoord 10, 12
	dbmapcoord 11, 12
	dbmapcoord 10, 13
	dbmapcoord 11, 13
	db -1 ; end

SilphGauntlet4F_TextPointers:
	dw SilphGauntlet4FText1
	dw SilphGauntlet4FText2
	dw SilphGauntlet4FText3
	dw SilphGauntlet4FText4
	dw SilphGauntlet4FText5
	dw SilphGauntlet4FText6
	dw PurifiedZoneText
	
SilphGauntlet4FTrainerHeaders:
	def_trainers 7
SilphGauntlet4FTrainerHeader0:
	trainer EVENT_BEAT_GAUNTLET_SCIENTIST, 1, SilphGauntlet4FBattleText1, SilphGauntlet4FEndBattleText1, SilphGauntlet4FAfterBattleText1
SilphGauntlet4FTrainerHeader1:
	trainer EVENT_BEAT_GAUNTLET_GAMBLER, 2, SilphGauntlet4FBattleText2, SilphGauntlet4FEndBattleText2, SilphGauntlet4FAfterBattleText2
SilphGauntlet4FTrainerHeader2:
	trainer EVENT_BEAT_GAUNTLET_ROCKET, 2, SilphGauntlet4FBattleText3, SilphGauntlet4FEndBattleText3, SilphGauntlet4FAfterBattleText3
SilphGauntlet4FTrainerHeader3:
	trainer EVENT_BEAT_GAUNTLET_PSYCHIC, 2, SilphGauntlet4FBattleText4, SilphGauntlet4FEndBattleText4, SilphGauntlet4FAfterBattleText4
SilphGauntlet4FTrainerHeader4:
	trainer EVENT_BEAT_GAUNTLET_BURGLAR, 2, SilphGauntlet4FBattleText5, SilphGauntlet4FEndBattleText5, SilphGauntlet4FAfterBattleText5
SilphGauntlet4FTrainerHeader5:
	trainer EVENT_BEAT_GAUNTLET_CHANNELER, 2, SilphGauntlet4FBattleText6, SilphGauntlet4FEndBattleText6, SilphGauntlet4FAfterBattleText6
	db -1 ; end
	
SilphGauntlet4FText1:
	text_asm
	ld hl, SilphGauntlet4FTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphGauntlet4FBattleText1:
	text_far _SilphGauntlet4FBattleText1
	text_end

SilphGauntlet4FEndBattleText1:
	text_far _SilphGauntlet4FEndBattleText1
	text_end

SilphGauntlet4FAfterBattleText1:
	text_far _SilphGauntlet4FAfterBattleText1
	text_end

SilphGauntlet4FText2:
	text_asm
	ld hl, SilphGauntlet4FTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphGauntlet4FBattleText2:
	text_far _SilphGauntlet4FBattleText2
	text_end

SilphGauntlet4FEndBattleText2:
	text_far _SilphGauntlet4FEndBattleText2
	text_end

SilphGauntlet4FAfterBattleText2:
	text_far _SilphGauntlet4FAfterBattleText2
	text_end
	
SilphGauntlet4FText3:
	text_asm
	ld hl, SilphGauntlet4FTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphGauntlet4FBattleText3:
	text_far _SilphGauntlet4FBattleText3
	text_end

SilphGauntlet4FEndBattleText3:
	text_far _SilphGauntlet4FEndBattleText3
	text_end

SilphGauntlet4FAfterBattleText3:
	text_far _SilphGauntlet4FAfterBattleText3
	text_end

SilphGauntlet4FText4:
	text_asm
	ld hl, SilphGauntlet4FTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SilphGauntlet4FBattleText4:
	text_far _SilphGauntlet4FBattleText4
	text_end

SilphGauntlet4FEndBattleText4:
	text_far _SilphGauntlet4FEndBattleText4
	text_end

SilphGauntlet4FAfterBattleText4:
	text_far _SilphGauntlet4FAfterBattleText4
	text_end
	
SilphGauntlet4FText5:
	text_asm
	ld hl, SilphGauntlet4FTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

SilphGauntlet4FBattleText5:
	text_far _SilphGauntlet4FBattleText5
	text_end

SilphGauntlet4FEndBattleText5:
	text_far _SilphGauntlet4FEndBattleText5
	text_end

SilphGauntlet4FAfterBattleText5:
	text_far _SilphGauntlet4FAfterBattleText5
	text_end

SilphGauntlet4FText6:
	text_asm
	ld hl, SilphGauntlet4FTrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

SilphGauntlet4FBattleText6:
	text_far _SilphGauntlet4FBattleText6
	text_end

SilphGauntlet4FEndBattleText6:
	text_far _SilphGauntlet4FEndBattleText6
	text_end

SilphGauntlet4FAfterBattleText6:
	text_far _SilphGauntlet4FAfterBattleText6
	text_end

PurifiedZoneText:
	text_far _PurifiedZoneText
	text_end
	