CeladonGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	call nz, .LoadNames
	call EnableAutoTextBoxDrawing
	ld hl, CeladonGymTrainerHeader0
	ld de, CeladonGym_ScriptPointers
	ld a, [wCeladonGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeladonGymCurScript], a
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

.CityName:
	db "CELADON CITY@"

.LeaderName:
	db "ERIKA@"

CeladonGymText_48943:
	xor a
	ld [wJoyIgnore], a
	ld [wCeladonGymCurScript], a
	ld [wCurMapScript], a
	ret

CeladonGym_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw CeladonGymScript3

CeladonGymScript3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeladonGymText_48943
	ld a, $f0
	ld [wJoyIgnore], a

CeladonGymText_48963:
	ld a, $9
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_ERIKA
	lb bc, TM_MEGA_DRAIN, 1
	call GiveItem
	jr nc, .BagFull
	ld a, $a
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM21
	jr .gymVictory
.BagFull
	ld a, $b
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_RAINBOWBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_RAINBOWBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_CELADON_GYM_TRAINER_0, EVENT_BEAT_CELADON_GYM_TRAINER_6

	jp CeladonGymText_48943

CeladonGym_TextPointers:
	dw CeladonGymText1
	dw CeladonGymText2
	dw CeladonGymText3
	dw CeladonGymText4
	dw CeladonGymText5
	dw CeladonGymText6
	dw CeladonGymText7
	dw CeladonGymText8
	dw CeladonGymText9
	dw TM21Text
	dw TM21NoRoomText

CeladonGymTrainerHeader0:
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_0, 2, CeladonGymBattleText2, CeladonGymEndBattleText2, CeladonGymAfterBattleText2
CeladonGymTrainerHeader1:
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_1, 2, CeladonGymBattleText3, CeladonGymEndBattleText3, CeladonGymAfterBattleText3
CeladonGymTrainerHeader2:
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_2, 4, CeladonGymBattleText4, CeladonGymEndBattleText4, CeladonGymAfterBattleText4
CeladonGymTrainerHeader3:
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_3, 4, CeladonGymBattleText5, CeladonGymEndBattleText5, CeladonGymAfterBattleText5
CeladonGymTrainerHeader4:
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_4, 2, CeladonGymBattleText6, CeladonGymEndBattleText6, CeladonGymAfterBattleText6
CeladonGymTrainerHeader5:
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_5, 2, CeladonGymBattleText7, CeladonGymEndBattleText7, CeladonGymAfterBattleText7
CeladonGymTrainerHeader6:
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_6, 1, 3, CeladonGymBattleText8, CeladonGymEndBattleText8, CeladonGymAfterBattleText8
	db -1 ; end

CeladonGymText1:
	text_asm
	CheckEvent EVENT_BEAT_ERIKA
	jr z, .beginBattle
	CheckEventReuseA EVENT_GOT_TM21
	jr nz, .afterVictory
	call z, CeladonGymText_48963
	call DisableWaitingAfterTextDisplay
	jr .done
.afterVictory
	ld hl, CeladonGymText_48a68
	call PrintText
	jr .done
.beginBattle
	ld hl, CeladonGymText_48a5e
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, CeladonGymText_48a63
	ld de, CeladonGymText_48a63
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $4
	ld [wGymLeaderNo], a
	ld a, $3
	ld [wCeladonGymCurScript], a
	ld [wCurMapScript], a
.done
	jp TextScriptEnd

CeladonGymText_48a5e:
	text_far _CeladonGymText_48a5e
	text_end

CeladonGymText_48a63:
	text_far _CeladonGymText_48a63
	text_end

CeladonGymText_48a68:
	text_far _CeladonGymText_48a68
	text_end

CeladonGymText9:
	text_far _CeladonGymText9
	text_end

TM21Text:
	text_far _ReceivedTM21Text
	sound_get_item_1
	text_far _TM21ExplanationText
	text_end

TM21NoRoomText:
	text_far _TM21NoRoomText
	text_end

CeladonGymText2:
	text_asm
	ld hl, CeladonGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText2:
	text_far _CeladonGymBattleText2
	text_end

CeladonGymEndBattleText2:
	text_far _CeladonGymEndBattleText2
	text_end

CeladonGymAfterBattleText2:
	text_far _CeladonGymAfterBattleText2
	text_end

CeladonGymText3:
	text_asm
	ld hl, CeladonGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText3:
	text_far _CeladonGymBattleText3
	text_end

CeladonGymEndBattleText3:
	text_far _CeladonGymEndBattleText3
	text_end

CeladonGymAfterBattleText3:
	text_far _CeladonGymAfterBattleText3
	text_end

CeladonGymText4:
	text_asm
	ld hl, CeladonGymTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText4:
	text_far _CeladonGymBattleText4
	text_end

CeladonGymEndBattleText4:
	text_far _CeladonGymEndBattleText4
	text_end

CeladonGymAfterBattleText4:
	text_far _CeladonGymAfterBattleText4
	text_end

CeladonGymText5:
	text_asm
	ld hl, CeladonGymTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText5:
	text_far _CeladonGymBattleText5
	text_end

CeladonGymEndBattleText5:
	text_far _CeladonGymEndBattleText5
	text_end

CeladonGymAfterBattleText5:
	text_far _CeladonGymAfterBattleText5
	text_end

CeladonGymText6:
	text_asm
	ld hl, CeladonGymTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText6:
	text_far _CeladonGymBattleText6
	text_end

CeladonGymEndBattleText6:
	text_far _CeladonGymEndBattleText6
	text_end

CeladonGymAfterBattleText6:
	text_far _CeladonGymAfterBattleText6
	text_end

CeladonGymText7:
	text_asm
	ld hl, CeladonGymTrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText7:
	text_far _CeladonGymBattleText7
	text_end

CeladonGymEndBattleText7:
	text_far _CeladonGymEndBattleText7
	text_end

CeladonGymAfterBattleText7:
	text_far _CeladonGymAfterBattleText7
	text_end

CeladonGymText8:
	text_asm
	ld hl, CeladonGymTrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBattleText8:
	text_far _CeladonGymBattleText8
	text_end

CeladonGymEndBattleText8:
	text_far _CeladonGymEndBattleText8
	text_end

CeladonGymAfterBattleText8:
	text_far _CeladonGymAfterBattleText8
	text_end
