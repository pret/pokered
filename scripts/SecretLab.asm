SecretLab_Script:
	call ReplaceDoor
	call CheckOpponentLeaves
	call CheckOpponentWalkIn
	call CheckRestartMusic
	call CheckNoteButtons
	call CheckWalkingToDoor
	call CheckMewtwoTransform
	jp EnableAutoTextBoxDrawing

SecretLabPlayMusic::
	CheckEvent EVENT_OPENED_SECRET_LAB_BARRICADE
	jr nz, .enhancedMusic
	ld a, [wReplacedMapMusic]
	cp MUSIC_SECRET_LAB1 ; are we already playing the dungeon's music? (can happen when changing the option in the option menu)
	ret z ; this track always plays regardless of option when in this map's current state, so don't do anything
	ld a, MUSIC_SECRET_LAB1
	ld [wReplacedMapMusic], a
	ld c, BANK(Music_Dungeon2)
	ld a, MUSIC_DUNGEON2
	call PlayMusic ; start playing something else with 4 channels in bank 3
	; replace it with the actual music we want immediately
	ld de, Music_SecretLab_Ch1
	callfar Audio3_RemapChannel1
	ld de, Music_SecretLab_Ch2
	callfar Audio3_RemapChannel2
	ld de, Music_SecretLab_Ch3
	callfar Audio3_RemapChannel3
	ld de, Music_SecretLab_Ch4
	jpfar Audio3_RemapChannel4
.enhancedMusic
	ld a, d
	and a
	jr nz, PlayEnhancedSecretLabMusic ; d != 0 -> always play music
	ld a, [wReplacedMapMusic]
	cp MUSIC_SECRET_LAB2 ; are we already playing the dungeon's music? (can happen when going through the door)
	ret z
	; fall through

PlayEnhancedSecretLabMusic:
	ld a, [wOptions2]
	bit BIT_MUSIC, a
	jr z, .ogMusic
	ld a, MUSIC_SECRET_LAB2
	ld [wReplacedMapMusic], a
	ld c, BANK(Music_Dungeon2)
	ld a, MUSIC_DUNGEON2
	call PlayMusic ; start playing something else with 4 channels in bank 3
	ld de, Music_SecretLab2_Ch1
	callfar Audio3_RemapChannel1
	ld de, Music_SecretLab2_Ch2
	callfar Audio3_RemapChannel2
	ld de, Music_SecretLab2_Ch3
	callfar Audio3_RemapChannel3
	ld de, Music_SecretLab2_Ch4
	jpfar Audio3_RemapChannel4
.ogMusic
	xor a
	ld [wReplacedMapMusic], a
	ld a, MUSIC_CINNABAR_MANSION
	ld c, BANK(Music_CinnabarMansion)
	jp PlayMusic

ReplaceDoor:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ResetEvent EVENT_OPENED_MACHINE_DOOR
	CheckEvent EVENT_OPENED_SECRET_LAB_BARRICADE
	jr z, .clearPassword
	call OpenBarricadeDoor
	ld a, [wYCoord]
	cp 23
	jr nz, .upDoorCheck
	jpfar ForceStepOutFromDoor
.upDoorCheck
	cp 16
	ret nz
	ld d, D_UP
	jpfar ForceStepFromDoor
.clearPassword
	xor a
	ld bc, 7
	ld hl, wSecretLabPasswordTracker
	jp FillMemory ; clear password on entering area if the door hasn't been opened yet

OpenBarricadeDoor:
	lb bc, 11, 2
	ld a, $32
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

CheckOpponentWalkIn:
	CheckEvent EVENT_BEAT_SECRET_LAB_CHIEF
	ret nz
	ld a, [wIsInBattle]
	cp $FF
	ret z
	CheckEvent EVENT_SECRET_LAB_NPC_WALK_IN_HAPPENING
	jp nz, WaitForWalkFinish
	ld a, [wYCoord]
	cp 38
	jr z, .firstSoldierWalksIn
	cp 32
	jr z, .secondSoldierWalksIn	
	cp 28
	jr z, .walkUpToChief
	ret
.firstSoldierWalksIn
	CheckEvent EVENT_BEAT_SECRET_LAB_SOLDIER_0
	ret nz
	ld a, [wXCoord]
	add 4
	ld [wSprite01StateData2MapX], a
	ld de, SoldierWalkInMovement
	ld a, SECRETLAB_SOLDIER1
	ldh [hSpriteIndex], a
	call MoveSprite
	call .playEncounterMusic
	jr .done
.secondSoldierWalksIn
	CheckEvent EVENT_BEAT_SECRET_LAB_SOLDIER_1
	ret nz
	ld a, [wXCoord]
	add 4
	ld [wSprite02StateData2MapX], a
	ld de, SoldierWalkInMovement
	ld a, SECRETLAB_SOLDIER2
	ldh [hSpriteIndex], a
	call MoveSprite
	call .playEncounterMusic
	jr .done
.walkUpToChief
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, 3
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_UP
	ld b, 3
	ld hl, wSimulatedJoypadStatesEnd
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ld a, [wXCoord]
	cp 4
	jr z, .done
	ld c, D_RIGHT
	ld d, a
	jr c, .right
	ld c, D_LEFT
	sub 4
	jr .loop2
.right
	ld a, 4
	sub d
.loop2
	ld [hl], c
	inc hl
	push hl
	ld hl, wSimulatedJoypadStatesIndex
	inc [hl]
	pop hl
	dec a
	jr nz, .loop2
.done
	SetEvent EVENT_SECRET_LAB_NPC_WALK_IN_HAPPENING
	ret
.playEncounterMusic
	ld c, BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	jp PlayMusic

WaitForWalkFinish:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz
	ResetEvent EVENT_SECRET_LAB_NPC_WALK_IN_HAPPENING
	xor a
	ld [wJoyIgnore], a
	CheckEvent EVENT_SECRET_LAB_NPC_WALK_OUT_HAPPENING
	jr nz, .hideNPC
	ld a, TEXT_SECRETLAB_ENGAGE_TRAINER
	ldh [hTextID], a
	jp DisplayTextID
.hideNPC
	ld a, SFX_GO_OUTSIDE
	rst _PlaySound
	CheckEvent EVENT_BEAT_SECRET_LAB_SOLDIER_0
	ld a, HS_SECRET_LAB_SOLDIER_1
	call nz, .hideNPCAction
	CheckEvent EVENT_BEAT_SECRET_LAB_SOLDIER_1
	ld a, HS_SECRET_LAB_SOLDIER_2
	call nz, .hideNPCAction
	CheckEvent EVENT_BEAT_SECRET_LAB_CHIEF
	ld a, HS_SECRET_LAB_CHIEF
	call nz, .hideNPCAction
	ResetEvent EVENT_SECRET_LAB_NPC_WALK_OUT_HAPPENING
	ret
.hideNPCAction
	ld [wMissableObjectIndex], a
	predef_jump HideExtraObject

SoldierLeaveMovementDefault:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
SoldierWalkInMovement:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1

CheckOpponentLeaves:
	CheckEvent EVENT_SECRET_LAB_NPC_WALK_OUT_HAPPENING
	jr nz, WaitForWalkFinish
	CheckEvent EVENT_SECRET_LAB_BATTLE_COMPLETED
	ret z
	ResetEvent EVENT_SECRET_LAB_BATTLE_COMPLETED
	ld a, [wIsInBattle]
	cp $FF
	ret z
	ld hl, wStatusFlags3
	res BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, wMiscFlags
	res BIT_SEEN_BY_TRAINER, [hl]
	CheckEvent EVENT_BEAT_SECRET_LAB_SOLDIER_0
	ld a, SECRETLAB_SOLDIER1
	jr z, .beatSoldier1
	CheckEvent EVENT_BEAT_SECRET_LAB_SOLDIER_1
	ld a, SECRETLAB_SOLDIER2
	jr z, .beatSoldier2
	ld a, SECRETLAB_CHIEF
	SetEvent EVENT_BEAT_SECRET_LAB_CHIEF
	jr .finishTrainer
.beatSoldier1
	SetEvent EVENT_BEAT_SECRET_LAB_SOLDIER_0
	jr .finishTrainer
.beatSoldier2
	SetEvent EVENT_BEAT_SECRET_LAB_SOLDIER_1
.finishTrainer
	push af
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_DOWN
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	call UpdateSprites
	call GBFadeInFromWhite ; have to fade in here after the battle
	ld hl, wCurrentMapScriptFlags
	res 3, [hl] ; prevents fade in from happening later ; TODO: needs constant
	ld a, TEXT_SECRETLAB_AFTER_BATTLE
	ldh [hTextID], a
	call DisplayTextID
	; make them walk away
	ld a, [wXCoord]
	cp 7
	ld de, SoldierLeaveMovementDefault
	jr nz, .walkAway
	ld de, SoldierLeaveMovementAlternative
.walkAway
	pop af
	ldh [hSpriteIndex], a
	call MoveSprite
	SetEvent EVENT_SECRET_LAB_NPC_WALK_OUT_HAPPENING
	ret

SoldierLeaveMovementAlternative:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1

CheckRestartMusic:
	CheckEvent EVENT_BEAT_SECRET_LAB_CHIEF
	ret z
	CheckEvent EVENT_OPENED_SECRET_LAB_BARRICADE
	ret nz
	ld a, [wYCoord]
	cp 27
	ret c
	xor a
	ld [wMuteAudioAndPauseMusic], a
	ret

CheckNoteButtons:
	ld a, [wYCoord]
	cp 7
	jp z, CheckToggleMachineDoor
	cp 25
	jr nz, .resetButtons
	ld a, [wXCoord]
	and a
	jr z, .dSharp
	dec a
	jr z, .e
	dec a
	jr z, .g
	dec a
	jr z, .gSharp
	sub 3
	jr z, .a
	dec a
	jr z, .aSharp
	dec a
	jp z, .b
	dec a
	jp z, .pointless
.resetButtons
	ResetEventRange EVENT_STANDING_ON_BUTTON_D#, EVENT_STANDING_ON_BUTTON_POINTLESS
	ResetEvent EVENT_STANDING_ON_MACHINE_DOOR_BUTTON
	ret
.dSharp
	CheckEvent EVENT_STANDING_ON_BUTTON_D#
	ld a, 0
	call z, .playButtonPressTick
	call .resetButtons
	SetEvent EVENT_STANDING_ON_BUTTON_D#
	ret
.e
	CheckEvent EVENT_STANDING_ON_BUTTON_E
	ld a, 1
	call z, .playButtonPressTick
	call .resetButtons
	SetEvent EVENT_STANDING_ON_BUTTON_E
	ret
.g
	CheckEvent EVENT_STANDING_ON_BUTTON_G
	ld a, 2
	call z, .playButtonPressTick
	call .resetButtons
	SetEvent EVENT_STANDING_ON_BUTTON_G
	ret
.gSharp
	CheckEvent EVENT_STANDING_ON_BUTTON_G#
	ld a, 3
	call z, .playButtonPressTick
	call .resetButtons
	SetEvent EVENT_STANDING_ON_BUTTON_G#
	ret
.a
	CheckEvent EVENT_STANDING_ON_BUTTON_A
	ld a, 4
	call z, .playButtonPressTick
	call .resetButtons
	SetEvent EVENT_STANDING_ON_BUTTON_A
	ret
.aSharp
	CheckEvent EVENT_STANDING_ON_BUTTON_A#
	ld a, 5
	call z, .playButtonPressTick
	call .resetButtons
	SetEvent EVENT_STANDING_ON_BUTTON_A#
	ret
.b
	CheckEvent EVENT_STANDING_ON_BUTTON_B
	ld a, 6
	call z, .playButtonPressTick
	call .resetButtons
	SetEvent EVENT_STANDING_ON_BUTTON_B
	ret
.pointless
	CheckEvent EVENT_STANDING_ON_BUTTON_POINTLESS
	ld a, 7
	call z, .playButtonPressTick
	call .resetButtons
	SetEvent EVENT_STANDING_ON_BUTTON_POINTLESS
	ret
.playButtonPressTick	
	push af
	CheckEvent EVENT_OPENED_SECRET_LAB_BARRICADE
	jr nz, .noStopMusic
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
.noStopMusic
	ld a, SFX_TELEPORT_ENTER_2
	rst _PlaySound
	ld c, 10
	rst _DelayFrames
	pop af
	cp 7
	jr z, .pointlessButton
	; store sound
	push af
	ld a, SFX_LEDGE ; initiates playing this sound but it will get remapped below to a simple note sound
	rst _PlaySound
	pop af
	push af
	ld hl, NoteSoundPointers
	call GetAddressFromPointerArray
	ld d, h
	ld e, l
	callfar Audio3_RemapChannel5
	pop af
	CheckEventHL EVENT_OPENED_SECRET_LAB_BARRICADE
	ret nz ; if we already opened the door, no need to check or store the password anymore
	push af
	call CheckPasswordCorrect
	jr nz, StoreNoteToPassword ; if the password wasn't right, store the button press
	pop af
	ret
.pointlessButton
	ld a, SFX_SHOOTING_STAR
	rst _PlaySound
	ret

CheckPasswordCorrect:
	cp 5
	ret nz ; if they didn't press the 5th button from the left to trigger this function they won't be finishing the password anyway so return 
	ld b, 0
	ld hl, wSecretLabPasswordTracker
	ld de, NotePassword
.loop
	ld a, [de]
	ld c, [hl]
	cp c
	ret nz
	inc hl
	inc de
	inc b
	ld a, b
	cp 6
	jr nz, .loop
	; matching password
	ld c, 20
	rst _DelayFrames
	call StopAllMusic
	ld a, SFX_SWITCH
	rst _PlaySound
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld hl, PlayerMoveToDoor
	ld de, wSimulatedJoypadStatesEnd
	ld bc, 4
	rst _CopyData
	ld a, 4
	ld [wSimulatedJoypadStatesIndex], a
	SetEvent EVENT_SECRET_LAB_WALKING_IN_FRONT_OF_DOOR
	xor a
	ret

PlayerMoveToDoor:: ; these happen in reverse order
	db D_LEFT
	db D_LEFT
	db D_LEFT
	db D_DOWN

StoreNoteToPassword:
	pop af
	ld hl, wSecretLabPasswordTracker + 6
	ld b, 6
	ld c, [hl]
	ld [hl], a ; load current button into the last slot of the password
.loop
	dec hl
	ld a, [hl]
	ld [hl], c
	ld c, a
	dec b
	ret z 
	jr .loop

NoteSoundPointers:
	dw SFX_SecretLabNotesD#
	dw SFX_SecretLabNotesE
	dw SFX_SecretLabNotesG
	dw SFX_SecretLabNotesG#
	dw SFX_SecretLabNotesA
	dw SFX_SecretLabNotesA#
	dw SFX_SecretLabNotesB

; this is the password to get through the big metal doors in the secret lab, 0 is the leftmost button and 7 is the rightmost button
NotePassword:
	db 1, 0, 6, 5, 2, 3, 4 ; and ends with 5 as the last note which doesn't need storing


CheckWalkingToDoor:
	CheckEvent EVENT_SECRET_LAB_WALKING_IN_FRONT_OF_DOOR
	ret z
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz
	ResetEvent EVENT_SECRET_LAB_WALKING_IN_FRONT_OF_DOOR
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	call UpdateSprites
	xor a
	ld [wJoyIgnore], a
	SetEvent EVENT_OPENED_SECRET_LAB_BARRICADE
	call SecretLabShakeScreen
	lb bc, 11, 2
	ld a, $31
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	call SecretLabShakeScreen
	call OpenBarricadeDoor
	ld c, 60
	rst _DelayFrames
	jp PlayEnhancedSecretLabMusic

SecretLabShakeScreen:
	ld a, SFX_NOISE_INSTRUMENT06
	ld b, 30
	call ShakeScreenBasic
	ld a, SFX_INTRO_CRASH
	rst _PlaySound
	ret
FarShakeScreen:
	ld a, d ; sfx that will play while shaking
	ld b, e ; how many "shakes"
ShakeScreenBasic:
	push af
	ldh a, [hSCX]
	ld d, a
	ld e, 1
.shakeLoop ; scroll the BG left and right and play a sound effect
	ld a, e
	xor $fe
	ld e, a
	add d
	ldh [hSCX], a
	pop af
	push af
	push bc
	rst _PlaySound
	pop bc
	ld c, 2
	rst _DelayFrames
	dec b
	jr nz, .shakeLoop
	pop af
	ld a, d
	ldh [hSCX], a
	ret

CheckToggleMachineDoor:
	ld a, [wXCoord]
	cp 5
	jp nz, CheckNoteButtons.resetButtons
	CheckEvent EVENT_STANDING_ON_MACHINE_DOOR_BUTTON
	ret nz
	; fall through
ToggleMachineDoor:
	SetEvent EVENT_STANDING_ON_MACHINE_DOOR_BUTTON
	ld a, SFX_TELEPORT_ENTER_2
	rst _PlaySound
	ld a, SFX_GO_INSIDE
	call PlaySoundWaitForCurrent
ToggleMachineDoorQuick:
	CheckAndResetEvent EVENT_OPENED_MACHINE_DOOR
	lb bc, 3, 3
	ld a, $34
	jr z, .open
	xor a
.open
	ld [wNewTileBlockID], a
	push af
	predef ReplaceTileBlock
	pop af
	and a
	ret z
	SetEvent EVENT_OPENED_MACHINE_DOOR
	ret

CheckMewtwoTransform:
	CheckEvent EVENT_STARTED_MEWTWO_TRANSFORMATION
	ret z
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz
	ResetEvent EVENT_STARTED_MEWTWO_TRANSFORMATION
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	call UpdateSprites
	xor a
	ld [wJoyIgnore], a
	ld a, TEXT_SECRETLAB_MEWTWO_TRANSFORMATION
	ldh [hTextID], a
	jp DisplayTextID

SecretLabFailedClones::
	ld b, TEXT_SECRETLAB_FAILED_CLONES
	jr SecretLabCheckDisplayTextID

SecretLabComputers::
	ld b, TEXT_SECRETLAB_COMPUTERS
	jr SecretLabCheckDisplayTextID

SecretLabMewtwoMachine::
	ld b, TEXT_SECRETLAB_MEWTWO_MACHINE
	; fall through
SecretLabCheckDisplayTextID:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	ld a, b
	ldh [hTextID], a
	jp DisplayTextID


SecretLabTrainerHeaders:
	def_trainers 5
SecretLabTrainerHeader0:
	trainer EVENT_BEAT_SECRET_LAB_SOLDIER_0, 0, SecretLabBattleText1, SecretLabEndBattleText1, SecretLabAfterBattleText1
SecretLabTrainerHeader1:
	trainer EVENT_BEAT_SECRET_LAB_SOLDIER_1, 0, SecretLabBattleText2, SecretLabEndBattleText2, SecretLabAfterBattleText2
SecretLabTrainerHeader2:
	trainer EVENT_BEAT_SECRET_LAB_CHIEF, 0, SecretLabBattleText3, SecretLabEndBattleText3, SecretLabAfterBattleText3
	db -1 ; end

SecretLab_TextPointers:
	dw 0 ; can't speak to soldier 1 manually
	dw 0 ; can't speak to soldier 2 manually
	dw 0 ; can't speak to chief manually
	const_def 4
	dw_const SecretLabMewMachineText,        TEXT_SECRETLAB_MEW_MACHINE
	dw_const SecretLab_EngageTrainerText,    TEXT_SECRETLAB_ENGAGE_TRAINER
	dw_const SecretLab_AfterBattleText,      TEXT_SECRETLAB_AFTER_BATTLE
	dw_const SecretLabFailedClonesText,      TEXT_SECRETLAB_FAILED_CLONES
	dw_const SecretLabComputersText,         TEXT_SECRETLAB_COMPUTERS
	dw_const SecretLabMewtwoMachineText,     TEXT_SECRETLAB_MEWTWO_MACHINE
	dw_const SecretLabMewtwoTransformation,  TEXT_SECRETLAB_MEWTWO_TRANSFORMATION

SecretLab_EngageTrainerText:
	text_asm
	CheckEvent EVENT_BEAT_SECRET_LAB_SOLDIER_0
	ld hl, SecretLabTrainerHeader0
	ld a, SECRETLAB_SOLDIER1
	jr z, .startTrainer
	CheckEvent EVENT_BEAT_SECRET_LAB_SOLDIER_1
	ld hl, SecretLabTrainerHeader1
	ld a, SECRETLAB_SOLDIER2
	jr z, .startTrainer
	ld a, 13
	ld [wGymLeaderNo], a ; turns on gym leader music for chief battle
	ld hl, SecretLabTrainerHeader2 
	ld a, SECRETLAB_CHIEF
.startTrainer
	ld [wSpriteIndex], a
	call TalkToTrainer
	ld hl, wStatusFlags7
	res BIT_USE_CUR_MAP_SCRIPT, [hl]
	; end text
	SetEvent EVENT_SECRET_LAB_BATTLE_COMPLETED
	rst TextScriptEnd

SecretLab_AfterBattleText:
	text_asm
	ld hl, SecretLabTrainerHeader0
	CheckEvent EVENT_BEAT_SECRET_LAB_SOLDIER_1
	jr z, .printText
	ld hl, SecretLabTrainerHeader1
	CheckEvent EVENT_BEAT_SECRET_LAB_CHIEF
	jr z, .printText
	ld hl, SecretLabTrainerHeader2 
.printText
	ld a, 3
	call GetAddressFromPointerArray
	rst _PrintText
	rst TextScriptEnd

SecretLabBattleText1:
	text_far _SecretLabBattleText1
	text_end

SecretLabEndBattleText1:
	text_far _SecretLabEndBattleText1
	text_end

SecretLabAfterBattleText1:
	text_far _SecretLabAfterBattleText1
	text_end

SecretLabBattleText2:
	text_far _SecretLabBattleText2
	text_end

SecretLabEndBattleText2:
	text_far _SecretLabEndBattleText2
	text_end

SecretLabAfterBattleText2:
	text_far _SecretLabAfterBattleText2
	text_end

SecretLabBattleText3:
	text_far _SecretLabBattleText3
	text_end

SecretLabEndBattleText3:
	text_far _SecretLabEndBattleText3
	text_end

SecretLabAfterBattleText3:
	text_far _SecretLabAfterBattleText3
	text_end

SecretLabFailedClonesText:
	text_asm
	ld a, [wHiddenObjectFunctionArgument]
	ld hl, SecretLabFailedClonesTextPointers
	call GetAddressFromPointerArray
	rst _PrintText
	rst TextScriptEnd

SecretLabFailedClonesTextPointers:
	dw SecretLabFailedClone1Text
	dw SecretLabFailedClone2Text
	dw SecretLabFailedClone3Text
	dw SecretLabFailedClone4Text
	dw SecretLabFailedClone5Text
	dw SecretLabFailedClone6Text
	dw SecretLabFailedClone7Text
	dw SecretLabFailedClone8Text

SecretLabFailedClone1Text:
	text_far _SecretLabFailedClone1Text
	text_end
SecretLabFailedClone2Text:
	text_far _SecretLabFailedClone2Text
	text_end
SecretLabFailedClone3Text:
	text_far _SecretLabFailedClone3Text
	text_end
SecretLabFailedClone4Text:
	text_far _SecretLabFailedClone4Text
	text_end
SecretLabFailedClone5Text:
	text_far _SecretLabFailedClone5Text
	text_end
SecretLabFailedClone6Text:
	text_far _SecretLabFailedClone6Text
	text_end
SecretLabFailedClone7Text:
	text_far _SecretLabFailedClone7Text
	text_end
SecretLabFailedClone8Text:
	text_far _SecretLabFailedClone8Text
	text_end

SecretLabComputersText:
	text_asm
	ld a, SFX_ENTER_PC
	rst _PlaySound
	ld a, [wHiddenObjectFunctionArgument]
	ld hl, SecretLabComputersTextPointers
	call GetAddressFromPointerArray
	rst _PrintText
	rst TextScriptEnd
	
SecretLabComputersTextPointers:
	dw SecretLabComputer1Text
	dw SecretLabComputer2Text
	dw SecretLabComputer3Text
	dw SecretLabComputer4Text

SecretLabComputer1Text:
	text_far _SecretLabComputer1Text
	text_end
SecretLabComputer2Text:
	text_far _SecretLabComputer2Text
	text_end
SecretLabComputer3Text:
	text_far _SecretLabComputer3Text
	text_end
SecretLabComputer4Text:
	text_far _SecretLabComputer4Text
	text_end

SecretLabMewtwoMachineText:
	text_asm
	ld d, MEWTWO
	callfar FindPokemonInParty
	jr c, .foundMewtwo
	ld d, ARMORED_MEWTWO
	callfar FindPokemonInParty
	jr c, .foundMewtwo
	ld hl, SecretLabMewtwoMachineText1
	rst _PrintText
	rst TextScriptEnd
.foundMewtwo
	ld hl, SecretLabMewtwoReactionText
	rst _PrintText
	CheckEvent EVENT_OPENED_MACHINE_DOOR
	jr nz, .doorOpen
	ld hl, SecretLabMewtwoReactionText3
	rst _PrintText
	rst TextScriptEnd
.doorOpen
	xor a ; NORMAL_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	dec a
	ld [wUpdateSpritesEnabled], a
	call SaveScreenTilesToBuffer2
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call ReloadTilesetTilePatterns
	call Delay3
	call LoadGBPal
	pop af
	ld hl, SecretLabMewtwoForgetItText
	jr c, .done
	ld a, [wCurPartySpecies]
	cp MEWTWO
	jr z, .success
	cp ARMORED_MEWTWO
	jr z, .success
	ld hl, SecretLabMewtwoReactionText4
	rst _PrintText
	rst TextScriptEnd
.success
	ld hl, PlayerMewtwoTransformMoveScript
	ld de, wSimulatedJoypadStatesEnd
	ld bc, 5
	rst _CopyData
	ld a, 5
	ld [wSimulatedJoypadStatesIndex], a
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, [wXCoord]
	cp 7
	jr nz, .startTransform
	ld a, 6
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_LEFT
	ld de, wSimulatedJoypadStatesEnd + 5
	ld [de], a
.startTransform
	SetEvent EVENT_STARTED_MEWTWO_TRANSFORMATION
	ld hl, SecretLabMewtwoHereWeGoText
.done
	rst _PrintText
	rst TextScriptEnd

PlayerMewtwoTransformMoveScript:: ; these happen in reverse order
	db D_LEFT
	db D_DOWN
	db D_DOWN
	db D_UP
	db D_LEFT

SecretLabMewtwoMachineText1:
	text_far _SecretLabMewtwoMachineText
	text_end

SecretLabMewtwoReactionText:
	text_far _SecretLabMewtwoReactionText
	text_end

SecretLabMewtwoReactionText3:
	text_far _SecretLabMewtwoReactionText3
	text_end

SecretLabMewtwoReactionText4:
	text_far _SecretLabMewtwoReactionText4
	text_end

SecretLabMewtwoForgetItText:
	text_far _GenericForgetItText
	text_end

SecretLabMewtwoHereWeGoText:
	text_far _SecretLabMewtwoHereWeGoText
	text_end

SecretLabMewMachineText:
	text_asm
	ld d, MEW
	callfar FindPokemonInParty
	jr c, .foundMew
	ld hl, SecretLabMewMachineText1
	rst _PrintText
	rst TextScriptEnd
.foundMew
	ld hl, SecretLabMewReactionText
	rst _PrintText
	; play a slightly off-sounding mew cry
	ld a, 246
	ld [wFrequencyModifier], a
	ld a, 255
	ld [wTempoModifier], a
	ld a, SFX_CRY_1E
	rst _PlaySound
	rst TextScriptEnd

SecretLabMewMachineText1:
	text_far _SecretLabMewMachineText
	text_end

SecretLabMewReactionText:
	text_far _SecretLabMewReactionText
	text_end

SecretLabMewtwoTransformation:
	text_asm
	call StopAllMusic
	ld a, SFX_ENTER_PC
	rst _PlaySound
	ld hl, SecretLabMewtwoTransformText
	rst _PrintText
	ld a, [wCurPartySpecies]
	cp MEWTWO
	jr z, .resultArmoredMewtwo
	cp ARMORED_MEWTWO
	jr z, .resultMewtwo
	ret
.resultArmoredMewtwo
	ld a, ARMORED_MEWTWO
	ld [wCurPartySpecies], a
	ld hl, SecretLabMewtwoTransformArmorText
	rst _PrintText
	call SecretLabMewtwoTransformRumble
	ld a, SFX_INTRO_RAISE
	rst _PlaySound
	ld c, 20
	rst _DelayFrames
	call SecretLabMewtwoTransformRumble
	ld a, SFX_INTRO_RAISE
	rst _PlaySound
	ld c, 40
	rst _DelayFrames
	call .animationStart
	ld hl, SecretLabMewtwoGotArmorText
	rst _PrintText
	jr .done
.resultMewtwo
	ld a, MEWTWO
	ld [wCurPartySpecies], a
	ld hl, SecretLabMewtwoTransformNormalText
	rst _PrintText
	ld a, SFX_INTRO_RAISE
	rst _PlaySound
	call SecretLabMewtwoTransformRumble
	ld c, 20
	rst _DelayFrames
	ld a, SFX_INTRO_RAISE
	rst _PlaySound
	call SecretLabMewtwoTransformRumble
	ld c, 40
	rst _DelayFrames
	call .animationStart
	ld hl, SecretLabMewtwoRemovedArmorText
	rst _PrintText
	jr .done
.animationStart
	ld a, MEWTWO
	ld [wWholeScreenPaletteMonSpecies], a
	ld a, SFX_INTRO_WHOOSH
	rst _PlaySound
	ld c, 60
	rst _DelayFrames
	call ToggleMachineDoorQuick
	ld a, SFX_GO_INSIDE
	rst _PlaySound
	call SaveScreenTilesToBuffer2
	ld c, 20
	rst _DelayFrames
	ld a, SFX_INTRO_LUNGE
	rst _PlaySound
	call GBFadeOutToWhite
	SetFlag FLAG_HIDE_PLAYER_SPRITE
	call UpdateSprites
	call ClearScreen
	call GBPalNormal
	call Delay3
	ld b, SET_PAL_GENERIC
	call RunPaletteCommand
	hlcoord 7, 4
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a ; getmonheader input pokemon
	call GetMonHeader ; load pokemon picture location
	call LoadFlippedFrontSpriteByMonIndex
	ld a, [wCurPartySpecies]
	jp PlayCry
.done
	ld c, 30
	rst _DelayFrames
	callfar ChangePartyPokemonSpecies
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call ReloadTilesetTilePatterns
	ResetFlag FLAG_HIDE_PLAYER_SPRITE
	call UpdateSprites
	call GBFadeInFromWhite
	ld hl, SecretLabMewtwoTransformCompleteText
	rst _PrintText
	ld a, SFX_TURN_OFF_PC
	rst _PlaySound
	ld c, 20
	rst _DelayFrames
	call PlayEnhancedSecretLabMusic
	rst TextScriptEnd

SecretLabMewtwoTransformText:
	text_far _SecretLabMewtwoTransformText
	text_end

SecretLabMewtwoTransformArmorText:
	text_far _SecretLabMewtwoTransformArmorText
	text_end

SecretLabMewtwoTransformNormalText:
	text_far _SecretLabMewtwoTransformNormalText
	text_end

SecretLabMewtwoGotArmorText:
	text_far _SecretLabMewtwoGotArmorText
	sound_get_item_2
	text_end

SecretLabMewtwoRemovedArmorText:
	text_far _SecretLabMewtwoRemovedArmorText
	sound_get_item_1
	text_end

SecretLabMewtwoTransformCompleteText:
	text_far _SecretLabMewtwoTransformCompleteText
	text_end


SecretLabMewtwoTransformRumble:
	ld b, 20
.rumbleLoop
	push bc
	ld a, SFX_NOISE_INSTRUMENT06
	rst _PlaySound
	pop bc
	ld c, 2
	rst _DelayFrames
	dec b
	jr nz, .rumbleLoop
	ret