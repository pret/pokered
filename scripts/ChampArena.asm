; PureRGBnote: ADDED: new postgame rematch area, with waaaay too much script code

ChampArena_Script:
	call CheckResetDoorEvent
	call ChampArenaCheckBattleComplete
	call ChampArenaWaitForPlayerWalkToFinish
	call ChampArenaWaitForOpponentWalkToFinish
	call ChampArenaCheckOpenDoor
	jp EnableAutoTextBoxDrawing

ChampArena_TextPointers:
	def_text_pointers
	dw_const ChampArenaIntroText,           TEXT_CHAMP_ARENA_INTRO
	dw_const ChampArenaStartBattleText,     TEXT_CHAMP_ARENA_START_BATTLE
	dw_const ChampArenaAssistantText,       TEXT_CHAMP_ARENA_ASSISTANT
	dw_const ChampArenaEndBattleText,       TEXT_CHAMP_ARENA_END_BATTLE
	dw_const ChampArenaContinueText,        TEXT_CHAMP_ARENA_CONTINUE

InitNewArenaCutscene:
	CheckEvent EVENT_ARENA_ALL_CHALLENGERS_DEFEATED
	jr nz, .alreadySetChampChallenger
	ld hl, wEventFlags + CHAMP_ARENA_BATTLE_EVENTS_START / 8
	ld b, CHAMP_ARENA_BATTLE_EVENTS_END - CHAMP_ARENA_BATTLE_EVENTS_START
	call CountSetExactNumberBits
	ld [wChampArenaChallenger], a
.alreadySetChampChallenger
	; show the crowd and challengers
	ld hl, HideShowArenaSprites
	call ArenaShowAllhl
	; make the challenger sprite the correct challenger
	call ReloadChallengerSprite
	call LoadAssistantCutsceneSprites
	call ReloadVariableCrowd
	; hide the player's sprite so that we can make the camera stay in the center of the screen but have a proxy player walking around
	SetFlag FLAG_HIDE_PLAYER_SPRITE
	; move the assistant to the top middle of the arena
	ld a, 11 ; x = 7 + 4 (MapX offset)
	ld [wSprite03StateData2MapX], a
	dec a ; x = 6 + 4 (MapY offset)
	ld [wSprite03StateData2MapY], a
	ld a, 28 ; y pixels (28 pixels from top of screen)
	ld [wSprite03StateData1YPixels], a
	ld a, 64 ; x pixels (64 pixels from left of screen)
	ld [wSprite03StateData1XPixels], a
	ld a, SPRITE_FACING_DOWN
  	ldh [hSpriteFacingDirection], a
	ld a, CHAMP_ARENA_ASSISTANT
	ldh [hSpriteIndex], a
  	call SetSpriteFacingDirection
	call UpdateSprites
	jp Delay3

ChampArenaWaitForPlayerWalkToFinish:
	CheckEvent EVENT_ARENA_PLAYER_WALKING
	ret z
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz
	ResetEvent EVENT_ARENA_PLAYER_WALKING
	call GBFadeOutToWhite
	call InitNewArenaCutscene
	call GBFadeInFromWhite
	jp ChampArenaStartIntroScript

ArenaHideAllhl:
.loop
	ld a, [hli]
	cp -1
	jr z, .gymGuideCheck
	ld [wMissableObjectIndex], a
	push hl
	predef HideExtraObject
	pop hl
	jr .loop
.gymGuideCheck
	ld a, HS_CHAMP_ARENA_TM_KID
	ld [wMissableObjectIndex], a
	predef_jump HideExtraObject

ArenaShowAllhl:
.loop
	ld a, [hli]
	cp -1
	jr z, .gymGuideCheck
	ld [wMissableObjectIndex], a
	push hl
	predef ShowExtraObject
	pop hl
	jr .loop
.gymGuideCheck
	ld a, [wChampArenaChallenger]
	cp 11 ; gym guide
	ret nz
	ld a, HS_CHAMP_ARENA_CROWD_4 ; in the case of the gym guide since there are 2 challengers we can't have a full crowd on screen at once
	ld [wMissableObjectIndex], a
	predef_jump HideExtraObject

HideShowArenaSprites:
	db HS_CHAMP_ARENA_CHALLENGER 
	db HS_CHAMP_ARENA_PROXY_PLAYER 
	db HS_CHAMP_ARENA_CROWD_1 
	db HS_CHAMP_ARENA_CROWD_2 
	db HS_CHAMP_ARENA_VARIABLE_CROWD_1
	db HS_CHAMP_ARENA_VARIABLE_CROWD_2
	db HS_CHAMP_ARENA_CROWD_3
	db HS_CHAMP_ARENA_VARIABLE_CROWD_3
	db HS_CHAMP_ARENA_CROWD_4
	db -1

ChampArenaStartIntroScript:
	; start the battle text
	ld a, TEXT_CHAMP_ARENA_INTRO
	ldh [hTextID], a
	call DisplayTextID
ChampArenaStartNewBattle:
	SetEvent EVENT_ARENA_OPPONENT_WALKING
	ld a, [wChampArenaChallenger]
	cp 12 ; rival
	jr nz, .notRival
	ld c, BANK(Music_MeetRival)
	ld hl, Music_MeetRival
	call PlaySpecialFieldMusic3 ; we play it this way so it's playing off of audio engine 3 so we can play crowd sound effects from engine 3
.notRival
	; make opponent walk in
	ld de, OpponentWalksUp
	ld a, CHAMP_ARENA_CHALLENGER
	ldh [hSpriteIndex], a
	call MoveSprite
	jp OpenDoor

OpponentWalksUp:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1

ChampArenaWaitForOpponentWalkToFinish:
	CheckEvent EVENT_ARENA_OPPONENT_WALKING
	ret z
	call CheckOpponentOpenCloseDoor
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz

	ResetEvent EVENT_ARENA_OPPONENT_WALKING
	xor a
	ld [wJoyIgnore], a

	; check if they were leaving or entering
	ld a, [wSprite02StateData2MapY]
	cp 12 ; y = 8 (+4 MapY offset)
	jr z, .entering
	ld a, HS_CHAMP_ARENA_CHALLENGER
	ld [wMissableObjectIndex], a
	predef HideExtraObject ; hide the challenger to make it look like they left
	call CloseDoor
	; they were leaving, ask the player if they want to continue battling
	ld a, TEXT_CHAMP_ARENA_CONTINUE
	ldh [hTextID], a
	call DisplayTextID
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .doneBattling
	; otherwise continue
	call GBFadeOutToWhite
	callfar FarHeal
	call InitNewArenaCutscene
	call GBFadeInFromWhite
	; display text for the new battle intro
	jr ChampArenaStartNewBattle
.doneBattling
	xor a
	ld [wCurrentMenuItem], a
	call GBFadeOutToBlack
	call ChampArenaHideNPCs
	; move assistant back to original spot
	ld a, 12 ; (x = 8) (plus the 4 MapX offset)
	ld [wSprite03StateData2MapX], a
	ld [wSprite03StateData1YPixels], a ; this is apparently the correct y pixel amount too (12)
	ld a, 9 ; (y = 5) (plus the 4 MapY offset)
	ld [wSprite03StateData2MapY], a
	ld a, 80
	ld [wSprite03StateData1XPixels], a
	call UpdateSprites
	call LoadAssistantNormalSprites
	jp GBFadeInFromBlack
.entering
	ld a, CHAMP_ARENA_CHALLENGER
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_RIGHT
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
	ld a, RIGHT
	ld [wMapSpriteData + 2], a ; second sprite's movement 2 byte
	ld a, [wChampArenaChallenger]
	cp 11 ; gym guide
	jr nz, .noTMKid
	ld a, HS_CHAMP_ARENA_TM_KID
	ld [wMissableObjectIndex], a
	predef ShowExtraObject
	; make TM kid appear to walk down a step
	xor a ; down
	call TMKidWalks
.noTMKid
	; start the battle text
	ld a, TEXT_CHAMP_ARENA_START_BATTLE
	ldh [hTextID], a
	call DisplayTextID
	; choose music?
	; make opponent and player move to their positions?
	; variable audience might talk to player?
	SetEvent EVENT_ARENA_BATTLE_INITIATED
	ret

CheckOpponentOpenCloseDoor:	
	ld a, [wSprite02StateData2MapY]
	cp 14 ; (y = 10) (+4 MapY offset)
	jr z, .aboveDoorUp
	cp 16 ; (y = 12) (+4 MapY offset)
	ret nz
	ld a, [wSprite02StateData1FacingDirection]
	cp SPRITE_FACING_DOWN
	jp z, OpenDoor
	ret
.aboveDoorUp
	ld a, [wSprite02StateData1FacingDirection]
	cp SPRITE_FACING_UP
	jp z, CloseDoor
	ret


ChampArenaCheckBattleComplete:
	CheckEvent EVENT_ARENA_BATTLE_INITIATED
	ret z
	ResetEvent EVENT_ARENA_BATTLE_INITIATED
	ld a, [wIsInBattle]
	cp -1 ; lost battle
	jr z, ChampArenaHideNPCs
	ld a, LEFT
	ld [wMapSpriteData], a ; first sprite's movement 2 byte
	ld a, RIGHT
	ld [wMapSpriteData + 6], a ; fourth sprite's movement 2 byte
	; end battle text
	ld a, TEXT_CHAMP_ARENA_END_BATTLE
	ldh [hTextID], a
	call DisplayTextID
	ld a, [wChampArenaChallenger]
	cp 11 ; gym guide
	jr nz, .noTMKid
	ld a, 1
	call TMKidWalks
	ld a, HS_CHAMP_ARENA_TM_KID
	ld [wMissableObjectIndex], a
	predef HideExtraObject
.noTMKid
	; make the opponent leave
	SetEvent EVENT_ARENA_OPPONENT_WALKING
	ld de, OpponentLeaves
	ld a, CHAMP_ARENA_CHALLENGER
	ldh [hSpriteIndex], a
	jp MoveSprite

ChampArenaHideNPCs:
	ResetFlag FLAG_HIDE_PLAYER_SPRITE
	ld hl, HideShowArenaSprites
	jp ArenaHideAllhl

OpponentLeaves:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1


ChampArenaCheckOpenDoor:
	ld a, [wXCoord]
	cp 7
	ret nz
	ld a, [wYCoord]
	cp 13
	jr z, .facingCheckBelow
	cp 11
	ret nz
.facingCheckAbove
	ld a, [wPlayerMovingDirection]
	cp PLAYER_DIR_DOWN
	jr z, OpenDoor
	cp PLAYER_DIR_UP
	ret nz
	jr CloseDoor
.facingCheckBelow
	ld a, [wPlayerMovingDirection]
	cp PLAYER_DIR_UP
	jr z, OpenDoor
	cp PLAYER_DIR_DOWN
	ret nz
	; close door
CloseDoor:
	CheckEvent EVENT_OPENED_ARENA_DOOR
	ret z
	ResetEvent EVENT_OPENED_ARENA_DOOR
	ld a, $16
	jr OpenDoor.done
OpenDoor:
	CheckEvent EVENT_OPENED_ARENA_DOOR
	ret nz
	SetEvent EVENT_OPENED_ARENA_DOOR
	ld a, $1E
.done
	ld [wNewTileBlockID], a
	ld a, SFX_GO_INSIDE
	rst _PlaySound
	lb bc, 6, 3
	predef_jump ReplaceTileBlock

; puts the remaining number of opponents into w2CharStringBuffer
ChampArenaGetRemainingOpponentCount:
	ld hl, w2CharStringBuffer
	ld a, CHAMP_ARENA_BATTLE_EVENTS_END - CHAMP_ARENA_BATTLE_EVENTS_START
	sub c
	cp 10
	jr c, .lowerThan10
	sub 10
	ld [hl], "１"
	inc hl
.lowerThan10
	add NUMBER_CHAR_OFFSET
	ld [hli], a
	ld [hl], "@"
	ret

ChampArenaAssistantText:
	text_asm
	ld hl, .welcome
	rst _PrintText
	; starts the battle script
	ld hl, wEventFlags + CHAMP_ARENA_BATTLE_EVENTS_START / 8
	ld b, CHAMP_ARENA_BATTLE_EVENTS_END - CHAMP_ARENA_BATTLE_EVENTS_START
	call CountSetExactNumberBits
	; if beat all, do something different
	call ChampArenaGetRemainingOpponentCount
	ld a, [wNumSetBits]
	cp 13 ; none left
	jr z, .noneLeft
	push af
	ld hl, .trainersWaiting
	rst _PrintText
	pop af
	cp 12 ; 12 done, one left
	jr z, .oneLeft
	ld hl, .welcome2
	rst _PrintText
	jr .continue
.oneLeft
	ld hl, .welcome3
	rst _PrintText
	jr .continue
.noneLeft
	SetEvent EVENT_ARENA_ALL_CHALLENGERS_DEFEATED
	ld hl, ChampArenaContinueText.callInChallengers
	rst _PrintText
	ld hl, ChampArenaContinueText.callInChallengers2
	rst _PrintText
.continue
	xor a
	ld [wCurrentMenuItem], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .noChoiceOfChallenger
	CheckEvent EVENT_ARENA_ALL_CHALLENGERS_DEFEATED
	jr z, .noChoiceOfChallenger
	call ShowChampArenaTrainerSelectMenu
	ld a, 1
	jr nz, .loadCurrentMenuItem
	xor a
.loadCurrentMenuItem
	ld [wCurrentMenuItem], a
.noChoiceOfChallenger
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .seeYa
	jr nz, .done
	ld hl, .inviteIn
	rst _PrintText
	SetEvent EVENT_ARENA_PLAYER_WALKING
	; player walks away
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld hl, wSimulatedJoypadStatesEnd
	ld a, [wXCoord]
	ld de, PlayerCenterFieldDirectionsRight
	ld b, 5
	cp 9
	jr z, .loadPlayerDirections
	ld b, 3
	cp 8
	jr z, .loadPlayerDirections
	ld de, PlayerCenterFieldDirectionsLeft
.loadPlayerDirections
	ld a, b
	ld [wSimulatedJoypadStatesIndex], a
.loop
	ld a, [de]
	cp -1
	jr z, .done2
	ld [hli], a
	inc de
	jr .loop
.done
	rst _PrintText
.done2
	rst TextScriptEnd
.welcome
	text_far _ChampArenaAssistantWelcome
	text_end
.trainersWaiting
	text_far _ChampArenaAssistantTrainersWaitingToBattle
	text_end
.welcome2
	text_far _ChampArenaAssistantWelcome2
	text_end
.welcome3
	text_far _ChampArenaAssistantWelcome3
	text_end	
.seeYa
	text_far _ChampArenaAssistantSeeYa
	text_end
.inviteIn
	text_far _ChampArenaAssistantInviteIn
	text_end

PlayerCenterFieldDirectionsLeft:
	db D_DOWN
PlayerCenterFieldDirectionsRight:
	db D_DOWN
	db D_DOWN
	db D_LEFT
	db D_LEFT
	db D_DOWN
	db -1

ChampArenaIntroText:
	text_asm
	ld hl, .welcomeAudience
	rst _PrintText
	; audience reaction
	rst TextScriptEnd
.welcomeAudience
	text_far _ChampArenaAssistantStartBattle
	text_end

ChampArenaContinueText:
	text_asm
	ld hl, wEventFlags + CHAMP_ARENA_BATTLE_EVENTS_START / 8
	ld b, CHAMP_ARENA_BATTLE_EVENTS_END - CHAMP_ARENA_BATTLE_EVENTS_START
	call CountSetExactNumberBits
	; if beaten all, do something different
	call ChampArenaGetRemainingOpponentCount
	ld a, [wNumSetBits]
	cp 13 ; none left
	jr z, .noneLeft
	push af
	ld hl, .stillOpponentsLeft
	rst _PrintText
	pop af
	cp 12 ; 12 done, one left
	jr z, .oneLeft
	ld hl, .stillOpponentsLeft2
	rst _PrintText
	jr .continue
.oneLeft
	ld hl, .stillOpponentsLeft3
	rst _PrintText
	jr .continue
.noneLeft
	CheckEvent EVENT_ARENA_ALL_CHALLENGERS_DEFEATED
	jr nz, .knowsDefeatedAll
	SetEvent EVENT_ARENA_ALL_CHALLENGERS_DEFEATED
	ld hl, .defeatedAllTrainers
	rst _PrintText
	ld hl, .callInChallengers
	rst _PrintText
.knowsDefeatedAll
	ld hl, .callInChallengers2
	rst _PrintText
.continue
	xor a
	ld [wCurrentMenuItem], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .notAllDefeated
	CheckEvent EVENT_ARENA_ALL_CHALLENGERS_DEFEATED
	jr z, .notAllDefeated
	call ShowChampArenaTrainerSelectMenu
	ld a, 1
	jr nz, .loadCurrentMenuItem
	xor a
.loadCurrentMenuItem
	ld [wCurrentMenuItem], a
.notAllDefeated
	ld a, [wCurrentMenuItem]
	and a
	ld hl, ChampArenaAssistantText.inviteIn
	jr z, .done
	ld hl, ChampArenaAssistantText.seeYa
.done
	rst _PrintText
	rst TextScriptEnd
.stillOpponentsLeft
	text_far _ChampArenaAssistantStillOpponentsLeft
	text_end
.stillOpponentsLeft2
	text_far _ChampArenaAssistantStillOpponentsLeft2
	text_end
.stillOpponentsLeft3
	text_far _ChampArenaAssistantStillOpponentsLeft3
	text_end
.defeatedAllTrainers
	text_far _ChampArenaAssistantDefeatedAllTrainers
	sound_get_item_2
	text_promptbutton
	text_end
.callInChallengers
	text_far _ChampArenaAssistantCallInChallengers
	text_end
.callInChallengers2
	text_far _ChampArenaAssistantCallInChallengers2
	text_end

ReloadChallengerSprite:
	ld a, [wChampArenaChallenger]
	ld hl, wSpriteOptions2
	add a ; 2 data entries per sprite (OG+ sprite and OG sprite)
	bit BIT_MENU_ICON_SPRITES, [hl]
	jr nz, .noIncrement
	inc a ; use the original sprite if menu icon sprites turned off
.noIncrement
	add a ; multiply by 2
	add a ; multiply by 2 again (4 bytes per sprite data entry)
	ld hl, OpponentSpriteArray
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	cp -1
	jr nz, .useSprite
	; if we're here we're trying to use a "non-remapped" sprite for one that doesn't have a remapped sprite so go back a sprite data entry
	dec hl
	dec hl
	dec hl
	dec hl
.useSprite
	ld a, [hli]
	ld e, a
	ld a, [hli] ; address of sprite that will replace's data
	ld d, a
	ld a, [hli]
	ld b, a ; bank of sprite that will replace
	; hl now pointing to the sprite ID that we will use later
	ld c, 12 ; number of tiles to replace
	push hl
	push de
	push bc
	ld hl, vChars0 tile 24 ; replace 2nd sprite's standing tiles
	call CopyVideoData
	pop bc
	pop de
	ld hl, LEN_2BPP_TILE * 12 ; 12 tiles
	add hl, de ; make hl now pointing to the walking tile data of the sprite that will replace's data
	ld d, h
	ld e, l
	ld hl, vChars1 tile 24 ; replace 2nd sprite's walking tiles
	call CopyVideoData
	pop hl
	ld a, [hl]
	ld [wSprite02StateData1PictureID], a
	ld [wMapSpriteOriginalPictureIDs+1], a
	ret

;OpponentTrainerDataArray1:
;	db OPP_ERIKA, 2     dw 
;	db OPP_BLAINE, 2

MACRO sprite_data
	IF \2 < 0
	db -1, -1, -1, -1
	ELSE 
	dw \1
	db BANK(\1), \2
	ENDC
ENDM

OpponentSpriteArray:
	sprite_data ErikaSprite,          SPRITE_ERIKA
	sprite_data SilphWorkerFSprite,   SPRITE_SILPH_WORKER_F
	sprite_data BlaineSprite,         SPRITE_BLAINE
	sprite_data MiddleAgedManSprite,  SPRITE_MIDDLE_AGED_MAN
	sprite_data LtSurgeSprite,        SPRITE_LT_SURGE
	sprite_data RockerSprite,         SPRITE_ROCKER
	sprite_data SabrinaSprite,        SPRITE_SABRINA
	sprite_data GirlSprite,           SPRITE_GIRL
	sprite_data BrunoSprite,          SPRITE_BRUNO
	sprite_data -1,                   -1
	sprite_data MistySprite,          SPRITE_MISTY
	sprite_data BrunetteGirlSprite,   SPRITE_BRUNETTE_GIRL
	sprite_data LanceSprite,          SPRITE_LANCE
	sprite_data -1,                   -1
	sprite_data KogaSprite,           SPRITE_KOGA
	sprite_data -1,                   -1
	sprite_data LoreleiSprite,        SPRITE_LORELEI
	sprite_data -1,                   -1
	sprite_data BrockSprite,          SPRITE_BROCK
	sprite_data SuperNerdSprite,      SPRITE_SUPER_NERD
	sprite_data AgathaSprite,         SPRITE_AGATHA
	sprite_data -1,                   -1
	sprite_data GymGuideSprite,       SPRITE_GYM_GUIDE
	sprite_data -1,                   -1
	sprite_data BlueSprite,           SPRITE_BLUE
	sprite_data -1,                   -1

ChampArenaStartBattleText:
	text_asm
	call AssistantHoldsUpLeftHand
	ld a, [wChampArenaChallenger]
	ld hl, OpponentIntroductionTextArray
	ld de, .return
	push de
	call GetAddressFromPointerArray
	jp hl
.return
	push hl
	; make the assistant bow
	call AssistantBows
	call UpdateSprites
	ld c, 10
	rst _DelayFrames
	call AssistantFacesDown
	ld hl, .battlePositions
	rst _PrintText
	; move player and challenger to battle positions instantly for effect
	call GBPalWhiteOut
	ld a, 14 ; (x = 10) (+4 MapX Offset)
	ld [wSprite01StateData2MapX], a
	ld a, 112 ; (112 pixels from left of screen)
	ld [wSprite01StateData1XPixels], a
	ld a, 8 ; (x = 4) (+4 MapX Offset)
	ld [wSprite02StateData2MapX], a
	ld [wSprite04StateData2MapX], a ; tm kid if showing
	ld a, 16 ; (16 pixels from left of screen)
	ld [wSprite02StateData1XPixels], a
	ld [wSprite04StateData1XPixels], a ; tm kid if showing
	call UpdateSprites
	ld a, SFX_TELEPORT_ENTER_2
	rst _PlaySound
	call Delay3
	call GBPalNormal
	ld a, [wSprite07StateData1PictureID]
	cp SPRITE_MOM_SITTING
	jr nz, .momDadNotInCrowd
	; if mom is in the crowd, make her talk call out to the player
	ld c, 30
	rst _DelayFrames ; delay frames so it's a bit easier to tell what is going on
	CheckEvent EVENT_MET_DAD
	lb bc, HEART_BUBBLE, CHAMP_ARENA_VARIABLE_CROWD1
	ld hl, .momCheersOn
	jr z, .momOrDadCheers
	call Random
	bit 0, a ; 50% chance of dad cheering instead of mom if you met him in bills garden
	jr z, .momOrDadCheers
	lb bc, SMILE_BUBBLE, CHAMP_ARENA_VARIABLE_CROWD2
	ld hl, .dadCheersOn
.momOrDadCheers
  	push hl
	ld a, c
	ld [wEmotionBubbleSpriteIndex], a
	push af
	ld a, b
  	ld [wWhichEmotionBubble], a
  	call PlayEmotionBubbleSFX
	callfar EmotionBubbleQuick
	pop af
	push af
	call SetSpriteFacingLeft
	pop af
	pop hl
	push af
	rst _PrintText
	pop af
	call SetSpriteFacingDown
.momDadNotInCrowd
	ld hl, .whichMusic
	rst _PrintText
	CheckEvent EVENT_ARENA_ALL_CHALLENGERS_DEFEATED
	jr nz, .chooseMusicFromFullList
	call SaveScreenTilesToBuffer2
	pop hl
	; hl will have which music option menu to use
	ld b, A_BUTTON
	call DisplayMultiChoiceTextBox
	ld a, [wCurrentMenuItem]
	and a
	call nz, ChampArenaGetChosenMusic ; set new music entry
	call LoadScreenTilesFromBuffer2
.letBattleCommence
	ld hl, .battleCommence
	rst _PrintText
	ld a, CHAMP_ARENA_CHALLENGER
	ldh [hSpriteIndex], a ; makes the battle transition show the correct trainer when doing the battle transition animation
	rst TextScriptEnd
.chooseMusicFromFullList
	pop hl
	call ShowChampArenaMusicSelectMenu
	jr .letBattleCommence
.battlePositions
	text_far _ChampArenaAssistantBattlePositions
	text_end
.whichMusic
	text_far _ChampArenaAssistantMusic
	text_end
.battleCommence
	text_far _ChampArenaAssistantBattleCommence
	text_end
.momCheersOn
	text_far _ChampArenaMomCheersPlayerOn
	text_end
.dadCheersOn
	text_far _ChampArenaDadCheersPlayerOn
	text_end

OpponentIntroductionTextArray:
	dw ErikaIntroText
	dw BlaineIntroText
	dw SurgeIntroText
	dw SabrinaIntroText
	dw BrunoIntroText
	dw MistyIntroText
	dw LanceIntroText
	dw KogaIntroText
	dw LoreleiIntroText
	dw BrockIntroText
	dw AgathaIntroText
	dw GymGuideIntroText
	dw BlueIntroText

ChampArenaEndBattleText:
	text_asm
	call LoadAssistantCutsceneSprites
	call AssistantHoldsUpRightHand
	ld hl, .defeated
	rst _PrintText
	call AudienceClaps
	call AssistantFacesDown
	call UpdateSprites
	ld c, 60
	rst _DelayFrames
	; move the proxy player and opponent sprites back to the middle of the battle area
	call GBPalWhiteOut
	ld a, 10 ; (x = 6) (+4 MapX offset)
	ld [wSprite02StateData2MapX], a
	ld [wSprite04StateData2MapX], a ; tm kid if he's showing
	ld a, 12 ; (x = 8) (+4 MapX offset)
	ld [wSprite01StateData2MapX], a
	ld a, 48 ; 48 pixels from the left of the screen
	ld [wSprite02StateData1XPixels], a
	ld [wSprite04StateData1XPixels], a ; tm kid if he's showing
	ld a, 80 ; 48 pixels from the left of the screen
	ld [wSprite01StateData1XPixels], a
	call UpdateSprites
	ld a, SFX_TELEPORT_ENTER_2
	rst _PlaySound
	call Delay3
	call WaitForSoundToFinish
	call GBPalNormal
	; opponent response to having lost (set defeated event)
	ld a, [wChampArenaChallenger]
	ld hl, OpponentDefeatedTextArray
	call GetAddressFromPointerArray
	jp hl
.defeated
	text_far _ChampArenaAssistantDefeatedText
	text_end

OpponentDefeatedTextArray:
	dw ErikaDefeatedText
	dw BlaineDefeatedText
	dw SurgeDefeatedText
	dw SabrinaDefeatedText
	dw BrunoDefeatedText
	dw MistyDefeatedText
	dw LanceDefeatedText
	dw KogaDefeatedText
	dw LoreleiDefeatedText
	dw BrockDefeatedText
	dw AgathaDefeatedText
	dw GymGuideDefeatedText
	dw BlueDefeatedText

ErikaIntroText:
	ld hl, .intro 
	call AssistantPrintIntroText
	ld hl, IntroReactionsErika
	call ProcessIntroReactions
	call AudienceClaps
	ld hl, .intro2
	rst _PrintText
	; TODO: how do you respond?
	ld a, 4
	ld [wGymLeaderNo], a
	ld b, 2
	call GetChampArenaChallengerPartyID
	ld a, OPP_ERIKA
	ld hl, .challengerLost
	ld de, .challengerWon
	call ChampArenaStoreInitBattleData
	ld hl, ChampArenaMusicSelectErika
	ret
.intro
	text_far _ErikaIntroText
	text_end
.intro2
	text_far _ErikaIntroText2
	text_end
.challengerLost
	text_far _ErikaLostText
	text_end
.challengerWon
	text_far _ErikaWonText
	text_end

BlaineIntroText:
	ld hl, .intro 
	call AssistantPrintIntroText
	ld hl, IntroReactionsBlaine
	call ProcessIntroReactions
	call AudienceClaps
	ld hl, .intro2
	rst _PrintText
	; TODO: how do you respond?
	ld a, 7
	ld [wGymLeaderNo], a
	ld b, 2
	call GetChampArenaChallengerPartyID
	ld a, OPP_BLAINE
	ld hl, .challengerLost
	ld de, .challengerWon
	call ChampArenaStoreInitBattleData
	ld hl, ChampArenaMusicSelectBlaine
	ret
.intro
	text_far _BlaineIntroText
	text_end
.intro2
	text_far _BlaineIntroText2
	text_end
.challengerLost
	text_far _BlaineLostText
	text_end
.challengerWon
	text_far _BlaineWonText
	text_end

SurgeIntroText:
	ld hl, .intro 
	call AssistantPrintIntroText
	ld hl, IntroReactionsSurge
	call ProcessIntroReactions
	call AudienceClaps
	ld hl, .intro2
	rst _PrintText
	; TODO: how do you respond?
	ld a, 3
	ld [wGymLeaderNo], a
	ld b, 2
	call GetChampArenaChallengerPartyID
	ld a, OPP_LT_SURGE
	ld hl, .challengerLost
	ld de, .challengerWon
	call ChampArenaStoreInitBattleData
	ld hl, ChampArenaMusicSelectSurge
	ret
.intro
	text_far _SurgeIntroText
	text_end
.intro2
	text_far _SurgeIntroText2
	text_end
.challengerLost
	text_far _SurgeLostText
	text_end
.challengerWon
	text_far _SurgeWonText
	text_end

SabrinaIntroText:
	ld hl, .intro 
	call AssistantPrintIntroText
	ld hl, IntroReactionsSabrina
	call ProcessIntroReactions
	call AudienceClaps
	ld hl, .intro2
	rst _PrintText
	; TODO: how do you respond?
	ld a, 6
	ld [wGymLeaderNo], a
	ld b, 2
	call GetChampArenaChallengerPartyID
	ld a, OPP_SABRINA
	ld hl, .challengerLost
	ld de, .challengerWon
	call ChampArenaStoreInitBattleData
	ld hl, ChampArenaMusicSelectSabrina
	ret
.intro
	text_far _SabrinaIntroText
	text_end
.intro2
	text_far _SabrinaIntroText2
	text_end
.challengerLost
	text_far _SabrinaLostText
	text_end
.challengerWon
	text_far _SabrinaWonText
	text_end

BrunoIntroText:
	ld hl, .intro 
	call AssistantPrintIntroText
	ld hl, IntroReactionsBruno
	call ProcessIntroReactions
	call AudienceClaps
	ld hl, .intro2
	rst _PrintText
	; TODO: how do you respond?
	ld a, 10
	ld [wGymLeaderNo], a
	ld b, 2
	call GetChampArenaChallengerPartyID
	ld a, OPP_BRUNO
	ld hl, .challengerLost
	ld de, .challengerWon
	call ChampArenaStoreInitBattleData
	ld hl, ChampArenaMusicSelectBruno
	ret
.intro
	text_far _BrunoIntroText
	text_end
.intro2
	text_far _BrunoIntroText2
	text_end
.challengerLost
	text_far _BrunoLostText
	text_end
.challengerWon
	text_far _BrunoWonText
	text_end

MistyIntroText:
	ld hl, .intro 
	call AssistantPrintIntroText
	ld hl, IntroReactionsMisty
	call ProcessIntroReactions
	call AudienceClaps
	ld a, CHAMP_ARENA_CHALLENGER
	call SetSpriteFacingUp
	ld hl, .intro2
	rst _PrintText
	ld a, CHAMP_ARENA_CHALLENGER
	call SetSpriteFacingRight
	ld hl, .intro3
	rst _PrintText
	; TODO: how do you respond?
	ld a, 2
	ld [wGymLeaderNo], a
	ld b, a
	call GetChampArenaChallengerPartyID
	ld a, OPP_MISTY
	ld hl, .challengerLost
	ld de, .challengerWon
	call ChampArenaStoreInitBattleData
	ld hl, ChampArenaMusicSelectMisty
	ret
.intro
	text_far _MistyIntroText
	text_end
.intro2
	text_far _MistyIntroText2
	text_end
.intro3
	text_far _MistyIntroText3
	text_end
.challengerLost
	text_far _MistyLostText
	text_end
.challengerWon
	text_far _MistyWonText
	text_end

LanceIntroText:
	ld hl, .intro 
	call AssistantPrintIntroText
	ld hl, IntroReactionsLance
	call ProcessIntroReactions
	call AudienceClaps
	ld hl, .intro2
	rst _PrintText
	; TODO: how do you respond?
	ld a, 12
	ld [wGymLeaderNo], a
	ld b, 2
	call GetChampArenaChallengerPartyID
	ld a, OPP_LANCE
	ld hl, .challengerLost
	ld de, .challengerWon
	call ChampArenaStoreInitBattleData
	ld hl, ChampArenaMusicSelectLance
	ret
.intro
	text_far _LanceIntroText
	text_end
.intro2
	text_far _LanceIntroText2
	text_end
.challengerLost
	text_far _LanceLostText
	text_end
.challengerWon
	text_far _LanceWonText
	text_end

KogaIntroText:
	ld hl, .intro 
	call AssistantPrintIntroText
	ld hl, IntroReactionsKoga
	call ProcessIntroReactions
	call AudienceClaps
	ld hl, .intro2
	rst _PrintText
	; TODO: how do you respond?
	ld a, 5
	ld [wGymLeaderNo], a
	ld b, 2
	call GetChampArenaChallengerPartyID
	ld a, OPP_KOGA
	ld hl, .challengerLost
	ld de, .challengerWon
	call ChampArenaStoreInitBattleData
	ld hl, ChampArenaMusicSelectKoga
	ret
.intro
	text_far _KogaIntroText
	text_end
.intro2
	text_far _KogaIntroText2
	text_end
.challengerLost
	text_far _KogaLostText
	text_end
.challengerWon
	text_far _KogaWonText
	text_end
	
LoreleiIntroText:
	ld hl, .intro 
	call AssistantPrintIntroText
	ld hl, IntroReactionsLorelei
	call ProcessIntroReactions
	call AudienceClaps
	ld hl, .intro2
	rst _PrintText
	; TODO: how do you respond?
	ld a, 9
	ld [wGymLeaderNo], a
	ld b, 2
	call GetChampArenaChallengerPartyID
	ld a, OPP_LORELEI
	ld hl, .challengerLost
	ld de, .challengerWon
	call ChampArenaStoreInitBattleData
	ld hl, ChampArenaMusicSelectLorelei
	ret
.intro
	text_far _LoreleiIntroText
	text_end
.intro2
	text_far _LoreleiIntroText2
	text_end
.challengerLost
	text_far _LoreleiLostText
	text_end
.challengerWon
	text_far _LoreleiWonText
	text_end

BrockIntroText:
	ld hl, .intro 
	call AssistantPrintIntroText
	ld hl, IntroReactionsBrock
	call ProcessIntroReactions
	call AudienceClaps
	ld hl, .intro2
	rst _PrintText
	; TODO: how do you respond?
	ld a, 1
	ld [wGymLeaderNo], a
	ld b, 2
	call GetChampArenaChallengerPartyID
	ld a, OPP_BROCK
	ld hl, .challengerLost
	ld de, .challengerWon
	call ChampArenaStoreInitBattleData
	ld hl, ChampArenaMusicSelectBrock
	ret
.intro
	text_far _BrockIntroText
	text_end
.intro2
	text_far _BrockIntroText2
	text_end
.challengerLost
	text_far _BrockLostText
	text_end
.challengerWon
	text_far _BrockWonText
	text_end

AgathaIntroText:
	ld hl, .intro 
	call AssistantPrintIntroText
	ld hl, IntroReactionsAgatha
	call ProcessIntroReactions
	call AudienceClaps
	ld a, CHAMP_ARENA_CHALLENGER
	call SetSpriteFacingUp
	ld hl, .intro2
	rst _PrintText
	ld a, CHAMP_ARENA_CHALLENGER
	call SetSpriteFacingRight
	ld hl, .intro3
	rst _PrintText
	; TODO: how do you respond?
	ld a, 11
	ld [wGymLeaderNo], a
	ld b, 2
	call GetChampArenaChallengerPartyID
	ld a, OPP_AGATHA
	ld hl, .challengerLost
	ld de, .challengerWon
	call ChampArenaStoreInitBattleData
	ld hl, ChampArenaMusicSelectAgatha
	ret
.intro
	text_far _AgathaIntroText
	text_end
.intro2
	text_far _AgathaIntroText2
	text_end
.intro3
	text_far _AgathaIntroText3
	text_end
.challengerLost
	text_far _AgathaLostText
	text_end
.challengerWon
	text_far _AgathaWonText
	text_end

GymGuideIntroText:
	ld hl, .intro 
	call AssistantPrintIntroText
	ld hl, IntroReactionsGymGuide
	call ProcessIntroReactions
	call AudienceClaps
	ld hl, .intro2
	rst _PrintText
	; tm kid shows up 
	ld hl, .tmkid
	rst _PrintText
	; TODO: how do you respond?
	ld a, 13
	ld [wGymLeaderNo], a
	ld b, 1
	call GetChampArenaChallengerPartyID
	ld a, OPP_GYM_GUIDE
	ld hl, .challengerLost
	ld de, .challengerWon
	call ChampArenaStoreInitBattleData
	ld hl, ChampArenaMusicSelectGymGuide
	ret
.intro
	text_far _GymGuideIntroText
	text_end
.intro2
	text_far _GymGuideIntroText2
	text_end
.tmkid
	text_far _ChampArenaGymGuideSonText
	text_end
.challengerLost
	text_far _GymGuideLostText
	text_end
.challengerWon
	text_far _GymGuideWonText
	text_end

BlueIntroText:
	ld hl, .intro
	call AssistantPrintIntroText
	ld hl, IntroReactionsBlue
	call ProcessIntroReactions
	call AudienceClaps
	ld hl, .intro2
	rst _PrintText
	; TODO: how do you respond?
	ld a, [wRivalStarter]
	call StarterToPartyID
	add 3 ; second set of parties
	CheckEventHL EVENT_ARENA_ALL_CHALLENGERS_DEFEATED
	jr z, .foundParty
	add 3 ; third set of parties
.foundParty
	ld b, a
	ld a, OPP_RIVAL3
	ld hl, .challengerLost
	ld de, .challengerWon
	call ChampArenaStoreInitBattleData
	ld hl, ChampArenaMusicSelectBlue
	ret
.intro
	text_far _RivalIntroText
	text_end
.intro2
	text_far _RivalIntroText2
	text_end
.challengerLost
	text_far _RivalLostText
	text_end
.challengerWon
	text_far _RivalWonText
	text_end

ChampArenaStoreInitBattleData:	
	ld [wCurOpponent], a
	ld a, b
	ld [wTrainerNo], a
	call SaveEndBattleTextPointers
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ret

ErikaDefeatedText:
	SetEvent EVENT_ARENA_BEAT_ERIKA
	ld hl, .defeated
	rst _PrintText
	rst TextScriptEnd
.defeated
	text_far _ChampArenaErikaBeforeLeaves
	text_end

BlaineDefeatedText:
	SetEventA EVENT_ARENA_BEAT_BLAINE
	ld hl, .defeated
	rst _PrintText
	rst TextScriptEnd
.defeated
	text_far _ChampArenaBlaineBeforeLeaves
	text_end

SurgeDefeatedText:
	SetEventA EVENT_ARENA_BEAT_SURGE
	ld hl, .defeated
	rst _PrintText
	rst TextScriptEnd
.defeated
	text_far _ChampArenaSurgeBeforeLeaves
	text_end

SabrinaDefeatedText:
	SetEventA EVENT_ARENA_BEAT_SABRINA
	ld hl, .defeated
	rst _PrintText
	rst TextScriptEnd
.defeated
	text_far _ChampArenaSabrinaBeforeLeaves
	text_end

BrunoDefeatedText:
	SetEventA EVENT_ARENA_BEAT_BRUNO
	ld hl, .defeated
	rst _PrintText
	rst TextScriptEnd
.defeated
	text_far _ChampArenaBrunoBeforeLeaves
	text_end

MistyDefeatedText:
	SetEventA EVENT_ARENA_BEAT_MISTY
	ld hl, .defeated
	rst _PrintText
	rst TextScriptEnd
.defeated
	text_far _ChampArenaMistyBeforeLeaves
	text_end

LanceDefeatedText:
	SetEventA EVENT_ARENA_BEAT_LANCE
	ld hl, .defeated
	rst _PrintText
	rst TextScriptEnd
.defeated
	text_far _ChampArenaLanceBeforeLeaves
	text_end

KogaDefeatedText:
	SetEventA EVENT_ARENA_BEAT_KOGA
	ld hl, .defeated
	rst _PrintText
	rst TextScriptEnd
.defeated
	text_far _ChampArenaKogaBeforeLeaves
	text_end

LoreleiDefeatedText:
	SetEventA EVENT_ARENA_BEAT_LORELEI
	ld hl, .defeated
	rst _PrintText
	rst TextScriptEnd
.defeated
	text_far _ChampArenaLoreleiBeforeLeaves
	text_end

BrockDefeatedText:
	SetEventA EVENT_ARENA_BEAT_BROCK
	ld hl, .defeated
	rst _PrintText
	rst TextScriptEnd
.defeated
	text_far _ChampArenaBrockBeforeLeaves
	text_end

AgathaDefeatedText:
	SetEventA EVENT_ARENA_BEAT_AGATHA
	ld hl, .defeated
	rst _PrintText
	rst TextScriptEnd
.defeated
	text_far _ChampArenaAgathaBeforeLeaves
	text_end

GymGuideDefeatedText:
	SetEventA EVENT_ARENA_BEAT_GYM_GUIDE
	ld hl, .defeated
	rst _PrintText
	rst TextScriptEnd
.defeated
	text_far _ChampArenaGymGuideBeforeLeaves
	text_end

BlueDefeatedText:
	SetEventA EVENT_ARENA_BEAT_BLUE
	ld hl, .defeated
	rst _PrintText
	rst TextScriptEnd
.defeated
	text_far _ChampArenaRivalBeforeLeaves
	text_end

; INPUT:
; hl = address of string of bytes
; b = how many bits in a sequence of bytes to count
; OUTPUT:
; [wNumSetBits] = number of set bits
CountSetExactNumberBits::
	ld c, 0
.loop
	ld a, [hli]
	ld e, a
	ld d, 8
.innerLoop ; count how many bits are set in the current byte
	xor a
	srl e
	adc c
	ld c, a
	dec b
	jr z, .done
	dec d
	jr nz, .innerLoop
	jr .loop
.done
	ld a, c
	ld [wNumSetBits], a
	ret

; input a = which music was chosen (1, 2, or if last battle, 3)
ChampArenaGetChosenMusic:
	cp 3
	jr z, .final
	dec a
	push af
	ld a, [wChampArenaChallenger]
	add a
	ld hl, ChampArenaMusicMappings
	ld d, 0
	ld e, a
	add hl, de
	pop af
	and a
	jr z, .noInc
	inc hl
.noInc
	ld a, [hl]
	jr .done
.final
	ld a, 11
.done
	inc a
	ld [wSpecialBattleMusicID], a
	ret

ChampArenaMusicMappings:
	db 0, 1 ; ERIKA
	db 2, 3 ; BLAINE
	db 4, 5 ; SURGE
	db 6, 7 ; SABRINA
	db 8, 9 ; BRUNO
	db 0, 3 ; MISTY
	db 6, 8 ; LANCE
	db 9, 10 ; KOGA
	db 1, 6 ; LORELEI
	db 5, 2 ; BROCK
	db 10, 8 ; AGATHA
	db 7, 3 ; GYM GUIDE
	db 4, 0 ; BLUE

TMKidWalks:
	ld d, a ; whether tm kid is walking up or down
	and a
	ld a, SPRITE_FACING_DOWN
	jr z, .down1
	ld a, SPRITE_FACING_UP
.down1
  	ldh [hSpriteFacingDirection], a
	ld a, CHAMP_ARENA_TM_KID
	ldh [hSpriteIndex], a
  	push de
  	call SetSpriteFacingDirection
  	call UpdateSprites
  	pop de
	ld c, 2
.walkLoopStart
	ld b, 8
.walkLoop
	ld hl, wSprite04StateData1YPixels
	ld a, d
	and a
	jr z, .down2
	dec [hl]
	jr .doneIncDec
.down2
	inc [hl]
.doneIncDec
	rst _DelayFrame
	dec b
	jr nz, .walkLoop
	ld a, [wSprite04StateData1ImageIndex]
	xor 1
	ld [wSprite04StateData1ImageIndex], a
	dec c
	jr nz, .walkLoopStart
	ld a, d
	and a
	ld a, 13 ; y = 9 + 4 (offset)
	jr z, .down3
	dec a
.down3
	ld [wSprite04StateData2MapY], a
	ld a, SPRITE_FACING_RIGHT
  	ldh [hSpriteFacingDirection], a
  	jp SetSpriteFacingDirection

LoadAssistantNormalSprites:
	ld hl, vChars0 tile 40
	ld b, BANK(ArenaAssistantSprite)
	ld de, ArenaAssistantSprite tile 4
	ld c, 4
	call CopyVideoData
	ld hl, vChars0 tile 44
	ld b, BANK(ArenaAssistantSprite)
	ld de, ArenaAssistantSprite tile 8
	ld c, 4
	jp CopyVideoData

LoadAssistantCutsceneSprites:
	ld hl, vChars0 tile 40 ; replace 3rd sprite's back standing tiles with the bowing tiles
	ld b, BANK(ArenaAssistantSprite)
	ld de, ArenaAssistantSprite tile 12
	ld c, 4
	call CopyVideoData
	ld hl, vChars0 tile 44 ; replace 3rd sprite's sideways standing tiles with the holding hand up tiles
	ld b, BANK(ArenaAssistantSprite)
	ld de, ArenaAssistantSprite tile 20
	ld c, 4
	jp CopyVideoData

AssistantPrintIntroText:
	rst _PrintText
AssistantFacesDown:
	ld a, CHAMP_ARENA_ASSISTANT
	jp SetSpriteFacingDown

AssistantHoldsUpLeftHand:
	ld a, CHAMP_ARENA_ASSISTANT
	jp SetSpriteFacingLeft

AssistantHoldsUpRightHand:
	ld a, CHAMP_ARENA_ASSISTANT
	jp SetSpriteFacingRight

AssistantBows:
	ld a, CHAMP_ARENA_ASSISTANT
	jp SetSpriteFacingUp

AudienceClaps:
	call PlayAudienceClappingSFX
	ld c, 120 ; how many frames the animation will last
.loop
	ld hl, AudienceClapSequence
.innerloop
	ld a, [hli]
	cp 10 ; variable crowd 3
	jr nz, .continue
	ld b, a
	ld a, [wSprite10StateData1PictureID]
	cp SPRITE_BLUE_SITTING
	ld a, b
	jr z, .loop ; blue is mean and never claps for anyone
.continue
	push hl
	push bc
	push af
	call GetAddressFromPointer
	ld a, [hl]
	cp SPRITE_FACING_DOWN
	jr z, .up
	cp SPRITE_FACING_UP
	jr z, .left
	; sprite is facing left
.up
	pop af
	call SetSpriteFacingUp ; clap preparation
	jr .next
.left
	pop af
	call SetSpriteFacingLeft ; clapping hands
.next
	call UpdateSprites
	pop bc
	ld b, c
	srl b
	jr c, .noDelay
	rst _DelayFrame ; delay every other iteration of the loop
.noDelay
	dec c
	pop hl
	jr z, .done
.skipClap
	inc hl
	inc hl
	ld a, [hl]
	cp -1
	jr z, .loop
	jr .innerloop
.done
	; return to normal poses
	ld a, 5
.loop2
	push af
	call SetSpriteFacingDown
	pop af
	inc a
	cp 12
	ret z
	jr .loop2

AudienceClapSequence:
	dbw 11, wSprite11StateData1FacingDirection
	dbw 5,  wSprite05StateData1FacingDirection
	dbw 7,  wSprite07StateData1FacingDirection
	dbw 8,  wSprite08StateData1FacingDirection
	dbw 6,  wSprite06StateData1FacingDirection
	dbw 9,  wSprite09StateData1FacingDirection 
	dbw 10, wSprite10StateData1FacingDirection
	db -1

; a = which sprite the bubble will show on

ShowQuestionBubble:
	ld b, QUESTION_BUBBLE
	jr ShowEmotionBubble

ShowSmileBubble:
	ld b, SMILE_BUBBLE
	jr ShowEmotionBubble

ShowExclamationBubble:
	ld b, EXCLAMATION_BUBBLE
	jr ShowEmotionBubble

ShowHeartBubble:
	ld b, HEART_BUBBLE

ShowEmotionBubble:
	ld [wEmotionBubbleSpriteIndex], a
	ld a, b
  	ld [wWhichEmotionBubble], a
	call PlayEmotionBubbleSFX
	farjp EmotionBubbleVeryFast

; hl = list of reactions to run through
ProcessIntroReactions:
.loop
	ld a, [hli]
	cp -1
	ret z
	cp CHAMP_ARENA_VARIABLE_CROWD1
	jr z, .variableCrowd
	cp CHAMP_ARENA_VARIABLE_CROWD2
	jr z, .variableCrowd
	cp CHAMP_ARENA_VARIABLE_CROWD3
	jr z, .variableCrowd
	; normal crowd
	push af
	ld a, [hli]
	ld b, a
	pop af
	push hl
	call ShowEmotionBubble
	pop hl
	jr .loop
.variableCrowd
	push af
	push hl
	ld hl, wSpriteStateData1
	ld bc, SPRITESTATEDATA1_LENGTH
	call AddNTimes
	ld b, [hl] ; picture ID of given sprite
	pop hl
	ld a, [hli]
	cp b
	jr nz, .noReaction
	pop af
	ld b, [hl]
	push hl
	call ShowEmotionBubble
	pop hl
	inc hl
	jr .loop
.noReaction
	pop af
	inc hl
	jr .loop



IntroReactionsErika:
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_MIDDLE_AGED_MAN_SITTING, HEART_BUBBLE
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_MIDDLE_AGED_WOMAN_SITTING, EXCLAMATION_BUBBLE
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_GYM_GUIDE_SITTING, HEART_BUBBLE ; gym guide
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_LITTLE_BOY_SITTING, HEART_BUBBLE ; gym guide's son
	db CHAMP_ARENA_VARIABLE_CROWD3, SPRITE_DAISY_SITTING, SMILE_BUBBLE ; daisy
	db CHAMP_ARENA_CROWD3, HEART_BUBBLE
	db -1

IntroReactionsBlaine:
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_MIDDLE_AGED_WOMAN_SITTING, SMILE_BUBBLE
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_MIDDLE_AGED_MAN_SITTING, QUESTION_BUBBLE
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_AGATHA_SITTING, SMILE_BUBBLE ; agatha
	db CHAMP_ARENA_CROWD2, EXCLAMATION_BUBBLE
	db -1

IntroReactionsSurge:
	db CHAMP_ARENA_VARIABLE_CROWD3, SPRITE_COOLTRAINER_F_SITTING, HEART_BUBBLE
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_MIDDLE_AGED_WOMAN_SITTING, HEART_BUBBLE
	db CHAMP_ARENA_CROWD2, HEART_BUBBLE
	db -1

IntroReactionsSabrina:
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_MIDDLE_AGED_MAN_SITTING, HEART_BUBBLE
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_AGATHA_SITTING, SMILE_BUBBLE ; agatha
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_GYM_GUIDE_SITTING, HEART_BUBBLE ; gym guide
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_LITTLE_BOY_SITTING, HEART_BUBBLE ; gym guide's son
	db CHAMP_ARENA_CROWD3, HEART_BUBBLE
	db -1

IntroReactionsBruno:
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_MIDDLE_AGED_WOMAN_SITTING, HEART_BUBBLE
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_AGATHA_SITTING, EXCLAMATION_BUBBLE ; agatha
	db CHAMP_ARENA_CROWD2, SMILE_BUBBLE
	db -1

IntroReactionsMisty:
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_MIDDLE_AGED_MAN_SITTING, HEART_BUBBLE
	db CHAMP_ARENA_VARIABLE_CROWD3, SPRITE_DAISY_SITTING, SMILE_BUBBLE ; daisy
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_LITTLE_BOY_SITTING, HEART_BUBBLE ; gym guide's son
	db CHAMP_ARENA_CROWD3, HEART_BUBBLE
	db -1

IntroReactionsLance:
	db CHAMP_ARENA_VARIABLE_CROWD3, SPRITE_COOLTRAINER_F_SITTING, HEART_BUBBLE
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_GYM_GUIDE_SITTING, EXCLAMATION_BUBBLE ; gym guide
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_LITTLE_BOY_SITTING, EXCLAMATION_BUBBLE ; gym guide's son
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_AGATHA_SITTING, SMILE_BUBBLE ; agatha
	db -1

IntroReactionsKoga:
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_AGATHA_SITTING, HEART_BUBBLE ; agatha
	db CHAMP_ARENA_VARIABLE_CROWD3, SPRITE_COOLTRAINER_F_SITTING, EXCLAMATION_BUBBLE
	db -1


IntroReactionsLorelei:
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_MIDDLE_AGED_MAN_SITTING, HEART_BUBBLE
	; the gym guide and his son really like lorelei haha
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_GYM_GUIDE_SITTING, HEART_BUBBLE ; gym guide
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_LITTLE_BOY_SITTING, HEART_BUBBLE ; gym guide's son
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_GYM_GUIDE_SITTING, HEART_BUBBLE ; gym guide
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_LITTLE_BOY_SITTING, HEART_BUBBLE ; gym guide's son
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_AGATHA_SITTING, SMILE_BUBBLE ; agatha
	db CHAMP_ARENA_VARIABLE_CROWD3, SPRITE_DAISY_SITTING, SMILE_BUBBLE ; daisy
	db CHAMP_ARENA_CROWD3, HEART_BUBBLE
	db -1

IntroReactionsBrock:
	db CHAMP_ARENA_CROWD2, HEART_BUBBLE
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_LITTLE_BOY_SITTING, EXCLAMATION_BUBBLE ; gym guide's son
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_OAK_SITTING, SMILE_BUBBLE ; oak
	db -1

IntroReactionsAgatha:
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_OAK_SITTING, SMILE_BUBBLE ; oak
	db CHAMP_ARENA_VARIABLE_CROWD3, SPRITE_DAISY_SITTING, SMILE_BUBBLE ; daisy
	db -1

IntroReactionsGymGuide:
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_OAK_SITTING, EXCLAMATION_BUBBLE ; oak
	db CHAMP_ARENA_VARIABLE_CROWD3, SPRITE_COOLTRAINER_F_SITTING, QUESTION_BUBBLE
	db CHAMP_ARENA_CROWD2, QUESTION_BUBBLE
	db CHAMP_ARENA_CROWD3, QUESTION_BUBBLE
	db -1

IntroReactionsBlue:
	db CHAMP_ARENA_VARIABLE_CROWD3, SPRITE_DAISY_SITTING, HEART_BUBBLE ; daisy
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_MOM_SITTING, EXCLAMATION_BUBBLE ; mom
	db CHAMP_ARENA_VARIABLE_CROWD2, SPRITE_DAD_SITTING, EXCLAMATION_BUBBLE ; dad
	db CHAMP_ARENA_VARIABLE_CROWD1, SPRITE_OAK_SITTING, SMILE_BUBBLE ; oak
	db CHAMP_ARENA_CROWD2, EXCLAMATION_BUBBLE
	db -1

ReloadVariableCrowd:
	; first decide which NPC will replace CHAMP_ARENA_VARIABLE_CROWD3
	CheckEvent EVENT_ARENA_BEAT_ERIKA
	ret z ; very first battle no one gets replaced4
	ld a, [wChampArenaChallenger]
	cp 12 ; rival
	call z, .daisy ; always show daisy when fighting rival
	jr z, .loadCrowd3
	call Random
	srl a
	jr c, .loadDefaultCrowd3 ; 50% chance of no one special
.reroll
	call Random
	and %111
	call z, .giovanni ; 1/8 chance of giovanni
	jr z, .loadCrowd3
	cp 5
	call c, .daisy ; 4/8 chance of daisy
	call nc, .blue ; 3/8 chance of blue
.loadCrowd3
	ld [wSprite10StateData1PictureID], a
	ld [wMapSpriteOriginalPictureIDs+9], a
	ld hl, vChars0 tile 108
	call CopyVideoData
.checkCrowd1and2
	; then decide who will replace CHAMP_ARENA_VARIABLE_CROWD1 and CHAMP_ARENA_VARIABLE_CROWD2
	call Random
	and %11
	jr z, .loadDefaultCrowd1and2 ; 25% chance of no one special
	cp 1
	jr z, .loadMomAndDad
	cp 2
	jr z, .loadOakAndMaybeAgatha
	ld a, [wChampArenaChallenger]
	cp 11 ; gym guide
	jr z, .checkCrowd1and2 ; reroll, can't have them in the crowd when they're being challenged
	; load gym guide and son
	call .tmkid
	call .loadCrowd1
	call .gymguide
	jr .loadCrowd2
.loadDefaultCrowd3
	ld a, [wSprite10StateData1PictureID]
	cp SPRITE_COOLTRAINER_F_SITTING
	jr z, .checkCrowd1and2
	call .default3
	call .loadCrowd3
	jr .checkCrowd1and2
.loadDefaultCrowd1and2
	ld a, [wSprite07StateData1PictureID]
	cp SPRITE_MIDDLE_AGED_MAN_SITTING
	jr z, .skipDefault1
	call .default1
	call .loadCrowd1
.skipDefault1
	ld a, [wSprite08StateData1PictureID]
	cp SPRITE_MIDDLE_AGED_WOMAN_SITTING
	ret z
	call .default2
	jr .loadCrowd2
.loadMomAndDad
	call .mom
	call .loadCrowd1
	call .dad
	jr .loadCrowd2
.loadOakAndMaybeAgatha
	call .oak
	call .loadCrowd1
	ld a, [wChampArenaChallenger]
	cp 10
	jr z, .doLoadDefault2 ; can't load agatha if challenging her
	call Random
	srl a
	call .agatha
	jr c, .loadCrowd2 ; 50% chance agatha won't be there anyway even if she could load
.doLoadDefault2
	call .default2
	jr .loadCrowd2
.loadCrowd1
	ld [wSprite07StateData1PictureID], a
	ld [wMapSpriteOriginalPictureIDs+6], a
	ld hl, vChars0 tile 84
	jp CopyVideoData
.loadCrowd2
	ld [wSprite08StateData1PictureID], a
	ld [wMapSpriteOriginalPictureIDs+7], a
	ld hl, vChars0 tile 96
	jp CopyVideoData
.default1
	ld a, SPRITE_MIDDLE_AGED_MAN_SITTING
	lb bc, BANK(MiddleAgedManSittingSprite), 12
	ld de, MiddleAgedManSittingSprite
	ret
.default2
	ld a, SPRITE_MIDDLE_AGED_WOMAN_SITTING
	lb bc, BANK(MiddleAgedWomanSittingSprite), 12
	ld de, MiddleAgedWomanSittingSprite
	ret
.default3
	ld a, SPRITE_COOLTRAINER_F_SITTING
	lb bc, BANK(CooltrainerFSittingSprite), 12
	ld de, CooltrainerFSittingSprite
	ret
.daisy
	ld a, SPRITE_DAISY_SITTING
	lb bc, BANK(DaisySittingSprite), 12
	ld de, DaisySittingSprite
	ret
.mom
	ld a, SPRITE_MOM_SITTING
	lb bc, BANK(MomSittingSprite), 12
	ld de, MomSittingSprite
	ret
.dad
	ld a, SPRITE_DAD_SITTING
	lb bc, BANK(DadSittingSprite), 12
	ld de, DadSittingSprite
	ret
.oak
	ld a, SPRITE_OAK_SITTING
	lb bc, BANK(OakSittingSprite), 12
	ld de, OakSittingSprite
	ret
.agatha
	ld a, SPRITE_AGATHA_SITTING
	lb bc, BANK(AgathaSittingSprite), 12
	ld de, AgathaSittingSprite
	ret
.gymguide
	ld a, SPRITE_GYM_GUIDE_SITTING
	lb bc, BANK(GymGuideSittingSprite), 12
	ld de, GymGuideSittingSprite
	ret
.tmkid
	ld a, SPRITE_LITTLE_BOY_SITTING
	lb bc, BANK(LittleBoySittingSprite), 12
	ld de, LittleBoySittingSprite
	ret
.blue
	ld a, SPRITE_BLUE_SITTING
	lb bc, BANK(BlueSittingSprite), 4
	ld de, BlueSittingSprite
	ret
.giovanni
	ld a, SPRITE_GIOVANNI_SITTING
	lb bc, BANK(GiovanniSittingSprite), 12
	ld de, GiovanniSittingSprite
	ret

ShowChampArenaTrainerSelectMenu:
	call SaveScreenTilesToBuffer2
	ld a, [wListScrollOffset]
	push af ; save list scroll offset to preserve item list index
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
.loop
	ld hl, ChampArenaTrainerList
	call LoadItemList
	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld [wMenuItemToSwap], a
	ld [wListMenuHoverTextType], a
	inc a
	ld [wListMenuCustomType], a
	ld a, CUSTOMLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	ld b, 1
	jr c, .done
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wListScrollOffset]
	add b
	; a = which trainer was selected
	ld [wChampArenaChallenger], a
	ld b, 0
.done
	push bc
	call LoadScreenTilesFromBuffer2
	pop bc
	pop af
	ld [wListScrollOffset], a ; restore list scroll offset to preserve item list index
	ld a, b
	and a
	rst TextScriptEnd

ChampArenaTrainerList:
	db 13
	db ERIKA
	db BLAINE
	db LT_SURGE
	db SABRINA
	db BRUNO
	db MISTY
	db LANCE
	db KOGA
	db LORELEI
	db BROCK
	db AGATHA
	db GYM_GUIDE
	db RIVAL3
	db -1

ShowChampArenaMusicSelectMenu:
	call SaveScreenTilesToBuffer2
	ld a, [wListScrollOffset]
	push af ; save list scroll offset to preserve item list index
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
.loop
	ld hl, ChampArenaMusicList
	call LoadItemList
	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld [wMenuItemToSwap], a
	ld [wListMenuHoverTextType], a
	ld a, 2
	ld [wListMenuCustomType], a
	ld a, CUSTOMLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	ld b, 1
	jr c, .done
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wListScrollOffset]
	add b
	; a = which music was selected
	ld [wSpecialBattleMusicID], a
	ld b, 0
.done
	push bc
	call LoadScreenTilesFromBuffer2
	pop bc
	pop af
	ld [wListScrollOffset], a ; restore list scroll offset to preserve item list index
	ld a, b
	and a
	rst TextScriptEnd

	const_def
	const CHAMP_ARENA_MUSIC_CLASSIC
	const CHAMP_ARENA_MUSIC_FRIENDLY
	const CHAMP_ARENA_MUSIC_CUTE
	const CHAMP_ARENA_MUSIC_MACHO
	const CHAMP_ARENA_MUSIC_JAZZY
	const CHAMP_ARENA_MUSIC_COOL
	const CHAMP_ARENA_MUSIC_ROCKIN
	const CHAMP_ARENA_MUSIC_ANTHEMIC
	const CHAMP_ARENA_MUSIC_GENIUS
	const CHAMP_ARENA_MUSIC_SERIOUS
	const CHAMP_ARENA_MUSIC_INSPIRING
	const CHAMP_ARENA_MUSIC_TENSE
	const CHAMP_ARENA_MUSIC_TITLE

ChampArenaMusicList:
	db 13
	db CHAMP_ARENA_MUSIC_CLASSIC
	db CHAMP_ARENA_MUSIC_FRIENDLY
	db CHAMP_ARENA_MUSIC_CUTE
	db CHAMP_ARENA_MUSIC_MACHO
	db CHAMP_ARENA_MUSIC_JAZZY
	db CHAMP_ARENA_MUSIC_COOL
	db CHAMP_ARENA_MUSIC_ROCKIN
	db CHAMP_ARENA_MUSIC_ANTHEMIC
	db CHAMP_ARENA_MUSIC_GENIUS
	db CHAMP_ARENA_MUSIC_SERIOUS
	db CHAMP_ARENA_MUSIC_INSPIRING
	db CHAMP_ARENA_MUSIC_TENSE
	db CHAMP_ARENA_MUSIC_TITLE
	db -1

GetChampArenaChallengerPartyID:
	CheckEvent EVENT_ARENA_ALL_CHALLENGERS_DEFEATED
	ret z
	inc b ; after defeating everyone, they get stronger parties
	ret

; a = which emotion bubble
PlayEmotionBubbleSFX:
	cp HEART_BUBBLE
	ld de, HeartBubbleSFX
	jr z, PlayChampCrowdSFXChannel5
	cp EXCLAMATION_BUBBLE
	ld de, ExclamationBubbleSFX
	jr z, PlayChampCrowdSFXChannel5
	cp SMILE_BUBBLE
	ld de, SmileBubbleSFX
	jr z, PlayChampCrowdSFXChannel5
	ld de, QuestionBubbleSFX
	jr PlayChampCrowdSFXChannel5

PlayAudienceClappingSFX:
	ld de, AudienceClappingSFX
	; fall through
PlayChampCrowdSFXChannel8:
	ld a, SFX_PUSH_BOULDER
	rst _PlaySound
	ld hl, wChannelCommandPointers + CHAN8 * 2
	jr PlayChampCrowdSFX

PlayChampCrowdSFXChannel5:
	ld a, SFX_TRADE_MACHINE
	rst _PlaySound
	ld hl, wChannelCommandPointers + CHAN5 * 2
	; fall through

; input hl = crowd SFX's 
PlayChampCrowdSFX:
	; remap channel to play the actual desired sound
	ld a, e
	ld [hli], a
	ld [hl], d
	ret

CheckResetDoorEvent:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	ResetEvent EVENT_OPENED_ARENA_DOOR ; when loading the arena ensure the door resets to being closed.
	; if we loaded the map while on top of the door, open it.
	ld a, [wXCoord]
	cp 7
	ret nz
	ld a, [wYCoord]
	cp 12
	ret nz
	jp OpenDoor