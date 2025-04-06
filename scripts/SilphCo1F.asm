; PureRGBnote: ADDED: new trainers in this location. Only after defeating giovanni on 11F though.
; PureRGBnote: ADDED: this map is also used for the abandoned building left of silph co.

SilphCo1F_Script:
	call SilphCo1FOnMapLoad
	call CheckForceTalkToEntranceRocket
	call CheckFloatingWeezingAnimation
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo1FTrainerHeaders
	ld de, SilphCo1F_ScriptPointers
	ld a, [wSilphCo1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo1FCurScript], a
	ret

SilphCo1FOnMapLoad:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	ld a, [wXCoord]
	cp 30
	call nc, SilphCo1FCheckHideRockets
SilphCo1FReplaceTilesCheck::
	ld a, [wXCoord]
	cp 42
	ret nc
	cp 36
	ret c
	ld hl, vTileset tile 1
	ld de, Facility_GFX tile $32
	lb bc, BANK(Facility_GFX), 1
	call CopyVideoData
	ld hl, vTileset tile 5
	ld de, VerticalPipeTiles
	lb bc, BANK(VerticalPipeTiles), 6
	jp CopyVideoData

SilphCo1FCheckHideRockets:
	; don't want to make new hide/show variables so I'm just moving them off screen conditionally
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ret z
	ld hl, wSprite06StateData2MapY
	call .moveOffScreen
	ld hl, wSprite07StateData2MapY
	call .moveOffScreen
	ld hl, wSprite08StateData2MapY
	call .moveOffScreen
	jp UpdateSprites
.moveOffScreen
	ld a, 0 + 4
	ld [hli], a
	ld [hl], 36 + 4
	ret

CheckForceTalkToEntranceRocket:
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ret nz
	CheckEvent EVENT_SOLVED_ROCKET_PASSWORD
	ret nz
	ld a, [wXCoord]
	cp 56
	ret nz
	ld a, [wYCoord]
	cp 11
	ret nz
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld a, TEXT_SILPHCO1F_ROCKET1
	ldh [hTextID], a
	; force talking to 
	jp DisplayTextID


SilphCo1F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SILPHCO1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHCO1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHCO1F_END_BATTLE

SilphCo1F_TextPointers:
	def_text_pointers
	dw_const SilphCo1FTrainer1Text,         TEXT_SILPHCO1F_FIREFIGHTER1
	dw_const SilphCo1FTrainer2Text,         TEXT_SILPHCO1F_SOLDIER1
	dw_const SilphCo1FTrainer3Text,         TEXT_SILPHCO1F_SOLDIER2
	dw_const SilphCo1FTrainer4Text,         TEXT_SILPHCO1F_FIREFIGHTER2
	dw_const SilphCo1FLinkReceptionistText, TEXT_SILPHCO1F_LINK_RECEPTIONIST
	dw_const SaffronAbandonedBuildingRocket1Text, TEXT_SILPHCO1F_ROCKET1
	dw_const SaffronAbandonedBuildingRocket2Text, TEXT_SILPHCO1F_ROCKET2
	dw_const SaffronAbandonedBuildingRocket3Text, TEXT_SILPHCO1F_ROCKET3
	dw_const DoRet, TEXT_SILPHCO1F_WEEZING_PROXY
	dw_const SaffronAbandonedBuildingBrokenStairs, TEXT_SILPHCO1F_BROKEN_STAIRS
	dw_const SaffronAbandonedBuildingHeliumPipeText, TEXT_SILPHCO1F_HELIUM_PIPE
	dw_const SaffronAbandonedBuildingWeezingText, TEXT_WEEZING_STARTED_FLOATING

SilphCo1FTrainerHeaders:
	def_trainers 0
SilphCo1FTrainerHeader0:
	trainer EVENT_BEAT_SILPH_CO_1F_TRAINER_0, 0, SilphCo1FBattleText1, SilphCo1FEndBattleText1, SilphCo1FAfterBattleText1
SilphCo1FTrainerHeader1:
	trainer EVENT_BEAT_SILPH_CO_1F_TRAINER_1, 0, SilphCo1FBattleText2, SilphCo1FEndBattleText2, SilphCo1FAfterBattleText2
SilphCo1FTrainerHeader2:
	trainer EVENT_BEAT_SILPH_CO_1F_TRAINER_2, 0, SilphCo1FBattleText3, SilphCo1FEndBattleText3, SilphCo1FAfterBattleText3
SilphCo1FTrainerHeader3:
	trainer EVENT_BEAT_SILPH_CO_1F_TRAINER_3, 0, SilphCo1FBattleText4, SilphCo1FEndBattleText4, SilphCo1FAfterBattleText4
	db -1 ;end

SilphCo1FTrainer1Text:
	text_asm
	ld hl, SilphCo1FTrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

SilphCo1FBattleText1:
	text_far _SilphCo1FBattleText1
	text_end

SilphCo1FEndBattleText1:
	text_far _SilphCo1FEndBattleText1
	text_end

SilphCo1FAfterBattleText1:
	text_far _SilphCo1FAfterBattleText1
	text_end

SilphCo1FTrainer2Text:
	text_asm
	ld hl, SilphCo1FTrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

SilphCo1FBattleText2:
	text_far _SilphCo1FBattleText2
	text_end

SilphCo1FEndBattleText2:
	text_far _SilphCo1FEndBattleText2
	text_end

SilphCo1FAfterBattleText2:
	text_far _SilphCo1FAfterBattleText2
	text_end

SilphCo1FTrainer3Text:
	text_asm
	ld hl, SilphCo1FTrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

SilphCo1FBattleText3:
	text_far _SilphCo1FBattleText3
	text_end

SilphCo1FEndBattleText3:
	text_far _SilphCo1FEndBattleText3
	text_end

SilphCo1FAfterBattleText3:
	text_far _SilphCo1FAfterBattleText3
	text_end

SilphCo1FTrainer4Text:
	text_asm
	ld hl, SilphCo1FTrainerHeader3
	call TalkToTrainer
	rst TextScriptEnd

SilphCo1FBattleText4:
	text_far _SilphCo1FBattleText4
	text_end

SilphCo1FEndBattleText4:
	text_far _SilphCo1FEndBattleText4
	text_end

SilphCo1FAfterBattleText4:
	text_far _SilphCo1FAfterBattleText4
	text_end

SilphCo1FLinkReceptionistText:
	text_far _SilphCo1FLinkReceptionistText
	text_end

SaffronAbandonedBuildingRocket1Text:
	text_asm
	call SaveScreenTilesToBuffer2
	CheckEvent EVENT_SOLVED_ROCKET_PASSWORD
	ld hl, .guess
	jr nz, .printDone
	ld hl, .password
	rst _PrintText
	ld hl, RocketPasswordMenu
	ld b, A_BUTTON | B_BUTTON
	call DisplayMultiChoiceTextBox
	push af
	call LoadScreenTilesFromBuffer2
	pop af
	jr nz, .failed
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .seriously
	jr z, .failedPrint
	dec a
	ld hl, .evenMean
	jr z, .failedPrint
	dec a
	jr z, .passwordGot
	ld hl, .dennis
.failedPrint
	rst _PrintText
.failed
	ld a, D_RIGHT
	ld hl, wSimulatedJoypadStatesEnd
	ld [hli], a
	ld [hli], a
	ld [hl], -1
	ld a, 2
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld hl, .getOut
.printDone
	rst _PrintText
	rst TextScriptEnd
.passwordGot
	SetEvent EVENT_SOLVED_ROCKET_PASSWORD
	ld hl, .correct
	jr .printDone
.password
	text_far _SaffronAbandonedBuildingRocket1
	text_end
.getOut
	text_far _SaffronAbandonedBuildingRocket1GetOut
	text_end
.seriously
	text_far _SaffronAbandonedBuildingRocket1Seriously
	text_end
.evenMean
	text_far _SaffronAbandonedBuildingRocket1Brocket
	text_end
.dennis
	text_far _SaffronAbandonedBuildingRocket1Dennis
	text_end
.guess
	text_far _SaffronAbandonedBuildingRocket1Guess
	text_end
.correct
	text_far _SaffronAbandonedBuildingRocket1Sprocket
	text_end


SaffronAbandonedBuildingRocket2Text:
	text_far _SaffronAbandonedBuildingRocket2
	text_end

SaffronAbandonedBuildingRocket3Text:
	text_far _SaffronAbandonedBuildingRocket3 
	text_end

SaffronAbandonedBuildingBrokenStairs:
	text_far _SaffronAbandonedBuildingStairs
	text_end

SaffronAbandonedBuildingHeliumPipe::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	ld a, TEXT_SILPHCO1F_HELIUM_PIPE
	ldh [hTextID], a
	call DisplayTextID
	CheckEvent EVENT_FLOATING_WEEZING_ANIMATION
	ret z
	; make player walk down one step
	ld a, D_DOWN
	ld hl, wSimulatedJoypadStatesEnd
	ld [hli], a
	ld [hl], -1
	ld a, 1
	ld [wSimulatedJoypadStatesIndex], a
	jp StartSimulatingJoypadStates

SaffronAbandonedBuildingHeliumPipeText:
	text_asm
	ld de, PowerPlantRoofRain
	call PlayNewSoundChannel8
	ld hl, .pipeAir
	rst _PrintText
	ld de, StopSFXSound
	call PlayNewSoundChannel8
	callfar GenericShowPartyMenuSelection
	ld hl, .forgetIt
	jr c, .printDone
	call GetPartyMonName2
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Species
 	ld bc, wPartyMon2 - wPartyMon1
  	call AddNTimes
  	ld a, [hl]
  	cp WEEZING
  	jr z, .weezing
  	cp KOFFING
  	ld hl, .koffing
  	jr z, .printDone
  	cp FLOATING_WEEZING 
  	ld hl, .already
  	jr z, .printDone
  	ld hl, .wrongMon
.printDone
	rst _PrintText
	rst TextScriptEnd
.weezing
	SetEvent EVENT_FLOATING_WEEZING_ANIMATION
	ld a, FLOATING_WEEZING
	ld [wCurPartySpecies], a
	callfar ChangePartyPokemonSpecies ; change weezing into floating weezing
	ld hl, .weezingText
	jr .printDone
.pipeAir
	text_far _SaffronAbandonedBuildingSteamPipe
	text_end
.forgetIt
	text_far _GenericForgetItText
	text_end
.wrongMon
	text_far _SecretLabMewtwoReactionText4
	text_end
.koffing
	text_far _SaffronAbandonedBuildingKoffing
	text_end
.already
	text_far _SaffronAbandonedBuildingAlready
	text_end
.weezingText
	text_far _SaffronAbandonedBuildingWeezing
	text_end

CheckFloatingWeezingAnimation:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz ; wait for player to finish walking
	CheckAndResetEvent EVENT_FLOATING_WEEZING_ANIMATION
	ret z
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	; make player face up
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	call UpdateSprites
	ld hl, wSprite09StateData2MapY
	ld a, [wYCoord]
	add 3 
	ld [hli], a
	ld a, [wXCoord]
	add 4 
	ld [hl], a
	call UpdateSprites
	ld de, vNPCSprites tile $3C
	callfar DoBallPoofOnNPC
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	jr nz, .weezingSprite
	call .loadSeelSprite
	jr .doneSpriteReplace
.weezingSprite
	; load weezing sprite into vram
	call .loadWeezingSprite
.doneSpriteReplace
	ld a, SILPHCO1F_WEEZING_PROXY
	ldh [hSpriteIndex], a
	ld de, GasSound
	callfar FloatingAnimation
	ld de, StopSFXSound
	call PlayNewSoundChannel8
	ld a, TEXT_WEEZING_STARTED_FLOATING
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ld [wMuteAudioAndPauseMusic], a
	ld c, 60
	rst _DelayFrames
	ld de, vNPCSprites tile $3C
	callfar DoBallPoofOnNPC
	ld hl, wSprite09StateData2MapY
	; move it back offscreen
	ld [hl], 0 + 4
	inc hl
	ld [hl], 36 + 4
	jp UpdateSprites
.loadSeelSprite
	ld hl, vNPCSprites tile $3C
	ld de, SeelSprite
	lb bc, BANK(SeelSprite), 4
	jp CopyVideoData
.loadWeezingSprite
	ld hl, vNPCSprites tile $3C
	ld de, PartyMonSprites1 tile 136
	lb bc, BANK(PartyMonSprites1), 2
	call CopyVideoData
	ld hl, vNPCSprites tile $3E
	ld de, PartyMonSprites1 tile 140
	lb bc, BANK(PartyMonSprites1), 2
	jp CopyVideoData

SaffronAbandonedBuildingWeezingText:
	text_far _SaffronAbandonedBuildingWeezing2
	sound_get_item_2
	text_far _MagnetMagnetonText3
	text_end
