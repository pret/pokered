FuchsiaGym_Script:
	call .LoadNames
	call EnableAutoTextBoxDrawing
	ld hl, FuchsiaGymTrainerHeaders
	ld de, FuchsiaGym_ScriptPointers
	ld a, [wFuchsiaGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wFuchsiaGymCurScript], a
	ret

.LoadNames:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	ret z
	ld hl, .CityName
	ld de, .LeaderName
	call LoadGymLeaderAndCityName
	ret

.CityName:
	db "FUCHSIA CITY@"

.LeaderName:
	db "KOGA@"

FuchsiaGymResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wFuchsiaGymCurScript], a
	ld [wCurMapScript], a
	ret

FuchsiaGym_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw FuchsiaGymKogaPostBattle

FuchsiaGymKogaPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jp z, FuchsiaGymResetScripts
	ld a, $f0
	ld [wJoyIgnore], a
; fallthrough
FuchsiaGymReceiveTM06:
	ld a, $9
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_KOGA
	lb bc, TM_TOXIC, 1
	call GiveItem
	jr nc, .BagFull
	ld a, $a
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM06
	jr .gymVictory
.BagFull
	ld a, $b
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_SOULBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_SOULBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_FUCHSIA_GYM_TRAINER_0, EVENT_BEAT_FUCHSIA_GYM_TRAINER_5

	jp FuchsiaGymResetScripts

FuchsiaGym_TextPointers:
	dw KogaText
	dw FuchsiaGymTrainerText1
	dw FuchsiaGymTrainerText2
	dw FuchsiaGymTrainerText3
	dw FuchsiaGymTrainerText4
	dw FuchsiaGymTrainerText5
	dw FuchsiaGymTrainerText6
	dw FuchsiaGymGuideText
	dw KogaSoulBadgeInfoText
	dw ReceivedTM06Text
	dw TM06NoRoomText

FuchsiaGymTrainerHeaders:
	def_trainers 2
FuchsiaGymTrainerHeader0:
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_0, 2, FuchsiaGymBattleText1, FuchsiaGymEndBattleText1, FuchsiaGymAfterBattleText1
FuchsiaGymTrainerHeader1:
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_1, 2, FuchsiaGymBattleText2, FuchsiaGymEndBattleText2, FuchsiaGymAfterBattleText2
FuchsiaGymTrainerHeader2:
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_2, 4, FuchsiaGymBattleText3, FuchsiaGymEndBattleText3, FuchsiaGymAfterBattleText3
FuchsiaGymTrainerHeader3:
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_3, 2, FuchsiaGymBattleText4, FuchsiaGymEndBattleText4, FuchsiaGymAfterBattleText4
FuchsiaGymTrainerHeader4:
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_4, 2, FuchsiaGymBattleText5, FuchsiaGymEndBattleText5, FuchsiaGymAfterBattleText5
FuchsiaGymTrainerHeader5:
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_5, 2, FuchsiaGymBattleText6, FuchsiaGymEndBattleText6, FuchsiaGymAfterBattleText6
	db -1 ; end

KogaText:
	text_asm
	CheckEvent EVENT_BEAT_KOGA
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM06
	jr nz, .afterBeat
	call z, FuchsiaGymReceiveTM06
	call DisableWaitingAfterTextDisplay
	jr .done
.afterBeat
	ld hl, KogaPostBattleAdviceText
	call PrintText
	jr .done
.beforeBeat
	ld hl, KogaBeforeBattleText
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, ReceivedSoulBadgeText
	ld de, ReceivedSoulBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $5
	ld [wGymLeaderNo], a
	xor a
	ldh [hJoyHeld], a
	ld a, $3
	ld [wFuchsiaGymCurScript], a
.done
	jp TextScriptEnd

KogaBeforeBattleText:
	text_far _KogaBeforeBattleText
	text_end

ReceivedSoulBadgeText:
	text_far _ReceivedSoulBadgeText
	text_end

KogaPostBattleAdviceText:
	text_far _KogaPostBattleAdviceText
	text_end

KogaSoulBadgeInfoText:
	text_far _KogaSoulBadgeInfoText
	text_end

ReceivedTM06Text:
	text_far _ReceivedTM06Text
	sound_get_key_item

TM06ExplanationText:
	text_far _TM06ExplanationText
	text_end

TM06NoRoomText:
	text_far _TM06NoRoomText
	text_end

FuchsiaGymTrainerText1:
	text_asm
	ld hl, FuchsiaGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText1:
	text_far _FuchsiaGymBattleText1
	text_end

FuchsiaGymEndBattleText1:
	text_far _FuchsiaGymEndBattleText1
	text_end

FuchsiaGymAfterBattleText1:
	text_far _FuchsiaGymAfterBattleText1
	text_end

FuchsiaGymTrainerText2:
	text_asm
	ld hl, FuchsiaGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText2:
	text_far _FuchsiaGymBattleText2
	text_end

FuchsiaGymEndBattleText2:
	text_far _FuchsiaGymEndBattleText2
	text_end

FuchsiaGymAfterBattleText2:
	text_far _FuchsiaGymAfterBattleText2
	text_end

FuchsiaGymTrainerText3:
	text_asm
	ld hl, FuchsiaGymTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText3:
	text_far _FuchsiaGymBattleText3
	text_end

FuchsiaGymEndBattleText3:
	text_far _FuchsiaGymEndBattleText3
	text_end

FuchsiaGymAfterBattleText3:
	text_far _FuchsiaGymAfterBattleText3
	text_end

FuchsiaGymTrainerText4:
	text_asm
	ld hl, FuchsiaGymTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText4:
	text_far _FuchsiaGymBattleText4
	text_end

FuchsiaGymEndBattleText4:
	text_far _FuchsiaGymEndBattleText4
	text_end

FuchsiaGymAfterBattleText4:
	text_far _FuchsiaGymAfterBattleText4
	text_end

FuchsiaGymTrainerText5:
	text_asm
	ld hl, FuchsiaGymTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText5:
	text_far _FuchsiaGymBattleText5
	text_end

FuchsiaGymEndBattleText5:
	text_far _FuchsiaGymEndBattleText5
	text_end

FuchsiaGymAfterBattleText5:
	text_far _FuchsiaGymAfterBattleText5
	text_end

FuchsiaGymTrainerText6:
	text_asm
	ld hl, FuchsiaGymTrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText6:
	text_far _FuchsiaGymBattleText6
	text_end

FuchsiaGymEndBattleText6:
	text_far _FuchsiaGymEndBattleText6
	text_end

FuchsiaGymAfterBattleText6:
	text_far _FuchsiaGymAfterBattleText6
	text_end

FuchsiaGymGuideText:
	text_asm
	CheckEvent EVENT_BEAT_KOGA
	ld hl, FuchsiaGymGuidePostBattleText
	jr nz, .afterBeat
	ld hl, FuchsiaGymGuidePreBattleText
.afterBeat
	call PrintText
	jp TextScriptEnd

FuchsiaGymGuidePreBattleText:
	text_far _FuchsiaGymGuidePreBattleText
	text_end

FuchsiaGymGuidePostBattleText:
	text_far _FuchsiaGymGuidePostBattleText
	text_end
