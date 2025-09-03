; PureRGBnote: ADDED: This map is also used for the "Bottom of the seafoam cave lake" underwater area you see in the dragonair event.
SeafoamIslands1F_Script:
	call EnableAutoTextBoxDrawing
	ld a, [wXCoord]
	cp 32
	jp nc, DragonairUnderWaterEventAreaScript
	ld hl, wCurrentMapScriptFlags
	res BIT_CUR_MAP_LOADED_1, [hl]
	SetEvent EVENT_IN_SEAFOAM_ISLANDS
	ld hl, wMiscFlags
	bit BIT_PUSHED_BOULDER, [hl]
	res BIT_PUSHED_BOULDER, [hl]
	jr z, .noBoulderWasPushed
	ld hl, Seafoam1HolesCoords
	call CheckBoulderCoords
	ret nc
	EventFlagAddress hl, EVENT_SEAFOAM1_BOULDER1_DOWN_HOLE
	ld a, [wCoordIndex]
	cp $1
	jr nz, .boulder2FellDownHole
	SetEventReuseHL EVENT_SEAFOAM1_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_1F_BOULDER_1
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_B1F_BOULDER_1
	ld [wObjectToShow], a
	jr .hideAndShowBoulderObjects
.boulder2FellDownHole
	SetEventAfterBranchReuseHL EVENT_SEAFOAM1_BOULDER2_DOWN_HOLE, EVENT_SEAFOAM1_BOULDER1_DOWN_HOLE
	ld a, HS_SEAFOAM_ISLANDS_1F_BOULDER_2
	ld [wObjectToHide], a
	ld a, HS_SEAFOAM_ISLANDS_B1F_BOULDER_2
	ld [wObjectToShow], a
.hideAndShowBoulderObjects
	ld a, [wObjectToHide]
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, [wObjectToShow]
	ld [wMissableObjectIndex], a
	predef ShowObject
	jpfar BoulderHoleDropEffectDefault
.noBoulderWasPushed
	ld a, SEAFOAM_ISLANDS_B1F
	ld [wDungeonWarpDestinationMap], a
	ld hl, Seafoam1HolesCoords
	jp IsPlayerOnDungeonWarp

Seafoam1HolesCoords:
	dbmapcoord 17,  6
	dbmapcoord 24,  6
	db -1 ; end

SeafoamIslands1F_TextPointers:
	def_text_pointers
	dw_const BoulderText, TEXT_SEAFOAMISLANDS1F_BOULDER1
	dw_const BoulderText, TEXT_SEAFOAMISLANDS1F_BOULDER2
	dw_const DragonairEventErikText, TEXT_SEAFOAMISLANDS1F_ERIK
	dw_const DragonairEventSaraText, TEXT_SEAFOAMISLANDS1F_SARA
	dw_const DragonairEventCloysterText, TEXT_SEAFOAMISLANDS1F_CLOYSTER
	dw_const DragonairEventDragonairText1, TEXT_SEAFOAMISLANDS1F_DRAGONAIR1
	dw_const DragonairEventDragonairText2, TEXT_SEAFOAMISLANDS1F_DRAGONAIR2

DragonairUnderWaterEventAreaScript:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	jr z, .defaultScript
	bit 3, [hl]
	res 3, [hl]
	jp nz, .afterBattleScript
.mapLoadScript
	; play surf music, but at lower tempo and pitch
	ld c, BANK(Music_Surfing)
	ld a, MUSIC_SURFING
	call PlayMusic
	; remap channel 1 to not set the tempo
	ld de, Music_Surfing_Ch1_NoTempo
	ld hl, wChannelCommandPointers + CHAN1 * 2
	call RemapSoundChannel
	xor a
	ld [wMusicTempo], a
	ld a, $FF
	ld [wMusicTempo + 1], a
	ld a, %00010010 ; 1 octave lower 2 pitches higher
	ld hl, wChannelTranspositions
	ld [hli], a
	ld [hli], a
	ld [hl], a
	call SeafoamIslands1FLoadCustomTiles
	ld a, 3
	ld [wMapPalOffset], a
	jp LoadGBPal
.defaultScript
	ld a, [wStatusFlags5] ; is the player moving?
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz
	CheckEvent EVENT_DRAGONAIR_EVENT_BEAT_CLOYSTER
	jr nz, .beatCloyster
	ld a, [wXCoord]
	cp 36
	ret nz
	ld a, [wYCoord]
	cp 3
	ret nz
	; force player to talk to cloyster
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	ld a, TEXT_SEAFOAMISLANDS1F_CLOYSTER
	ldh [hTextID], a
	jp DisplayTextID
.beatCloyster
	ld a, [wYCoord]
	cp 2
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld [wWhichPokemon], a ; reload this, dragonair is guaranteed to be in first slot now
	call GetPartyMonName2
	ld a, TEXT_SEAFOAMISLANDS1F_ERIK
	ldh [hTextID], a
	call DisplayTextID
.warpOut
	xor a
	ld [wMapPalOffset], a
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	xor a
	ld [wWalkBikeSurfState], a
	; load warp back to house
	ld a, 5 ; 6th warp
	ld [wDestinationWarpID], a
	ld a, FUCHSIA_GOOD_ROD_HOUSE
	ldh [hWarpDestinationMap], a
	ld hl, wStatusFlags3
	set BIT_WARP_FROM_CUR_SCRIPT, [hl] ; scripted warp flag
	ret
.afterBattleScript
	ResetEvent EVENT_DRAGONAIR_EVENT_BATTLING_CLOYSTER
	ld a, [wBattleResult]
	dec a
	ret z ; do nothing if we lost the battle
	call .mapLoadScript
	ld a, [wBattleFunctionalFlags]
	bit 1, a
	jr nz, .forceWalkDown ; do nothing if we ran from battle
	ld a, [wEscapedFromBattle]
	and a
	jr nz, .forceWalkDown ; do nothing if we pokedoll'd out
	SetEvent EVENT_DRAGONAIR_EVENT_BEAT_CLOYSTER
	ld a, [wBattleResult]
	cp 2
	jr nz, .notCaught
	ld c, SEAFOAMISLANDS1F_CLOYSTER
	lb de, 20, 1
	callfar FarMoveSpriteOffScreen
	jr .doAutoMovement
.notCaught
	ld a, TEXT_SEAFOAMISLANDS1F_CLOYSTER
	ldh [hTextID], a
	call DisplayTextID
.doAutoMovement
	ld a, [wXCoord]
	cp 36
	jr z, .upOne
	ld hl, wSimulatedJoypadStatesEnd
	ld a, D_UP
	ld [hli], a
	ld [hli], a
	ld a, [wBattleResult]
	cp 2
	ld b, 2
	jr z, .caught
	inc b
	ld [hl], D_LEFT
	inc hl
.caught
	ld a, b
	ld [wSimulatedJoypadStatesIndex], a
	jp StartSimulatingJoypadStates
.upOne
	ld d, D_UP
	jpfar ForceStepFromDoor
.forceWalkDown
	SetEvent EVENT_DRAGONAIR_EVENT_FOUGHT_CLOYSTER_ONCE
	ld a, [wYCoord]
	cp 3
	ret nz
	jpfar ForceStepOutFromDoor



SeafoamIslands1FCheckLoadCustomTiles::
	ld a, [wXCoord]
	cp 32
	ret c
SeafoamIslands1FLoadCustomTiles:
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	jr nz, .shellSprite
	ld hl, vNPCSprites tile $78
	ld de, FossilSprite
	lb bc, BANK(FossilSprite), 4
	call CopyVideoData 
	jr .doneLoad
.shellSprite
	call DragonairEventLoadCloysterSprite
.doneLoad
	; load "sand" tile onto default water tile
	ld hl, vTileset tile $14
	ld de, Cavern_GFX tile $05
	lb bc, BANK(Cavern_GFX), 1
	call CopyVideoData 
	; load custom "ice crystal" tiles
	ld hl, vTileset tile $3D
	ld de, IceCrystalLarge
	lb bc, BANK(IceCrystalLarge), 4
	call CopyVideoData 
	; load custom "seaweed" tiles
	ld hl, vTileset tile $23
	ld de, SeaweedTiles
	lb bc, BANK(SeaweedTiles), 1
	jp CopyVideoData 

Seafoam1FAnimatedTiles2::
	ld a, [wXCoord]
	cp 32
	ret c
	ldh a, [hMovingBGTilesCounter1]
	inc a
	ldh [hMovingBGTilesCounter1], a
	cp 40
	ret c
	cp 41
	ret z ; animate water tile
	ld de, vTileset tile $23
	ld a, [wMovingBGTilesCounter2]
	rrca
	ld hl, SeaweedTiles
	jr c, .gotTile
	ld hl, SeaweedTiles tile 1
.gotTile
	; copy tile
	ld c, 16
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	scf
	ret

DragonairEventErikText:
	text_asm
	CheckEvent EVENT_DRAGONAIR_EVENT_BEAT_CLOYSTER
	jp nz, DragonairEventTransformText
	CheckEvent EVENT_DRAGONAIR_EVENT_FOUGHT_CLOYSTER_ONCE
	jr z, .notFoughtCloyster
	ld hl, .leaveQuestion
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no
	call DragonairUnderWaterEventAreaScript.warpOut
.no
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	rst TextScriptEnd
.notFoughtCloyster
	CheckEvent EVENT_DRAGONAIR_EVENT_CLEARED_ONCE
	ld hl, .erikDefault
	jr z, .printDone
	ld hl, .erikReturn
.printDone
	rst _PrintText
	rst TextScriptEnd
.erikDefault
	text_far _DragonairEventErikText
	text_end
.leaveQuestion
	text_far _DragonairEventLeaveText
	text_end
.erikReturn
	text_far _DragonairEventErikReturnText
	text_end

DragonairEventSaraText:
	text_asm
	CheckEvent EVENT_DRAGONAIR_EVENT_FOUGHT_CLOYSTER_ONCE
	jr nz, .foughtOnce
	CheckEvent EVENT_DRAGONAIR_EVENT_CLEARED_ONCE
	ld hl, .saraDefault
	jr z, .printDone
	ld hl, .saraReturn
	jr .printDone
.foughtOnce
	ld hl, .frigginCloyster
	rst _PrintText
	ld a, SFX_HEAL_HP
	rst _PlaySound
	call GBFadeOutToWhite
	ld a, SFX_HEAL_AILMENT
	call PlaySoundWaitForCurrent
	predef HealParty
	call LoadGBPal
	ld hl, .dontGiveUp
.printDone
	rst _PrintText
	rst TextScriptEnd
.saraDefault
	text_far _DragonairEventSaraText
	text_end
.frigginCloyster
	text_far _DragonairEventHealText
	text_end
.dontGiveUp
	text_far SilphCo9FNurseDontGiveUpText
	text_end
.saraReturn
	text_far _DragonairEventSaraReturnText
	text_end

DragonairEventDragonairText1:
	text_far _DragonairEventDragonairText1
	text_asm
	jr Seafoam1FDoDragonairCry

DragonairEventDragonairText2:
	text_far _DragonairEventDragonairText2
	text_asm
Seafoam1FDoDragonairCry:
	ld a, DRAGONAIR
	call PlayCry
	rst TextScriptEnd

DragonairEventCloysterText:
	text_asm
	CheckEvent EVENT_DRAGONAIR_EVENT_BEAT_CLOYSTER
	jr z, .notBeaten
	ld hl, .beaten
	rst _PrintText
	rst TextScriptEnd
.notBeaten
	call DragonairEventOpenUpCloysterSprite
	ld hl, .initial
	rst _PrintText
	ld a, CLOYSTER
	call PlayCry
	call DisplayTextPromptButton
	ld hl, .initial2
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no
.yes
	; make player re-choose dragonair since it's position in the party could've changed
	callfar ChooseDragonairForEvent
	ld a, [wWhichPokemon]
	cp $FF
  	ld hl, .lowLevel
  	jr z, .printNo
  	cp $FD
  	jr nc, .promptNo
  	push af
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1HP
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld a, [hli]
	or [hl]
	jr nz, .good
	pop af
	ld hl, .noWill
	rst _PrintText
	jr .no
.good
	pop af
  	and a
  	jr z, .noSwapMon
  	ld a, 1
  	ld [wMenuItemToSwap], a
  	callfar SwitchPartyMon_InitVarOrSwapData ; put dragonair in first party slot
.noSwapMon
	call DragonairEventOpenUpCloysterSprite
	ld hl, .letsDoThis
	rst _PrintText
	callfar PlayTrainerMusic
	ld a, 1
	ld [wIsAltPalettePkmnData], a
	ld a, CLOYSTER
	ld [wEngagedTrainerClass], a
	ld a, 45
	ld [wEngagedTrainerSet], a
	ld a, SEAFOAMISLANDS1F_CLOYSTER
	ldh [hSpriteIndex], a ; makes cloyster stay on screen during battle transition
	call InitBattleEnemyParameters
	SetEvent EVENT_DRAGONAIR_EVENT_BATTLING_CLOYSTER
	rst TextScriptEnd
.printNo
	rst _PrintText
.promptNo
	call DisplayTextPromptButton
.no
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	call nz, DragonairEventLoadCloysterSprite
	ld a, [wYCoord]
	cp 3
	jr nz, .ready
	callfar ForceStepOutFromDoor
.ready
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	rst TextScriptEnd
.initial
	text_far _DragonairEventCloysterText
	text_end
.initial2
	text_far _DragonairEventCloysterText2
	text_end
.lowLevel
	text_far _DragonairEventLowLevelText
	text_end
.letsDoThis
	text_far _LetsDoThis
	text_end
.beaten
	text_far _DragonairEventCloysterBeatenText
	text_end
.noWill
	text_far _NoWillText
	text_end

DragonairEventOpenUpCloysterSprite:
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ret z
	ld hl, vNPCSprites tile $78
	ld de, PartyMonSprites2 tile 64
	lb bc, BANK(PartyMonSprites2), 4
	predef_jump CopyMenuSpritesVideoDataFar

DragonairEventLoadCloysterSprite:
	ld hl, vNPCSprites tile $78
	ld de, PartyMonSprites2 tile 66
	lb bc, BANK(PartyMonSprites2), 4
	predef_jump CopyMenuSpritesVideoDataFar

DragonairEventTransformText:
	CheckAndSetEvent EVENT_DRAGONAIR_EVENT_CLEARED_ONCE
	jr nz, .noEndingText
	SetEventReuseHL EVENT_DRAGONAIR_EVENT_ENDING_TEXT_TRIGGER
.noEndingText
	ld hl, .transformed
	rst _PrintText
	ld a, WINTER_DRAGONAIR
	ld [wCurPartySpecies], a
	callfar ChangePartyPokemonSpecies
	ld a, SFX_INTRO_WHOOSH
	rst _PlaySound
	call GBFadeOutToWhite
	call LoadGBPal
	ld hl, .transformed2
	rst _PrintText
	; make it learn ICE BEAM if it doesn't have it
	ld hl, wPartyMon1Moves
	ld b, NUM_MOVES
.loop
	ld a, [hli]
	cp ICE_BEAM
	jr z, .skipLearn
	dec b
	jr nz, .loop
	; doesn't have ice beam, trigger learning
	ld a, ICE_BEAM
	ld [wMoveNum], a
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyToStringBuffer
	call SaveScreenTilesToBuffer2
	; have to clear screen because the "choose move to forget" box renders below sprites
	call ClearScreen
	call Delay3
	predef LearnMove ; teach ice beam
	call LoadScreenTilesFromBuffer2
	call Delay3
.skipLearn
	CheckEvent EVENT_DRAGONAIR_EVENT_ENDING_TEXT_TRIGGER
	ld a, 1
	jr z, .noEndingText2
	ld hl, .transformed3
	rst _PrintText
	xor a
.noEndingText2
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	rst TextScriptEnd
.transformed2
	text_far _DragonairEventTransformText2
	text_end
.transformed
	text_far _DragonairEventTransformText
	text_end
.transformed3
	text_far _DragonairEventTransformText3
	text_end


SeaweedTiles:
	INCBIN "gfx/overworld/seaweed.2bpp"
