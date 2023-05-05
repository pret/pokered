RocketHideoutB4F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideout4TrainerHeaders
	ld de, RocketHideoutB4F_ScriptPointers
	ld a, [wRocketHideoutB4FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRocketHideoutB4FCurScript], a
	ret

RocketHideout4Script_45510:
	CheckAndResetEvent EVENT_6A0
	call nz, RocketHideout4Script_45525
	xor a
	ld [wJoyIgnore], a
RocketHideout4Script_4551e:
	ld [wRocketHideoutB4FCurScript], a
	ld [wCurMapScript], a
	ret

RocketHideout4Script_45525:
	ld a, HS_ROCKET_HIDEOUT_B4F_JAMES
	call RocketHideout4Script_45756
	ld a, HS_ROCKET_HIDEOUT_B4F_JESSIE
	call RocketHideout4Script_45756
	ret

RocketHideoutB4F_ScriptPointers:
	dw RocketHideout4Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw RocketHideout4Script3
	dw RocketHideout4Script4
	dw RocketHideout4Script5
	dw RocketHideout4Script6
	dw RocketHideout4Script7
	dw RocketHideout4Script8
	dw RocketHideout4Script9
	dw RocketHideout4Script10
	dw RocketHideout4Script11
	dw RocketHideout4Script12
	dw RocketHideout4Script13

RocketHideout4Script3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, RocketHideout4Script_45510
	ld a, $fc
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	ld a, $a
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	call GBFadeOutToBlack
	ld a, HS_ROCKET_HIDEOUT_B4F_GIOVANNI
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_ROCKET_HIDEOUT_B4F_ITEM_4
	ld [wMissableObjectIndex], a
	predef ShowObject
	call UpdateSprites
	call GBFadeInFromBlack
	xor a
	ld [wJoyIgnore], a
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ld a, $0
	ld [wRocketHideoutB4FCurScript], a
	ld [wCurMapScript], a
	ret

RocketHideout4Script0:
IF DEF(_DEBUG)
	call DebugPressedOrHeldB
	ret nz
ENDC
	CheckEvent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_0
	call z, RocketHideout4Script_455a5
	CheckEvent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_2
	call z, CheckFightingMapTrainers
	ret

RocketHideout4Script_455a5:
	ld a, [wYCoord]
	cp $e
	ret nz
	ResetEvent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_1
	ld a, [wXCoord]
	cp $18
	jr z, .asm_455c2
	ld a, [wXCoord]
	cp $19
	ret nz
	SetEvent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_1
.asm_455c2
	xor a
	ldh [hJoyHeld], a
	ld a, $fc
	ld [wJoyIgnore], a
	call StopMusic
	ld c, 0 ; BANK(Music_MeetJessieJames)
	ld a, MUSIC_MEET_JESSIE_JAMES
	call PlayMusic
	call UpdateSprites
	call Delay3
	call UpdateSprites
	call Delay3
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, $b
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, HS_ROCKET_HIDEOUT_B4F_JAMES
	call RocketHideout4Script_45747
	ld a, HS_ROCKET_HIDEOUT_B4F_JESSIE
	call RocketHideout4Script_45747
	ld a, $4
	call RocketHideout4Script_4551e
	ret

RocketHideout4JessieJamesMovementData_45605:
	db $4
RocketHideout4JessieJamesMovementData_45606:
	db $4
	db $4
	db $4
	db $ff

RocketHideout4Script4:
	ld de, RocketHideout4JessieJamesMovementData_45605
	CheckEvent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_1
	jr z, .asm_45617
	ld de, RocketHideout4JessieJamesMovementData_45606
.asm_45617
	ld a, $2
	ldh [hSpriteIndexOrTextID], a
	call MoveSprite
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $5
	call RocketHideout4Script_4551e
	ret

RocketHideout4Script5:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wd730]
	bit 0, a
	ret nz
RocketHideout4Script6:
	ld a, $2
	ld [wSprite02StateData1MovementStatus], a
	ld a, SPRITE_FACING_LEFT
	ld [wSprite02StateData1FacingDirection], a
	CheckEvent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_1
	jr z, .asm_4564a
	ld a, SPRITE_FACING_DOWN
	ld [wSprite02StateData1FacingDirection], a
.asm_4564a
	call Delay3
	ld a, $fc
	ld [wJoyIgnore], a
RocketHideout4Script7:
	ld de, RocketHideout4JessieJamesMovementData_45606
	CheckEvent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_1
	jr z, .asm_4565f
	ld de, RocketHideout4JessieJamesMovementData_45605
.asm_4565f
	ld a, $3
	ldh [hSpriteIndexOrTextID], a
	call MoveSprite
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $8
	call RocketHideout4Script_4551e
	ret

RocketHideout4Script8:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, $fc
	ld [wJoyIgnore], a
RocketHideout4Script9:
	ld a, $2
	ld [wSprite03StateData1MovementStatus], a
	ld a, SPRITE_FACING_DOWN
	ld [wSprite03StateData1FacingDirection], a
	CheckEvent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_1
	jr z, .asm_45697
	ld a, SPRITE_FACING_RIGHT
	ld [wSprite03StateData1FacingDirection], a
.asm_45697
	call Delay3
	ld a, $c
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
RocketHideout4Script10:
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	call Delay3
	ld hl, RocketHideout4JessieJamesEndBattleText
	ld de, RocketHideout4JessieJamesEndBattleText
	call SaveEndBattleTextPointers
	ld a, OPP_JESSIE_JAMES
	ld [wCurOpponent], a
	ld a, 2
	ld [wTrainerNo], a
	ld [wIsTrainerBattle], a
	xor a
	ldh [hJoyHeld], a
	ld [wJoyIgnore], a
	SetEvent EVENT_6A0
	ld a, $b
	call RocketHideout4Script_4551e
	ret

RocketHideout4Script11:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, [wIsInBattle]
	cp $ff
	jp z, RocketHideout4Script_45510
	ld a, $2
	ld [wSprite02StateData1MovementStatus], a
	ld [wSprite03StateData1MovementStatus], a
	xor a
	ld [wSprite02StateData1FacingDirection], a
	ld [wSprite03StateData1FacingDirection], a
	ld a, $fc
	ld [wJoyIgnore], a
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, $d
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	call StopMusic
	ld c, BANK(Music_MeetJessieJames)
	ld a, MUSIC_MEET_JESSIE_JAMES
	call PlayMusic
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $c
	call RocketHideout4Script_4551e
	ret

RocketHideout4Script12:
	ld a, $ff
	ld [wJoyIgnore], a
	call GBFadeOutToBlack
	ld a, HS_ROCKET_HIDEOUT_B4F_JAMES
	call RocketHideout4Script_45756
	ld a, HS_ROCKET_HIDEOUT_B4F_JESSIE
	call RocketHideout4Script_45756
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	ld a, $d
	call RocketHideout4Script_4551e
	ret

RocketHideout4Script13:
	call PlayDefaultMusic
	xor a
	ldh [hJoyHeld], a
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_0
	ld a, $0
	call RocketHideout4Script_4551e
	ret

RocketHideout4Script_45747:
	ld [wMissableObjectIndex], a
	predef ShowObject
	call UpdateSprites
	call Delay3
	ret

RocketHideout4Script_45756:
	ld [wMissableObjectIndex], a
	predef HideObject
	ret

RocketHideoutB4F_TextPointers:
	dw RocketHideout4Text0
	dw RocketHideout4Text1
	dw RocketHideout4Text2
	dw RocketHideout4Text3
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw RocketHideout4Text9
	dw RocketHideout4Text10
	dw RocketHideout4Text11
	dw RocketHideout4Text12

RocketHideout4TrainerHeaders:
	def_trainers 4
RocketHideout4TrainerHeader0:
	trainer EVENT_BEAT_ROCKET_HIDEOUT_4_TRAINER_2, 1, RocketHideout4Trainer0BeforeText, RocketHideout4Trainer0EndBattleText, RocketHideout4Trainer0AfterText
	db -1 ; end

RocketHideout4Text1:
RocketHideout4Text2:
	text_end

RocketHideout4Text10:
	text_far _RocketHideoutJessieJamesText1
	text_asm
	ld c, 10
	call DelayFrames
	ld a, $8
	ld [wPlayerMovingDirection], a
	ld a, $0
	ld [wEmotionBubbleSpriteIndex], a
	ld a, EXCLAMATION_BUBBLE
	ld [wWhichEmotionBubble], a
	predef EmotionBubble
	ld c, 20
	call DelayFrames
	jp TextScriptEnd

RocketHideout4Text11:
	text_far _RocketHideoutJessieJamesText2
	text_end

RocketHideout4JessieJamesEndBattleText:
	text_far _RocketHideoutJessieJamesText3
	text_end

RocketHideout4Text12:
	text_far _RocketHideoutJessieJamesText4
	text_asm
	ld c, 64
	call DelayFrames
	jp TextScriptEnd

RocketHideout4Text0:
	text_asm
	CheckEvent EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	jp nz, .asm_457fb
	ld c, 0 ; BANK(Music_Sakaki)
	ld a, MUSIC_SAKAKI
	call PlayMusic
	ld hl, RocketHideout4Text_45804
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, RocketHideout4Text_45809
	ld de, RocketHideout4Text_45809
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ldh [hJoyHeld], a
	ld a, $3
	ld [wRocketHideoutB4FCurScript], a
	ld [wCurMapScript], a
	jr .asm_45801

.asm_457fb
	ld hl, RocketHideout4Text9
	call PrintText
.asm_45801
	jp TextScriptEnd

RocketHideout4Text_45804:
	text_far _RocketHideout4Text_4557a
	text_end

RocketHideout4Text_45809:
	text_far _RocketHideout4Text_4557f
	text_end

RocketHideout4Text9:
	text_far _RocketHideout4Text_45584
	text_end

RocketHideout4Text3:
	text_asm
	ld hl, RocketHideout4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RocketHideout4Trainer0BeforeText:
	text_far _RocketHideout4BattleText4
	text_end

RocketHideout4Trainer0EndBattleText:
	text_far _RocketHideout4EndBattleText4
	text_promptbutton
	text_asm
	SetEvent EVENT_ROCKET_DROPPED_LIFT_KEY
	ld a, HS_ROCKET_HIDEOUT_B4F_ITEM_5
	ld [wMissableObjectIndex], a
	predef ShowObject
	jp TextScriptEnd

RocketHideout4Trainer0AfterText:
	text_asm
	ld hl, RocketHideout4Text_45844
	call PrintText
	jp TextScriptEnd

RocketHideout4Text_45844:
	text_far _RocketHideout4Text_455ec
	text_end