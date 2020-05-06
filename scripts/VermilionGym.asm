VermilionGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	push hl
	call nz, VermilionGymLoadName
	pop hl
	bit 6, [hl]
	res 6, [hl]
	call nz, VermilionGymSetDoorTile
	call EnableAutoTextBoxDrawing
	ld hl, VermilionGymTrainerHeader0
	ld de, VermilionGym_ScriptPointers
	ld a, [wVermilionGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wVermilionGymCurScript], a
	ret

VermilionGymLoadName:
	ld hl, Gym3CityName
	ld de, Gym3LeaderName
	jp LoadGymLeaderAndCityName

Gym3CityName:
	db "VERMILION CITY@"

Gym3LeaderName:
	db "LT.SURGE@"

VermilionGymSetDoorTile:
	CheckEvent EVENT_2ND_LOCK_OPENED
	jr nz, .doorsOpen
	ld a, $24 ; double door tile ID
	jr .replaceTile
.doorsOpen
	ld a, SFX_GO_INSIDE
	call PlaySound
	ld a, $5 ; clear floor tile ID
.replaceTile
	ld [wNewTileBlockID], a
	lb bc, 2, 2
	predef_jump ReplaceTileBlock

VermilionGymResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wVermilionGymCurScript], a
	ld [wCurMapScript], a
	ret

VermilionGym_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw VermilionGymLTSurgePostBattle

VermilionGymLTSurgePostBattle:
	ld a, [wIsInBattle]
	cp $ff ; did we lose?
	jp z, VermilionGymResetScripts
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a

VermilionGymReceiveTM24:
	ld a, $6
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_LT_SURGE
	lb bc, TM_24, 1
	call GiveItem
	jr nc, .BagFull
	ld a, $7
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM24
	jr .gymVictory
.BagFull
	ld a, $8
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set 2, [hl]
	ld hl, wBeatGymFlags
	set 2, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_VERMILION_GYM_TRAINER_0, EVENT_BEAT_VERMILION_GYM_TRAINER_2

	jp VermilionGymResetScripts

VermilionGym_TextPointers:
	dw LTSurgeText
	dw VermilionGymTrainerText1
	dw VermilionGymTrainerText2
	dw VermilionGymTrainerText3
	dw VermilionGymFanText
	dw LTSurgeThunderbadgeInfoText
	dw ReceivedTM24Text
	dw TM24NoRoomText

VermilionGymTrainerHeader0:
	dbEventFlagBit EVENT_BEAT_VERMILION_GYM_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VERMILION_GYM_TRAINER_0
	dw VermilionGymBattleText1 ; TextBeforeBattle
	dw VermilionGymAfterBattleText1 ; TextAfterBattle
	dw VermilionGymEndBattleText1 ; TextEndBattle
	dw VermilionGymEndBattleText1 ; TextEndBattle

VermilionGymTrainerHeader1:
	dbEventFlagBit EVENT_BEAT_VERMILION_GYM_TRAINER_1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VERMILION_GYM_TRAINER_1
	dw VermilionGymBattleText2 ; TextBeforeBattle
	dw VermilionGymAfterBattleText2 ; TextAfterBattle
	dw VermilionGymEndBattleText2 ; TextEndBattle
	dw VermilionGymEndBattleText2 ; TextEndBattle

VermilionGymTrainerHeader2:
	dbEventFlagBit EVENT_BEAT_VERMILION_GYM_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VERMILION_GYM_TRAINER_2
	dw VermilionGymBattleText3 ; TextBeforeBattle
	dw VermilionGymAfterBattleText3 ; TextAfterBattle
	dw VermilionGymEndBattleText3 ; TextEndBattle
	dw VermilionGymEndBattleText3 ; TextEndBattle

	db $ff

LTSurgeText:
	TX_ASM
	CheckEvent EVENT_BEAT_LT_SURGE
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM24
	jr nz, .afterBeat
	call z, VermilionGymReceiveTM24
	call DisableWaitingAfterTextDisplay
	jr .done
.afterBeat
	ld hl, LTSurgePostBattleAdviceText
	call PrintText
	jr .done
.beforeBeat
	ld hl, LTSurgePreBattleText
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, ReceivedThunderbadgeText
	ld de, ReceivedThunderbadgeText
	call SaveEndBattleTextPointers
	ld a, [H_SPRITEINDEX]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $3
	ld [wGymLeaderNo], a
	xor a
	ld [hJoyHeld], a
	ld a, $3 ; set script index to LT Surge post-battle script
	ld [wVermilionGymCurScript], a
	ld [wCurMapScript], a
.done
	jp TextScriptEnd

LTSurgePreBattleText:
	TX_FAR _LTSurgePreBattleText
	db "@"

LTSurgePostBattleAdviceText:
	TX_FAR _LTSurgePostBattleAdviceText
	db "@"

LTSurgeThunderbadgeInfoText:
	TX_FAR _LTSurgeThunderbadgeInfoText
	db "@"

ReceivedTM24Text:
	TX_FAR _ReceivedTM24Text
	TX_SFX_KEY_ITEM
	TX_FAR _TM24ExplanationText
	db "@"

TM24NoRoomText:
	TX_FAR _TM24NoRoomText
	db "@"

ReceivedThunderbadgeText:
	TX_FAR _ReceivedThunderbadgeText
	db "@"

VermilionGymTrainerText1:
	TX_ASM
	ld hl, VermilionGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VermilionGymBattleText1:
	TX_FAR _VermilionGymBattleText1
	db "@"

VermilionGymEndBattleText1:
	TX_FAR _VermilionGymEndBattleText1
	db "@"

VermilionGymAfterBattleText1:
	TX_FAR _VermilionGymAfterBattleText1
	db "@"

VermilionGymTrainerText2:
	TX_ASM
	ld hl, VermilionGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

VermilionGymBattleText2:
	TX_FAR _VermilionGymBattleText2
	db "@"

VermilionGymEndBattleText2:
	TX_FAR _VermilionGymEndBattleText2
	db "@"

VermilionGymAfterBattleText2:
	TX_FAR _VermilionGymAfterBattleText2
	db "@"

VermilionGymTrainerText3:
	TX_ASM
	ld hl, VermilionGymTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

VermilionGymBattleText3:
	TX_FAR _VermilionGymBattleText3
	db "@"

VermilionGymEndBattleText3:
	TX_FAR _VermilionGymEndBattleText3
	db "@"

VermilionGymAfterBattleText3:
	TX_FAR _VermilionGymAfterBattleText3
	db "@"

VermilionGymFanText:
	TX_ASM
	ld a, [wBeatGymFlags]
	bit 2, a
	jr nz, .afterBeat
	ld hl, VermilionGymFanPreBattleText
	call PrintText
	jr .done
.afterBeat
	ld hl, VermilionGymFanPostBattleText
	call PrintText
.done
	jp TextScriptEnd

VermilionGymFanPreBattleText:
	TX_FAR _VermilionGymFanPreBattleText
	db "@"

VermilionGymFanPostBattleText:
	TX_FAR _VermilionGymFanPostBattleText
	db "@"
