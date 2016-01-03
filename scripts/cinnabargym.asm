CinnabarGymScript: ; 7574a (1d:574a)
	call CinnabarGymScript_75759
	call EnableAutoTextBoxDrawing
	ld hl, CinnabarGymScriptPointers
	ld a, [wCinnabarGymCurScript]
	jp CallFunctionInTable

CinnabarGymScript_75759: ; 75759 (1d:5759)
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	push hl
	call nz, CinnabarGymScript_75772
	pop hl
	bit 5, [hl]
	res 5, [hl]
	call nz, UpdateCinnabarGymGateTileBlocks
	ResetEvent EVENT_2A7
	ret
CinnabarGymScript_75772: ; 75772 (1d:5772)
	ld hl, Gym7CityName
	ld de, Gym7LeaderName
	jp LoadGymLeaderAndCityName

Gym7CityName: ; 7577b (1d:577b)
	db "CINNABAR ISLAND@"
Gym7LeaderName: ; 7578b (1d:578b)
	db "BLAINE@"

CinnabarGymScript_75792: ; 75792 (1d:5792)
	xor a
	ld [wJoyIgnore], a
	ld [wCinnabarGymCurScript], a
	ld [wCurMapScript], a
	ld [wOpponentAfterWrongAnswer], a
	ret

CinnabarGymScript_757a0: ; 757a0 (1d:57a0)
	ld a, [hSpriteIndexOrTextID]
	ld [wTrainerHeaderFlagBit], a
	ret

CinnabarGymScriptPointers: ; 757a6 (1d:57a6)
	dw CinnabarGymScript0
	dw CinnabarGymScript1
	dw CinnabarGymScript2
	dw CinnabarGymScript3

CinnabarGymScript0: ; 757ae (1d:57ae)
	ld a, [wOpponentAfterWrongAnswer]
	and a
	ret z
	ld [H_SPRITEINDEX], a
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

MovementData_757d7: ; 757d7 (1d:57d7)
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_UP
	db $FF

MovementData_757da: ; 757da (1d:57da)
	db NPC_MOVEMENT_LEFT
	db $FF

CinnabarGymScript1: ; 757dc (1d:57dc)
	ld a, [wd730]
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, [wOpponentAfterWrongAnswer]
	ld [wTrainerHeaderFlagBit], a
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

CinnabarGymFlagAction: ; 757f1 (1d:57f1)
	predef_jump FlagActionPredef

CinnabarGymScript2: ; 757f6 (1d:57f6)
	ld a, [wIsInBattle]
	cp $ff
	jp z, CinnabarGymScript_75792
	ld a, [wTrainerHeaderFlagBit]
	ld [$ffdb], a
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
	ld [$ffdb], a
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

CinnabarGymScript3: ; 7584a (1d:584a)
	ld a, [wIsInBattle]
	cp $ff
	jp z, CinnabarGymScript_75792
	ld a, $f0
	ld [wJoyIgnore], a
CinnabarGymScript3_75857: ; 75857 (1d:5857)
	ld a, $a
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_BLAINE
	lb bc, TM_38, 1
	call GiveItem
	jr nc, .BagFull
	ld a, $b
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM38
	jr .asm_75880
.BagFull
	ld a, $c
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
.asm_75880
	ld hl, wObtainedBadges
	set 6, [hl]
	ld hl, wBeatGymFlags
	set 6, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_CINNABAR_GYM_TRAINER_0, EVENT_BEAT_CINNABAR_GYM_TRAINER_6

	ld hl, wCurrentMapScriptFlags
	set 5, [hl]

	jp CinnabarGymScript_75792

CinnabarGymTextPointers: ; 7589f (1d:589f)
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

CinnabarGymScript_758b7: ; 758b7 (1d:58b7)
	ld a, [hSpriteIndexOrTextID]
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

CinnabarGymText1: ; 758df (1d:58df)
	TX_ASM
	CheckEvent EVENT_BEAT_BLAINE
	jr z, .asm_d9332
	CheckEventReuseA EVENT_GOT_TM38
	jr nz, .asm_3012f
	call z, CinnabarGymScript3_75857
	call DisableWaitingAfterTextDisplay
	jp TextScriptEnd
.asm_3012f
	ld hl, BlaineFireBlastText
	call PrintText
	jp TextScriptEnd
.asm_d9332
	ld hl, BlaineBattleText
	call PrintText
	ld hl, BlaineEndBattleText
	ld de, BlaineEndBattleText
	call SaveEndBattleTextPointers
	ld a, $7
	ld [wGymLeaderNo], a
	jp CinnabarGymScript_758b7

BlaineBattleText: ; 75914 (1d:5914)
	TX_FAR _BlaineBattleText
	db "@"

BlaineEndBattleText: ; 75919 (1d:5919)
	TX_FAR _BlaineEndBattleText
	db $11
	db $d
	db "@"

BlaineFireBlastText: ; 75920 (1d:5920)
	TX_FAR _BlaineFireBlastText
	db "@"

BlaineBadgeText: ; 75925 (1d:5925)
	TX_FAR _BlaineBadgeText
	db "@"

ReceivedTM38Text: ; 7592a (1d:592a)
	TX_FAR _ReceivedTM38Text
	db $0B
	TX_FAR _TM38ExplanationText
	db "@"

TM38NoRoomText: ; 75934 (1d:5934)
	TX_FAR _TM38NoRoomText
	db "@"

CinnabarGymText2: ; 75939 (1d:5939)
	TX_ASM
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

CinnabarGymText_7595f: ; 7595f (1d:595f)
	TX_FAR _CinnabarGymText_7595f
	db "@"

CinnabarGymText_75964: ; 75964 (1d:5964)
	TX_FAR _CinnabarGymText_75964
	db "@"

CinnabarGymText_75969: ; 75969 (1d:5969)
	TX_FAR _CinnabarGymText_75969
	db "@"

CinnabarGymText3: ; 7596e (1d:596e)
	TX_ASM
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

CinnabarGymText_75994: ; 75994 (1d:5994)
	TX_FAR _CinnabarGymText_75994
	db "@"

CinnabarGymText_75999: ; 75999 (1d:5999)
	TX_FAR _CinnabarGymText_75999
	db "@"

CinnabarGymText_7599e: ; 7599e (1d:599e)
	TX_FAR _CinnabarGymText_7599e
	db "@"

CinnabarGymText4: ; 759a3 (1d:59a3)
	TX_ASM
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

CinnabarGymText_759c9: ; 759c9 (1d:59c9)
	TX_FAR _CinnabarGymText_759c9
	db "@"

CinnabarGymText_759ce: ; 759ce (1d:59ce)
	TX_FAR _CinnabarGymText_759ce
	db "@"

CinnabarGymText_759d3: ; 759d3 (1d:59d3)
	TX_FAR _CinnabarGymText_759d3
	db "@"

CinnabarGymText5: ; 759d8 (1d:59d8)
	TX_ASM
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

CinnabarGymText_759fe: ; 759fe (1d:59fe)
	TX_FAR _CinnabarGymText_759fe
	db "@"

CinnabarGymText_75a03: ; 75a03 (1d:5a03)
	TX_FAR _CinnabarGymText_75a03
	db "@"

CinnabarGymText_75a08: ; 75a08 (1d:5a08)
	TX_FAR _CinnabarGymText_75a08
	db "@"

CinnabarGymText6: ; 75a0d (1d:5a0d)
	TX_ASM
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

CinnabarGymText_75a33: ; 75a33 (1d:5a33)
	TX_FAR _CinnabarGymText_75a33
	db "@"

CinnabarGymText_75a38: ; 75a38 (1d:5a38)
	TX_FAR _CinnabarGymText_75a38
	db "@"

CinnabarGymText_75a3d: ; 75a3d (1d:5a3d)
	TX_FAR _CinnabarGymText_75a3d
	db "@"

CinnabarGymText7: ; 75a42 (1d:5a42)
	TX_ASM
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

CinnabarGymText_75a68: ; 75a68 (1d:5a68)
	TX_FAR _CinnabarGymText_75a68
	db "@"

CinnabarGymText_75a6d: ; 75a6d (1d:5a6d)
	TX_FAR _CinnabarGymText_75a6d
	db "@"

CinnabarGymText_75a72: ; 75a72 (1d:5a72)
	TX_FAR _CinnabarGymText_75a72
	db "@"

CinnabarGymText8: ; 75a77 (1d:5a77)
	TX_ASM
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

CinnabarGymText_75a9d: ; 75a9d (1d:5a9d)
	TX_FAR _CinnabarGymText_75a9d
	db "@"

CinnabarGymText_75aa2: ; 75aa2 (1d:5aa2)
	TX_FAR _CinnabarGymText_75aa2
	db "@"

CinnabarGymText_75aa7: ; 75aa7 (1d:5aa7)
	TX_FAR _CinnabarGymText_75aa7
	db "@"

CinnabarGymText9: ; 75aac (1d:5aac)
	TX_ASM
	CheckEvent EVENT_BEAT_BLAINE
	jr nz, .asm_627d9
	ld hl, CinnabarGymText_75ac2
	jr .asm_0b11d
.asm_627d9
	ld hl, CinnabarGymText_75ac7
.asm_0b11d
	call PrintText
	jp TextScriptEnd

CinnabarGymText_75ac2: ; 75ac2 (1d:5ac2)
	TX_FAR _CinnabarGymText_75ac2
	db "@"

CinnabarGymText_75ac7: ; 75ac7 (1d:5ac7)
	TX_FAR _CinnabarGymText_75ac7
	db "@"
