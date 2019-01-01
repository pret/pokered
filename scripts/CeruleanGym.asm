CeruleanGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	call nz, CeruleanGymScript_5c6d0
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanGymTrainerHeader0
	ld de, CeruleanGym_ScriptPointers
	ld a, [wCeruleanGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeruleanGymCurScript], a
	ret

CeruleanGymScript_5c6d0:
	ld hl, Gym2CityName
	ld de, Gym2LeaderName
	jp LoadGymLeaderAndCityName

Gym2CityName:
	db "CERULEAN CITY@"

Gym2LeaderName:
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
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_MISTY
	lb bc, TM_11, 1
	call GiveItem
	jr nc, .BagFull
	ld a, $6
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM11
	jr .asm_5c736
.BagFull
	ld a, $7
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
.asm_5c736
	ld hl, wObtainedBadges
	set 1, [hl]
	ld hl, wBeatGymFlags
	set 1, [hl]

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
	dbEventFlagBit EVENT_BEAT_CERULEAN_GYM_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_CERULEAN_GYM_TRAINER_0
	dw CeruleanGymBattleText1 ; TextBeforeBattle
	dw CeruleanGymAfterBattleText1 ; TextAfterBattle
	dw CeruleanGymEndBattleText1 ; TextEndBattle
	dw CeruleanGymEndBattleText1 ; TextEndBattle

CeruleanGymTrainerHeader1:
	dbEventFlagBit EVENT_BEAT_CERULEAN_GYM_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_CERULEAN_GYM_TRAINER_1
	dw CeruleanGymBattleText2 ; TextBeforeBattle
	dw CeruleanGymAfterBattleText2 ; TextAfterBattle
	dw CeruleanGymEndBattleText2 ; TextEndBattle
	dw CeruleanGymEndBattleText2 ; TextEndBattle

	db $ff

CeruleanGymText1:
	TX_ASM
	CheckEvent EVENT_BEAT_MISTY
	jr z, .asm_5c78d
	CheckEventReuseA EVENT_GOT_TM11
	jr nz, .asm_5c785
	call z, CeruleanGymScript_5c70d
	call DisableWaitingAfterTextDisplay
	jr .asm_5c7bb
.asm_5c785
	ld hl, CeruleanGymText_5c7c3
	call PrintText
	jr .asm_5c7bb
.asm_5c78d
	ld hl, CeruleanGymText_5c7be
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, CeruleanGymText_5c7d8
	ld de, CeruleanGymText_5c7d8
	call SaveEndBattleTextPointers
	ld a, [H_SPRITEINDEX]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $2
	ld [wGymLeaderNo], a
	xor a
	ld [hJoyHeld], a
	ld a, $3
	ld [wCeruleanGymCurScript], a
.asm_5c7bb
	jp TextScriptEnd

CeruleanGymText_5c7be:
	TX_FAR _CeruleanGymText_5c7be
	db "@"

CeruleanGymText_5c7c3:
	TX_FAR _CeruleanGymText_5c7c3
	db "@"

CeruleanGymText5:
	TX_FAR _CeruleanGymText_5c7c8
	db "@"

CeruleanGymText6:
	TX_FAR _ReceivedTM11Text
	TX_SFX_ITEM_1
	db "@"

CeruleanGymText7:
	TX_FAR _CeruleanGymText_5c7d3
	db "@"

CeruleanGymText_5c7d8:
	TX_FAR _CeruleanGymText_5c7d8
	TX_SFX_KEY_ITEM ; actually plays the second channel of SFX_BALL_POOF due to the wrong music bank being loaded
	TX_BLINK
	db "@"

CeruleanGymText2:
	TX_ASM
	ld hl, CeruleanGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

CeruleanGymBattleText1:
	TX_FAR _CeruleanGymBattleText1
	db "@"

CeruleanGymEndBattleText1:
	TX_FAR _CeruleanGymEndBattleText1
	db "@"

CeruleanGymAfterBattleText1:
	TX_FAR _CeruleanGymAfterBattleText1
	db "@"

CeruleanGymText3:
	TX_ASM
	ld hl, CeruleanGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

CeruleanGymBattleText2:
	TX_FAR _CeruleanGymBattleText2
	db "@"

CeruleanGymEndBattleText2:
	TX_FAR _CeruleanGymEndBattleText2
	db "@"

CeruleanGymAfterBattleText2:
	TX_FAR _CeruleanGymAfterBattleText2
	db "@"

CeruleanGymText4:
	TX_ASM
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
	TX_FAR _CeruleanGymText_5c82a
	db "@"

CeruleanGymText_5c82f:
	TX_FAR _CeruleanGymText_5c82f
	db "@"
