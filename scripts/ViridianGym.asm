ViridianGym_Script:
	ld hl, Gym8CityName
	ld de, Gym8LeaderName
	call LoadGymLeaderAndCityName
	call EnableAutoTextBoxDrawing
	ld hl, ViridianGymTrainerHeader0
	ld de, ViridianGym_ScriptPointers
	ld a, [wViridianGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wViridianGymCurScript], a
	ret

Gym8CityName:
	db "VIRIDIAN CITY@"
Gym8LeaderName:
	db "GIOVANNI@"

ViridianGymScript_748d6:
	xor a
	ld [wJoyIgnore], a
	ld [wViridianGymCurScript], a
	ld [wCurMapScript], a
	ret

ViridianGym_ScriptPointers:
	dw ViridianGymScript0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw ViridianGymScript3
	dw ViridianGymScript4

ViridianGymScript0:
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	ld hl, ViridianGymArrowTilePlayerMovement
	call DecodeArrowMovementRLE
	cp $ff
	jp z, CheckFightingMapTrainers
	call StartSimulatingJoypadStates
	ld hl, wd736
	set 7, [hl]
	ld a, SFX_ARROW_TILES
	call PlaySound
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $4
	ld [wCurMapScript], a
	ret

;format:
;db y,x
;dw pointer to movement
ViridianGymArrowTilePlayerMovement:
	db $b,$13
	dw ViridianGymArrowMovement1
	db $1,$13
	dw ViridianGymArrowMovement2
	db $2,$12
	dw ViridianGymArrowMovement3
	db $2,$b
	dw ViridianGymArrowMovement4
	db $a,$10
	dw ViridianGymArrowMovement5
	db $6,$4
	dw ViridianGymArrowMovement6
	db $d,$5
	dw ViridianGymArrowMovement7
	db $e,$4
	dw ViridianGymArrowMovement8
	db $f,$0
	dw ViridianGymArrowMovement9
	db $f,$1
	dw ViridianGymArrowMovement10
	db $10,$d
	dw ViridianGymArrowMovement11
	db $11,$d
	dw ViridianGymArrowMovement12
	db $FF

;format: direction, count
ViridianGymArrowMovement1:
	db D_UP,$09,$FF

ViridianGymArrowMovement2:
	db D_LEFT,$08,$FF

ViridianGymArrowMovement3:
	db D_DOWN,$09,$FF

ViridianGymArrowMovement4:
	db D_RIGHT,$06,$FF

ViridianGymArrowMovement5:
	db D_DOWN,$02,$FF

ViridianGymArrowMovement6:
	db D_DOWN,$07,$FF

ViridianGymArrowMovement7:
	db D_RIGHT,$08,$FF

ViridianGymArrowMovement8:
	db D_RIGHT,$09,$FF

ViridianGymArrowMovement9:
	db D_UP,$08,$FF

ViridianGymArrowMovement10:
	db D_UP,$06,$FF

ViridianGymArrowMovement11:
	db D_LEFT,$06,$FF

ViridianGymArrowMovement12:
	db D_LEFT,$0C,$FF

ViridianGymScript4:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	jr nz, .asm_74980
	xor a
	ld [wJoyIgnore], a
	ld hl, wd736
	res 7, [hl]
	ld a, $0
	ld [wCurMapScript], a
	ret
.asm_74980
	jpba LoadSpinnerArrowTiles

ViridianGymScript3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, ViridianGymScript_748d6
	ld a, $f0
	ld [wJoyIgnore], a
ViridianGymScript3_74995:
	ld a, $c
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	lb bc, TM_27, 1
	call GiveItem
	jr nc, .BagFull
	ld a, $d
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM27
	jr .asm_749be
.BagFull
	ld a, $e
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
.asm_749be
	ld hl, wObtainedBadges
	set 7, [hl]
	ld hl, wBeatGymFlags
	set 7, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_VIRIDIAN_GYM_TRAINER_0, EVENT_BEAT_VIRIDIAN_GYM_TRAINER_7

	ld a, HS_ROUTE_22_RIVAL_2
	ld [wMissableObjectIndex], a
	predef ShowObject
	SetEvents EVENT_2ND_ROUTE22_RIVAL_BATTLE, EVENT_ROUTE22_RIVAL_WANTS_BATTLE
	jp ViridianGymScript_748d6

ViridianGym_TextPointers:
	dw ViridianGymText1
	dw ViridianGymText2
	dw ViridianGymText3
	dw ViridianGymText4
	dw ViridianGymText5
	dw ViridianGymText6
	dw ViridianGymText7
	dw ViridianGymText8
	dw ViridianGymText9
	dw ViridianGymText10
	dw PickUpItemText
	dw ViridianGymText12
	dw ViridianGymText13
	dw ViridianGymText14

ViridianGymTrainerHeader0:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_GYM_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_GYM_TRAINER_0
	dw ViridianGymBattleText1 ; TextBeforeBattle
	dw ViridianGymAfterBattleText1 ; TextAfterBattle
	dw ViridianGymEndBattleText1 ; TextEndBattle
	dw ViridianGymEndBattleText1 ; TextEndBattle

ViridianGymTrainerHeader1:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_GYM_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_GYM_TRAINER_1
	dw ViridianGymBattleText2 ; TextBeforeBattle
	dw ViridianGymAfterBattleText2 ; TextAfterBattle
	dw ViridianGymEndBattleText2 ; TextEndBattle
	dw ViridianGymEndBattleText2 ; TextEndBattle

ViridianGymTrainerHeader2:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_GYM_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_GYM_TRAINER_2
	dw ViridianGymBattleText3 ; TextBeforeBattle
	dw ViridianGymAfterBattleText3 ; TextAfterBattle
	dw ViridianGymEndBattleText3 ; TextEndBattle
	dw ViridianGymEndBattleText3 ; TextEndBattle

ViridianGymTrainerHeader3:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_GYM_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_GYM_TRAINER_3
	dw ViridianGymBattleText4 ; TextBeforeBattle
	dw ViridianGymAfterBattleText4 ; TextAfterBattle
	dw ViridianGymEndBattleText4 ; TextEndBattle
	dw ViridianGymEndBattleText4 ; TextEndBattle

ViridianGymTrainerHeader4:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_GYM_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_GYM_TRAINER_4
	dw ViridianGymBattleText5 ; TextBeforeBattle
	dw ViridianGymAfterBattleText5 ; TextAfterBattle
	dw ViridianGymEndBattleText5 ; TextEndBattle
	dw ViridianGymEndBattleText5 ; TextEndBattle

ViridianGymTrainerHeader5:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_GYM_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_GYM_TRAINER_5
	dw ViridianGymBattleText6 ; TextBeforeBattle
	dw ViridianGymAfterBattleText6 ; TextAfterBattle
	dw ViridianGymEndBattleText6 ; TextEndBattle
	dw ViridianGymEndBattleText6 ; TextEndBattle

ViridianGymTrainerHeader6:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_GYM_TRAINER_6, 1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_GYM_TRAINER_6, 1
	dw ViridianGymBattleText7 ; TextBeforeBattle
	dw ViridianGymAfterBattleText7 ; TextAfterBattle
	dw ViridianGymEndBattleText7 ; TextEndBattle
	dw ViridianGymEndBattleText7 ; TextEndBattle

ViridianGymTrainerHeader7:
	dbEventFlagBit EVENT_BEAT_VIRIDIAN_GYM_TRAINER_7, 1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VIRIDIAN_GYM_TRAINER_7, 1
	dw ViridianGymBattleText8 ; TextBeforeBattle
	dw ViridianGymAfterBattleText8 ; TextAfterBattle
	dw ViridianGymEndBattleText8 ; TextEndBattle
	dw ViridianGymEndBattleText8 ; TextEndBattle

	db $ff

ViridianGymText1:
	TX_ASM
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr z, .asm_6de66
	CheckEventReuseA EVENT_GOT_TM27
	jr nz, .asm_9fc95
	call z, ViridianGymScript3_74995
	call DisableWaitingAfterTextDisplay
	jr .asm_6dff7
.asm_9fc95
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, ViridianGymText_74ad9
	call PrintText
	call GBFadeOutToBlack
	ld a, HS_VIRIDIAN_GYM_GIOVANNI
	ld [wMissableObjectIndex], a
	predef HideObject
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	jr .asm_6dff7
.asm_6de66
	ld hl, ViridianGymText_74ace
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, ViridianGymText_74ad3
	ld de, ViridianGymText_74ad3
	call SaveEndBattleTextPointers
	ld a, [H_SPRITEINDEX]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $8
	ld [wGymLeaderNo], a
	ld a, $3
	ld [wViridianGymCurScript], a
.asm_6dff7
	jp TextScriptEnd

ViridianGymText_74ace:
	TX_FAR _ViridianGymText_74ace
	db "@"

ViridianGymText_74ad3:
	TX_FAR _ViridianGymText_74ad3
	TX_SFX_LEVEL_UP ; probably supposed to play SFX_GET_ITEM_1 but the wrong music bank is loaded
	db "@"

ViridianGymText_74ad9:
	TX_FAR _ViridianGymText_74ad9
	TX_WAIT
	db "@"

ViridianGymText12:
	TX_FAR _ViridianGymText12
	db "@"

ViridianGymText13:
	TX_FAR _ReceivedTM27Text
	TX_SFX_ITEM_1

TM27ExplanationText:
	TX_FAR _TM27ExplanationText
	db "@"

ViridianGymText14:
	TX_FAR _TM27NoRoomText
	db "@"

ViridianGymText2:
	TX_ASM
	ld hl, ViridianGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText1:
	TX_FAR _ViridianGymBattleText1
	db "@"

ViridianGymEndBattleText1:
	TX_FAR _ViridianGymEndBattleText1
	db "@"

ViridianGymAfterBattleText1:
	TX_FAR _ViridianGymAfterBattleText1
	db "@"

ViridianGymText3:
	TX_ASM
	ld hl, ViridianGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText2:
	TX_FAR _ViridianGymBattleText2
	db "@"

ViridianGymEndBattleText2:
	TX_FAR _ViridianGymEndBattleText2
	db "@"

ViridianGymAfterBattleText2:
	TX_FAR _ViridianGymAfterBattleText2
	db "@"

ViridianGymText4:
	TX_ASM
	ld hl, ViridianGymTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText3:
	TX_FAR _ViridianGymBattleText3
	db "@"

ViridianGymEndBattleText3:
	TX_FAR _ViridianGymEndBattleText3
	db "@"

ViridianGymAfterBattleText3:
	TX_FAR _ViridianGymAfterBattleText3
	db "@"

ViridianGymText5:
	TX_ASM
	ld hl, ViridianGymTrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText4:
	TX_FAR _ViridianGymBattleText4
	db "@"

ViridianGymEndBattleText4:
	TX_FAR _ViridianGymEndBattleText4
	db "@"

ViridianGymAfterBattleText4:
	TX_FAR _ViridianGymAfterBattleText4
	db "@"

ViridianGymText6:
	TX_ASM
	ld hl, ViridianGymTrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText5:
	TX_FAR _ViridianGymBattleText5
	db "@"

ViridianGymEndBattleText5:
	TX_FAR _ViridianGymEndBattleText5
	db "@"

ViridianGymAfterBattleText5:
	TX_FAR _ViridianGymAfterBattleText5
	db "@"

ViridianGymText7:
	TX_ASM
	ld hl, ViridianGymTrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText6:
	TX_FAR _ViridianGymBattleText6
	db "@"

ViridianGymEndBattleText6:
	TX_FAR _ViridianGymEndBattleText6
	db "@"

ViridianGymAfterBattleText6:
	TX_FAR _ViridianGymAfterBattleText6
	db "@"

ViridianGymText8:
	TX_ASM
	ld hl, ViridianGymTrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText7:
	TX_FAR _ViridianGymBattleText7
	db "@"

ViridianGymEndBattleText7:
	TX_FAR _ViridianGymEndBattleText7
	db "@"

ViridianGymAfterBattleText7:
	TX_FAR _ViridianGymAfterBattleText7
	db "@"

ViridianGymText9:
	TX_ASM
	ld hl, ViridianGymTrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymBattleText8:
	TX_FAR _ViridianGymBattleText8
	db "@"

ViridianGymEndBattleText8:
	TX_FAR _ViridianGymEndBattleText8
	db "@"

ViridianGymAfterBattleText8:
	TX_FAR _ViridianGymAfterBattleText8
	db "@"

ViridianGymText10:
	TX_ASM
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr nz, .asm_1abd1
	ld hl, ViridianGymText_74bd4
	call PrintText
	jr .asm_6064d
.asm_1abd1
	ld hl, ViridianGymText_74bd9
	call PrintText
.asm_6064d
	jp TextScriptEnd

ViridianGymText_74bd4:
	TX_FAR _ViridianGymText_74bd4
	db "@"

ViridianGymText_74bd9:
	TX_FAR _ViridianGymText_74bd9
	db "@"
