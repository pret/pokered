; PureRGBnote: ADDED: Entirely new volcano area with a lot of stuff. 
CinnabarVolcano_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	call nz, CinnabarVolcanoOnMapLoad
	call CheckForceTalkToProspector
	call CheckHoleDrillFinish
	call CheckStartVolcanoRumbling
	call CheckReassignFloodLavaWarp
	call CheckShowSurfableRhydon
	call CheckForceSurfDirection
	call CheckWaitForVolcanoSpriteWalk
	call MoltresBattleAnimation
	jp EnableAutoTextBoxDrawing

CinnabarVolcanoOnMapLoad:
	; TODO: remove debug stuff
	;SetEvent EVENT_GOT_LAVA_SUIT
	;SetEventReuseHL EVENT_GOT_DRILL
	;SetEventReuseHL EVENT_VOLCANO_BOMBED_FLOOR1
	;SetEventReuseHL EVENT_VOLCANO_BOMBED_FLOOR2
	;SetEventReuseHL EVENT_VOLCANO_BOMBED_FLOOR3
	;SetEventReuseHL EVENT_VOLCANO_BOMBED_FLOOR4
	;SetEventReuseHL EVENT_VOLCANO_DUG_TO_FLOOR1
	;SetEventReuseHL EVENT_VOLCANO_DUG_TO_FLOOR2
	;SetEventReuseHL EVENT_VOLCANO_DUG_TO_FLOOR3
	;SetEventReuseHL EVENT_VOLCANO_DUG_TO_FLOOR4
	;SetEventReuseHL EVENT_GAVE_GRAVELER_ROCK_SALTS
	;SetEventReuseHL EVENT_GAVE_RHYDON_LIMESTONE
	;SetEventReuseHL EVENT_FINISHED_VOLCANO
	;
	CheckEvent EVENT_BEAT_MOLTRES
	jr z, .dontHideVolcanoMoltres
	ld a, HS_VOLCANO_MOLTRES
	call VolcanoHideSpriteEntry
.dontHideVolcanoMoltres
	CheckAndResetEvent EVENT_IN_LAVA_FLOOD_ROOM
	ld a, 1
	jr z, .loadCooldown
	ld a, 150
.loadCooldown
	ld [wOverworldAnimationCooldown], a ; make sure the rumble animation doesn't start the moment we load the map
	CheckAndResetEvent EVENT_LAVA_FLOOD_ACTIVE
	call nz, LavaFloodResetAlways
	SetFlag FLAG_MAP_HAS_OVERWORLD_ANIMATION
	lda_coord 8, 9 ; tile player is standing on
	cp $01 ; entrance "carpet"
	jr z, .forceWalkUp
	cp $1A ; ladder on wall
	jr z, .forceWalkDown
	cp $1F ; cave entrance
	jr z, .forceWalkDown
.doneForcedWalk
	call VolcanoDoRoomSpecificMapLoadCode
	call RepositionRubies
	CheckEvent EVENT_GOT_LAVA_SUIT
	jr z, .next
	ld a, [wWalkBikeSurfState]
	cp SURFING
	jr z, .next
	ld a, WEARING_LAVA_SUIT
	ld [wWalkBikeSurfState], a
	call LoadLavaSuitSpriteGraphics
.next
	jp CheckIfVolcanoBattleOccurred
.forceWalkUp
	ld d, D_UP
	callfar ForceStepFromDoor
	jr .doneForcedWalk
.forceWalkDown
	callfar ForceStepOutFromDoor
	jr .doneForcedWalk

VolcanoDoRoomSpecificMapLoadCode::
	; entrance room is simple to check so check it without the coord range code
	call VolcanoCheckIfInEntrance
	jr nc, .notEntrance
.entrance
	; entrance on map load code
	; no volcano shaking in entrance room
	ResetFlag FLAG_MAP_HAS_OVERWORLD_ANIMATION
	; reset surf flag in entrance area so player can't automatically surf on lava
	ld hl, wStatusFlags1
	res BIT_AUTOSURF, [hl] ; reset autosurf bit
	CheckEvent EVENT_VOLCANO_TALKED_TO_BLAINE
	jr nz, .notLastConvo
	CheckEventReuseA EVENT_FINISHED_VOLCANO
	jr z, .notLastConvo
	; blaine in entrance
	ld hl, wSprite02StateData2MapY
	ld [hl], 3 + 4
	inc hl
	ld [hl], 2 + 4
	jp MakeBlaineAndProspectorWearLavaSuit
.notLastConvo
	CheckEvent EVENT_GOT_LAVA_SUIT
	ret z
	call ProspectorInMainRoom
	jp UpdateSprites
.notEntrance
	ld de, VolcanoMainRoomRange
	callfar FarArePlayerCoordsInRange
	jr c, .mainRoom
	ld de, VolcanoFloor1Range
	callfar FarArePlayerCoordsInRange
	jr c, .floor1
	ld de, VolcanoFloor2Range
	callfar FarArePlayerCoordsInRange
	jr c, .floor2
	ld de, VolcanoFloor3RangePart1
	callfar FarArePlayerCoordsInRange
	jr c, .floor3
	ld de, VolcanoFloor3RangePart2
	callfar FarArePlayerCoordsInRange
	jr c, .floor3
	ld de, VolcanoFloor4Range
	callfar FarArePlayerCoordsInRange
	jr c, .floor4
	ret
.mainRoom
	call ProspectorInMainRoom
	call MakeBlaineAndProspectorWearLavaSuit
	CheckEvent EVENT_VOLCANO_DUG_TO_FLOOR1
	ret z
	CheckEvent EVENT_FINISHED_VOLCANO
	jr z, .notFinished
	call CinnabarVolcanoReplaceMainRoomLava
.notFinished
	lb bc, 1, 16
	ld a, $3C
	jp ReplaceTileBlockEntry
.floor1
	ld hl, wStatusFlags1
	res BIT_AUTOSURF, [hl] ; reset autosurf bit to make sure entering main room that surfing from downstairs isn't still present
	CheckEvent EVENT_VOLCANO_DUG_TO_FLOOR2
	jr z, .skipLadderReplaceFloor1
	lb bc, 12, 6
	ld a, $28
	; we will redraw the map in the routine after this anyway so don't redraw to reduce lag
	call ReplaceTileBlockEntryNoRedraw
.skipLadderReplaceFloor1
	CheckEvent EVENT_VOLCANO_BOMBED_FLOOR1
	ret z
	jp VolcanoBombedFloor1ReplaceBlocks
.floor2
	CheckEvent EVENT_VOLCANO_DUG_TO_FLOOR3
	jr z, .skipLadderReplaceFloor2
	lb bc, 17, 21
	ld a, $28
	call ReplaceTileBlockEntryNoRedraw
.skipLadderReplaceFloor2
	CheckEvent EVENT_VOLCANO_BOMBED_FLOOR2
	ret z
	ld hl, VolcanoBombedFloor2ReplaceBlocks
	jp CallReplaceBlocksThenRedrawMap
.floor3
	SetEvent EVENT_IN_LAVA_FLOOD_ROOM
	CheckEvent EVENT_VOLCANO_DUG_TO_FLOOR4
	jr z, .skipLadderReplaceFloor3
	lb bc, 15, 1
	ld a, $3C
	call ReplaceTileBlockEntryNoRedraw
.skipLadderReplaceFloor3
	CheckEvent EVENT_VOLCANO_BOMBED_FLOOR3
	ret z
	ld hl, VolcanoBombedFloor3ReplaceBlocks
	jp CallReplaceBlocksThenRedrawMap
.floor4
	CheckAndSetEvent EVENT_ENTERED_FLOOR4_FIRST_TIME
	call z, ShowOnlyTwoRubies ; show the "rock salts" and "limestone" items by repositioning rubies again
.dontShowTwoRocks
	CheckEvent EVENT_GAVE_GRAVELER_ROCK_SALTS
	jr z, .dontMoveGraveler
	ld hl, wSprite12StateData2MapY
	ld [hl], 62 + 4
.dontMoveGraveler
	CheckEvent EVENT_GAVE_RHYDON_LIMESTONE
	jr z, .dontMoveSickRhydon
	ld hl, wSprite13StateData2MapY
	ld [hl], 62 + 4
.dontMoveSickRhydon
	CheckEvent EVENT_DEFEATED_VOLCANO_MAGMAR
	jr z, .dontMoveBossMagmar
	ld hl, wSprite14StateData2MapX
	ld [hl], 47 + 4
	CheckEvent EVENT_VOLCANO_BOMBED_FLOOR4
	jr z, .dontMoveBossMagmar
	call VolcanoFloor4TileBlockReplacements
	ld a, 62 + 4
	ld [wSprite14StateData2MapY], a
.dontMoveBossMagmar
	ld a, [wWalkBikeSurfState]
	cp SURFING
	ret z
	jp ShowSurfableRhydon

ReplaceTileBlockEntry:
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock
ReplaceTileBlockEntryNoRedraw:
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlockNoRedraw

RepositionRubies:
	CheckEvent EVENT_VOLCANO_BOMBED_FLOOR4
	ret nz
	CheckEventReuseA EVENT_VOLCANO_DUG_TO_FLOOR4
	jr nz, .4thFloor
	CheckEventReuseA EVENT_VOLCANO_DUG_TO_FLOOR3
	jr nz, .3rdFloor
	CheckEventReuseA EVENT_VOLCANO_DUG_TO_FLOOR2
	ret z
	; +4 map offset to actual coordinates
.2ndFloor
	lb bc, 47 + 4, 17 + 4
	lb de, 42 + 4, 24 + 4
	lb hl, 49 + 4, 22 + 4
	jr MoveRubyLocations
.4thFloor
	lb de, 13 + 4, 54 + 4
	lb hl, 27 + 4, 56 + 4
	jr MoveOnlyTwoRubyLocations
.3rdFloor
	lb bc, 23 + 4, 34 + 4
	lb de, 13 + 4, 46 + 4
	lb hl, 24 + 4, 40 + 4
	; fall through
MoveRubyLocations:
	ld a, b
	ld [wSprite05StateData2MapX], a
	ld a, c
	ld [wSprite05StateData2MapY], a
	; fall through
MoveOnlyTwoRubyLocations:
	ld a, d
	ld [wSprite06StateData2MapX], a
	ld a, e
	ld [wSprite06StateData2MapY], a
	ld a, h
	ld [wSprite07StateData2MapX], a
	ld a, l
	ld [wSprite07StateData2MapY], a
	ret

CheckHoleDrillFinish:
	CheckEvent EVENT_HOLE_DRILL_FINISHED
	ret z
	ld a, [wMovementFlags]
	bit BIT_EXITING_DOOR, a
	ret nz
	ResetEvent EVENT_HOLE_DRILL_FINISHED
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ret

CheckStartVolcanoRumbling:
	; occasionally, we will play a volcano rumbling noise and animation
	ld a, [wOverworldAnimationCooldown] ; cooldown after previous animation
	and a
	ret nz ; cooldown after animation completes must reach 0 before we try to run another animation
	; in lava flood room, rumbling is on a timer and not random.
	CheckEvent EVENT_IN_LAVA_FLOOD_ROOM
	ld b, 200
	jr nz, .next
	ld a, [wPlayerMovingDirection]
	and a
	jr z, .standing
	; randomly while walking the rumbling can be triggered (it will be more common because this is run less often while walking)
	call Random
	and %11111
	ret nz ; 1/32 chance of continuing
	jr .startRumbling
.standing
	; when standing, it can be randomly triggered as well (less common because this runs every frame while standing)
	call Random
	cp 4
	ret nc
	call Random
	and %111
	ret nz
	; we will reach this code around once every 8 seconds if we're running at 60fps
.startRumbling
	; check if sfx is already playing
	; play sfx
	call Random
	and %111100 ; number between 0 and 64 that's divisible by 4
	add 128 ; random length between 128 and 192 frames
	ld b, a
.next
	ld a, [wOverworldAnimationCounter]
	and a
	ret nz ; if the rumble is already happening, don't start it again
	ld a, b
	ld [wOverworldAnimationCounter], a
	ResetFlag FLAG_JIGGLE_TOGGLE
	ld de, SFX_Volcano_Rumble
	jp PlayNewSoundChannel8

LavaFloodReset::
	CheckEvent EVENT_IN_LAVA_FLOOD_ROOM
	ret z
	ld a, 200 ; shorter cooldown in lava flood area
	ld [wOverworldAnimationCooldown], a
LavaFloodResetAlways::
	; lava flood specific code
	ResetEvent EVENT_LAVA_FLOOD_ACTIVE
	ld hl, vChars2 tile $27
	ld de, Volcano_GFX tile $27
	call .copy
	ld hl, vChars2 tile $2A
	ld de, Volcano_GFX tile $2A
.copy
	lb bc, BANK(Volcano_GFX), 1
	jp CopyVideoData

CheckReassignFloodLavaWarp:
	CheckEvent EVENT_IN_LAVA_FLOOD_ROOM
	ret z
	ld a, [wXCoord]
	cp 2
	ld a, [wYCoord]
	jr nz, .rightCheck
	cp 37
	ret nz
	ld a, 19 ; 20th warp
	jr .loadWarp
.rightCheck
	cp 47
	ret nz
	ld a, [wXCoord]
	cp 47
	ret nz
	ld a, 20 ; 21st warp
.loadWarp
	ld [wWarpedFromWhichWarp], a
	ret
	
CheckShowSurfableRhydon:
	CheckEvent EVENT_SURFING_ON_RHYDON
	ret z
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz
	ld a, [wYCoord]
	cp 57
	ret nz
	ld a, [wXCoord]
	cp 4
	ret nz
ShowSurfableRhydon:
	ResetEvent EVENT_SURFING_ON_RHYDON
	ld a, HS_VOLCANO_SURFING_RHYDON
	jp VolcanoShowSpriteEntry

CheckForceSurfDirection::
	ld a, [wWalkBikeSurfState]
	cp SURFING
	ret nz
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz
	lda_coord 8, 9 ; tile below player
	cp $24 ; down flowing lava
	ld b, D_DOWN
	jr z, .forceInput
	ld a, [wYCoord]
	cp 53
	ret c ; prevents other direction lava currents from functioning when not on bottom floor
	lda_coord 8, 9 ; tile below player
	cp $23 ; right flowing lava
	ld b, D_RIGHT
	jr z, .forceInput
	cp $25 ; left flowing lava
	ld b, D_LEFT
	jr z, .forceInput
	cp $26 ; up flowing lava
	ld b, D_UP
	ret nz
.forceInput
	ld a, b
	ld hl, wSimulatedJoypadStatesEnd
	ld [hli], a
	ld [hl], -1
	ld a, 1
	ld [wSimulatedJoypadStatesIndex], a
	SetFlag FLAG_FAST_AUTO_MOVEMENT
	jp StartSimulatingJoypadStates


VolcanoDrillingResult::
	ld a, [wCurMap]
	cp CINNABAR_VOLCANO_WEST
	ret z
	CheckEvent EVENT_IN_LAVA_FLOOD_ROOM
	call z, StopVolcanoShaking
	ld hl, VolcanoDrillingJumpTable
FindInCoordJumpTable::
	ld a, [wXCoord]
	ld b, a
	ld a, [wYCoord]
	ld c, a
.loop
	ld a, [hli]
	cp b
	jr nz, .next
	ld a, [hli]
	cp c
	jr nz, .next2
	hl_deref
	jp hl
.next
	inc hl
.next2
	ld a, [hl]
	cp -1
	ret z ; TODO: behaviour when not on a special tile?
	jp .loop

MACRO CoordJump
	db \1, \2
	dw \3
ENDM

VolcanoDrillingJumpTable::
	CoordJump 33,  2, DrilledFloor1Ladder
	CoordJump 13, 24, DrilledFloor2Ladder
	CoordJump 43, 34, DrilledFloor3Ladder
	CoordJump  3, 30, DrilledFloor4Ladder
	db -1

DrilledFloor1Ladder:
	CheckEvent EVENT_VOLCANO_DUG_TO_FLOOR1
	ret nz
	SetEvent EVENT_VOLCANO_DUG_TO_FLOOR1
	lb bc, 1, 16
	ld a, $3C
ReplaceLadderAndWalkUp:
	push bc
	push af
	call WaitForSoundToFinish
	ld de, SFX_Drilled_Hole
	call PlayNewSoundChannel8
	lb de, 4, 2
	call GenericShakeScreenY
	pop af
	pop bc
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	SetEvent EVENT_HOLE_DRILL_FINISHED
	ld a, 1
	ld [wOverworldAnimationCooldown], a
	ld d, D_UP
	jpfar ForceStepFromDoor

DrilledFloor2Ladder:
	CheckEvent EVENT_VOLCANO_DUG_TO_FLOOR2
	ret nz
	CheckEventReuseA EVENT_VOLCANO_BOMBED_FLOOR1
	jr z, FailedDrillFloor
	call CheckHasAllRubies
	jr nz, FailedDrillFloor
	call VolcanoPlayPowerDrillSound
	SetEvent EVENT_VOLCANO_DUG_TO_FLOOR2
	lb bc, 12, 6
	ld a, $28
	jr ReplaceLadderAndWalkUp

DrilledFloor3Ladder:
	CheckEvent EVENT_VOLCANO_DUG_TO_FLOOR3
	ret nz
	CheckEventReuseA EVENT_VOLCANO_BOMBED_FLOOR2
	jr z, FailedDrillFloor
	call CheckHasAllRubies
	jr nz, FailedDrillFloor
	call VolcanoPlayPowerDrillSound
	SetEvent EVENT_VOLCANO_DUG_TO_FLOOR3
	lb bc, 17, 21
	ld a, $28
	jr ReplaceLadderAndWalkUp

DrilledFloor4Ladder:
	CheckEvent EVENT_VOLCANO_DUG_TO_FLOOR4
	ret nz
	CheckEventReuseA EVENT_VOLCANO_BOMBED_FLOOR3
	jr z, FailedDrillFloor
	call CheckHasAllRubies
	jr nz, FailedDrillFloor
	call VolcanoPlayPowerDrillSound
	SetEvent EVENT_VOLCANO_DUG_TO_FLOOR4
	lb bc, 15, 1
	ld a, $3C
	jp ReplaceLadderAndWalkUp

FailedDrillFloor:
	ld a, SFX_DENIED
	rst _PlaySound
	ld a, TEXT_CINNABAR_VOLCANO_FAILED_DRILLING
CinnabarVolcanoDisplayTextIDEntry:
	ldh [hTextID], a
	jp DisplayTextID

FailedDrillFloorText:
	text_far _FailedDrillFloorText
	text_end

VolcanoPlayPowerDrillSound:
	ld de, SFX_Power_Drill
	call PlayNewSoundChannel8
	jp WaitForSoundToFinish

; d = how many frames/2 to shake screen
; e = how many pixels to shake screen by
GenericShakeScreenX::
	ld b, d
	ldh a, [hSCX]
	ld d, a
.shakeLoop
	ld a, 255
	sub e
	ld e, a
	add d
	ldh [hSCX], a
	ld c, 2
	rst _DelayFrames
	dec b
	jr nz, .shakeLoop
	ld a, d
	ldh [hSCX], a
	ret

; d = how many frames/2 to shake screen
; e = how many pixels to shake screen by
GenericShakeScreenY::
	ld b, d
	ldh a, [hSCY]
	ld d, a
.shakeLoop
	ld a, 255
	sub e
	ld e, a
	add d
	ldh [hSCY], a
	ld c, 2
	rst _DelayFrames
	dec b
	jr nz, .shakeLoop
	ld a, d
	ldh [hSCY], a
	ret

	const_def 1
	const EXPLODED_ROCKS
	const MELTED_ROCKS
	const SHATTERED_ROCKS


VolcanoRocksAlreadyBroken:
	ld a, TEXT_CINNABAR_VOLCANO_BOMB_ROCK_AFTER
	jp CinnabarVolcanoDisplayTextIDEntry

VolcanoBombableRockFloor1::
	CheckEvent EVENT_VOLCANO_BOMBED_FLOOR1
	jr nz, VolcanoRocksAlreadyBroken
	call VolcanoBombableRockCommon
	jr z, VolcanoBombableRockDone.done
.success
	SetEvent EVENT_VOLCANO_BOMBED_FLOOR1
	ld hl, VolcanoBombedFloor1ReplaceBlocks
VolcanoBombableRockDone:
	push hl
	ld c, 60
	rst _DelayFrames
	ld de, SFX_Lava_Flows
	call PlayNewSoundChannel8
	pop hl
	call hl_caller
	lb de, 4, 2
	call GenericShakeScreenX
	ld c, 30
	rst _DelayFrames
	; reload old amber sprite
	call ReloadOldAmberSprite
	; show all 3 rubies if we're just finishing the final floor
	CheckEvent EVENT_VOLCANO_BOMBED_FLOOR4
	call z, ShowRubies
	ld a, TEXT_CINNABAR_VOLCANO_BOMB_ROCK_DONE
	call CinnabarVolcanoDisplayTextIDEntry
	CheckEvent EVENT_VOLCANO_BOMBED_FLOOR4
	jr nz, .done ; skip resuming music if it's the 4th floor
	xor a
	ld [wMuteAudioAndPauseMusic], a
.done
	jp ResumeVolcanoShaking

	
VolcanoBombedFloor1ReplaceBlocks:
	ld de, VolcanoFloor1TileBlockReplacements
	call VolcanoReplaceBlockLineWithLava
	ld a, $4D
	lb bc, 14, 17
	jp ReplaceTileBlockEntry

VolcanoBombableRockFloor2::
	CheckEvent EVENT_VOLCANO_BOMBED_FLOOR2
	jr nz, VolcanoRocksAlreadyBroken
	call VolcanoBombableRockCommon
	jr z, VolcanoBombableRockDone.done
.success
	SetEvent EVENT_VOLCANO_BOMBED_FLOOR2
	ld hl, VolcanoBombedFloor2ReplaceBlocksRedraw
	jr VolcanoBombableRockDone

VolcanoBombedFloor2ReplaceBlocksRedraw:
	call VolcanoBombedFloor2ReplaceBlocksDefault
	jpfar RedrawMapView

VolcanoBombedFloor2ReplaceBlocksDefault:
	ld de, VolcanoFloor2TileBlockReplacements
	call VolcanoReplaceBlockLineWithLava
	ld a, $4D
	lb bc, 19, 24
	jp ReplaceTileBlockEntryNoRedraw

VolcanoBombedFloor2ReplaceBlocks:
	call VolcanoBombedFloor2ReplaceBlocksDefault
	ld a, $60
	lb bc, 17, 24
	jp ReplaceTileBlockEntryNoRedraw

VolcanoReplaceBlockLineWithLava:
	ld a, $05
	ld [wNewTileBlockID], a
	jpfar ReplaceTileBlockLineHorizontalWithOneBlock


VolcanoBombableRockFloor3::
	CheckEvent EVENT_VOLCANO_BOMBED_FLOOR3
	jp nz, VolcanoRocksAlreadyBroken
	ResetEvent EVENT_LAVA_FLOOD_ACTIVE
	call VolcanoBombableRockCommon
	ld a, 200
	ld [wOverworldAnimationCooldown], a 
	jr z, VolcanoBombableRockDone.done
.success
	SetEvent EVENT_VOLCANO_BOMBED_FLOOR3
	ld hl, VolcanoBombedFloor3ReplaceBlocks
	jp VolcanoBombableRockDone

VolcanoBombedFloor3ReplaceBlocks:
	ld de, VolcanoFloor3TileBlockReplacements
	call VolcanoReplaceBlockLineWithLava
	ld a, $4D
	lb bc, 25, 25
	jp ReplaceTileBlockEntry

VolcanoBombableRockFloor4::
	CheckEvent EVENT_VOLCANO_BOMBED_FLOOR4
	ret nz
	call VolcanoBombableRockCommon
	jp z, VolcanoBombableRockDone.done
.success
	SetEvent EVENT_VOLCANO_BOMBED_FLOOR4
	ld hl, VolcanoBombedFloor4ReplaceBlocks
	jp VolcanoBombableRockDone

VolcanoBombedFloor4ReplaceBlocks:
	; just replace one or two blocks to begin with, will continue the animation
	; as a chain reaction
	ld a, $05
	lb bc, 33, 23
	call ReplaceTileBlockEntry
	ld a, $4D
	lb bc, 33, 24
	jp ReplaceTileBlockEntry

ReloadOldAmberSprite:
	ld hl, vChars0 tile 120 ; start of vram tiles for the old amber sprite
	ld de, OldAmberSprite
	lb bc, BANK(OldAmberSprite), 4
	jp CopyVideoData

ShowRubies:
	ld a, HS_VOLCANO_RUBY_1
	call VolcanoShowSpriteEntry
ShowOnlyTwoRubies:
	ld a, HS_VOLCANO_RUBY_2
	call VolcanoShowSpriteEntry
	ld a, HS_VOLCANO_RUBY_3
	jp VolcanoShowSpriteEntry

VolcanoBombableRockCommon:
	call PauseVolcanoShaking
	xor a
	ld [wActionResultOrTookBattleTurn], a
	ld a, TEXT_CINNABAR_VOLCANO_BOMB_ROCK
	call CinnabarVolcanoDisplayTextIDEntry
	ld a, [wActionResultOrTookBattleTurn]
	and a
	ret z
	push af
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	call PlayCryOfSelectedPartyPokemon
	call WaitForSoundToFinish
	pop af
	push af
	cp EXPLODED_ROCKS
	jr z, .explode
	cp SHATTERED_ROCKS
	jr z, .shatter
.melt
	ld hl, vChars0 tile 120 ; start of vram tiles for the old amber sprite
	ld de, BurningAnimation
	lb bc, BANK(BurningAnimation), 4
	call CopyVideoData
	call ShowAnimationSprite
	ld de, SFX_Melt_Rocks
	call PlayNewSoundChannel8
	ld b, 3
.loopBurningAnimation
	push bc
	ld hl, .doBurningAnimation
	call .animateOnEachRock
	pop bc
	dec b
	jr nz, .loopBurningAnimation	
	call GBFadeOutToWhite
	; replace block below player
	ld a, $5B
	call ReplaceBlockBelowPlayer
	call HideAnimationSprite
	call GBFadeInFromWhite
	call WaitForSoundToFinish
.lavaStartsFlowing
	; lava starts flowing
	pop af
	and a ; nz flag set
	ret
.rockShatterAnimationLoad
	ld de, RockShatterAnimation tile 8
	lb bc, BANK(RockShatterAnimation), 2
	jp CopyVideoData
.shatter
	; shatter rock
	ld hl, vChars0 tile 120 ; start of vram tiles for the old amber sprite
	call .rockShatterAnimationLoad
	ld hl, vChars0 tile 122 ; start of vram tiles for the old amber sprite
	call .rockShatterAnimationLoad
	call ShowAnimationSprite
	ld b, $5C
	ld hl, .doShatterAnimation
	call .animateOnEachRock
	call HideAnimationSprite
	call WaitForSoundToFinish
	jr .lavaStartsFlowing
.explode
	; show a rock exploding animation
	; tile 1 of explosion animation
	ld hl, vChars0 tile 120 ; start of vram tiles for the old amber sprite
	ld de, ExplosionAnimation
	lb bc, BANK(ExplosionAnimation), 4
	call CopyVideoData
	call ShowAnimationSprite
	ld de, SFX_Explode_Rocks
	call PlayNewSoundChannel8
	ld b, 3 ; show an explosion on each rock 3 times
.loopExplosionAnimation
	push bc
	call GBPalWhiteOut
	rst _DelayFrame
	call GBPalNormal
	rst _DelayFrame
	ld hl, .doExplosionAnimate
	call .animateOnEachRock
	pop bc
	dec b
	jr nz, .loopExplosionAnimation	
	call GBPalWhiteOut
	; replace block below player
	ld a, $5B
	call ReplaceBlockBelowPlayer
	call HideAnimationSprite
	call WaitForSoundToFinish
	call GBFadeInFromWhite
	jr .lavaStartsFlowing
.explosionAnimateLoad
	ld hl, vChars0 tile 120 ; start of vram tiles for the old amber sprite
	lb bc, BANK(ExplosionAnimation), 4
	jp CopyVideoData
.doExplosionAnimate
	push hl
	call UpdateSprites
	rst _DelayFrame
	ld de, ExplosionAnimation tile 4
	call .explosionAnimateLoad
	rst _DelayFrame
	ld de, ExplosionAnimation tile 8
	call .explosionAnimateLoad
	rst _DelayFrame
	ld de, ExplosionAnimation
	call .explosionAnimateLoad
	rst _DelayFrame
	pop hl
	ret
.burningAnimationLoad
	ld hl, vChars0 tile 120 ; start of vram tiles for the old amber sprite
	lb bc, BANK(BurningAnimation), 4
	jp CopyVideoData
.doBurningAnimation
	push hl
	call UpdateSprites
	rst _DelayFrame
	ld de, BurningAnimation tile 4
	call .burningAnimationLoad
	ld c, 3
	rst _DelayFrames
	ld de, BurningAnimation
	call .burningAnimationLoad
	ld c, 3
	rst _DelayFrames
	pop hl
	ret
.doShatterAnimation
	push hl
	push bc
	ld de, SFX_Drilled_Hole
	call PlayNewSoundChannel8
	lb de, 4, 4
	call GenericShakeScreenY
	pop bc
	ld a, b
	cp $5F
	jr nz, .skipReload
	ld a, $5B
.skipReload
	push bc
	call ReplaceBlockBelowPlayer
	call UpdateSprites
	call ShatterAnim
	pop bc
	inc b	
	pop hl
	ret
.animateOnEachRock
	call hl_caller
	ld a, [wSprite08StateData1XPixels]
	add 16
	ld [wSprite08StateData1XPixels], a
	call hl_caller
	ld a, [wSprite08StateData1YPixels]
	add 16
	ld [wSprite08StateData1YPixels], a
	call hl_caller
	ld a, [wSprite08StateData1XPixels]
	sub 16
	ld [wSprite08StateData1XPixels], a
	call hl_caller
	ld a, [wSprite08StateData1YPixels]
	sub 16
	ld [wSprite08StateData1YPixels], a
	ret

ShatterAnim:
	rst _DelayFrame
	ld de, RockShatterAnimation
	call .shatterAnimLoad
	ld c, 8
	rst _DelayFrames
	ld de, RockShatterAnimation tile 4
	call .shatterAnimLoad
	call Delay3
	ld de, RockShatterAnimation tile 8
	call .shatterAnimLoad
	call Delay3
	ld de, RockShatterAnimation tile 8
	lb bc, BANK(RockShatterAnimation), 2
	call .shatterAnimLoad2
	ld hl, vChars0 tile 122 ; start of vram tiles for the old amber sprite
	ld de, RockShatterAnimation tile 8
	lb bc, BANK(RockShatterAnimation), 2
	call CopyVideoData
	jp Delay3
.shatterAnimLoad
	lb bc, BANK(RockShatterAnimation), 4
.shatterAnimLoad2
	ld hl, vChars0 tile 120 ; start of vram tiles for the old amber sprite
	jp CopyVideoData


ShowAnimationSprite:
	ld a, HS_VOLCANO_ANIMATION_PROXY ; we will use an extra sprite as a proxy for showing an animation
	call VolcanoShowSpriteEntry
	ld hl, wSprite08StateData2MapY
	ld a, [wYCoord]
	add 5 ; add map offset + 1 coordinate below player
	ld [hli], a
	ld a, [wXCoord]
	add 4 ; map offset
	ld [hl], a
	ret

HideAnimationSprite:
	ld a, HS_VOLCANO_ANIMATION_PROXY
VolcanoHideSpriteEntry:
	ld [wMissableObjectIndex], a
	predef_jump HideExtraObject

VolcanoShowSpriteEntry:
	ld [wMissableObjectIndex], a
	predef_jump ShowExtraObject


; input a = which block to replace it with
ReplaceBlockBelowPlayer:
	ld [wNewTileBlockID], a
	ld a, [wXCoord]
	srl a
	ld c, a
	ld a, [wYCoord]
	inc a
	srl a
	ld b, a
	predef_jump ReplaceTileBlock

PlayCryOfSelectedPartyPokemon::
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Species
 	ld bc, wPartyMon2 - wPartyMon1
 	call AddNTimes
 	ld a, [hl]
 	jp PlayCry

PauseVolcanoShaking::
	ResetEvent FLAG_MAP_HAS_OVERWORLD_ANIMATION
StopVolcanoShaking::
	xor a
	ld [wOverworldAnimationCounter], a
	inc a
	ld [wOverworldAnimationCooldown], a 
	CheckAndResetFlagHL FLAG_JIGGLE_TOGGLE
	ret z
	ld hl, hSCX
	inc [hl]
	inc hl ; hSCY
	inc [hl]
	ret

ResumeVolcanoShaking::
	SetEvent FLAG_MAP_HAS_OVERWORLD_ANIMATION
	ret

CinnabarVolcano_TextPointers:
	def_text_pointers
	dw_const CinnabarVolcanoProspectorText, TEXT_CINNABAR_VOLCANO_PROSPECTOR
	dw_const CinnabarVolcanoBlaineText, TEXT_CINNABAR_VOLCANO_BLAINE
	dw_const CinnabarVolcanoAvoidWestSideText, TEXT_CINNABAR_VOLCANO_AVOID_WEST_SIDE
	dw_const CinnabarVolcanoMoltresText, TEXT_CINNABAR_VOLCANO_MOLTRES
	dw_const CinnabarVolcanoRuby1Text, TEXT_CINNABAR_VOLCANO_RUBY1
	dw_const CinnabarVolcanoRuby2Text, TEXT_CINNABAR_VOLCANO_RUBY2
	dw_const CinnabarVolcanoRuby3Text, TEXT_CINNABAR_VOLCANO_RUBY3
	dw_const CinnabarVolcanoBombRockText, TEXT_CINNABAR_VOLCANO_BOMB_ROCK
	dw_const StopChannel8ThenPickUpItemText, TEXT_CINNABAR_VOLCANO_ITEM1
	dw_const StopChannel8ThenPickUpItemText, TEXT_CINNABAR_VOLCANO_ITEM2
	dw_const CinnabarVolcanoSurfingRhydonText, TEXT_CINNABAR_VOLCANO_SURFING_RHYDON
	dw_const CinnabarVolcanoHungryGravelerText, TEXT_CINNABAR_VOLCANO_HUNGRY_GRAVELER
	dw_const CinnabarVolcanoSickRhydonText, TEXT_CINNABAR_VOLCANO_SICK_RHYDON
	dw_const CinnabarVolcanoBossMagmarText, TEXT_CINNABAR_VOLCANO_BOSS_MAGMAR
	dw_const CinnabarVolcanoBombRockDoneText, TEXT_CINNABAR_VOLCANO_BOMB_ROCK_DONE
	dw_const CinnabarVolcanoBombRockAfterText, TEXT_CINNABAR_VOLCANO_BOMB_ROCK_AFTER
	dw_const CinnabarVolcanoBossMagmarAfterTextMove, TEXT_CINNABAR_VOLCANO_BOSS_MAGMAR_AFTER
	dw_const CinnabarVolcanoClearedAllBlockagesText, TEXT_CINNABAR_VOLCANO_CLEARED_ALL_BLOCKAGES
	dw_const FailedDrillFloorText, TEXT_CINNABAR_VOLCANO_FAILED_DRILLING

CinnabarVolcanoRuby1Text:
	text_asm
	ld a, HS_VOLCANO_RUBY_1
	jr CinnabarVolcanoRubyTextCommon

CinnabarVolcanoRuby2Text:
	text_asm
	ld a, HS_VOLCANO_RUBY_2
	jr CinnabarVolcanoRubyTextCommon

CinnabarVolcanoRuby3Text:
	text_asm
	ld a, HS_VOLCANO_RUBY_3
	; fall through

CinnabarVolcanoRubyTextCommon:
	call VolcanoHideSpriteEntry
	call VolcanoStopChannel8
	CheckEvent EVENT_VOLCANO_DUG_TO_FLOOR4
	jr z, .normal
	CheckExtraHideShowState HS_VOLCANO_RUBY_3
	ld hl, .gotLimestone
	jr nz, .next
	ld hl, .gotRocksalts
.next
	rst _PrintText
	call PlayUnusedFanfare
	rst TextScriptEnd
.normal
	ld hl, .foundARuby
	rst _PrintText
	call PlayUnusedFanfareThenTextPrompt
	call CheckHasAllRubies
	; a = how many rubies the player has currently
	dec a
	ld hl, .twoMoreToGo
	jr z, .done
	dec a
	ld hl, .oneMoreToGo
	jr z, .done
	ld hl, .gotAllOfThemScript
.done
	rst _PrintText
	rst TextScriptEnd
.foundARuby
	text_far _FoundRubyText
	text_end
.twoMoreToGo
	text_far _RubyTwoMoreToGoText
	text_end
.oneMoreToGo
	text_far _RubyOneMoreToGoText
	text_end
.gotAllOfThemScript
	text_asm
	ld hl, .gotAllOfThem
	rst _PrintText
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	ld a, SFX_TRADE_MACHINE
	rst _PlaySound
	ld c, 30
	rst _DelayFrames
	ld de, SFX_Drill_PowerUp
	call PlayNewSoundChannel8
	call WaitForSoundToFinish
	xor a
	ld [wMuteAudioAndPauseMusic], a
	call DisplayTextPromptButton
	ld hl, .drillPoweredUp
	rst _PrintText
	rst TextScriptEnd
.gotAllOfThem
	text_far _RubyGotAllOfThemText
	text_end
.drillPoweredUp
	text_far _RubyGoodToGo
	text_end
.gotRocksalts
	text_far _GotRocksalts
	text_end
.gotLimestone
	text_far _GotLimestone
	text_end

; z flag is set if all rubies are obtained currently
CheckHasAllRubies::
	ld b, 0
	CheckExtraHideShowState HS_VOLCANO_RUBY_1
	call nz, .incr
	CheckExtraHideShowState HS_VOLCANO_RUBY_2
	call nz, .incr
	CheckExtraHideShowState HS_VOLCANO_RUBY_3
	call nz, .incr
	ld a, b
	cp 3
	ret
.incr
	inc b
	ret


CinnabarVolcanoBombRockText:
	text_asm
	ld hl, .initialText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .printForgetIt
	callfar GenericShowPartyMenuSelection
	jr c, .printForgetIt
	call GetPartyMonName2
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Moves
 	ld bc, wPartyMon2 - wPartyMon1
  	call AddNTimes
  	ld b, NUM_MOVES
.loop
	; we check for specific moves first because exploding the rocks looks cooler
	ld a, [hli]
	cp EXPLOSION
	jr z, .explodeRocksExplosion
	cp SELFDESTRUCT
	jr z, .explodeRocksSelfdestruct
	cp SKULL_BASH
	jr z, .shatterRocksSkullBash
	dec b
	jr nz, .loop
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Type1
 	ld bc, wPartyMon2 - wPartyMon1
  	call AddNTimes
  	ld a, [hli]
  	cp FIRE
  	jr z, .meltFire
  	cp ROCK
  	jr z, .shatterRocks
  	cp GROUND
  	jr z, .shatterRocks
  	ld a, [hli]
  	cp FIRE
  	jr z, .meltFire
  	cp ROCK
  	jr z, .shatterRocks
  	cp GROUND
  	jr z, .shatterRocks
.printWrongMon
	ld hl, .wrongMon
	jr .failed
.printForgetIt
	ld hl, .forgetIt
.failed
.done
	rst _PrintText
	rst TextScriptEnd
.success
	ld [wActionResultOrTookBattleTurn], a
	jr .done
.explodeRocksExplosion
	ld hl, .explodeRocksExplosionText
	ld a, EXPLODED_ROCKS
	jr .success
.explodeRocksSelfdestruct
	ld hl, .explodeRocksSelfdestructText
	ld a, EXPLODED_ROCKS
	jr .success
.shatterRocksSkullBash
	ld hl, .shatterRocksSkullBashText
	ld a, SHATTERED_ROCKS
	jr .success
.shatterRocks
	ld hl, .shatteredRocksText
	ld a, SHATTERED_ROCKS
	jr .success
.meltFire
	ld hl, .meltedRocksText
	ld a, MELTED_ROCKS
	jr .success
.initialText
	text_far _CinnabarVolcanoBombRocksText
	text_end
.forgetIt
	text_far _GenericForgetItText
	text_end
.wrongMon
	text_far _SecretLabMewtwoReactionText4
	text_end
.explodeRocksExplosionText
	text_far _ExplodeRocksExplosionText
	text_end
.explodeRocksSelfdestructText
	text_far _ExplodeRocksSelfdestructText
	text_end
.shatterRocksSkullBashText
	text_far _ShatteredRocksSkullBashText
	text_end
.shatteredRocksText
	text_far _ShatteredRocksText
	text_end
.meltedRocksText
	text_far _MeltedRocksText
	text_end

PlayUnusedFanfareThenTextPrompt:
	call PlayUnusedFanfare
	jp DisplayTextPromptButton

PlayUnusedFanfare::
	; play success sound
	ld a, SFX_GET_ITEM_1
	rst _PlaySound
	; remap to play unused fanfare here
	ld de, SFX_UnusedFanfare_Ch5
	ld hl, wChannelCommandPointers + CHAN5 * 2
	ld a, e
	ld [hli], a
	ld [hl], d
	inc hl
	ld de, SFX_UnusedFanfare_Ch6
	ld a, e
	ld [hli], a
	ld [hl], d
	inc hl
	ld de, SFX_UnusedFanfare_Ch7
	ld a, e
	ld [hli], a
	ld [hl], d
	jp WaitForSoundToFinish

CinnabarVolcanoSurfingRhydonText:
	text_asm
	ld hl, .itsRhydon
	rst _PrintText
	ld a, CINNABAR_VOLCANO_SURFING_RHYDON
	call SetSpriteFacingDown
	ld hl, .getOn
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no
	ld a, RHYDON
	ld [wNamedObjectIndex], a
	ld [wBattleMonSpecies2], a
	call GetMonName
	ld a, SURFBOARD
	ld [wCurItem], a
	ld [wPseudoItemID], a
	call UseItem
	ld hl, .gotOn
	rst _PrintText
	ld a, RHYDON
	call PlayCry
	ld a, HS_VOLCANO_SURFING_RHYDON
	call VolcanoHideSpriteEntry
	SetEvent EVENT_SURFING_ON_RHYDON
	rst TextScriptEnd
.no
	ld a, CINNABAR_VOLCANO_SURFING_RHYDON
	call SetSpriteFacingUp
	ld hl, CinnabarVolcanoBombRockText.forgetIt
.done
	rst _PrintText
	rst TextScriptEnd
.itsRhydon
	text_far _ItsRhydon
	text_end
.getOn
	text_far _RhydonGetOnBack
	text_end
.gotOn
	text_far _RhydonGotOnBack
	text_end

CinnabarVolcanoBombRockDoneText:
	text_asm
	ld hl, .rocksGone
	rst _PrintText
	call PlayUnusedFanfareThenTextPrompt
	CheckEvent EVENT_VOLCANO_BOMBED_FLOOR4
	jr nz, .floor4
	CheckEvent EVENT_VOLCANO_BOMBED_FLOOR3
	ld hl, .floor3Text
	jr nz, .done
	CheckEvent EVENT_VOLCANO_BOMBED_FLOOR2
	ld hl, .floor2Text
	jr nz, .done
	ld hl, .floor1Text
.done
	rst _PrintText
	rst TextScriptEnd
.floor4
	; wall breaks open, the whole side
	ld hl, .uhoh
	rst _PrintText
	ld a, D_UP
	ld b, 4
	ld hl, wSimulatedJoypadStatesIndex
	ld [hl], b
	ld hl, wSimulatedJoypadStatesEnd
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	SetFlag FLAG_FAST_AUTO_MOVEMENT
	call StartSimulatingJoypadStates
	SetEvent EVENT_VOLCANO_SPRITE_MOVING
	xor a
	ld [wOverworldAnimationCooldown], a
	ld a, 192
	ld [wOverworldAnimationCounter], a
	ld de, SFX_Volcano_Rumble
	call PlayNewSoundChannel8
	rst TextScriptEnd
.rocksGone
	text_far _RocksGoneText
	text_end
.floor3Text
.floor1Text
	text_far _WhereRubiesText
	text_end
.uhoh
	text_far _UhohVolcano
	text_end
.floor2Text
	text_asm
	ld hl, .floor1Text
	rst _PrintText
	call DisplayTextPromptButton
	ld a, $94
	lb bc, 17, 24
	call ReplaceTileBlockEntry
	call ShowAnimationSprite
	lb de, 0, -3
	call .doShatterFloor2
	ld a, $60
	lb bc, 17, 24
	call ReplaceTileBlockEntry
	lb de, 1, -3
	call .doShatterFloor2
	call HideAnimationSprite
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld hl, .floor2WarpTilesText
	rst _PrintText
	rst TextScriptEnd
.doShatterFloor2
	ld c, CINNABAR_VOLCANO_ANIMATION_PROXY
	callfar FarMoveSpriteInRelationToPlayer
	ld de, SFX_Drilled_Hole
	call PlayNewSoundChannel8
	jp ShatterAnim
.floor2WarpTilesText
	text_far _CinnabarVolcanoFloor2WarpTilesText
	text_end

VolcanoBlowWallOpen::
	call GBFadeOutToWhite
	call VolcanoFloor4TileBlockReplacements
	; move the sprites up to a talkable distance
	ld a, 62 + 4
	ld [wSprite14StateData2MapY], a
	ld a, [wSprite14StateData1YPixels]
	sub 48 ; 3 coords
	ld [wSprite14StateData1YPixels], a
	ld b, 8
.loop
	push bc
	ld de, SFX_Lava_Flows
	call PlayNewSoundChannel8
	pop bc
	ld c, 10
	rst _DelayFrames
	dec b
	jr nz, .loop
	call WaitForSoundToFinish
	call StopVolcanoShaking
	call GBFadeInFromWhite
	ld c, 60
	rst _DelayFrames
	ld a, TEXT_CINNABAR_VOLCANO_CLEARED_ALL_BLOCKAGES
	call CinnabarVolcanoDisplayTextIDEntry
	ld a, HS_VOLCANO_BLAINE
	call VolcanoShowSpriteEntry
	xor a
	ld [wMuteAudioAndPauseMusic], a
	ret

VolcanoFloor4TileBlockReplacements:
	SetFlag FLAG_SKIP_MAP_REDRAW
	ld de, VolcanoFloor4TileBlockHorizontalReplacementsFlow
	ld a, $05
	ld [wNewTileBlockID], a
	callfar ReplaceMultipleTileBlockLineHorizontalWithOneBlock
	ld de, VolcanoFloor4TileBlockHorizontalReplacementsFlat
	ld a, $04
	call .withOneBlockEntry
	ld de, VolcanoFloor4TileBlockHorizontalReplacementsWall1
	ld a, $73
	call .withOneBlockEntry
	ld de, VolcanoFloor4TileBlockHorizontalReplacementsWall2
	ld a, $58
	call .withOneBlockEntry
	ld de, VolcanoFloor4TileBlockVerticalReplacements
	ld a, $4D
	ld [wNewTileBlockID], a
	callfar ReplaceTileBlockLineVerticalWithOneBlock
	ld de, VolcanoFloor4TileBlockReplacementsOther
	callfar ReplaceMultipleTileBlocks
	ResetFlag FLAG_SKIP_MAP_REDRAW
	jpfar RedrawMapView
.withOneBlockEntry
	ld [wNewTileBlockID], a
	jpfar ReplaceTileBlockLineHorizontalWithOneBlock


CinnabarVolcanoHungryGravelerText:
	text_asm
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	jr z, .skipSpriteChange
	ld a, CINNABAR_VOLCANO_HUNGRY_GRAVELER
	call SetSpriteFacingDown
.skipSpriteChange
	CheckEvent EVENT_GAVE_GRAVELER_ROCK_SALTS
	jr nz, .already
	ld hl, .itsGraveler
	rst _PrintText
	ld a, GRAVELER
	call PlayCry
	CheckExtraHideShowState HS_VOLCANO_RUBY_2
	jr z, .noRockSalts
	call DisplayTextPromptButton
	ld hl, .giveRockSalts
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, CinnabarVolcanoBombRockText.forgetIt
	jr nz, .done
	SetEvent EVENT_VOLCANO_SPRITE_MOVING
.already
	call UpdateSprites
	ld de, SmileBubbleSFX
	call PlayNewSoundChannel5
	ld a, CINNABAR_VOLCANO_HUNGRY_GRAVELER
	ld [wEmotionBubbleSpriteIndex], a
	ld a, SMILE_BUBBLE
  	ld [wWhichEmotionBubble], a
	callfar EmotionBubble
	CheckAndSetEvent EVENT_GAVE_GRAVELER_ROCK_SALTS
	jr z, .noCry
	ld a, GRAVELER
	call PlayCry
.noCry
	ld hl, .munching
.done
	rst _PrintText
.noRockSalts
	rst TextScriptEnd
.itsGraveler
	text_far _ItsGraveler
	text_end
.giveRockSalts
	text_far _GiveGravelerRockSalts
	text_end
.munching
	text_far _GravelerMunching
	text_end

CinnabarVolcanoSickRhydonText:
	text_asm
	CheckEvent EVENT_GAVE_RHYDON_LIMESTONE
	jp nz, .already
	ld hl, .itsSickRhydon
	rst _PrintText
	; change rhydon's cry to have a lower pitch since it's sick
	ld a, 3
	ld [wFrequencyModifier], a
	ld a, $FF
	ld [wTempoModifier], a
	ld a, SFX_CRY_11
	rst _PlaySound
	CheckExtraHideShowState HS_VOLCANO_RUBY_3
	jr z, .noLimestone
	call WaitForSoundToFinish
	call DisplayTextPromptButton
	ld hl, .giveLimestone
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, CinnabarVolcanoBombRockText.forgetIt
	jr nz, .done
	ld hl, .grinded
	rst _PrintText
	ld de, SFX_Drill
	call PlayNewSoundChannel8
	call WaitForSoundToFinish
	call DisplayTextPromptButton
	ld hl, .antacid
	rst _PrintText
	call PlayUnusedFanfareThenTextPrompt
.already
	ld de, HeartBubbleSFX
	call PlayNewSoundChannel5
	ld a, CINNABAR_VOLCANO_SICK_RHYDON
	ld [wEmotionBubbleSpriteIndex], a
	ld a, HEART_BUBBLE
  	ld [wWhichEmotionBubble], a
	callfar EmotionBubble
	CheckAndSetEvent EVENT_GAVE_RHYDON_LIMESTONE
	jr nz, .after
	ld hl, .gaveAntacid
	rst _PrintText
	ld hl, .resting
	rst _PrintText
	SetEvent EVENT_VOLCANO_SPRITE_MOVING
	ld a, CINNABAR_VOLCANO_SICK_RHYDON
	ldh [hSpriteIndex], a
	ld de, GenericMoveDown
	call MoveSpriteButAllowAOrBPress
	rst TextScriptEnd
.after
	ld a, RHYDON
	call PlayCry
	ld hl, .resting
.done
	rst _PrintText
.noLimestone
	rst TextScriptEnd
.itsSickRhydon
	text_far _ItsSickRhydon
	text_end
.giveLimestone
	text_far _GiveRhydonLimestone
	text_end
.grinded
	text_far _RhydonGrinded
	text_end
.antacid
	text_far _GotAntacidText
	text_end
.gaveAntacid
	text_far _GaveRhydonAntacid
	text_end
.resting
	text_far _RhydonResting
	text_end

CinnabarVolcanoBossMagmarText:
	text_asm
	CheckEvent EVENT_DEFEATED_VOLCANO_MAGMAR
	ld hl, CinnabarVolcanoBossMagmarAfterText
	jr nz, .done
	ld hl, .magmar
	rst _PrintText
	ld a, MAGMAR
	call PlayCry
	call DisplayTextPromptButton
	ld hl, .battleQuestion
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, CinnabarVolcanoBombRockText.forgetIt
	jr nz, .done
	ld a, MAGMAR
	ld [wEngagedTrainerClass], a
	ld a, 45
	ld [wEngagedTrainerSet], a
	call InitBattleEnemyParameters
	SetEvent EVENT_BATTLING_VOLCANO_MAGMAR
	ld hl, .letsdothis
	rst _PrintText
	callfar PlayTrainerMusic
	rst TextScriptEnd
.done
	rst _PrintText
	rst TextScriptEnd
.magmar
	text_far _MagmarBoss
	text_end
.battleQuestion
	text_far _MagmarFight
	text_end
.letsdothis
	text_far _LetsDoThis
	text_end

CinnabarVolcanoBossMagmarAfterText:
	text_far _MagmarDefeat
	text_end

CinnabarVolcanoBombRockAfterText:
	text_far _CinnabarVolcanoBombRocksTextDone
	text_end

CheckWaitForVolcanoSpriteWalk:
	CheckEvent EVENT_VOLCANO_SPRITE_MOVING
	ret z
	ld a, $FF
	ld [wJoyIgnore], a
	CheckEvent EVENT_GOT_DRILL
	jr z, .entranceMovement
	CheckEventReuseA EVENT_VOLCANO_DUG_TO_FLOOR1
	jr z, .blaineWalksOut
	CheckEvent EVENT_VOLCANO_TALKED_TO_BLAINE
	jr nz, .blaineWalksOut
	CheckEvent EVENT_VOLCANO_BOMBED_FLOOR4
	jr nz, .easternWall
	CheckEvent EVENT_GAVE_RHYDON_LIMESTONE
	jr nz, .normalWalk
.graveler
	ResetEvent EVENT_VOLCANO_SPRITE_MOVING
	; graveler walking
	ld a, CINNABAR_VOLCANO_HUNGRY_GRAVELER
	call SlideSpriteDown
	ld a, SFX_PUSH_BOULDER
	rst _PlaySound
	xor a
	ld [wJoyIgnore], a
	jpfar AnimateBoulderDust
.normalWalk
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz
	ResetEvent EVENT_VOLCANO_SPRITE_MOVING
	xor a
	ld [wJoyIgnore], a
	ret
.easternWall
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz
	ResetEvent EVENT_VOLCANO_SPRITE_MOVING
	xor a
	ld [wJoyIgnore], a
	jp VolcanoBlowWallOpen
.blaineWalksOut
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ResetEvent EVENT_VOLCANO_SPRITE_MOVING
	xor a
	ld [wJoyIgnore], a
	ld a, HS_VOLCANO_BLAINE
	jp VolcanoHideSpriteEntry
.entranceMovement
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz
	ResetEvent EVENT_VOLCANO_SPRITE_MOVING
	xor a
	ld [wJoyIgnore], a
	ld a, [wYCoord]
	cp 4
	jr c, .prospectorWalkingUp
.mainRoomForcedWalk
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	ld a, CINNABAR_VOLCANO_PROSPECTOR
	call SetSpriteFacingRight
	ld a, TEXT_CINNABAR_VOLCANO_PROSPECTOR
	jp CinnabarVolcanoDisplayTextIDEntry
.prospectorWalkingUp
	; prospector walks up from entrance
	ld a, SFX_GO_OUTSIDE
	rst _PlaySound
	; fall through
ProspectorInMainRoom::
	ld a, 22 + 4
	ld [wSprite01StateData2MapX], a
	ld a, 12 + 4
	ld [wSprite01StateData2MapY], a
	ret

FarSlideSpriteDown::
	ld a, d
	jr SlideSpriteDown

FarSlideSpriteUp::
	ld a, d
	jr SlideSpriteUp

FarSlideSpriteUpArbitrarySpeed::
	ld a, d
	lb de, 1, 0 ; up, slide
	jr SlideSpriteUpOrDownCommon

SlideSpriteDownWithWalkAnimation:
	lb de, 0, 1 ; down, walk
	jr SlideSpriteUpOrDown
SlideSpriteUpWithWalkAnimation:
	lb de, 1, 1 ; up, walk
	jr SlideSpriteUpOrDown
SlideSpriteUp:
	lb de, 1, 0 ; up, slide
	jr SlideSpriteUpOrDown
SlideSpriteDown:
	lb de, 0, 0 ; down, slide
SlideSpriteUpOrDown:
	ld hl, wTempStore1
	ld [hl], 1
SlideSpriteUpOrDownCommon:
	; a = which sprite to perform this movement on
	dec a
	push af
	ld hl, wSprite01StateData2MapY
	ld bc, wSprite02StateData2 - wSprite01StateData2
	call AddNTimes
	pop af
	ld b, h
	ld c, l
	push bc
	ld hl, wSprite01StateData1YPixels
	ld bc, wSprite02StateData1 - wSprite01StateData1
	call AddNTimes
	ld c, 2
.walkLoopStart
	ld b, 8
.walkLoop
	ld a, d
	and a
	jr z, .down2
	dec [hl]
	jr .doneIncDec
.down2
	inc [hl]
.doneIncDec
	push bc
	ld a, [wTempStore1]
	ld c, a
	rst _DelayFrames
	pop bc
	dec b
	jr nz, .walkLoop
	ld a, e
	and a
	jr z, .noWalk
	push hl
	dec hl
	dec hl ; hl points to sprite's ImageIndex now
	ld a, [hl]
	xor 1
	ld [hl], a
	pop hl
.noWalk
	dec c
	jr nz, .walkLoopStart
	pop bc
	ld a, d
	and a
	ld a, [bc]
	jr z, .down3
	dec a
	jr .done
.down3
	inc a
.done
	ld [bc], a
	xor a
	ld [wTempStore1], a
	ret

CheckIfVolcanoBattleOccurred:
	ld hl, wCurrentMapScriptFlags
	bit BIT_MAP_LOADED_AFTER_BATTLE, [hl]
	res BIT_MAP_LOADED_AFTER_BATTLE, [hl]
	ret z
	ld a, [wIsInBattle]
	cp -1 ; lost battle
	ret z ; do nothing when you lost the battle
	call GBFadeInFromWhite
	CheckAndResetEvent EVENT_BATTLING_VOLCANO_MAGMAR
	jr nz, .magmarWin
	CheckAndResetEvent EVENT_BATTLING_MOLTRES
	ret z
.moltresWin
	SetEvent EVENT_BEAT_MOLTRES
	ld a, HS_VOLCANO_MOLTRES
	call VolcanoHideSpriteEntry
	ld a, HS_MOLTRES
	ld [wMissableObjectIndex], a
	predef_jump HideObject
.magmarWin
	ld a, [wBattleFunctionalFlags]
	bit 1, a
	ret nz ; do nothing if you ran from battle
	ld a, [wEscapedFromBattle]
	and a
	ret nz ; do nothing when you used a poke doll to end the battle
	SetEvent EVENT_DEFEATED_VOLCANO_MAGMAR
	ld a, [wBattleResult]
	cp 2 ; draw, happens if you catch the pokemon or run
	jr z, .caughtMagmar
	ld a, TEXT_CINNABAR_VOLCANO_BOSS_MAGMAR_AFTER
	jp CinnabarVolcanoDisplayTextIDEntry
.caughtMagmar
	ld a, HS_VOLCANO_BOSS_MAGMAR
	jp VolcanoHideSpriteEntry


CallReplaceBlocksThenRedrawMap:
	SetFlag FLAG_SKIP_MAP_REDRAW
	call hl_caller
	ResetFlag FLAG_SKIP_MAP_REDRAW
	jpfar RedrawMapView

CinnabarVolcanoBossMagmarAfterTextMove:
	text_asm
	ld hl, CinnabarVolcanoBossMagmarAfterText
	rst _PrintText
	SetEvent EVENT_VOLCANO_SPRITE_MOVING
	ld a, CINNABAR_VOLCANO_BOSS_MAGMAR
	ldh [hSpriteIndex], a
	ld de, GenericMoveLeft
	call MoveSpriteButAllowAOrBPress
	rst TextScriptEnd

CinnabarVolcanoMoltresText:
	text_far _VictoryRoad2FMoltresBattleText
	text_asm
	call StopAllMusic
	ld a, MOLTRES
	call PlayCry
	call WaitForSoundToFinish
	SetEvent EVENT_MOLTRES_BATTLE_ANIMATION
	rst TextScriptEnd

MoltresBattleAnimation:
	CheckAndResetEvent EVENT_MOLTRES_BATTLE_ANIMATION
	ret z
	; fiery animation
	call GBPalWhiteOut
	rst _DelayFrame
	call GBPalNormal
	; make moltres open its wings
	ld de, vNPCSprites tile $30
	callfar FarOpenBirdSpriteWings
	ld hl, vNPCSprites tile $78 ; start of vram tiles for the old amber sprite
	ld de, BurningAnimation
	lb bc, BANK(BurningAnimation), 4
	call CopyVideoData
	ld a, HS_VOLCANO_ANIMATION_PROXY ; we will use an extra sprite as a proxy for showing an animation
	call VolcanoShowSpriteEntry
	ld de, SFX_Melt_Rocks
	call PlayNewSoundChannel8
	ld a, 14 + 4
	ld [wSprite08StateData2MapY], a
	ld a, 4 + 4
	ld [wSprite08StateData2MapX], a
	call UpdateSprites
	ld a, [wSprite08StateData1YPixels]
	ld d, a
	ld a, [wSprite08StateData1XPixels]
	ld e, a
	ld b, 0
.outerLoop
	ld c, 0
.innerLoop
	ld hl, CirclePixelOffsetsY
	push bc
	ld b, 0
	add hl, bc
	pop bc
	ld a, b
	and a
	ld a, [hl]
	call nz, .doubleBTimes
	add d
	ld [wSprite08StateData1YPixels], a
	ld hl, CirclePixelOffsetsX
	push bc
	ld b, 0
	add hl, bc
	pop bc
	ld a, b
	and a
	ld a, [hl]
	call nz, .doubleBTimes
	add e
	ld [wSprite08StateData1XPixels], a
	rst _DelayFrame
	ld a, b
	cp 2
	jr nc, .noDelayAgain
	rst _DelayFrame
.noDelayAgain
	inc c
	ld a, c
	cp 16
	jr nz, .innerLoop
	inc b
	ld a, b
	cp 4
	jr nz, .outerLoop
.doneFireSpin
	call GBFadeOutToWhite
	SetFlag FLAG_SKIP_MAP_REDRAW
	ld a, $04
	ld [wNewTileBlockID], a
	ld de, VolcanoMoltresTileBlockReplacements
	callfar ReplaceMultipleTileBlockLineHorizontalWithOneBlock
	ResetFlag FLAG_SKIP_MAP_REDRAW
	ld a, $43
	ld [wNewTileBlockID], a
	lb bc, 7, 2
	predef ReplaceTileBlock
	call GBFadeInFromWhite
	ld a, MOLTRES
	ld [wEngagedTrainerClass], a
	ld a, 50
	ld [wEngagedTrainerSet], a
	call InitBattleEnemyParameters
	SetEvent EVENT_BATTLING_MOLTRES
	callfar PlayTrainerMusic
	ld c, 100
	rst _DelayFrames
	jp HideAnimationSprite
.doubleBTimes
	push bc
.loop
	add a
	dec b
	jr nz, .loop
	pop bc
	ret

CirclePixelOffsetsY:
	db -16, -12, -8, -4, 0, 4, 8, 12, 16, 12, 8, 4, 0, -4, -8, -12
CirclePixelOffsetsX:
	db   0, 4, 8, 12, 16, 12, 8, 4, 0, -4, -8, -12, -16, -12, -8, -4

VolcanoCheckIfInEntrance:
	ld hl, wYCoord
	ld a, [hli]
	cp 8
	ret nc
	ld a, [hl]
	cp 6
	ret

VolcanoPlayMusic::
	CheckEvent EVENT_GOT_LAVA_SUIT
	ret nz
	; music is muted in entrance room before getting lava suit for effect
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	ret

CheckForceTalkToProspector::
	CheckEvent EVENT_VOLCANO_TALKED_TO_BLAINE
	ret nz
	CheckEventReuseA EVENT_FINISHED_VOLCANO
	jr nz, .finalStep
	CheckEvent EVENT_GOT_LAVA_SUIT
	jr z, .firstStep
	CheckEventReuseA EVENT_GOT_DRILL
	jr nz, .forceAvoidWestMainRoom
	; force player to walk up to the main room prospector
	ld a, [wYCoord]
	cp 16
	ret nz
	ld a, D_UP
	ld b, 4
	ld hl, wSimulatedJoypadStatesIndex
	ld [hl], b
	ld hl, wSimulatedJoypadStatesEnd
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ld a, [wXCoord]
	cp 22
	jr nz, .movePlayer
	ld a, D_RIGHT
	ld [hl], a
	ld hl, wSimulatedJoypadStatesIndex
	inc [hl]
.movePlayer
	SetEvent EVENT_VOLCANO_SPRITE_MOVING
	jp StartSimulatingJoypadStates
.firstStep
	ld hl, wYCoord
	ld a, [hli]
	cp 2
	ret nz
	ld a, [hl]
	cp 3
	ret nz
.talkProspector
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	ld a, CINNABAR_VOLCANO_PROSPECTOR
	call SetSpriteFacingRight
	ld a, TEXT_CINNABAR_VOLCANO_PROSPECTOR
	jp CinnabarVolcanoDisplayTextIDEntry
.finalStep
	ld a, [wYCoord]
	cp 2
	ret nz
	jr .talkProspector
.forceAvoidWestMainRoom
	ld hl, wYCoord
	ld a, [hli]
	cp 15
	ret nz
	ld a, [hl]
	cp 12
	ret nz
	; force player to avoid west area until finishing volcano
	ld hl, wSimulatedJoypadStatesEnd
	ld [hl], D_DOWN
	inc hl
	ld [hl], -1
	ld a, 1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, TEXT_CINNABAR_VOLCANO_AVOID_WEST_SIDE
	jp CinnabarVolcanoDisplayTextIDEntry



CinnabarVolcanoProspectorText:
	text_asm
	CheckEvent EVENT_VOLCANO_TALKED_TO_BLAINE
	jr z, .notEnd
	ld hl, .prospecting
.printItAndDone
	rst _PrintText
	rst TextScriptEnd
.notEnd
	CheckEvent EVENT_FINISHED_VOLCANO
	jp nz, .finalConvo
	CheckEventReuseA EVENT_VOLCANO_BOMBED_FLOOR4
	jp nz, .finishedVolcano
	CheckEventReuseA EVENT_GOT_DRILL
	ld hl, .getToIt
	jr nz, .printItAndDone
	CheckEventReuseA EVENT_GOT_LAVA_SUIT
	jp nz, .explainVolcano
	; prospector recognizes you from the diamond mine if you did it
	CheckEventReuseA EVENT_DIAMOND_MINE_COMPLETED
	ld hl, .neverMetIntro
	jr z, .intro
	ld hl, .didMeetIntro
.intro
	rst _PrintText
	ld hl, .helpOut
	rst _PrintText
	ld a, SFX_INTRO_WHOOSH
	rst _PlaySound
	ld a, CINNABAR_VOLCANO_PROSPECTOR
	call NPCSpriteQuickSpin
	ld de, vNPCSprites tile 12
	ld hl, wSprite01StateData1PictureID
	ld bc, wMapSpriteOriginalPictureIDs
	call MakeNPCWearLavaSuit
	ld a, SFX_HEAL_HP
	rst _PlaySound
	ld c, 60
	rst _DelayFrames
	ld a, [wYCoord]
	cp 2
	jr nz, .noFacingChange
	ld a, CINNABAR_VOLCANO_PROSPECTOR
	call SetSpriteFacingRight
.noFacingChange
	ld hl, .tryOneOn
	rst _PrintText
	ld a, SFX_INTRO_WHOOSH
	rst _PlaySound
	call PlayerQuickSpin
	ld de, LavaSuitSprite
	lb bc, BANK(LavaSuitSprite), 12
	ld hl, vNPCSprites
	call CopyVideoData
	ld a, WEARING_LAVA_SUIT
	ld [wWalkBikeSurfState], a
	ld a, SFX_HEAL_HP
	rst _PlaySound
	ld c, 60
	rst _DelayFrames
	ld a, [wYCoord]
	cp 2
	ld a, PLAYER_DIR_LEFT
	jr z, .playerFacing
	ld a, PLAYER_DIR_UP
.playerFacing
	ld [wPlayerMovingDirection], a	
	ld hl, .lookinGood
	rst _PrintText
	SetEvent EVENT_GOT_LAVA_SUIT
	ld a, CINNABAR_VOLCANO_PROSPECTOR
	ldh [hSpriteIndex], a
	ld de, GenericMoveUp
	call MoveSpriteButAllowAOrBPress
	SetEvent EVENT_VOLCANO_SPRITE_MOVING
	rst TextScriptEnd
.explainVolcano
	ld hl, .problem
	rst _PrintText
	call .bothLookUp
	ld hl, .lavaconefull
	rst _PrintText
	ld a, CINNABAR_VOLCANO_PROSPECTOR
	call SetSpriteFacingLeft
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	ld hl, .blowrocks
	rst _PrintText
	ld a, CINNABAR_VOLCANO_PROSPECTOR
	call SetSpriteFacingRight
	ld hl, .digDown
	rst _PrintText
	callfar DrillAnimation
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	ld hl, .gotDrill
	rst _PrintText
	call PlayUnusedFanfareThenTextPrompt
	ld hl, .drillInfo
	rst _PrintText
	ld a, CINNABAR_VOLCANO_PROSPECTOR
	call SetSpriteFacingDown
	ld hl, .friend
	rst _PrintText
	ld a, CINNABAR_VOLCANO_PROSPECTOR
	call SetSpriteFacingRight
	ld hl, .youeast
	rst _PrintText
	SetEvent EVENT_GOT_DRILL
	ld a, CINNABAR_VOLCANO_BLAINE
	call SetSpriteFacingLeft
	call UpdateSprites
	ld de, SFX_Volcano_Ball_Poof_Ch5
	call PlayNewSoundChannel5
	ld de, SFX_Volcano_Ball_Poof_Ch8
	call PlayNewSoundChannel8
	ld de, vNPCSprites tile $2C
	callfar FarLoadSmokeTileFourTimes
	ld c, 4
	rst _DelayFrames
	ld a, HS_VOLCANO_ARCANINE
	call VolcanoHideSpriteEntry
	ld hl, .goodluck
	rst _PrintText
	SetEvent EVENT_VOLCANO_SPRITE_MOVING
	ld de, BlaineWalksOut
	call MoveSpriteButAllowAOrBPress
	rst TextScriptEnd
.finishedVolcano
	ld hl, .whatdidyoudo
	rst _PrintText
	call .bothLookUp
	call UpdateSprites
	ld c, 60
	rst _DelayFrames
	ld de, SFX_Lava_Flows
	call PlayNewSoundChannel8
	call CinnabarVolcanoReplaceMainRoomLava
	ld c, 60
	rst _DelayFrames
	ld a, CINNABAR_VOLCANO_PROSPECTOR
	call SetSpriteFacingRight
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	ld hl, .letsgetout
	rst _PrintText
	SetEvent EVENT_FINISHED_VOLCANO
	; scripted warp
	ld a, CINNABAR_VOLCANO
	ldh [hWarpDestinationMap], a
	ld a, 3
	ld [wDestinationWarpID], a
	ld hl, wStatusFlags3
	set BIT_WARP_FROM_CUR_SCRIPT, [hl]
	rst TextScriptEnd
.finalConvo
	ld hl, .phew
	rst _PrintText
	ld a, CINNABAR_VOLCANO_PROSPECTOR
	ld d, 4
	call NPCSpriteQuickSpinArbitrary
	call WaitForSoundToFinish
	ld a, SFX_WITHDRAW_DEPOSIT
	rst _PlaySound
	; takes off suit
	ld hl, vNPCSprites tile 12
	ld de, SailorSprite
	lb bc, BANK(SailorSprite), 12
	call CopyVideoData
	ld a, SPRITE_SAILOR
	ld [wSprite01StateData1PictureID], a
	ld [wMapSpriteOriginalPictureIDs], a ; first sprite's original pic id
	ld c, 60
	rst _DelayFrames
	ld hl, .gladgotthem
	rst _PrintText
	ld a, CINNABAR_VOLCANO_PROSPECTOR
	call SetSpriteFacingDown
	; blaine takes off suit
	ld a, CINNABAR_VOLCANO_BLAINE
	ld d, 4
	call NPCSpriteQuickSpinArbitrary
	call WaitForSoundToFinish
	ld a, SFX_WITHDRAW_DEPOSIT
	rst _PlaySound
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ld a, SPRITE_BLAINE
	ld de, BlaineSprite
	lb bc, BANK(BlaineSprite), 12
	jr nz, .loadSprite
	ld de, MiddleAgedManSprite
	lb bc, BANK(MiddleAgedManSprite), 12
	ld a, SPRITE_MIDDLE_AGED_MAN
.loadSprite
	ld [wSprite02StateData1PictureID], a
	ld hl, vNPCSprites tile 24
	call CopyVideoData
	ld a, CINNABAR_VOLCANO_BLAINE
	call SetSpriteFacingDown
	call UpdateSprites
	ld c, 60
	rst _DelayFrames
	ld a, CINNABAR_VOLCANO_BLAINE
	call SetSpriteFacingUp
	ld hl, .blainemoltres
	rst _PrintText
	ld a, CINNABAR_VOLCANO_BLAINE
	call SetSpriteFacingRight
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	CheckEvent EVENT_BEAT_BLAINE
	ld hl, .blainelastmessagedonegym
	jr nz, .blaineFinalMessage
	ld hl, .blainelastmessagenotdonegym
.blaineFinalMessage
	rst _PrintText
	SetEvent EVENT_VOLCANO_TALKED_TO_BLAINE
	SetEventReuseHL EVENT_VOLCANO_SPRITE_MOVING
	; set blaine to leave
	ld de, BlaineLeavesVolcano
	call MoveSpriteButAllowAOrBPress
	rst TextScriptEnd
.bothLookUp
	ld a, CINNABAR_VOLCANO_PROSPECTOR
	call SetSpriteFacingUp
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ret
.neverMetIntro
	text_far _CinnabarVolcanoProspectorGreetingNotMetText
	text_end
.didMeetIntro
	text_far _CinnabarVolcanoProspectorGreetingMetText
	text_end
.helpOut
	text_far _CinnabarVolcanoProspectorStrongMonsText
	text_end
.tryOneOn
	text_far _CinnabarVolcanoProspectorLavaSuitText
	text_end
.lookinGood
	text_far _CinnabarVolcanoProspectorLetsGo
	text_end
.problem
	text_far _CinnabarVolcanoProspectorHeresProblem
	text_end
.lavaconefull
	text_far _CinnabarVolcanoProspectorLavaExplain
	text_end
.blowrocks
	text_far _CinnabarVolcanoProspectorBlowRocks
	text_end
.digDown
	text_far _CinnabarVolcanoGiveDrill
	text_end
.gotDrill
	text_far _CinnabarVolcanoGotDrill
	text_end
.drillInfo
	text_far _CinnabarVolcanoDrill
	text_end
.friend
	text_far _CinnabarVolcanoFriend
	text_end
.youeast
	text_far _CinnabarVolcanoYouClearEast
	text_end
.goodluck
	text_far _GenericGoodLuckText
	text_end
.whatdidyoudo
	text_far _VolcanoProspectorDone
	text_end
.letsgetout
	text_far _VolcanoProspectorDone2
	text_end
.phew
	text_far _VolcanoProspectorPhew
	text_end
.gladgotthem
	text_far _VolcanoProspectorRightBlaine
	text_end
.blainemoltres
	text_far _VolcanoBlaineMessage1
	text_end
.blainelastmessagenotdonegym
	text_far _VolcanoBlaineMessageNotDone
	text_end
.blainelastmessagedonegym
	text_far _VolcanoBlaineMessageGymDone
	text_end
.prospecting
	text_far _VolcanoProspectorAfterMessage
	text_end
.getToIt
	text_far _VolcanoGetToIt
	text_end

BlaineWalksOut:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_LEFT
	db -1

BlaineLeavesVolcano:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1

FarNPCSpriteQuickSpin:
	ld a, d
; input a = which sprite
NPCSpriteQuickSpin:
	ld d, 8
NPCSpriteQuickSpinArbitrary:
.outerLoop
	ld hl, NPCQuickSpinFacings
	ld e, 4
.loop
	push af
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, c
	push hl
	call ChangeSpriteFacing
	call UpdateSprites
	rst _DelayFrame
	pop hl
	pop af
	dec e
	jr nz, .loop
	dec d
	jr nz, .outerLoop
	ret

NPCQuickSpinFacings:
	db SPRITE_FACING_LEFT, SPRITE_FACING_UP, SPRITE_FACING_RIGHT, SPRITE_FACING_DOWN

PlayerQuickSpin::
	ld d, 8
.outerLoop
	ld hl, PlayerQuickSpinFacings
	ld e, 4
.loop
	ld a, [hli]
	ld [wPlayerMovingDirection], a
	push hl
	call UpdateSprites
	rst _DelayFrame
	pop hl
	dec e
	jr nz, .loop
	dec d
	jr nz, .outerLoop
	ret

PlayerQuickSpinFacings:
	db PLAYER_DIR_LEFT, PLAYER_DIR_UP, PLAYER_DIR_RIGHT, PLAYER_DIR_DOWN

MoveSpriteButAllowAOrBPress:
	call MoveSprite
	ld hl, wJoyIgnore
	res BIT_B_BUTTON, [hl]
	res BIT_A_BUTTON, [hl]
	ret

; bc = picture id backup in wMapSpriteOriginalPictureIDs
; de = tile location for this sprite
; hl = picture id wram variable
MakeNPCWearLavaSuit:
	ld a, SPRITE_LAVA_SUIT
	ld [hl], a
	ld [bc], a
	ld h, d
	ld l, e
	ld de, LavaSuitSprite
	lb bc, BANK(LavaSuitSprite), 12
	jp CopyVideoData

MakeBlaineAndProspectorWearLavaSuit:
	ld de, vNPCSprites tile 12
	ld hl, wSprite01StateData1PictureID
	ld bc, wMapSpriteOriginalPictureIDs
	call MakeNPCWearLavaSuit
	ld de, vNPCSprites tile 24
	ld hl, wSprite02StateData1PictureID
	ld bc, wMapSpriteOriginalPictureIDs + 1
	call MakeNPCWearLavaSuit
	ld hl, wSpriteOptions2
	bit BIT_MENU_ICON_SPRITES, [hl]
	ret nz
	; replace cat sprite with quadruped sprite
	ld hl, vNPCSprites tile $2C
	ld de, PartyMonSprites1 tile 72
	call .copy
	ld hl, vNPCSprites tile $2E
	ld de, PartyMonSprites1 tile 76
.copy
	lb bc, BANK(PartyMonSprites1), 2
	jp CopyVideoData

CinnabarVolcanoClearedAllBlockagesText::
	text_far _VolcanoBlockagesGone
	sound_get_item_2
	text_far _VolcanoGoBackMainFloor
	text_end

CinnabarVolcanoBlaineText:
	text_far _VolcanoBlaineJoinUs
	text_end

CinnabarVolcanoReplaceMainRoomLava:
	ld a, $59 ; walkable block
	ld [wNewTileBlockID], a
	ld de, VolcanoMainRoomTileBlockReplacements
	jpfar ReplaceTileBlockLineVerticalWithOneBlock

CinnabarVolcanoAvoidWestSideText:
	text_far _VolcanoAvoidWestSide
	text_end

StopChannel8ThenPickUpItemText:
	text_asm
	call VolcanoStopChannel8
	; stops the volcano rumbling so the "get item" sound doesn't wait for it to finish
	jp PickupItemTextBody

VolcanoStopChannel8:
	ld de, StopSFXSound
	jp PlayNewSoundChannel8

VolcanoHiddenItemInit::
	CheckHiddenItemObtained 68 ; 69th hidden item
	ret nz
	call VolcanoStopChannel8
	jpfar HiddenItems
