MtMoonB2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, MtMoon3TrainerHeaders
	ld de, MtMoonB2F_ScriptPointers
	ld a, [wMtMoonB2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wMtMoonB2FCurScript], a
	CheckEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	ret z
	ld hl, CoordsData_49d37
	call ArePlayerCoordsInArray
	jr nc, .asm_49d31
	ld hl, wd72e
	set 4, [hl]
	ret
.asm_49d31
	ld hl, wd72e
	res 4, [hl]
	ret

CoordsData_49d37:
	dbmapcoord 11,  5
	dbmapcoord 12,  5
	dbmapcoord 13,  5
	dbmapcoord 14,  5
	dbmapcoord 11,  6
	dbmapcoord 12,  6
	dbmapcoord 13,  6
	dbmapcoord 14,  6
	dbmapcoord 11,  7
	dbmapcoord 12,  7
	dbmapcoord 13,  7
	dbmapcoord 14,  7
	dbmapcoord 11,  8
	dbmapcoord 12,  8
	dbmapcoord 13,  8
	dbmapcoord 14,  8
	db -1 ; end

MtMoon3Script_49cd7:
	CheckAndResetEvent EVENT_57E
	call nz, MtMoon3Script_49cec
	xor a
	ld [wJoyIgnore], a
MtMoon3Script_49ce5:
	ld [wMtMoonB2FCurScript], a
	ld [wCurMapScript], a
	ret

MtMoon3Script_49cec:
	ld a, HS_MT_MOON_B2F_JESSIE
	call MtMoon3Script_49f93
	ld a, HS_MT_MOON_B2F_JAMES
	call MtMoon3Script_49f93
	ret

MtMoonB2F_ScriptPointers:
	dw MtMoon3Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw MtMoon3Script3
	dw MtMoon3Script4
	dw MtMoon3Script5
	dw MtMoon3Script6
	dw MtMoon3Script7
	dw MtMoon3Script8
	dw MtMoon3Script9
	dw MtMoon3Script10
	dw MtMoon3Script11
	dw MtMoon3Script12
	dw MtMoon3Script13
	dw MtMoon3Script14
	dw MtMoon3Script15

MtMoon3Script0:
IF DEF(_DEBUG)
	call DebugPressedOrHeldB
	ret nz
ENDC
	CheckEitherEventSet EVENT_GOT_DOME_FOSSIL, EVENT_GOT_HELIX_FOSSIL
	call z, MtMoon3Script_49d28
	CheckEvent EVENT_BEAT_MT_MOON_3_TRAINER_0
	call z, MtMoon3Script_49e15
	ret

MtMoon3Script_49d28:
	CheckEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	jp nz, .asm_49d4b
	ld a, [wYCoord]
	cp 8
	jp nz, .asm_49d4b
	ld a, [wXCoord]
	cp 13
	jp nz, .asm_49d4b
	xor a
	ldh [hJoyHeld], a
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ret

.asm_49d4b
	CheckEitherEventSet EVENT_GOT_DOME_FOSSIL, EVENT_GOT_HELIX_FOSSIL
	jp z, CheckFightingMapTrainers
	ret

MtMoon3Script3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, MtMoon3Script_49cd7
	call UpdateSprites
	call Delay3
	SetEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	call MtMoon3Script_49ce5
	ret

MtMoon3Script4:
	ld a, $1
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld hl, CoordsData_49dc7
	call ArePlayerCoordsInArray
	jr c, .asm_49da8
	ld hl, CoordsData_49dc0
	call ArePlayerCoordsInArray
	jr c, .asm_49db0
	ld hl, CoordsData_49dd5
	call ArePlayerCoordsInArray
	jr c, .asm_49d9b
	ld hl, CoordsData_49dce
	call ArePlayerCoordsInArray
	jr c, .asm_49da3
	jp CheckFightingMapTrainers
; these are most likely pikachu-related and could be removed, but would need a lot of testing to make sure.
.asm_49d9b
	ld b, SPRITE_FACING_LEFT
.asm_49da3
	ld de, MovementData_49ddd
	jr .asm_49db3

.asm_49da8
	ld b, SPRITE_FACING_RIGHT
.asm_49db0
	ld de, MovementData_49ddc
.asm_49db3
	ld a, $1
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, $5
	call MtMoon3Script_49ce5
	ret

CoordsData_49dc0:
	dbmapcoord 12,  7
	dbmapcoord 11,  6
	dbmapcoord 12,  5
	db -1 ; end

CoordsData_49dc7:
	dbmapcoord 12,  7
	db -1 ; end

CoordsData_49dce:
	dbmapcoord 13,  7
	dbmapcoord 14,  6
	dbmapcoord 14,  5
	db -1 ; end

CoordsData_49dd5:
	dbmapcoord 13,  7
	db -1 ; end

MovementData_49ddc:
	db NPC_MOVEMENT_RIGHT
MovementData_49ddd:
	db NPC_MOVEMENT_UP
	db -1 ; end

MtMoon3Script5:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, $b
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	jr z, .asm_49e1d
	ld a, HS_MT_MOON_B2F_FOSSIL_1
	jr .asm_49e1f
.asm_49e1d
	ld a, HS_MT_MOON_B2F_FOSSIL_2
.asm_49e1f
	ld [wMissableObjectIndex], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	call MtMoon3Script_49ce5
	ret

MtMoon3Script_49e15:
	ld a, [wXCoord]
	cp $3
	ret nz
	ld a, [wYCoord]
	cp $5
	ret nz
	call StopMusic
	ld c, 0 ; BANK(Music_MeetJessieJames)
	ld a, MUSIC_MEET_JESSIE_JAMES
	call PlayMusic
	xor a
	ldh [hJoyHeld], a
	ld a, ~(A_BUTTON | B_BUTTON)
	ld [wJoyIgnore], a
	ld a, HS_MT_MOON_B2F_JESSIE
	call MtMoon3Script_49f84
	ld a, HS_MT_MOON_B2F_JAMES
	call MtMoon3Script_49f84
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, $c
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $6
	call MtMoon3Script_49ce5
	ret

MovementData_f9e65:
	db $06
MovementData_f9e66:
	db $06
	db $06
	db $06
	db $06
	db $06
	db $FF

MtMoon3Script6:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, $2
	ldh [hSpriteIndex], a
	ld de, MovementData_f9e65
	call MoveSprite
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $7
	call MtMoon3Script_49ce5
	ret

MtMoon3Script7:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wd730]
	bit 0, a
	ret nz
MtMoon3Script8:
	ld a, $2
	ld [wSprite02StateData1MovementStatus], a
	ld a, SPRITE_FACING_DOWN
	ld [wSprite02StateData1FacingDirection], a
MtMoon3Script9:
	ld a, $6
	ldh [hSpriteIndex], a
	ld de, MovementData_f9e66
	call MoveSprite
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $a
	call MtMoon3Script_49ce5
	ret

MtMoon3Script10:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wd730]
	bit 0, a
	ret nz
MtMoon3Script11:
	ld a, $2
	ld [wSprite06StateData1MovementStatus], a
	ld a, SPRITE_FACING_LEFT
	ld [wSprite06StateData1FacingDirection], a
	call Delay3
	ld a, ~(A_BUTTON | B_BUTTON)
	ld [wJoyIgnore], a
	ld a, $d
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
MtMoon3Script12:
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, MtMoon3JessieJamesEndBattleText
	ld de, MtMoon3JessieJamesEndBattleText
	call SaveEndBattleTextPointers
	ld a, OPP_JESSIE_JAMES
	ld [wCurOpponent], a
	ld a, 1
	ld [wTrainerNo], a
	xor a
	ldh [hJoyHeld], a
	ld [wJoyIgnore], a
	ld a, 1
	ld [wIsTrainerBattle], a
	SetEvent EVENT_57E
	ld a, $d
	call MtMoon3Script_49ce5
	ret

MtMoon3Script13:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wIsInBattle]
	cp $ff
	jp z, MtMoon3Script_49cd7
	ld a, $2
	ld [wSprite02StateData1MovementStatus], a
	ld [wSprite06StateData1MovementStatus], a
	xor a
	ld [wSprite02StateData1FacingDirection], a
	ld [wSprite06StateData1FacingDirection], a
	ld a, ~(A_BUTTON | B_BUTTON)
	ld [wJoyIgnore], a
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, $e
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call StopMusic
	ld c, 0 ; BANK(Music_MeetJessieJames)
	ld a, MUSIC_MEET_JESSIE_JAMES
	call PlayMusic
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $e
	call MtMoon3Script_49ce5
	ret

MtMoon3Script14:
	ld a, $ff
	ld [wJoyIgnore], a
	call GBFadeOutToBlack
	ld a, HS_MT_MOON_B2F_JESSIE
	call MtMoon3Script_49f93
	ld a, HS_MT_MOON_B2F_JAMES
	call MtMoon3Script_49f93
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	ld a, $f
	call MtMoon3Script_49ce5
	ret

MtMoon3Script15:
	call PlayDefaultMusic
	xor a
	ldh [hJoyHeld], a
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_MT_MOON_3_TRAINER_0
	ResetEventReuseHL EVENT_57E
	ld a, $0
	call MtMoon3Script_49ce5
	ret

MtMoon3Script_49f84:
	ld [wMissableObjectIndex], a
	predef ShowObject
	call UpdateSprites
	call Delay3
	ret

MtMoon3Script_49f93:
	ld [wMissableObjectIndex], a
	predef HideObject
	ret

MtMoonB2F_TextPointers:
	dw MtMoon3Text1
	dw MtMoon3Text2
	dw MtMoon3Text3
	dw MtMoon3Text4
	dw MtMoon3Text5
	dw MtMoon3Text6
	dw MtMoon3Text7
	dw MtMoon3Text8
	dw PickUpItemText
	dw PickUpItemText
	dw MtMoon3Text11
	dw MtMoon3Text12
	dw MtMoon3Text13
	dw MtMoon3Text14

MtMoon3TrainerHeaders:
	def_trainers 3
MtMoon3TrainerHeader0:
	trainer EVENT_BEAT_MT_MOON_3_TRAINER_1, 4, MtMoon3BattleText3, MtMoon3EndBattleText3, MtMoon3AfterBattleText3
MtMoon3TrainerHeader1:
	trainer EVENT_BEAT_MT_MOON_3_TRAINER_2, 4, MtMoon3BattleText4, MtMoon3EndBattleText4, MtMoon3AfterBattleText4
MtMoon3TrainerHeader2:
	trainer EVENT_BEAT_MT_MOON_3_TRAINER_3, 4, MtMoon3BattleText5, MtMoon3EndBattleText5, MtMoon3AfterBattleText5
	db -1 ; end

MtMoon3Text2:
MtMoon3Text6:
	text_end

MtMoon3Text12:
	text_far _MtMoonJessieJamesText1
	text_asm
	ld c, 10
	call DelayFrames
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld a, $0
	ld [wEmotionBubbleSpriteIndex], a
	ld a, EXCLAMATION_BUBBLE
	ld [wWhichEmotionBubble], a
	predef EmotionBubble
	ld c, 20
	call DelayFrames
	jp TextScriptEnd

MtMoon3Text13:
	text_far _MtMoonJessieJamesText2
	text_end

MtMoon3JessieJamesEndBattleText:
	text_far _MtMoonJessieJamesText3
	text_end

MtMoon3Text14:
	text_far _MtMoonJessieJamesText4
	text_asm
	ld c, 64
	call DelayFrames
	jp TextScriptEnd

MtMoon3Text1:
	text_asm
	CheckEvent EVENT_BEAT_MT_MOON_EXIT_SUPER_NERD
	jr z, .asm_4a02f
	; CheckEitherEventSetReuseA EVENT_GOT_DOME_FOSSIL, EVENT_GOT_HELIX_FOSSIL
	and (1 << (EVENT_GOT_DOME_FOSSIL % 8)) | (1 << (EVENT_GOT_HELIX_FOSSIL % 8))
	jr nz, .asm_4a057
	ld hl, MtMoon3Text_4a116
	call PrintText
	jr .asm_4a05d

.asm_4a02f
	ld hl, MtMoon3Text_4a10c
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, MtMoon3SuperNerdEndBattleText
	ld de, MtMoon3SuperNerdEndBattleText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $3
	call MtMoon3Script_49ce5
	jr .asm_4a05d

.asm_4a057
	ld hl, MtMoon3Text_4a11b
	call PrintText
.asm_4a05d
	jp TextScriptEnd

MtMoon3Text3:
	text_asm
	ld hl, MtMoon3TrainerHeader0
	jr MtMoon3TalkToTrainer

MtMoon3Text4:
	text_asm
	ld hl, MtMoon3TrainerHeader1
	jr MtMoon3TalkToTrainer


MtMoon3Text5:
	text_asm
	ld hl, MtMoon3TrainerHeader2
MtMoon3TalkToTrainer:
	call TalkToTrainer
	jp TextScriptEnd

MtMoon3Text7:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, MtMoon3Text_4a0ae
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_4a0ab
	lb bc, DOME_FOSSIL, 1
	call GiveItem
	jp nc, MtMoon3Script_4a0fd
	call MtMoon3Script_4a0f0
	ld a, HS_MT_MOON_B2F_FOSSIL_1
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvent EVENT_GOT_DOME_FOSSIL
	ld a, $4
	call MtMoon3Script_49ce5
.asm_4a0ab
	jp TextScriptEnd

MtMoon3Text_4a0ae:
	text_far _MtMoon3Text_49f24
	text_end

MtMoon3Text8:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, MtMoon3Text_4a0eb
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_4a0e8
	lb bc, HELIX_FOSSIL, 1
	call GiveItem
	jp nc, MtMoon3Script_4a0fd
	call MtMoon3Script_4a0f0
	ld a, HS_MT_MOON_B2F_FOSSIL_2
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvent EVENT_GOT_HELIX_FOSSIL
	ld a, $4
	call MtMoon3Script_49ce5
.asm_4a0e8
	jp TextScriptEnd

MtMoon3Text_4a0eb:
	text_far _MtMoon3Text_49f64
	text_end

MtMoon3Script_4a0f0:
	ld hl, MtMoon3Text_4a0f6
	jp PrintText

MtMoon3Text_4a0f6:
	text_far _MtMoon3Text_49f6f
	sound_get_key_item
	text_waitbutton
	text_end

MtMoon3Script_4a0fd:
	ld hl, MtMoon3Text_4a106
	call PrintText
	jp TextScriptEnd

MtMoon3Text_4a106:
	text_far _MtMoon3Text_49f7f
	text_waitbutton
	text_end

MtMoon3Text_4a10c:
	text_far _MtMoon3Text_49f85
	text_end

MtMoon3SuperNerdEndBattleText:
	text_far _MtMoon3Text_49f8a
	text_end

MtMoon3Text_4a116:
	text_far _MtMoon3Text_49f8f
	text_end

MtMoon3Text_4a11b:
	text_far _MtMoon3Text_49f94
	text_end

MtMoon3Text11:
	text_far _MtMoon3Text_49f99
	sound_get_key_item
	text_end

MtMoon3BattleText3:
	text_far _MtMoon3BattleText3
	text_end

MtMoon3EndBattleText3:
	text_far _MtMoon3EndBattleText3
	text_end

MtMoon3AfterBattleText3:
	text_far _MtMoon3AfterBattleText3
	text_end

MtMoon3BattleText4:
	text_far _MtMoon3BattleText4
	text_end

MtMoon3EndBattleText4:
	text_far _MtMoon3EndBattleText4
	text_end

MtMoon3AfterBattleText4:
	text_far _MtMoon3AfterBattleText4
	text_end

MtMoon3BattleText5:
	text_far _MtMoon3BattleText5
	text_end

MtMoon3EndBattleText5:
	text_far _MtMoon3EndBattleText5
	text_end

MtMoon3AfterBattleText5:
	text_far _MtMoon3AfterBattleText5
	text_end