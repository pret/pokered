SaffronGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	call nz, .LoadNames
	call EnableAutoTextBoxDrawing
	ld hl, SaffronGymTrainerHeaders
	ld de, SaffronGym_ScriptPointers
	ld a, [wSaffronGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSaffronGymCurScript], a
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

.CityName:
	db "SAFFRON CITY@"

.LeaderName:
	db "SABRINA@"

SaffronGymResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wSaffronGymCurScript], a
	ld [wCurMapScript], a
	ret

SaffronGym_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw SaffronGymSabrinaPostBattle

SaffronGymSabrinaPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jp z, SaffronGymResetScripts
	ld a, $f0
	ld [wJoyIgnore], a

SaffronGymReceiveTM46:
	ld a, $a
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_SABRINA
	lb bc, TM_PSYWAVE, 1
	call GiveItem
	jr nc, .BagFull
	ld a, $b
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM46
	jr .gymVictory
.BagFull
	ld a, $c
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_MARSHBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_MARSHBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_SAFFRON_GYM_TRAINER_0, EVENT_BEAT_SAFFRON_GYM_TRAINER_6

	jp SaffronGymResetScripts

SaffronGym_TextPointers:
	dw SabrinaText
	dw SaffronGymTrainerText1
	dw SaffronGymTrainerText2
	dw SaffronGymTrainerText3
	dw SaffronGymTrainerText4
	dw SaffronGymTrainerText5
	dw SaffronGymTrainerText6
	dw SaffronGymTrainerText7
	dw SaffronGymGuideText
	dw KogaMarshBadgeInfoText
	dw ReceivedTM46Text
	dw TM46NoRoomText

SaffronGymTrainerHeaders:
	def_trainers 2
SaffronGymTrainerHeader0:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_0, 3, SaffronGymBattleText1, SaffronGymEndBattleText1, SaffronGymAfterBattleText1
SaffronGymTrainerHeader1:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_1, 3, SaffronGymBattleText2, SaffronGymEndBattleText2, SaffronGymAfterBattleText2
SaffronGymTrainerHeader2:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_2, 3, SaffronGymBattleText3, SaffronGymEndBattleText3, SaffronGymAfterBattleText3
SaffronGymTrainerHeader3:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_3, 3, SaffronGymBattleText4, SaffronGymEndBattleText4, SaffronGymAfterBattleText4
SaffronGymTrainerHeader4:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_4, 3, SaffronGymBattleText5, SaffronGymEndBattleText5, SaffronGymAfterBattleText5
SaffronGymTrainerHeader5:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_5, 3, SaffronGymBattleText6, SaffronGymEndBattleText6, SaffronGymAfterBattleText6
SaffronGymTrainerHeader6:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_6, 3, SaffronGymBattleText7, SaffronGymEndBattleText7, SaffronGymAfterBattleText7
	db -1 ; end

SabrinaText:
	text_asm
	CheckEvent EVENT_BEAT_SABRINA
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM46
	jr nz, .afterBeat
	call z, SaffronGymReceiveTM46
	call DisableWaitingAfterTextDisplay
	jr .done
.afterBeat
	ld hl, SabrinaPostBattleAdviceText
	call PrintText
	jr .done
.beforeBeat
	ld hl, SabrinaPreBattleText
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, ReceivedMarshBadgeText
	ld de, ReceivedMarshBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $6
	ld [wGymLeaderNo], a
	ld a, $3
	ld [wSaffronGymCurScript], a
.done
	jp TextScriptEnd

SabrinaPreBattleText:
	text_far _SabrinaPreBattleText
	text_end

ReceivedMarshBadgeText:
	text_far _ReceivedMarshBadgeText
	sound_get_key_item ; actually plays the second channel of SFX_BALL_POOF due to the wrong music bank being loaded
	text_promptbutton
	text_end

SabrinaPostBattleAdviceText:
	text_far _SabrinaPostBattleAdviceText
	text_end

KogaMarshBadgeInfoText:
	text_far _KogaMarshBadgeInfoText
	text_end

ReceivedTM46Text:
	text_far _ReceivedTM46Text
	sound_get_item_1
	text_far _TM46ExplanationText
	text_end

TM46NoRoomText:
	text_far _TM46NoRoomText
	text_end

SaffronGymTrainerText1:
	text_asm
	ld hl, SaffronGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymTrainerText2:
	text_asm
	ld hl, SaffronGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymTrainerText3:
	text_asm
	ld hl, SaffronGymTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymTrainerText4:
	text_asm
	ld hl, SaffronGymTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymTrainerText5:
	text_asm
	ld hl, SaffronGymTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymTrainerText6:
	text_asm
	ld hl, SaffronGymTrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymTrainerText7:
	text_asm
	ld hl, SaffronGymTrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymGuideText:
	text_asm
	CheckEvent EVENT_BEAT_SABRINA
	jr nz, .afterBeat
	ld hl, SaffronGymGuidePreBattleText
	call PrintText
	jr .done
.afterBeat
	ld hl, SaffronGymGuidePostBattleText
	call PrintText
.done
	jp TextScriptEnd

SaffronGymGuidePreBattleText:
	text_far _SaffronGymGuidePreBattleText
	text_end

SaffronGymGuidePostBattleText:
	text_far _SaffronGymGuidePostBattleText
	text_end

SaffronGymBattleText1:
	text_far _SaffronGymBattleText1
	text_end

SaffronGymEndBattleText1:
	text_far _SaffronGymEndBattleText1
	text_end

SaffronGymAfterBattleText1:
	text_far _SaffronGymAfterBattleText1
	text_end

SaffronGymBattleText2:
	text_far _SaffronGymBattleText2
	text_end

SaffronGymEndBattleText2:
	text_far _SaffronGymEndBattleText2
	text_end

SaffronGymAfterBattleText2:
	text_far _SaffronGymAfterBattleText2
	text_end

SaffronGymBattleText3:
	text_far _SaffronGymBattleText3
	text_end

SaffronGymEndBattleText3:
	text_far _SaffronGymEndBattleText3
	text_end

SaffronGymAfterBattleText3:
	text_far _SaffronGymAfterBattleText3
	text_end

SaffronGymBattleText4:
	text_far _SaffronGymBattleText4
	text_end

SaffronGymEndBattleText4:
	text_far _SaffronGymEndBattleText4
	text_end

SaffronGymAfterBattleText4:
	text_far _SaffronGymAfterBattleText4
	text_end

SaffronGymBattleText5:
	text_far _SaffronGymBattleText5
	text_end

SaffronGymEndBattleText5:
	text_far _SaffronGymEndBattleText5
	text_end

SaffronGymAfterBattleText5:
	text_far _SaffronGymAfterBattleText5
	text_end

SaffronGymBattleText6:
	text_far _SaffronGymBattleText6
	text_end

SaffronGymEndBattleText6:
	text_far _SaffronGymEndBattleText6
	text_end

SaffronGymAfterBattleText6:
	text_far _SaffronGymAfterBattleText6
	text_end

SaffronGymBattleText7:
	text_far _SaffronGymBattleText7
	text_end

SaffronGymEndBattleText7:
	text_far _SaffronGymEndBattleText7
	text_end

SaffronGymAfterBattleText7:
	text_far _SaffronGymAfterBattleText7
	text_end
