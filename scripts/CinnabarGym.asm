CinnabarGym_Script:
	call CinnabarGymSetMapAndTiles
	call EnableAutoTextBoxDrawing
	ld hl, CinnabarGym_ScriptPointers
	ld a, [wCinnabarGymCurScript]
	jp CallFunctionInTable

CinnabarGymSetMapAndTiles:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	push hl
	call nz, .LoadNames
	pop hl
	bit 5, [hl]
	res 5, [hl]
	call nz, UpdateCinnabarGymGateTileBlocks
	ResetEvent EVENT_2A7
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

.CityName:
	db "CINNABAR ISLAND@"

.LeaderName:
	db "BLAINE@"

CinnabarGymResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wCinnabarGymCurScript], a
	ld [wCurMapScript], a
	ld [wOpponentAfterWrongAnswer], a
	ret

CinnabarGymSetTrainerHeader:
	ldh a, [hSpriteIndexOrTextID]
	ld [wTrainerHeaderFlagBit], a
	ret

CinnabarGym_ScriptPointers:
	dw CinnabarGymScript0
	dw CinnabarGymScript1
	dw CinnabarGymScript2
	dw CinnabarGymBlainePostBattle

CinnabarGymScript0:
	ld a, [wOpponentAfterWrongAnswer]
	and a
	ret z
	ldh [hSpriteIndex], a
	cp $4
	jr nz, .asm_757c3
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld de, MovementNpcToLeftAndUp
	jr .MoveSprite
.asm_757c3
	ld de, MovementNpcToLeft
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
.MoveSprite
	call MoveSprite
	ld a, $1
	ld [wCinnabarGymCurScript], a
	ld [wCurMapScript], a
	ret

MovementNpcToLeftAndUp:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_UP
	db -1 ; end

MovementNpcToLeft:
	db NPC_MOVEMENT_LEFT
	db -1 ; end

CinnabarGymScript1:
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, [wOpponentAfterWrongAnswer]
	ld [wTrainerHeaderFlagBit], a
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID

CinnabarGymFlagAction:
	predef_jump FlagActionPredef

CinnabarGymScript2:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CinnabarGymResetScripts
	ld a, [wTrainerHeaderFlagBit]
	ldh [hGymGateIndex], a
	AdjustEventBit EVENT_BEAT_CINNABAR_GYM_TRAINER_0, 2
	ld c, a
	ld b, FLAG_TEST
	EventFlagAddress hl, EVENT_BEAT_CINNABAR_GYM_TRAINER_0
	call CinnabarGymFlagAction
	ld a, c
	and a
	jr nz, .asm_7581b
	call WaitForSoundToFinish
	ld a, SFX_GO_INSIDE
	call PlaySound
	call WaitForSoundToFinish
.asm_7581b
	ld a, [wTrainerHeaderFlagBit]
	ldh [hGymGateIndex], a
	AdjustEventBit EVENT_BEAT_CINNABAR_GYM_TRAINER_0, 2
	ld c, a
	ld b, FLAG_SET
	EventFlagAddress hl, EVENT_BEAT_CINNABAR_GYM_TRAINER_0
	call CinnabarGymFlagAction
	ld a, [wTrainerHeaderFlagBit]
	sub $2
	AdjustEventBit EVENT_CINNABAR_GYM_GATE0_UNLOCKED, 0
	ld c, a
	ld b, FLAG_SET
	EventFlagAddress hl, EVENT_CINNABAR_GYM_GATE0_UNLOCKED
	call CinnabarGymFlagAction
	call UpdateCinnabarGymGateTileBlocks
	xor a
	ld [wJoyIgnore], a
	ld [wOpponentAfterWrongAnswer], a
	ld a, $0
	ld [wCinnabarGymCurScript], a
	ld [wCurMapScript], a
	ret

CinnabarGymBlainePostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CinnabarGymResetScripts
	ld a, $f0
	ld [wJoyIgnore], a
; fallthrough
CinnabarGymReceiveTM38:
	ld a, $a
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_BLAINE
	lb bc, TM_FIRE_BLAST, 1
	call GiveItem
	jr nc, .BagFull
	ld a, $b
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM38
	jr .gymVictory
.BagFull
	ld a, $c
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_VOLCANOBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_VOLCANOBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_CINNABAR_GYM_TRAINER_0, EVENT_BEAT_CINNABAR_GYM_TRAINER_6

	ld hl, wCurrentMapScriptFlags
	set 5, [hl]

	jp CinnabarGymResetScripts

CinnabarGym_TextPointers:
	dw BlaineText
	dw CinnabarGymTrainerText1
	dw CinnabarGymTrainerText2
	dw CinnabarGymTrainerText3
	dw CinnabarGymTrainerText4
	dw CinnabarGymTrainerText5
	dw CinnabarGymTrainerText6
	dw CinnabarGymTrainerText7
	dw CinnabarGymGuideText
	dw BlaineVolcanoBadgeInfoText
	dw ReceivedTM38Text
	dw TM38NoRoomText

CinnabarGymScript_758b7:
	ldh a, [hSpriteIndexOrTextID]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld a, [wSpriteIndex]
	cp $1
	jr z, .asm_758d4
	ld a, $2
	jr .asm_758d6
.asm_758d4
	ld a, $3
.asm_758d6
	ld [wCinnabarGymCurScript], a
	ld [wCurMapScript], a
	jp TextScriptEnd

BlaineText:
	text_asm
	CheckEvent EVENT_BEAT_BLAINE
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM38
	jr nz, .afterBeat
	call z, CinnabarGymReceiveTM38
	call DisableWaitingAfterTextDisplay
	jp TextScriptEnd
.afterBeat
	ld hl, BlainePostBattleAdviceText
	call PrintText
	jp TextScriptEnd
.beforeBeat
	ld hl, BlainePreBattleText
	call PrintText
	ld hl, ReceivedVolcanoBadgeText
	ld de, ReceivedVolcanoBadgeText
	call SaveEndBattleTextPointers
	ld a, $7
	ld [wGymLeaderNo], a
	jp CinnabarGymScript_758b7

BlainePreBattleText:
	text_far _BlainePreBattleText
	text_end

ReceivedVolcanoBadgeText:
	text_far _ReceivedVolcanoBadgeText
	sound_get_key_item ; actually plays the second channel of SFX_BALL_POOF due to the wrong music bank being loaded
	text_waitbutton
	text_end

BlainePostBattleAdviceText:
	text_far _BlainePostBattleAdviceText
	text_end

BlaineVolcanoBadgeInfoText:
	text_far _BlaineVolcanoBadgeInfoText
	text_end

ReceivedTM38Text:
	text_far _ReceivedTM38Text
	sound_get_item_1
	text_far _TM38ExplanationText
	text_end

TM38NoRoomText:
	text_far _TM38NoRoomText
	text_end

CinnabarGymTrainerText1:
	text_asm
	call CinnabarGymSetTrainerHeader
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_0
	jr nz, .asm_46bb4
	ld hl, CinnabarGymBattleText2
	call PrintText
	ld hl, CinnabarGymEndBattleText2
	ld de, CinnabarGymEndBattleText2
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_46bb4
	ld hl, CinnabarGymAfterBattleText2
	call PrintText
	jp TextScriptEnd

CinnabarGymBattleText2:
	text_far _CinnabarGymBattleText2
	text_end

CinnabarGymEndBattleText2:
	text_far _CinnabarGymEndBattleText2
	text_end

CinnabarGymAfterBattleText2:
	text_far _CinnabarGymAfterBattleText2
	text_end

CinnabarGymTrainerText2:
	text_asm
	call CinnabarGymSetTrainerHeader
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_1
	jr nz, .asm_4b406
	ld hl, CinnabarGymBattleText1
	call PrintText
	ld hl, CinnabarGymEndBattleText1
	ld de, CinnabarGymEndBattleText1
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_4b406
	ld hl, CinnabarGymAfterBattleText1
	call PrintText
	jp TextScriptEnd

CinnabarGymBattleText1:
	text_far _CinnabarGymBattleText1
	text_end

CinnabarGymEndBattleText1:
	text_far _CinnabarGymEndBattleText1
	text_end

CinnabarGymAfterBattleText1:
	text_far _CinnabarGymAfterBattleText1
	text_end

CinnabarGymTrainerText3:
	text_asm
	call CinnabarGymSetTrainerHeader
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_2
	jr nz, .afterBeat
	ld hl, CinnabarGymBattleText3
	call PrintText
	ld hl, CinnabarGymEndBattleText3
	ld de, CinnabarGymEndBattleText3
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.afterBeat
	ld hl, CinnabarGymAfterBattleText3
	call PrintText
	jp TextScriptEnd

CinnabarGymBattleText3:
	text_far _CinnabarGymBattleText3
	text_end

CinnabarGymEndBattleText3:
	text_far _CinnabarGymEndBattleText3
	text_end

CinnabarGymAfterBattleText3:
	text_far _CinnabarGymAfterBattleText3
	text_end

CinnabarGymTrainerText4:
	text_asm
	call CinnabarGymSetTrainerHeader
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_3
	jr nz, .afterBeat
	ld hl, CinnabarGymBattleText4
	call PrintText
	ld hl, CinnabarGymEndBattleText4
	ld de, CinnabarGymEndBattleText4
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.afterBeat
	ld hl, CinnabarGymAfterBattleText4
	call PrintText
	jp TextScriptEnd

CinnabarGymBattleText4:
	text_far _CinnabarGymBattleText4
	text_end

CinnabarGymEndBattleText4:
	text_far _CinnabarGymEndBattleText4
	text_end

CinnabarGymAfterBattleText4:
	text_far _CinnabarGymAfterBattleText4
	text_end

CinnabarGymTrainerText5:
	text_asm
	call CinnabarGymSetTrainerHeader
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_4
	jr nz, .afterBeat
	ld hl, CinnabarGymBattleText5
	call PrintText
	ld hl, CinnabarGymEndBattleText5
	ld de, CinnabarGymEndBattleText5
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.afterBeat
	ld hl, CinnabarGymAfterBattleText5
	call PrintText
	jp TextScriptEnd

CinnabarGymBattleText5:
	text_far _CinnabarGymBattleText5
	text_end

CinnabarGymEndBattleText5:
	text_far _CinnabarGymEndBattleText5
	text_end

CinnabarGymAfterBattleText5:
	text_far _CinnabarGymAfterBattleText5
	text_end

CinnabarGymTrainerText6:
	text_asm
	call CinnabarGymSetTrainerHeader
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_5
	jr nz, .afterBeat
	ld hl, CinnabarGymBattleText6
	call PrintText
	ld hl, CinnabarGymEndBattleText6
	ld de, CinnabarGymEndBattleText6
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.afterBeat
	ld hl, CinnabarGymAfterBattleText6
	call PrintText
	jp TextScriptEnd

CinnabarGymBattleText6:
	text_far _CinnabarGymBattleText6
	text_end

CinnabarGymEndBattleText6:
	text_far _CinnabarGymEndBattleText6
	text_end

CinnabarGymAfterBattleText6:
	text_far _CinnabarGymAfterBattleText6
	text_end

CinnabarGymTrainerText7:
	text_asm
	call CinnabarGymSetTrainerHeader
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_6
	jr nz, .afterBeat
	ld hl, CinnabarGymBattleText7
	call PrintText
	ld hl, CinnabarGymEndBattleText7
	ld de, CinnabarGymEndBattleText7
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.afterBeat
	ld hl, CinnabarGymAfterBattleText7
	call PrintText
	jp TextScriptEnd

CinnabarGymBattleText7:
	text_far _CinnabarGymBattleText7
	text_end

CinnabarGymEndBattleText7:
	text_far _CinnabarGymEndBattleText7
	text_end

CinnabarGymAfterBattleText7:
	text_far _CinnabarGymAfterBattleText7
	text_end

CinnabarGymGuideText:
	text_asm
	CheckEvent EVENT_BEAT_BLAINE
	jr nz, .afterBeat
	ld hl, CinnabarGymGuidePreBattleText
	jr .done
.afterBeat
	ld hl, CinnabarGymGuidePostBattleText
.done
	call PrintText
	jp TextScriptEnd

CinnabarGymGuidePreBattleText:
	text_far _CinnabarGymGuidePreBattleText
	text_end

CinnabarGymGuidePostBattleText:
	text_far _CinnabarGymGuidePostBattleText
	text_end
