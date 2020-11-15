FuchsiaGym_Script:
	call .LoadNames
	call EnableAutoTextBoxDrawing
	ld hl, FuchsiaGymTrainerHeader0
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

FuchsiaGymScript_75477:
	xor a
	ld [wJoyIgnore], a
	ld [wFuchsiaGymCurScript], a
	ld [wCurMapScript], a
	ret

FuchsiaGym_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw FuchsiaGymScript3

FuchsiaGymScript3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, FuchsiaGymScript_75477
	ld a, $f0
	ld [wJoyIgnore], a
FuchsiaGymScript3_75497:
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

	jp FuchsiaGymScript_75477

FuchsiaGym_TextPointers:
	dw FuchsiaGymText1
	dw FuchsiaGymText2
	dw FuchsiaGymText3
	dw FuchsiaGymText4
	dw FuchsiaGymText5
	dw FuchsiaGymText6
	dw FuchsiaGymText7
	dw FuchsiaGymText8
	dw FuchsiaGymText9
	dw FuchsiaGymText10
	dw FuchsiaGymText11

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

FuchsiaGymText1:
	text_asm
	CheckEvent EVENT_BEAT_KOGA
	jr z, .beginBattle
	CheckEventReuseA EVENT_GOT_TM06
	jr nz, .afterVictory
	call z, FuchsiaGymScript3_75497
	call DisableWaitingAfterTextDisplay
	jr .done
.afterVictory
	ld hl, KogaExplainToxicText
	call PrintText
	jr .done
.beginBattle
	ld hl, KogaBeforeBattleText
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, KogaAfterBattleText
	ld de, KogaAfterBattleText
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

KogaAfterBattleText:
	text_far _KogaAfterBattleText
	text_end

KogaExplainToxicText:
	text_far _KogaExplainToxicText
	text_end

FuchsiaGymText9:
	text_far _FuchsiaGymText9
	text_end

FuchsiaGymText10:
	text_far _ReceivedTM06Text
	sound_get_key_item

TM06ExplanationText:
	text_far _TM06ExplanationText
	text_end

FuchsiaGymText11:
	text_far _TM06NoRoomText
	text_end

FuchsiaGymText2:
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

FuchsiaGymText3:
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

FuchsiaGymText4:
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

FuchsiaGymText5:
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

FuchsiaGymText6:
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

FuchsiaGymText7:
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

FuchsiaGymText8:
	text_asm
	CheckEvent EVENT_BEAT_KOGA
	ld hl, FuchsiaGymText_75653
	jr nz, .asm_50671
	ld hl, FuchsiaGymText_7564e
.asm_50671
	call PrintText
	jp TextScriptEnd

FuchsiaGymText_7564e:
	text_far _FuchsiaGymText_7564e
	text_end

FuchsiaGymText_75653:
	text_far _FuchsiaGymText_75653
	text_end
