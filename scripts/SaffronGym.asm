SaffronGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	call nz, .LoadNames
	call EnableAutoTextBoxDrawing
	ld hl, SaffronGymTrainerHeader0
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

SaffronGymText_5d048:
	xor a
	ld [wJoyIgnore], a
	ld [wSaffronGymCurScript], a
	ld [wCurMapScript], a
	ret

SaffronGym_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw SaffronGymScript3

SaffronGymScript3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, SaffronGymText_5d048
	ld a, $f0
	ld [wJoyIgnore], a

SaffronGymText_5d068:
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

	jp SaffronGymText_5d048

SaffronGym_TextPointers:
	dw SaffronGymText1
	dw SaffronGymText2
	dw SaffronGymText3
	dw SaffronGymText4
	dw SaffronGymText5
	dw SaffronGymText6
	dw SaffronGymText7
	dw SaffronGymText8
	dw SaffronGymText9
	dw SaffronGymText10
	dw SaffronGymText11
	dw SaffronGymText12

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
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_6, 1, 3, SaffronGymBattleText7, SaffronGymEndBattleText7, SaffronGymAfterBattleText7
	db -1 ; end

SaffronGymText1:
	text_asm
	CheckEvent EVENT_BEAT_SABRINA
	jr z, .beginBattle
	CheckEventReuseA EVENT_GOT_TM46
	jr nz, .afterVictory
	call z, SaffronGymText_5d068
	call DisableWaitingAfterTextDisplay
	jr .done
.afterVictory
	ld hl, SaffronGymText_5d16e
	call PrintText
	jr .done
.beginBattle
	ld hl, SaffronGymText_5d162
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, SaffronGymText_5d167
	ld de, SaffronGymText_5d167
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

SaffronGymText_5d162:
	text_far _SaffronGymText_5d162
	text_end

SaffronGymText_5d167:
	text_far _SaffronGymText_5d167
	sound_get_key_item ; actually plays the second channel of SFX_BALL_POOF due to the wrong music bank being loaded
	text_promptbutton
	text_end

SaffronGymText_5d16e:
	text_far _SaffronGymText_5d16e
	text_end

SaffronGymText10:
	text_far _SaffronGymText_5d173
	text_end

SaffronGymText11:
	text_far ReceivedTM46Text
	sound_get_item_1
	text_far _TM46ExplanationText
	text_end

SaffronGymText12:
	text_far _TM46NoRoomText
	text_end

SaffronGymText2:
	text_asm
	ld hl, SaffronGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText3:
	text_asm
	ld hl, SaffronGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText4:
	text_asm
	ld hl, SaffronGymTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText5:
	text_asm
	ld hl, SaffronGymTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText6:
	text_asm
	ld hl, SaffronGymTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText7:
	text_asm
	ld hl, SaffronGymTrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText8:
	text_asm
	ld hl, SaffronGymTrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText9:
	text_asm
	CheckEvent EVENT_BEAT_SABRINA
	jr nz, .asm_5d1dd
	ld hl, SaffronGymText_5d1e6
	call PrintText
	jr .asm_5d1e3
.asm_5d1dd
	ld hl, SaffronGymText_5d1eb
	call PrintText
.asm_5d1e3
	jp TextScriptEnd

SaffronGymText_5d1e6:
	text_far _SaffronGymText_5d1e6
	text_end

SaffronGymText_5d1eb:
	text_far _SaffronGymText_5d1eb
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
