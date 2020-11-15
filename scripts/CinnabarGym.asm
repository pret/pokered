CinnabarGym_Script:
	call CinnabarGymScript_75759
	call EnableAutoTextBoxDrawing
	ld hl, CinnabarGym_ScriptPointers
	ld a, [wCinnabarGymCurScript]
	jp CallFunctionInTable

CinnabarGymScript_75759:
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

CinnabarGymScript_75792:
	xor a
	ld [wJoyIgnore], a
	ld [wCinnabarGymCurScript], a
	ld [wCurMapScript], a
	ld [wOpponentAfterWrongAnswer], a
	ret

CinnabarGymScript_757a0:
	ldh a, [hSpriteIndexOrTextID]
	ld [wTrainerHeaderFlagBit], a
	ret

CinnabarGym_ScriptPointers:
	dw CinnabarGymScript0
	dw CinnabarGymScript1
	dw CinnabarGymScript2
	dw CinnabarGymScript3

CinnabarGymScript0:
	ld a, [wOpponentAfterWrongAnswer]
	and a
	ret z
	ldh [hSpriteIndex], a
	cp $4
	jr nz, .asm_757c3
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld de, MovementData_757d7
	jr .asm_757cb
.asm_757c3
	ld de, MovementData_757da
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
.asm_757cb
	call MoveSprite
	ld a, $1
	ld [wCinnabarGymCurScript], a
	ld [wCurMapScript], a
	ret

MovementData_757d7:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_UP
	db -1 ; end

MovementData_757da:
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
	jp z, CinnabarGymScript_75792
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

CinnabarGymScript3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CinnabarGymScript_75792
	ld a, $f0
	ld [wJoyIgnore], a
CinnabarGymScript3_75857:
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

	jp CinnabarGymScript_75792

CinnabarGym_TextPointers:
	dw CinnabarGymText1
	dw CinnabarGymText2
	dw CinnabarGymText3
	dw CinnabarGymText4
	dw CinnabarGymText5
	dw CinnabarGymText6
	dw CinnabarGymText7
	dw CinnabarGymText8
	dw CinnabarGymText9
	dw BlaineBadgeText
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

CinnabarGymText1:
	text_asm
	CheckEvent EVENT_BEAT_BLAINE
	jr z, .beginBattle
	CheckEventReuseA EVENT_GOT_TM38
	jr nz, .afterVictory
	call z, CinnabarGymScript3_75857
	call DisableWaitingAfterTextDisplay
	jp TextScriptEnd
.afterVictory
	ld hl, BlaineFireBlastText
	call PrintText
	jp TextScriptEnd
.beginBattle
	ld hl, BlaineBattleText
	call PrintText
	ld hl, BlaineEndBattleText
	ld de, BlaineEndBattleText
	call SaveEndBattleTextPointers
	ld a, $7
	ld [wGymLeaderNo], a
	jp CinnabarGymScript_758b7

BlaineBattleText:
	text_far _BlaineBattleText
	text_end

BlaineEndBattleText:
	text_far _BlaineEndBattleText
	sound_get_key_item ; actually plays the second channel of SFX_BALL_POOF due to the wrong music bank being loaded
	text_waitbutton
	text_end

BlaineFireBlastText:
	text_far _BlaineFireBlastText
	text_end

BlaineBadgeText:
	text_far _BlaineBadgeText
	text_end

ReceivedTM38Text:
	text_far _ReceivedTM38Text
	sound_get_item_1
	text_far _TM38ExplanationText
	text_end

TM38NoRoomText:
	text_far _TM38NoRoomText
	text_end

CinnabarGymText2:
	text_asm
	call CinnabarGymScript_757a0
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_0
	jr nz, .asm_46bb4
	ld hl, CinnabarGymText_7595f
	call PrintText
	ld hl, CinnabarGymText_75964
	ld de, CinnabarGymText_75964
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_46bb4
	ld hl, CinnabarGymText_75969
	call PrintText
	jp TextScriptEnd

CinnabarGymText_7595f:
	text_far _CinnabarGymText_7595f
	text_end

CinnabarGymText_75964:
	text_far _CinnabarGymText_75964
	text_end

CinnabarGymText_75969:
	text_far _CinnabarGymText_75969
	text_end

CinnabarGymText3:
	text_asm
	call CinnabarGymScript_757a0
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_1
	jr nz, .asm_4b406
	ld hl, CinnabarGymText_75994
	call PrintText
	ld hl, CinnabarGymText_75999
	ld de, CinnabarGymText_75999
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_4b406
	ld hl, CinnabarGymText_7599e
	call PrintText
	jp TextScriptEnd

CinnabarGymText_75994:
	text_far _CinnabarGymText_75994
	text_end

CinnabarGymText_75999:
	text_far _CinnabarGymText_75999
	text_end

CinnabarGymText_7599e:
	text_far _CinnabarGymText_7599e
	text_end

CinnabarGymText4:
	text_asm
	call CinnabarGymScript_757a0
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_2
	jr nz, .asm_c0673
	ld hl, CinnabarGymText_759c9
	call PrintText
	ld hl, CinnabarGymText_759ce
	ld de, CinnabarGymText_759ce
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_c0673
	ld hl, CinnabarGymText_759d3
	call PrintText
	jp TextScriptEnd

CinnabarGymText_759c9:
	text_far _CinnabarGymText_759c9
	text_end

CinnabarGymText_759ce:
	text_far _CinnabarGymText_759ce
	text_end

CinnabarGymText_759d3:
	text_far _CinnabarGymText_759d3
	text_end

CinnabarGymText5:
	text_asm
	call CinnabarGymScript_757a0
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_3
	jr nz, .asm_5cfd7
	ld hl, CinnabarGymText_759fe
	call PrintText
	ld hl, CinnabarGymText_75a03
	ld de, CinnabarGymText_75a03
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_5cfd7
	ld hl, CinnabarGymText_75a08
	call PrintText
	jp TextScriptEnd

CinnabarGymText_759fe:
	text_far _CinnabarGymText_759fe
	text_end

CinnabarGymText_75a03:
	text_far _CinnabarGymText_75a03
	text_end

CinnabarGymText_75a08:
	text_far _CinnabarGymText_75a08
	text_end

CinnabarGymText6:
	text_asm
	call CinnabarGymScript_757a0
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_4
	jr nz, .asm_776b4
	ld hl, CinnabarGymText_75a33
	call PrintText
	ld hl, CinnabarGymText_75a38
	ld de, CinnabarGymText_75a38
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_776b4
	ld hl, CinnabarGymText_75a3d
	call PrintText
	jp TextScriptEnd

CinnabarGymText_75a33:
	text_far _CinnabarGymText_75a33
	text_end

CinnabarGymText_75a38:
	text_far _CinnabarGymText_75a38
	text_end

CinnabarGymText_75a3d:
	text_far _CinnabarGymText_75a3d
	text_end

CinnabarGymText7:
	text_asm
	call CinnabarGymScript_757a0
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_5
	jr nz, .asm_2f755
	ld hl, CinnabarGymText_75a68
	call PrintText
	ld hl, CinnabarGymText_75a6d
	ld de, CinnabarGymText_75a6d
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_2f755
	ld hl, CinnabarGymText_75a72
	call PrintText
	jp TextScriptEnd

CinnabarGymText_75a68:
	text_far _CinnabarGymText_75a68
	text_end

CinnabarGymText_75a6d:
	text_far _CinnabarGymText_75a6d
	text_end

CinnabarGymText_75a72:
	text_far _CinnabarGymText_75a72
	text_end

CinnabarGymText8:
	text_asm
	call CinnabarGymScript_757a0
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_6
	jr nz, .asm_d87be
	ld hl, CinnabarGymText_75a9d
	call PrintText
	ld hl, CinnabarGymText_75aa2
	ld de, CinnabarGymText_75aa2
	call SaveEndBattleTextPointers
	jp CinnabarGymScript_758b7
.asm_d87be
	ld hl, CinnabarGymText_75aa7
	call PrintText
	jp TextScriptEnd

CinnabarGymText_75a9d:
	text_far _CinnabarGymText_75a9d
	text_end

CinnabarGymText_75aa2:
	text_far _CinnabarGymText_75aa2
	text_end

CinnabarGymText_75aa7:
	text_far _CinnabarGymText_75aa7
	text_end

CinnabarGymText9:
	text_asm
	CheckEvent EVENT_BEAT_BLAINE
	jr nz, .asm_627d9
	ld hl, CinnabarGymText_75ac2
	jr .asm_0b11d
.asm_627d9
	ld hl, CinnabarGymText_75ac7
.asm_0b11d
	call PrintText
	jp TextScriptEnd

CinnabarGymText_75ac2:
	text_far _CinnabarGymText_75ac2
	text_end

CinnabarGymText_75ac7:
	text_far _CinnabarGymText_75ac7
	text_end
