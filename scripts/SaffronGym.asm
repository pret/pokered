SaffronGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	call nz, .extra
	call EnableAutoTextBoxDrawing
	ld hl, SaffronGymTrainerHeader0
	ld de, SaffronGym_ScriptPointers
	ld a, [wSaffronGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSaffronGymCurScript], a
	ret

.extra
	ld hl, Gym6CityName
	ld de, Gym6LeaderName
	jp LoadGymLeaderAndCityName

Gym6CityName:
	db "SAFFRON CITY@"

Gym6LeaderName:
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
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_SABRINA
	lb bc, TM_46, 1
	call GiveItem
	jr nc, .BagFull
	ld a, $b
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM46
	jr .asm_5d091
.BagFull
	ld a, $c
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
.asm_5d091
	ld hl, wObtainedBadges
	set 5, [hl]
	ld hl, wBeatGymFlags
	set 5, [hl]

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
	dbEventFlagBit EVENT_BEAT_SAFFRON_GYM_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SAFFRON_GYM_TRAINER_0
	dw SaffronGymBattleText1 ; TextBeforeBattle
	dw SaffronGymAfterBattleText1 ; TextAfterBattle
	dw SaffronGymEndBattleText1 ; TextEndBattle
	dw SaffronGymEndBattleText1 ; TextEndBattle

SaffronGymTrainerHeader1:
	dbEventFlagBit EVENT_BEAT_SAFFRON_GYM_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SAFFRON_GYM_TRAINER_1
	dw SaffronGymBattleText2 ; TextBeforeBattle
	dw SaffronGymAfterBattleText2 ; TextAfterBattle
	dw SaffronGymEndBattleText2 ; TextEndBattle
	dw SaffronGymEndBattleText2 ; TextEndBattle

SaffronGymTrainerHeader2:
	dbEventFlagBit EVENT_BEAT_SAFFRON_GYM_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SAFFRON_GYM_TRAINER_2
	dw SaffronGymBattleText3 ; TextBeforeBattle
	dw SaffronGymAfterBattleText3 ; TextAfterBattle
	dw SaffronGymEndBattleText3 ; TextEndBattle
	dw SaffronGymEndBattleText3 ; TextEndBattle

SaffronGymTrainerHeader3:
	dbEventFlagBit EVENT_BEAT_SAFFRON_GYM_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SAFFRON_GYM_TRAINER_3
	dw SaffronGymBattleText4 ; TextBeforeBattle
	dw SaffronGymAfterBattleText4 ; TextAfterBattle
	dw SaffronGymEndBattleText4 ; TextEndBattle
	dw SaffronGymEndBattleText4 ; TextEndBattle

SaffronGymTrainerHeader4:
	dbEventFlagBit EVENT_BEAT_SAFFRON_GYM_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SAFFRON_GYM_TRAINER_4
	dw SaffronGymBattleText5 ; TextBeforeBattle
	dw SaffronGymAfterBattleText5 ; TextAfterBattle
	dw SaffronGymEndBattleText5 ; TextEndBattle
	dw SaffronGymEndBattleText5 ; TextEndBattle

SaffronGymTrainerHeader5:
	dbEventFlagBit EVENT_BEAT_SAFFRON_GYM_TRAINER_5
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SAFFRON_GYM_TRAINER_5
	dw SaffronGymBattleText6 ; TextBeforeBattle
	dw SaffronGymAfterBattleText6 ; TextAfterBattle
	dw SaffronGymEndBattleText6 ; TextEndBattle
	dw SaffronGymEndBattleText6 ; TextEndBattle

SaffronGymTrainerHeader6:
	dbEventFlagBit EVENT_BEAT_SAFFRON_GYM_TRAINER_6, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SAFFRON_GYM_TRAINER_6, 1
	dw SaffronGymBattleText7 ; TextBeforeBattle
	dw SaffronGymAfterBattleText7 ; TextAfterBattle
	dw SaffronGymEndBattleText7 ; TextEndBattle
	dw SaffronGymEndBattleText7 ; TextEndBattle

	db $ff

SaffronGymText1:
	TX_ASM
	CheckEvent EVENT_BEAT_SABRINA
	jr z, .asm_5d134
	CheckEventReuseA EVENT_GOT_TM46
	jr nz, .asm_5d12c
	call z, SaffronGymText_5d068
	call DisableWaitingAfterTextDisplay
	jr .asm_5d15f
.asm_5d12c
	ld hl, SaffronGymText_5d16e
	call PrintText
	jr .asm_5d15f
.asm_5d134
	ld hl, SaffronGymText_5d162
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, SaffronGymText_5d167
	ld de, SaffronGymText_5d167
	call SaveEndBattleTextPointers
	ld a, [H_SPRITEINDEX]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $6
	ld [wGymLeaderNo], a
	ld a, $3
	ld [wSaffronGymCurScript], a
.asm_5d15f
	jp TextScriptEnd

SaffronGymText_5d162:
	TX_FAR _SaffronGymText_5d162
	db "@"

SaffronGymText_5d167:
	TX_FAR _SaffronGymText_5d167
	TX_SFX_KEY_ITEM ; actually plays the second channel of SFX_BALL_POOF due to the wrong music bank being loaded
	TX_BLINK
	db "@"

SaffronGymText_5d16e:
	TX_FAR _SaffronGymText_5d16e
	db "@"

SaffronGymText10:
	TX_FAR _SaffronGymText_5d173
	db "@"

SaffronGymText11:
	TX_FAR ReceivedTM46Text
	TX_SFX_ITEM_1
	TX_FAR _TM46ExplanationText
	db "@"

SaffronGymText12:
	TX_FAR _TM46NoRoomText
	db "@"

SaffronGymText2:
	TX_ASM
	ld hl, SaffronGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText3:
	TX_ASM
	ld hl, SaffronGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText4:
	TX_ASM
	ld hl, SaffronGymTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText5:
	TX_ASM
	ld hl, SaffronGymTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText6:
	TX_ASM
	ld hl, SaffronGymTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText7:
	TX_ASM
	ld hl, SaffronGymTrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText8:
	TX_ASM
	ld hl, SaffronGymTrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymText9:
	TX_ASM
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
	TX_FAR _SaffronGymText_5d1e6
	db "@"

SaffronGymText_5d1eb:
	TX_FAR _SaffronGymText_5d1eb
	db "@"

SaffronGymBattleText1:
	TX_FAR _SaffronGymBattleText1
	db "@"

SaffronGymEndBattleText1:
	TX_FAR _SaffronGymEndBattleText1
	db "@"

SaffronGymAfterBattleText1:
	TX_FAR _SaffronGymAfterBattleText1
	db "@"

SaffronGymBattleText2:
	TX_FAR _SaffronGymBattleText2
	db "@"

SaffronGymEndBattleText2:
	TX_FAR _SaffronGymEndBattleText2
	db "@"

SaffronGymAfterBattleText2:
	TX_FAR _SaffronGymAfterBattleText2
	db "@"

SaffronGymBattleText3:
	TX_FAR _SaffronGymBattleText3
	db "@"

SaffronGymEndBattleText3:
	TX_FAR _SaffronGymEndBattleText3
	db "@"

SaffronGymAfterBattleText3:
	TX_FAR _SaffronGymAfterBattleText3
	db "@"

SaffronGymBattleText4:
	TX_FAR _SaffronGymBattleText4
	db "@"

SaffronGymEndBattleText4:
	TX_FAR _SaffronGymEndBattleText4
	db "@"

SaffronGymAfterBattleText4:
	TX_FAR _SaffronGymAfterBattleText4
	db "@"

SaffronGymBattleText5:
	TX_FAR _SaffronGymBattleText5
	db "@"

SaffronGymEndBattleText5:
	TX_FAR _SaffronGymEndBattleText5
	db "@"

SaffronGymAfterBattleText5:
	TX_FAR _SaffronGymAfterBattleText5
	db "@"

SaffronGymBattleText6:
	TX_FAR _SaffronGymBattleText6
	db "@"

SaffronGymEndBattleText6:
	TX_FAR _SaffronGymEndBattleText6
	db "@"

SaffronGymAfterBattleText6:
	TX_FAR _SaffronGymAfterBattleText6
	db "@"

SaffronGymBattleText7:
	TX_FAR _SaffronGymBattleText7
	db "@"

SaffronGymEndBattleText7:
	TX_FAR _SaffronGymEndBattleText7
	db "@"

SaffronGymAfterBattleText7:
	TX_FAR _SaffronGymAfterBattleText7
	db "@"
