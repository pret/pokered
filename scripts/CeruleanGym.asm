CeruleanGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	call nz, .LoadNames
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanGymTrainerHeader0
	ld de, CeruleanGym_ScriptPointers
	ld a, [wCeruleanGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeruleanGymCurScript], a
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

.CityName:
	db "CERULEAN CITY@"

.LeaderName:
	db "MISTY@"

CeruleanGymScript_5c6ed:
	xor a
	ld [wJoyIgnore], a
	ld [wCeruleanGymCurScript], a
	ld [wCurMapScript], a
	ret

CeruleanGym_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw CeruleanGymScript3

CeruleanGymScript3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeruleanGymScript_5c6ed
	ld a, $f0
	ld [wJoyIgnore], a

CeruleanGymScript_5c70d:
	ld a, $5
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_MISTY
	lb bc, TM_BUBBLEBEAM, 1
	call GiveItem
	jr nc, .BagFull
	ld a, $6
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM11
	jr .gymVictory
.BagFull
	ld a, $7
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_CASCADEBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_CASCADEBADGE, [hl]

	; deactivate gym trainers
	SetEvents EVENT_BEAT_CERULEAN_GYM_TRAINER_0, EVENT_BEAT_CERULEAN_GYM_TRAINER_1

	jp CeruleanGymScript_5c6ed

CeruleanGym_TextPointers:
	dw CeruleanGymText1
	dw CeruleanGymText2
	dw CeruleanGymText3
	dw CeruleanGymText4
	dw CeruleanGymText5
	dw CeruleanGymText6
	dw CeruleanGymText7

CeruleanGymTrainerHeader0:
	trainer EVENT_BEAT_CERULEAN_GYM_TRAINER_0, 3, CeruleanGymBattleText1, CeruleanGymEndBattleText1, CeruleanGymAfterBattleText1
CeruleanGymTrainerHeader1:
	trainer EVENT_BEAT_CERULEAN_GYM_TRAINER_1, 3, CeruleanGymBattleText2, CeruleanGymEndBattleText2, CeruleanGymAfterBattleText2
	db -1 ; end

CeruleanGymText1:
	text_asm
	CheckEvent EVENT_BEAT_MISTY
	jr z, .beginBattle
	CheckEventReuseA EVENT_GOT_TM11
	jr nz, .afterVictory
	call z, CeruleanGymScript_5c70d
	call DisableWaitingAfterTextDisplay
	jr .done
.afterVictory
	ld hl, CeruleanGymText_5c7c3
	call PrintText
	jr .done
.beginBattle
	ld hl, CeruleanGymText_5c7be
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, CeruleanGymText_5c7d8
	ld de, CeruleanGymText_5c7d8
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $2
	ld [wGymLeaderNo], a
	xor a
	ldh [hJoyHeld], a
	ld a, $3
	ld [wCeruleanGymCurScript], a
.done
	jp TextScriptEnd

CeruleanGymText_5c7be:
	text_far _CeruleanGymText_5c7be
	text_end

CeruleanGymText_5c7c3:
	text_far _CeruleanGymText_5c7c3
	text_end

CeruleanGymText5:
	text_far _CeruleanGymText_5c7c8
	text_end

CeruleanGymText6:
	text_far _ReceivedTM11Text
	sound_get_item_1
	text_end

CeruleanGymText7:
	text_far _CeruleanGymText_5c7d3
	text_end

CeruleanGymText_5c7d8:
	text_far _CeruleanGymText_5c7d8
	sound_get_key_item ; actually plays the second channel of SFX_BALL_POOF due to the wrong music bank being loaded
	text_promptbutton
	text_end

CeruleanGymText2:
	text_asm
	ld hl, CeruleanGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

CeruleanGymBattleText1:
	text_far _CeruleanGymBattleText1
	text_end

CeruleanGymEndBattleText1:
	text_far _CeruleanGymEndBattleText1
	text_end

CeruleanGymAfterBattleText1:
	text_far _CeruleanGymAfterBattleText1
	text_end

CeruleanGymText3:
	text_asm
	ld hl, CeruleanGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

CeruleanGymBattleText2:
	text_far _CeruleanGymBattleText2
	text_end

CeruleanGymEndBattleText2:
	text_far _CeruleanGymEndBattleText2
	text_end

CeruleanGymAfterBattleText2:
	text_far _CeruleanGymAfterBattleText2
	text_end

CeruleanGymText4:
	text_asm
	CheckEvent EVENT_BEAT_MISTY
	jr nz, .asm_5c821
	ld hl, CeruleanGymText_5c82a
	call PrintText
	jr .asm_5c827
.asm_5c821
	ld hl, CeruleanGymText_5c82f
	call PrintText
.asm_5c827
	jp TextScriptEnd

CeruleanGymText_5c82a:
	text_far _CeruleanGymText_5c82a
	text_end

CeruleanGymText_5c82f:
	text_far _CeruleanGymText_5c82f
	text_end
