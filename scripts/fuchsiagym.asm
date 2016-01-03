FuchsiaGymScript: ; 7543d (1d:543d)
	call FuchsiaGymScript_75453
	call EnableAutoTextBoxDrawing
	ld hl, FuchsiaGymTrainerHeaders
	ld de, FuchsiaGymScriptPointers
	ld a, [wFuchsiaGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wFuchsiaGymCurScript], a
	ret

FuchsiaGymScript_75453: ; 75453 (1d:5453)
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	ret z
	ld hl, Gym5CityName
	ld de, Gym5LeaderName
	call LoadGymLeaderAndCityName
	ret

Gym5CityName: ; 75465 (1d:5465)
	db "FUCHSIA CITY@"
Gym5LeaderName: ; 75472 (1d:5472)
	db "KOGA@"

FuchsiaGymScript_75477: ; 75477 (1d:5477)
	xor a
	ld [wJoyIgnore], a
	ld [wFuchsiaGymCurScript], a
	ld [wCurMapScript], a
	ret

FuchsiaGymScriptPointers: ; 75482 (1d:5482)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw FuchsiaGymScript3

FuchsiaGymScript3: ; 7548a (1d:548a)
	ld a, [wIsInBattle]
	cp $ff
	jp z, FuchsiaGymScript_75477
	ld a, $f0
	ld [wJoyIgnore], a
FuchsiaGymScript3_75497: ; 75497 (1d:5497)
	ld a, $9
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_KOGA
	lb bc, TM_06, 1
	call GiveItem
	jr nc, .BagFull
	ld a, $a
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM06
	jr .asm_754c0
.BagFull
	ld a, $b
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
.asm_754c0
	ld hl, wObtainedBadges
	set 4, [hl]
	ld hl, wBeatGymFlags
	set 4, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_FUCHSIA_GYM_TRAINER_0, EVENT_BEAT_FUCHSIA_GYM_TRAINER_6

	jp FuchsiaGymScript_75477

FuchsiaGymTextPointers: ; 754d5 (1d:54d5)
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

FuchsiaGymTrainerHeaders: ; 754eb (1d:54eb)
FuchsiaGymTrainerHeader0: ; 754eb (1d:54eb)
	dbEventFlagBit EVENT_BEAT_FUCHSIA_GYM_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_FUCHSIA_GYM_TRAINER_0
	dw FuchsiaGymBattleText1 ; TextBeforeBattle
	dw FuchsiaGymAfterBattleText1 ; TextAfterBattle
	dw FuchsiaGymEndBattleText1 ; TextEndBattle
	dw FuchsiaGymEndBattleText1 ; TextEndBattle

FuchsiaGymTrainerHeader2: ; 754f7 (1d:54f7)
	dbEventFlagBit EVENT_BEAT_FUCHSIA_GYM_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_FUCHSIA_GYM_TRAINER_2
	dw FuchsiaGymBattleText2 ; TextBeforeBattle
	dw FuchsiaGymAfterBattleText2 ; TextAfterBattle
	dw FuchsiaGymEndBattleText2 ; TextEndBattle
	dw FuchsiaGymEndBattleText2 ; TextEndBattle

FuchsiaGymTrainerHeader3: ; 75503 (1d:5503)
	dbEventFlagBit EVENT_BEAT_FUCHSIA_GYM_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_FUCHSIA_GYM_TRAINER_3
	dw FuchsiaGymBattleText3 ; TextBeforeBattle
	dw FuchsiaGymAfterBattleText3 ; TextAfterBattle
	dw FuchsiaGymEndBattleText3 ; TextEndBattle
	dw FuchsiaGymEndBattleText3 ; TextEndBattle

FuchsiaGymTrainerHeader4: ; 7550f (1d:550f)
	dbEventFlagBit EVENT_BEAT_FUCHSIA_GYM_TRAINER_4
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_FUCHSIA_GYM_TRAINER_4
	dw FuchsiaGymBattleText4 ; TextBeforeBattle
	dw FuchsiaGymAfterBattleText4 ; TextAfterBattle
	dw FuchsiaGymEndBattleText4 ; TextEndBattle
	dw FuchsiaGymEndBattleText4 ; TextEndBattle

FuchsiaGymTrainerHeader5: ; 7551b (1d:551b)
	dbEventFlagBit EVENT_BEAT_FUCHSIA_GYM_TRAINER_5
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_FUCHSIA_GYM_TRAINER_5
	dw FuchsiaGymBattleText5 ; TextBeforeBattle
	dw FuchsiaGymAfterBattleText5 ; TextAfterBattle
	dw FuchsiaGymEndBattleText5 ; TextEndBattle
	dw FuchsiaGymEndBattleText5 ; TextEndBattle

FuchsiaGymTrainerHeader6: ; 75527 (1d:5527)
	dbEventFlagBit EVENT_BEAT_FUCHSIA_GYM_TRAINER_6
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_FUCHSIA_GYM_TRAINER_6
	dw FuchsiaGymBattleText6 ; TextBeforeBattle
	dw FuchsiaGymAfterBattleText6 ; TextAfterBattle
	dw FuchsiaGymEndBattleText6 ; TextEndBattle
	dw FuchsiaGymEndBattleText6 ; TextEndBattle

	db $ff

FuchsiaGymText1: ; 75534 (1d:5534)
	TX_ASM
	CheckEvent EVENT_BEAT_KOGA
	jr z, .asm_181b6
	CheckEventReuseA EVENT_GOT_TM06
	jr nz, .asm_adc3b
	call z, FuchsiaGymScript3_75497
	call DisableWaitingAfterTextDisplay
	jr .asm_e84c6
.asm_adc3b
	ld hl, KogaExplainToxicText
	call PrintText
	jr .asm_e84c6
.asm_181b6
	ld hl, KogaBeforeBattleText
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, KogaAfterBattleText
	ld de, KogaAfterBattleText
	call SaveEndBattleTextPointers
	ld a, [H_SPRITEINDEX]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $5
	ld [wGymLeaderNo], a
	xor a
	ld [hJoyHeld], a
	ld a, $3
	ld [wFuchsiaGymCurScript], a
.asm_e84c6
	jp TextScriptEnd

KogaBeforeBattleText: ; 75581 (1d:5581)
	TX_FAR _KogaBeforeBattleText
	db "@"

KogaAfterBattleText: ; 75586 (1d:5586)
	TX_FAR _KogaAfterBattleText
	db "@"

KogaExplainToxicText: ; 7558b (1d:558b)
	TX_FAR _KogaExplainToxicText
	db "@"

FuchsiaGymText9: ; 75590 (1d:5590)
	TX_FAR _FuchsiaGymText9
	db "@"

FuchsiaGymText10: ; 75595 (1d:5595)
	TX_FAR _ReceivedTM06Text
	db $11

TM06ExplanationText: ; 7559a (1d:559a)
	TX_FAR _TM06ExplanationText
	db "@"

FuchsiaGymText11: ; 7559f (1d:559f)
	TX_FAR _TM06NoRoomText
	db "@"

FuchsiaGymText2: ; 755a4 (1d:55a4)
	TX_ASM
	ld hl, FuchsiaGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText1: ; 755ae (1d:55ae)
	TX_FAR _FuchsiaGymBattleText1
	db "@"

FuchsiaGymEndBattleText1: ; 755b3 (1d:55b3)
	TX_FAR _FuchsiaGymEndBattleText1
	db "@"

FuchsiaGymAfterBattleText1: ; 755b8 (1d:55b8)
	TX_FAR _FuchsiaGymAfterBattleText1
	db "@"

FuchsiaGymText3: ; 755bd (1d:55bd)
	TX_ASM
	ld hl, FuchsiaGymTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText2: ; 755c7 (1d:55c7)
	TX_FAR _FuchsiaGymBattleText2
	db "@"

FuchsiaGymEndBattleText2: ; 755cc (1d:55cc)
	TX_FAR _FuchsiaGymEndBattleText2
	db "@"

FuchsiaGymAfterBattleText2: ; 755d1 (1d:55d1)
	TX_FAR _FuchsiaGymAfterBattleText2
	db "@"

FuchsiaGymText4: ; 755d6 (1d:55d6)
	TX_ASM
	ld hl, FuchsiaGymTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText3: ; 755e0 (1d:55e0)
	TX_FAR _FuchsiaGymBattleText3
	db "@"

FuchsiaGymEndBattleText3: ; 755e5 (1d:55e5)
	TX_FAR _FuchsiaGymEndBattleText3
	db "@"

FuchsiaGymAfterBattleText3: ; 755ea (1d:55ea)
	TX_FAR _FuchsiaGymAfterBattleText3
	db "@"

FuchsiaGymText5: ; 755ef (1d:55ef)
	TX_ASM
	ld hl, FuchsiaGymTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText4: ; 755f9 (1d:55f9)
	TX_FAR _FuchsiaGymBattleText4
	db "@"

FuchsiaGymEndBattleText4: ; 755fe (1d:55fe)
	TX_FAR _FuchsiaGymEndBattleText4
	db "@"

FuchsiaGymAfterBattleText4: ; 75603 (1d:5603)
	TX_FAR _FuchsiaGymAfterBattleText4
	db "@"

FuchsiaGymText6: ; 75608 (1d:5608)
	TX_ASM
	ld hl, FuchsiaGymTrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText5: ; 75612 (1d:5612)
	TX_FAR _FuchsiaGymBattleText5
	db "@"

FuchsiaGymEndBattleText5: ; 75617 (1d:5617)
	TX_FAR _FuchsiaGymEndBattleText5
	db "@"

FuchsiaGymAfterBattleText5: ; 7561c (1d:561c)
	TX_FAR _FuchsiaGymAfterBattleText5
	db "@"

FuchsiaGymText7: ; 75621 (1d:5621)
	TX_ASM
	ld hl, FuchsiaGymTrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymBattleText6: ; 7562b (1d:562b)
	TX_FAR _FuchsiaGymBattleText6
	db "@"

FuchsiaGymEndBattleText6: ; 75630 (1d:5630)
	TX_FAR _FuchsiaGymEndBattleText6
	db "@"

FuchsiaGymAfterBattleText6: ; 75635 (1d:5635)
	TX_FAR _FuchsiaGymAfterBattleText6
	db "@"

FuchsiaGymText8: ; 7563a (1d:563a)
	TX_ASM
	CheckEvent EVENT_BEAT_KOGA
	ld hl, FuchsiaGymText_75653
	jr nz, .asm_50671
	ld hl, FuchsiaGymText_7564e
.asm_50671
	call PrintText
	jp TextScriptEnd

FuchsiaGymText_7564e: ; 7564e (1d:564e)
	TX_FAR _FuchsiaGymText_7564e
	db "@"

FuchsiaGymText_75653: ; 75653 (1d:5653)
	TX_FAR _FuchsiaGymText_75653
	db "@"
