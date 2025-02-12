EnterMap::
; Load a new map.
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	call LoadMapData
	farcall ClearVariablesOnEnterMap
	ld hl, wStatusFlags2
	bit BIT_WILD_ENCOUNTER_COOLDOWN, [hl]
	jr z, .skipGivingThreeStepsOfNoRandomBattles
	ld a, 3 ; minimum number of steps between battles
	ld [wNumberOfNoRandomBattleStepsLeft], a
.skipGivingThreeStepsOfNoRandomBattles
	ld hl, wStatusFlags4
	bit BIT_BATTLE_OVER_OR_BLACKOUT, [hl] ; did a battle happen immediately before this?
	res BIT_BATTLE_OVER_OR_BLACKOUT, [hl] ; unset the "battle just happened" flag
	call z, ResetUsingStrengthSurfOutOfBattleBits
	call nz, MapEntryAfterBattle
;;;;; PureRGBnote: MOVED: from slightly later in the function
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	set BIT_CUR_MAP_LOADED_2, [hl]
;;;;;
	ld hl, wStatusFlags6
	ld a, [hl]
	and (1 << BIT_FLY_WARP) | (1 << BIT_DUNGEON_WARP)
	jr z, .didNotEnterUsingFlyWarpOrDungeonWarp
	res BIT_FLY_WARP, [hl]
	farcall EnterMapAnim
	call UpdateSprites
.didNotEnterUsingFlyWarpOrDungeonWarp
	farcall CheckForceBikeOrSurf ; handle currents in SF islands and forced bike riding in cycling road
	ld hl, wStatusFlags3
	res BIT_NO_NPC_FACE_PLAYER, [hl]
	call UpdateSprites
	xor a
	ld [wJoyIgnore], a

OverworldLoop::
	rst _DelayFrame
OverworldLoopLessDelay::
	;rst _DelayFrame ; shinpokerednote: ADDED: 60fps mode enabled by commenting this (but needs additional tweaks to run correctly)
	callfar GBCSetCPU2xSpeed	; shinpokerednote: ADDED: set 2x cpu speed when on gbc
	call LoadGBPal
	ld a, [wMovementFlags]
	bit BIT_LEDGE_OR_FISHING, a ; jumping down a ledge?
	jr z, .notMidJump
	; Handle the player jumping down
	; a ledge in the overworld.
	callfar HandleMidJump
.notMidJump
;;;;; PureRGBnote: ADDED: in some maps there are special map animations that play. This is where they are checked whether to happen.
	CheckFlag FLAG_MAP_HAS_OVERWORLD_ANIMATION
	jr z, .noAnimation
	callfar CheckOverworldAnimation
.noAnimation
;;;;;
	ld a, [wWalkCounter]
	and a
	jp nz, .moveAhead ; if the player sprite has not yet completed the walking animation
	call JoypadOverworld ; get joypad state (which is possibly simulated)
	farcall SafariZoneCheck
	ld a, [wSafariZoneGameOver]
	and a
	jp nz, WarpFound2
	ld hl, wStatusFlags3
	bit BIT_WARP_FROM_CUR_SCRIPT, [hl]
	res BIT_WARP_FROM_CUR_SCRIPT, [hl]
	jp nz, WarpFound2
	ld a, [wStatusFlags6]
	and (1 << BIT_FLY_WARP) | (1 << BIT_DUNGEON_WARP)
	jp nz, HandleFlyWarpOrDungeonWarp
	ld a, [wCurOpponent]
	and a
	jp nz, .newBattle
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a ; are we simulating button presses?
; PureRGBnote: OPTIMIZED
	ldh a, [hJoyPressed]
	jr z, .checkIfStartIsPressed
	ldh a, [hJoyHeld]
;	jr z, .notSimulating
;	ldh a, [hJoyHeld]
;	jr .checkIfStartIsPressed
;.notSimulating
;	ldh a, [hJoyPressed]
.checkIfStartIsPressed
	bit BIT_START, a
	jr z, .startButtonNotPressed
; if START is pressed
	xor a ; TEXT_START_MENU
	ldh [hTextID], a
	jp .displayDialogue
.startButtonNotPressed
	bit BIT_A_BUTTON, a
	jr nz, .aorSelectPressed ; PureRGBnote: ADDED: functionality that happens when pressing SELECT in overworld (bicycle)
	bit BIT_SELECT, a
	jp z, .checkIfDownButtonIsPressed
.aorSelectPressed	
; if A is pressed
	ld a, [wStatusFlags5]
	bit BIT_UNKNOWN_5_2, a
	jp nz, .noDirectionButtonsPressed
	call IsPlayerCharacterBeingControlledByGame
	jr nz, .checkForOpponent
;;;;;;;;;; PureRGBnote: ADDED: functionality that happens when pressing SELECT in overworld (bicycle)
.trySelectingBikeRod
	ldh a, [hJoyPressed]
	bit BIT_SELECT, a	;is Select being pressed?
	jr z, .notSelect
	callfar CheckForRodBike
	jp OverworldLoop
.notSelect
;;;;;;;;;;
	call CheckForHiddenObjectOrBookshelfOrCardKeyDoor
	ldh a, [hItemAlreadyFound]
	and a
	jp z, OverworldLoop ; jump if a hidden object or bookshelf was found, but not if a card key door was found
	call IsSpriteOrSignInFrontOfPlayer
	ldh a, [hTextID]
	and a
	jp z, OverworldLoop
.displayDialogue
	predef GetTileAndCoordsInFrontOfPlayer
	call UpdateSprites
	ld a, [wMiscFlags]
	;bit BIT_TURNING, a
	;jr nz, .checkForOpponent ; PureRGBnote: CHANGED: this bit isn't used anymore
	bit BIT_SEEN_BY_TRAINER, a
	jr nz, .checkForOpponent
	lda_coord 8, 9
	ld [wTilePlayerStandingOn], a ; checked when using Surf for forbidden tile pairs
	call DisplayTextID ; display either the start menu or the NPC/sign text
	ld a, [wEnteringCableClub]
	and a
	jr z, .checkForOpponent
	xor a
	ld [wEnteringCableClub], a
; XXX can this code be reached?
;	jr z, .changeMap
;	predef LoadSAV
;	ld a, [wCurMap]
;	ld [wDestinationMap], a
;	call PrepareForSpecialWarp
;	ld a, [wCurMap]
;	call SwitchToMapRomBank ; switch to the ROM bank of the current map
;	ld hl, wCurMapTileset
;	set BIT_NO_PREVIOUS_MAP, [hl]
.changeMap
	jp EnterMap
.checkForOpponent
	ld a, [wCurOpponent]
	and a
	jp nz, .newBattle
	jp OverworldLoop
.noDirectionButtonsPressed
	;ld hl, wMiscFlags
	;res BIT_TURNING, [hl] ; PureRGBnote: CHANGED: this bit isn't used anymore
	call UpdateSprites
;;;;;;;;;;; PureRGBnote: ADDED: code for changing direction without moving by pressing A+B and a direction when standing still.
	ldh a, [hJoyHeld] 
	and B_BUTTON | A_BUTTON
	cp B_BUTTON | A_BUTTON
	jr nz, .resetDirectionChangeState ; hold both B and A button to go into "change direction without moving" mode.
	ld a, [wDirectionChangeModeCounter]
	and %01111111 ; prevents wrapping to 0 by incrementing past 255
	inc a
	ld [wDirectionChangeModeCounter], a
	jr .doneCheckingDirectionChangeMode
.resetDirectionChangeState
	xor a
	ld [wDirectionChangeModeCounter], a
.doneCheckingDirectionChangeMode
;;;;;;;;;;;
	ld a, [wPlayerMovingDirection] ; the direction that was pressed last time
	and a
	jp z, OverworldLoop
; if a direction was pressed last time
	ld [wPlayerLastStopDirection], a ; save the last direction
	xor a
	ld [wPlayerMovingDirection], a ; zero the direction
	jp OverworldLoop

.checkIfDownButtonIsPressed
	ldh a, [hJoyHeld] ; current joypad state
	bit BIT_D_DOWN, a
	jr z, .checkIfUpButtonIsPressed
	ld a, 1
	ld [wSpritePlayerStateData1YStepVector], a
	ld a, PLAYER_DIR_DOWN
	jr .handleDirectionButtonPress

.checkIfUpButtonIsPressed
	bit BIT_D_UP, a
	jr z, .checkIfLeftButtonIsPressed
	ld a, -1
	ld [wSpritePlayerStateData1YStepVector], a
	ld a, PLAYER_DIR_UP
	jr .handleDirectionButtonPress

.checkIfLeftButtonIsPressed
	bit BIT_D_LEFT, a
	jr z, .checkIfRightButtonIsPressed
	ld a, -1
	ld [wSpritePlayerStateData1XStepVector], a
	ld a, PLAYER_DIR_LEFT
	jr .handleDirectionButtonPress

.checkIfRightButtonIsPressed
	bit BIT_D_RIGHT, a
	jr z, .noDirectionButtonsPressed
	ld a, 1
	ld [wSpritePlayerStateData1XStepVector], a


.handleDirectionButtonPress
	ld [wPlayerDirection], a ; new direction
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	jr nz, .noDirectionChange ; ignore direction changes if we are
;;;;;; PureRGBnote: ADDED: Code for entering "direction change" mode when wDirectionChangeModeCounter >= 10
	ld a, [wDirectionChangeModeCounter]
	cp 10 ; must hold down A+B for at least this many frames while standing still to get into this mode
	jr c, .noDirectionChange
;;;;;;
; PureRGBnote: CHANGED: this code isn't needed anymore
;	ld a, [wDirectionChangeModeCounter]
;	and a
;	jr z, .noDirectionChange
;	ld a, [wPlayerDirection] ; new direction
;	ld b, a
;	ld a, [wPlayerLastStopDirection] ; old direction
;	cp b
;	jr z, .noDirectionChange
; Check whether the player did a 180-degree turn.
; It appears that this code was supposed to show the player rotate by having
; the player's sprite face an intermediate direction before facing the opposite
; direction (instead of doing an instantaneous about-face), but the intermediate
; direction is only set for a short period of time. It is unlikely for it to
; ever be visible because DelayFrame is called at the start of OverworldLoop and
; normally not enough cycles would be executed between then and the time the
; direction is set for V-blank to occur while the direction is still set.
;	swap a ; put old direction in upper half
;	or b ; put new direction in lower half
;	cp (PLAYER_DIR_DOWN << 4) | PLAYER_DIR_UP ; change dir from down to up
;	jr nz, .notDownToUp
;	ld a, PLAYER_DIR_LEFT
;	ld [wPlayerMovingDirection], a
;	jr .holdIntermediateDirectionLoop
;.notDownToUp
;	cp (PLAYER_DIR_UP << 4) | PLAYER_DIR_DOWN ; change dir from up to down
;	jr nz, .notUpToDown
;	ld a, PLAYER_DIR_RIGHT
;	ld [wPlayerMovingDirection], a
;	jr .holdIntermediateDirectionLoop
;.notUpToDown
;	cp (PLAYER_DIR_RIGHT << 4) | PLAYER_DIR_LEFT ; change dir from right to left
;	jr nz, .notRightToLeft
;	ld a, PLAYER_DIR_DOWN
;	ld [wPlayerMovingDirection], a
;	jr .holdIntermediateDirectionLoop
;.notRightToLeft
;	cp (PLAYER_DIR_LEFT << 4) | PLAYER_DIR_RIGHT ; change dir from left to right
;	jr nz, .holdIntermediateDirectionLoop
;	ld a, PLAYER_DIR_UP
;	ld [wPlayerMovingDirection], a
.directionChangeState
	ld a, [wPlayerDirection]
	ld [wPlayerMovingDirection], a
	jp OverworldLoop
	;ld hl, wMiscFlags
	;set BIT_TURNING, [hl]
	;call NewBattle
	;jp c, BattleOccurred
	;jp OverworldLoop ; PureRGBnote: CHANGED: when we are in "direction change" mode we just dont check for battles now

.noDirectionChange
	xor a
	ld [wDirectionChangeModeCounter], a ; PureRGBnote: ADDED: when we aren't standing still, clear this counter
	ld a, [wPlayerDirection] ; current direction
	ld [wPlayerMovingDirection], a ; save direction
	call UpdateSprites
	ld a, [wWalkBikeSurfState]
	cp SURFING
	jr z, .surfing
; not surfing
	call CollisionCheckOnLand
	jr nc, .noCollision
; collision occurred
	push hl
	ld hl, wMovementFlags
	bit BIT_STANDING_ON_WARP, [hl]
	pop hl
	jp z, OverworldLoop
; collision occurred while standing on a warp
	push hl
	call ExtraWarpCheck ; sets carry if there is a potential to warp
	pop hl
	jp c, CheckWarpsCollision
	jp OverworldLoop

.surfing
	call CollisionCheckOnWater
	jp c, OverworldLoop

.noCollision
	ld a, $10 ; shinpokerednote: 60fps: counter is doubled
	ld [wWalkCounter], a
	jr .moveAhead2

.moveAhead
	ld a, [wMovementFlags]
	bit BIT_SPINNING, a
	jr z, .noSpinning
	farcall LoadSpinnerArrowTiles
.noSpinning
	call UpdateSprites

.moveAhead2
	;ld hl, wMiscFlags
	;res BIT_TURNING, [hl] ; PureRGBnote: CHANGED: this bit isn't used anymore
	ld a, [wMovementFlags]
	bit BIT_SPINNING, a
	jr nz, .spinnerSpeed ; PureRGBnote: CHANGED: faster spin tile movement
	CheckFlag FLAG_FAST_AUTO_MOVEMENT ; PureRGBnote: ADDED: flag that makes the player move quicker during auto movement scripts if set.
	jr nz, .spinnerSpeed
	ld a, [wWalkBikeSurfState]
	dec a ; riding a bike?
	jr nz, .normalPlayerSpriteAdvancement
	ld a, [wMovementFlags]
	bit BIT_LEDGE_OR_FISHING, a
	jr nz, .normalPlayerSpriteAdvancement
	call GetBikeSpeed ; PureRGBnote: CHANGED: bike speed check is relegated to its own function
	jr .notRunning
.spinnerSpeed
	call DoBikeSpeedup
	jr .notRunning
.normalPlayerSpriteAdvancement
	; PureRGBnote: ADDED: Holding B makes you run at 2x walking speed
	ldh a, [hJoyHeld]
	and B_BUTTON
	call nz, DoBikeSpeedup
.notRunning
	call AdvancePlayerSprite
	ld a, [wWalkCounter]
	and a
	jp nz, CheckMapConnections ; it seems like this check will never succeed (the other place where CheckMapConnections is run works)
; walking animation finished
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	jr nz, .doneStepCounting ; if button presses are being simulated, don't count steps
; step counting
	ld hl, wStepCounter
	dec [hl]
	ld a, [wStatusFlags2]
	bit BIT_WILD_ENCOUNTER_COOLDOWN, a
	jr z, .doneStepCounting
	ld hl, wNumberOfNoRandomBattleStepsLeft
	dec [hl]
	jr nz, .doneStepCounting
	ld hl, wStatusFlags2
	res BIT_WILD_ENCOUNTER_COOLDOWN, [hl]
.doneStepCounting
	CheckEvent EVENT_IN_SAFARI_ZONE
	jr z, .notSafariZone
	farcall SafariZoneCheckSteps
	ld a, [wSafariZoneGameOver]
	and a
	jp nz, WarpFound2
.notSafariZone
	ld a, [wIsInBattle]
	and a
	jp nz, CheckWarpsNoCollision
	predef ApplyOutOfBattlePoisonDamage ; also increment daycare mon exp
	ld a, [wOutOfBattleBlackout]
	and a
	jp nz, HandleBlackOut ; if all pokemon fainted
.newBattle
	call NewBattle
	ld hl, wMovementFlags
	res BIT_STANDING_ON_WARP, [hl]
	jp nc, CheckWarpsNoCollision ; check for warps if there was no battle
BattleOccurred::
	ld hl, wStatusFlags3
	res BIT_TALKED_TO_TRAINER, [hl]
	ld hl, wStatusFlags7
	res BIT_TRAINER_BATTLE, [hl]
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	set BIT_CUR_MAP_LOADED_2, [hl]
	set BIT_MAP_LOADED_AFTER_BATTLE, [hl] ; PureRGBnote: ADDED: new bit indicating we reloaded a map from a battle 
	xor a
	ldh [hJoyHeld], a
;;;;; TODO: remove pointless crap?
	ld a, [wCurMap]
	cp CINNABAR_GYM
	jr nz, .notCinnabarGym
	SetEvent EVENT_2A7
.notCinnabarGym
;;;;;
	ld hl, wStatusFlags4
	set BIT_BATTLE_OVER_OR_BLACKOUT, [hl]
	ld a, [wCurMap]
	cp OAKS_LAB
	jp z, .noFaintCheck ; no blacking out if the player lost to the rival in Oak's lab
	callfar AnyPartyAlive
	ld a, d
	and a
	jr z, .allPokemonFainted
.noFaintCheck
	ld c, 10
	rst _DelayFrames
	jp EnterMap
.allPokemonFainted
	ld a, $ff
	ld [wIsInBattle], a
	call RunMapScript
	jp HandleBlackOut

; function to determine if there will be a battle and execute it (either a trainer battle or wild battle)
; sets carry if a battle occurred and unsets carry if not
NewBattle::
	ld a, [wStatusFlags3]
	bit BIT_ON_DUNGEON_WARP, a
	jr nz, .noBattle
	call IsPlayerCharacterBeingControlledByGame
	jr nz, .noBattle ; no battle if the player character is under the game's control
	ld a, [wStatusFlags4]
	bit BIT_NO_BATTLES, a
	jr nz, .noBattle
	farjp InitBattle
.noBattle
	and a
	ret

; PureRGBnote: ADDED: bike will go even faster when holding B while riding it
; but we need to account for cycling road's "hill" in the movement speed which gets a bit complicated.
GetBikeSpeed::
	; Bike is normally 2x walking speed
	; Holding B makes the bike even faster
	ld a, [wCurMap]
	cp ROUTE_17 ; Cycling Road
	jr z, .cyclingRoad
	ldh a, [hJoyHeld]
	and B_BUTTON
	jr z, DoBikeSpeedup
	; B button held
	call DoBikeSpeedup
	call DoBikeSpeedup
	jr DoBikeSpeedup
.cyclingRoad
	; uphill we can only go a bit faster, downhill we can go full speed
	ldh a, [hJoyHeld]
	and D_UP | D_LEFT | D_RIGHT
	call z, DoBikeSpeedup
	ldh a, [hJoyHeld]
	and B_BUTTON
	ret z
	call DoBikeSpeedup
	ldh a, [hJoyHeld]
	and D_UP | D_LEFT | D_RIGHT
	ret nz
	; fall through

; function to make bikes twice as fast as walking
DoBikeSpeedup::
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	jp AdvancePlayerSprite

; check if the player has stepped onto a warp after having not collided
CheckWarpsNoCollision::
	ld a, [wNumberOfWarps]
	and a
	jp z, CheckMapConnections
	ld a, [wNumberOfWarps]
	ld b, 0
	ld c, a
	ld a, [wYCoord]
	ld d, a
	ld a, [wXCoord]
	ld e, a
	ld hl, wWarpEntries
CheckWarpsNoCollisionLoop::
	ld a, [hli] ; check if the warp's Y position matches
	cp d
	jr nz, CheckWarpsNoCollisionRetry1
	ld a, [hli] ; check if the warp's X position matches
	cp e
	jr nz, CheckWarpsNoCollisionRetry2
; if a match was found
	push hl
	push bc
	ld hl, wMovementFlags
	set BIT_STANDING_ON_WARP, [hl]
	farcall IsPlayerStandingOnDoorTileOrWarpTile
	pop bc
	pop hl
	jr c, WarpFound1 ; jump if standing on door or warp
	push hl
	push bc
	call ExtraWarpCheck
	pop bc
	pop hl
	jr nc, CheckWarpsNoCollisionRetry2
; if the extra check passed
	ld a, [wStatusFlags7]
	bit BIT_FORCED_WARP, a
	jr nz, WarpFound1
	push de
	push bc
	call Joypad
	pop bc
	pop de
	ldh a, [hJoyHeld]
	and D_DOWN | D_UP | D_LEFT | D_RIGHT
	jr z, CheckWarpsNoCollisionRetry2 ; if directional buttons aren't being pressed, do not pass through the warp
	jr WarpFound1

; check if the player has stepped onto a warp after having collided
CheckWarpsCollision::
	ld a, [wNumberOfWarps]
	ld c, a
	ld hl, wWarpEntries
.loop
	ld a, [hli] ; Y coordinate of warp
	ld b, a
	ld a, [wYCoord]
	cp b
	jr nz, .retry1
	ld a, [hli] ; X coordinate of warp
	ld b, a
	ld a, [wXCoord]
	cp b
	jr nz, .retry2
	ld a, [hli]
	ld [wDestinationWarpID], a
	ld a, [hl]
	ldh [hWarpDestinationMap], a
	jr WarpFound2
.retry1
	inc hl
.retry2
	inc hl
	inc hl
	dec c
	jr nz, .loop
	jp OverworldLoop

CheckWarpsNoCollisionRetry1::
	inc hl
CheckWarpsNoCollisionRetry2::
	inc hl
	inc hl
	jp ContinueCheckWarpsNoCollisionLoop

WarpFound1::
	ld a, [hli]
	ld [wDestinationWarpID], a
	ld a, [hli]
	ldh [hWarpDestinationMap], a

WarpFound2::
	ld a, [wNumberOfWarps]
	sub c
	ld [wWarpedFromWhichWarp], a ; save ID of used warp (needed for elevators)
	ld a, [wCurMap]
	ld [wWarpedFromWhichMap], a ; save ID of previous map (needed for elevators)
	call CheckIfInOutsideMap
	jr nz, .indoorMaps
; this is for handling "outside" maps that can't have the 0xFF destination map
	ld a, [wCurMap]
	ld [wLastMap], a
	call PlayMapChangeSound ; PureRGBnote: CHANGED: this was moved earlier to fix jank with entering rock tunnel
	; ld a, [wCurMapWidth]
	; ld [wUnusedLastMapWidth], a ; not read
	ldh a, [hWarpDestinationMap]
	ld [wCurMap], a
	cp ROCK_TUNNEL_1F
	jr nz, .done
	ld a, 6
	ld [wMapPalOffset], a
	jr .done

; for maps that can have the 0xFF destination map, which means to return to the outside map
; not all these maps are necessarily indoors, though
.indoorMaps
	ldh a, [hWarpDestinationMap] ; destination map
	cp LAST_MAP
	jr z, .goBackOutside
; if not going back to the previous map
	ld [wCurMap], a
	farcall IsPlayerStandingOnWarpPadOrHole
	ld a, [wStandingOnWarpPadOrHole]
	dec a ; is the player on a warp pad?
	jr nz, .notWarpPad
; if the player is on a warp pad
	ld hl, wStatusFlags6
	set BIT_FLY_WARP, [hl]
	call LeaveMapAnim
	jr .skipMapChangeSound
.notWarpPad
	call PlayMapChangeSound
.skipMapChangeSound
	ld hl, wMovementFlags
	res BIT_STANDING_ON_DOOR, [hl]
	res BIT_EXITING_DOOR, [hl]
	jr .done
.goBackOutside
	ld a, [wLastMap]
	ld [wCurMap], a
	call PlayMapChangeSound
	xor a
	ld [wMapPalOffset], a
.done
	ld hl, wMovementFlags
	set BIT_STANDING_ON_DOOR, [hl] ; have the player's sprite step out from the door (if there is one)
	call IgnoreInputForHalfSecond
	jp EnterMap

ContinueCheckWarpsNoCollisionLoop::
	inc b ; increment warp number
	dec c ; decrement number of warps
	jp nz, CheckWarpsNoCollisionLoop

; if no matching warp was found
CheckMapConnections::
	; shinpokerednote: MOVED: check map connections in another bank to save space, do all 4 if necessary from that bank without returning until done
	farcall CheckWestMap 
	jr nz, .didNotEnterConnectedMap
.loadNewMap ; load the connected map that was entered
	ld hl, wCurrentMapScriptFlags
	set BIT_CROSSED_MAP_CONNECTION, [hl] ; PureRGBnote: ADDED: flag to indicate we crossed between maps by walking in the overworld
	call LoadMapHeader
	call PlayDefaultMusicFadeOutCurrent
	ld b, SET_PAL_OVERWORLD
	call RunPaletteCommand
; Since the sprite set shouldn't change, this will just update VRAM slots at
; x#SPRITESTATEDATA2_IMAGEBASEOFFSET without loading any tile patterns.
	farcall InitMapSprites
	call LoadTileBlockMap
	jp OverworldLoopLessDelay

.didNotEnterConnectedMap
	jp OverworldLoop

; function to play a sound when changing maps
PlayMapChangeSound::
	lda_coord 8, 8 ; upper left tile of the 4x4 square the player's sprite is standing on
	cp $0b ; door tile in tileset 0
; PureRGBnote: OPTIMIZED
	ld a, SFX_GO_OUTSIDE
	jr nz, .playSound
	ld a, SFX_GO_INSIDE
	;jr nz, .didNotGoThroughDoor
	;ld a, SFX_GO_INSIDE
	;jr .playSound
;.didNotGoThroughDoor
	;ld a, SFX_GO_OUTSIDE
.playSound
	rst _PlaySound
	ld a, [wMapPalOffset]
	and a
;;;;;;;;;; shinpokerednote: FIXED: fixes a bit of jank with entering rock tunnel
	jp z, GBFadeOutToBlack
	push af
	ld a, 7
	ld [wMapPalOffset], a
	call LoadGBPal
	pop af
	ld [wMapPalOffset], a
	ret
;;;;;;;;;;

CheckIfInFlyMap::
	ld a, [wCurMap]
	cp CELADON_MART_ROOF ; PureRGBnote: FIXED: can fly on roofs
	ret z
	cp CELADON_MANSION_ROOF ; PureRGBnote: FIXED: can fly on roofs
	ret z
	cp POWER_PLANT_ROOF
	ret z
	; fall through
CheckIfInDigMap:: ; can dig outside, but not on roofs
	call CheckIfInOutsideMap
	ret z
	cp FOREST ; PureRGBnote: FIXED: can fly in safari zone and viridian forest
	ret

CheckIfInOutsideMap::
; If the player is in an outside map (a town or route), set the z flag
	ld a, [wCurMapTileset]
	and a ; most towns/routes have tileset 0 (OVERWORLD)
	ret z
	cp PLATEAU ; Route 23 / Indigo Plateau
	ret

; this function is an extra check that sometimes has to pass in order to warp, beyond just standing on a warp
; the "sometimes" qualification is necessary because of CheckWarpsNoCollision's behavior
; depending on the map, either "function 1" or "function 2" is used for the check
; "function 1" passes when the player is at the edge of the map and is facing towards the outside of the map
; "function 2" passes when the the tile in front of the player is among a certain set
; sets carry if the check passes, otherwise clears carry
ExtraWarpCheck::
	ld a, [wCurMap]
	cp SS_ANNE_3F
	jr z, .useFunction1
	cp ROCKET_HIDEOUT_B1F
	jr z, .useFunction2
	cp ROCKET_HIDEOUT_B2F
	jr z, .useFunction2
	cp ROCKET_HIDEOUT_B4F
	jr z, .useFunction2
	cp ROCK_TUNNEL_1F
	jr z, .useFunction2
	ld a, [wCurMapTileset]
	and a ; outside tileset (OVERWORLD)
	jr z, .useFunction2
	cp SHIP ; S.S. Anne tileset
	jr z, .useFunction2
	cp SHIP_PORT ; Vermilion Port tileset
	jr z, .useFunction2
	cp PLATEAU ; Indigo Plateau tileset
	jr z, .useFunction2
.useFunction1
	ld hl, IsPlayerFacingEdgeOfMap
	jr .doBankswitch
.useFunction2
	ld hl, IsWarpTileInFrontOfPlayer
.doBankswitch
	ld b, BANK(IsWarpTileInFrontOfPlayer)
	rst _Bankswitch
	ret

MapEntryAfterBattle::
	farcall IsPlayerStandingOnWarp ; for enabling warp testing after collisions
;;;;;;;;;; PureRGBnote: ADDED: skip fading in in maps that use a specific bit in their header - allows tile block replacements to go unseen
	ld a, [wCurMapConnections]
	bit BIT_DEFER_SHOWING_MAP, a
	ret nz
;;;;;;;;;;
	; fall through
MapFadeAfterBattle::
	ld a, [wMapPalOffset]
	and a
	jp z, GBFadeInFromWhite
	jp LoadGBPal

HandleBlackOut::
; For when all the player's pokemon faint.
; Does not print the "blacked out" message.
	call GBFadeOutToBlack
	ld a, $08
	call StopMusic
	ld hl, wStatusFlags4
	res BIT_BATTLE_OVER_OR_BLACKOUT, [hl]
	ld a, BANK(ResetStatusAndHalveMoneyOnBlackout) ; also BANK(PrepareForSpecialWarp) and BANK(SpecialEnterMap)
	call SetCurBank
	call ResetStatusAndHalveMoneyOnBlackout
	call PrepareForSpecialWarp
	call PlayDefaultMusicFadeOutCurrent
	jp SpecialEnterMap

StopMusic::
	ld [wAudioFadeOutControl], a
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	rst _PlaySound
.wait
	ld a, [wAudioFadeOutControl]
	and a
	jr nz, .wait
	jp StopAllSounds

HandleFlyWarpOrDungeonWarp::
	call UpdateSprites
	call Delay3
	xor a
	ld [wBattleResult], a
	ld [wIsInBattle], a
	ld [wMapPalOffset], a
	ld hl, wStatusFlags6
;;;;;;;;;; PureRGBnote: CHANGED: don't clear bike or surf state on falling down a hole (keeps you on your bike if you're on it)
	bit BIT_DUNGEON_WARP, [hl] ; fell down hole warp
	jr nz, .dontResetBikeState ; don't reset bike state on falling down a hole
	ld [wWalkBikeSurfState], a
.dontResetBikeState
;;;;;;;;;;
	set BIT_FLY_OR_DUNGEON_WARP, [hl] ; fly warp or dungeon warp
	res BIT_ALWAYS_ON_BIKE, [hl] ; forced to ride bike
	call LeaveMapAnim
	ld a, BANK(PrepareForSpecialWarp)
	call SetCurBank
	call PrepareForSpecialWarp
	jp SpecialEnterMap

LeaveMapAnim::
	farjp _LeaveMapAnim

LoadPlayerSpriteGraphics::
; Load sprite graphics based on whether the player is standing, biking, or surfing.

	; 0: standing
	; 1: biking
	; 2: surfing

	ld a, [wWalkBikeSurfState]
	dec a
	jr z, .ridingBike

	ldh a, [hTileAnimations]
	and a
	jr nz, .determineGraphics
	jr .startWalking

.ridingBike
	; If the bike can't be used,
	; start walking instead.
	call IsBikeRidingAllowed
	jr c, .determineGraphics

.startWalking
	xor a
	ld [wWalkBikeSurfState], a
	ld [wWalkBikeSurfStateCopy], a
	jp LoadWalkingPlayerSpriteGraphics

.determineGraphics
	ld a, [wWalkBikeSurfState]
	and a
	jp z, LoadWalkingPlayerSpriteGraphics
	dec a
	jp z, LoadBikePlayerSpriteGraphics
	dec a
	jp z, LoadSurfingPlayerSpriteGraphics
	dec a
	jp z, LoadLavaSuitSpriteGraphics
	jp LoadWalkingPlayerSpriteGraphics

IsBikeRidingAllowed::
; PureRGBnote: ADDED: The bike can be used on maps within BikeRidingMaps,
; or maps with tilesets in BikeRidingTilesets.
; Return carry if biking is allowed.

	ld a, [wCurMapTileset]
	ld b, a
	ld hl, BikeRidingTilesets
	call .bikeAllowedLoop
	ret c
	ld a, [wCurMap]
	ld b, a
	ld hl, BikeRidingMaps

.bikeAllowedLoop
.loop
	ld a, [hli]
	cp b
	jr z, .allowed
	inc a
	jr nz, .loop
	and a
	ret

.allowed
	scf
	ret

INCLUDE "data/tilesets/bike_riding_tilesets.asm"

; load the tile pattern data of the current tileset into VRAM
LoadTilesetTilePatternData::
	hl_deref wTilesetGfxPtr
	ld de, vTileset
	ld bc, $600
	ld a, [wTilesetBank]
	jp FarCopyData4

; this loads the current map's complete tile map (which references blocks, not individual tiles) to wOverworldMap
; it can also load partial tile maps of connected maps into a border of length 3 around the current map
LoadTileBlockMap::
; fill wOverworldMap-wOverworldMapEnd with the background tile
	ld hl, wOverworldMap
	ld a, [wMapBackgroundTile]
	ld d, a
	ld bc, wOverworldMapEnd - wOverworldMap
.backgroundTileLoop
	ld a, d
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .backgroundTileLoop
; load tile map of current map (made of tile block IDs)
; a 3-byte border at the edges of the map is kept so that there is space for map connections
	ld hl, wOverworldMap
	ld a, [wCurMapWidth]
	ldh [hMapWidth], a
	add MAP_BORDER * 2 ; east and west
	ldh [hMapStride], a ; map width + border
	ld b, 0
	ld c, a
; make space for north border (next 3 lines)
	add hl, bc
	add hl, bc
	add hl, bc
	ld c, MAP_BORDER
	add hl, bc ; this puts us past the (west) border
	ld a, [wCurMapDataPtr] ; tile map pointer
	ld e, a
	ld a, [wCurMapDataPtr + 1]
	ld d, a ; de = tile map pointer
	ld a, [wCurMapHeight]
	ld b, a
.rowLoop ; copy one row each iteration
	push hl
	ldh a, [hMapWidth] ; map width (without border)
	ld c, a
.rowInnerLoop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .rowInnerLoop
; add the map width plus the border to the base address of the current row to get the next row's address
	pop hl
	ldh a, [hMapStride] ; map width + border
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	dec b
	jr nz, .rowLoop
.northConnection
	ld a, [wNorthConnectedMap]
	cp $ff
	jr z, .southConnection
	call SwitchToMapRomBank
	de_deref wNorthConnectionStripDest
	hl_deref wNorthConnectionStripSrc
	ld a, [wNorthConnectionStripLength]
	ldh [hNorthSouthConnectionStripWidth], a
	ld a, [wNorthConnectedMapWidth]
	ldh [hNorthSouthConnectedMapWidth], a
	call LoadNorthSouthConnectionsTileMap
.southConnection
	ld a, [wSouthConnectedMap]
	cp $ff
	jr z, .westConnection
	call SwitchToMapRomBank
	de_deref wSouthConnectionStripDest
	hl_deref wSouthConnectionStripSrc
	ld a, [wSouthConnectionStripLength]
	ldh [hNorthSouthConnectionStripWidth], a
	ld a, [wSouthConnectedMapWidth]
	ldh [hNorthSouthConnectedMapWidth], a
	call LoadNorthSouthConnectionsTileMap
.westConnection
	ld a, [wWestConnectedMap]
	cp $ff
	jr z, .eastConnection
	call SwitchToMapRomBank
	de_deref wWestConnectionStripDest
	hl_deref wWestConnectionStripSrc
	ld a, [wWestConnectionStripLength]
	ld b, a
	ld a, [wWestConnectedMapWidth]
	ldh [hEastWestConnectedMapWidth], a
	call LoadEastWestConnectionsTileMap
.eastConnection
	ld a, [wEastConnectedMap]
	cp $ff
	ret z ;jr z, .done ; PureRGBnote: OPTIMIZED
	call SwitchToMapRomBank
	de_deref wEastConnectionStripDest
	hl_deref wEastConnectionStripSrc
	ld a, [wEastConnectionStripLength]
	ld b, a
	ld a, [wEastConnectedMapWidth]
	ldh [hEastWestConnectedMapWidth], a
	jp LoadEastWestConnectionsTileMap

LoadNorthSouthConnectionsTileMap::
	ld c, MAP_BORDER
.loop
	push de
	push hl
	ldh a, [hNorthSouthConnectionStripWidth]
	ld b, a
.innerLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .innerLoop
	pop hl
	pop de
	ldh a, [hNorthSouthConnectedMapWidth]
	add l
	ld l, a
	jr nc, .noCarry1
	inc h
.noCarry1
	ld a, [wCurMapWidth]
	add MAP_BORDER * 2
	add e
	ld e, a
	jr nc, .noCarry2
	inc d
.noCarry2
	dec c
	jr nz, .loop
	ret

LoadEastWestConnectionsTileMap::
	push hl
	push de
	ld c, MAP_BORDER
.innerLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .innerLoop
	pop de
	pop hl
	ldh a, [hEastWestConnectedMapWidth]
	add l
	ld l, a
	jr nc, .noCarry1
	inc h
.noCarry1
	ld a, [wCurMapWidth]
	add MAP_BORDER * 2
	add e
	ld e, a
	jr nc, .noCarry2
	inc d
.noCarry2
	dec b
	jr nz, LoadEastWestConnectionsTileMap
	ret

; function to check if there is a sign or sprite in front of the player
; if so, it is stored in [hTextID]
; if not, [hTextID] is set to 0
IsSpriteOrSignInFrontOfPlayer::
	xor a
	ldh [hTextID], a
	ld a, [wNumSigns]
	and a
	jr z, .extendRangeOverCounter
; if there are signs
	predef GetTileAndCoordsInFrontOfPlayer ; get the coordinates in front of the player in de
	ld hl, wSignCoords
	ld a, [wNumSigns]
	ld b, a
	ld c, 0
.signLoop
	inc c
	ld a, [hli] ; sign Y
	cp d
	jr z, .yCoordMatched
	inc hl
	jr .retry
.yCoordMatched
	ld a, [hli] ; sign X
	cp e
	jr nz, .retry
.xCoordMatched
; found sign
	push hl
	push bc
	ld hl, wSignTextIDs
	ld b, 0
	dec c
	add hl, bc
	ld a, [hl]
	ldh [hTextID], a ; store sign text ID
	pop bc
	pop hl
	ret
.retry
	dec b
	jr nz, .signLoop
; check if the player is front of a counter in a pokemon center, pokemart, etc. and if so, extend the range at which he can talk to the NPC
.extendRangeOverCounter
	predef GetTileAndCoordsInFrontOfPlayer ; get the tile in front of the player in c
	ld hl, wTilesetTalkingOverTiles ; list of tiles that extend talking range (counter tiles)
	ld b, 3
	ld d, $20 ; talking range in pixels (long range)
.counterTilesLoop
	ld a, [hli]
	cp c
	jr z, IsSpriteInFrontOfPlayer2 ; jumps if the tile in front of the player is a counter tile
	dec b
	jr nz, .counterTilesLoop

; part of the above function, but sometimes its called on its own, when signs are irrelevant
; the caller must zero [hTextID]
IsSpriteInFrontOfPlayer::
	ld d, $10 ; talking range in pixels (normal range)
IsSpriteInFrontOfPlayer2::
	lb bc, $3c, $40 ; Y and X position of player sprite
	ld a, [wSpritePlayerStateData1FacingDirection]
.checkIfPlayerFacingUp
	cp SPRITE_FACING_UP
	jr nz, .checkIfPlayerFacingDown
; facing up
	ld a, b
	sub d
	ld b, a
	ld a, PLAYER_DIR_UP
	jr .doneCheckingDirection

.checkIfPlayerFacingDown
	cp SPRITE_FACING_DOWN
	jr nz, .checkIfPlayerFacingRight
; facing down
	ld a, b
	add d
	ld b, a
	ld a, PLAYER_DIR_DOWN
	jr .doneCheckingDirection

.checkIfPlayerFacingRight
	cp SPRITE_FACING_RIGHT
	jr nz, .playerFacingLeft
; facing right
	ld a, c
	add d
	ld c, a
	ld a, PLAYER_DIR_RIGHT
	jr .doneCheckingDirection

.playerFacingLeft
; facing left
	ld a, c
	sub d
	ld c, a
	ld a, PLAYER_DIR_LEFT
.doneCheckingDirection
	ld [wPlayerDirection], a
	ld a, [wNumSprites] ; number of sprites
	and a
	ret z
; if there are sprites
	ld hl, wSprite01StateData1
	ld d, a
	ld e, $01
.spriteLoop
	push hl
	ld a, [hli] ; image (0 if no sprite)
	and a
	jr z, .nextSprite
	inc l
	ld a, [hli] ; sprite visibility
	inc a
	jr z, .nextSprite
	inc l
	ld a, [hli] ; Y location
	cp b
	jr nz, .nextSprite
	inc l
	ld a, [hl] ; X location
	cp c
	jr z, .foundSpriteInFrontOfPlayer
.nextSprite
	pop hl
	ld a, l
	add $10
	ld l, a
	inc e
	dec d
	jr nz, .spriteLoop
	ret
.foundSpriteInFrontOfPlayer
	pop hl
	ld a, l
	and $f0
	inc a
	ld l, a ; hl = x#SPRITESTATEDATA1_MOVEMENTSTATUS
	set BIT_FACE_PLAYER, [hl]
	ld a, e
	ldh [hTextID], a
	ret

; function to check if the player will jump down a ledge and check if the tile ahead is passable (when not surfing)
; sets the carry flag if there is a collision, and unsets it if there isn't a collision
CollisionCheckOnLand::
	ld a, [wMovementFlags]
	bit BIT_LEDGE_OR_FISHING, a
	jr nz, .noCollision
; if not jumping a ledge
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	jr nz, .noCollision ; no collisions when the player's movements are being controlled by the game
	ld a, [wPlayerDirection] ; the direction that the player is trying to go in
	ld d, a
	ld a, [wSpritePlayerStateData1CollisionData]
	and d ; check if a sprite is in the direction the player is trying to go
	jr nz, .collision
	xor a
	ldh [hTextID], a
	call IsSpriteInFrontOfPlayer ; check for sprite collisions again? when does the above check fail to detect a sprite collision?
	ldh a, [hTextID]
	and a ; was there a sprite collision?
	jr nz, .collision
; if no sprite collision
	ld hl, TilePairCollisionsLand
	call CheckForJumpingAndTilePairCollisions
	jr c, .collision
	call CheckTilePassable
	jr nc, .noCollision
	callfar CheckForAutoSurf ; PureRGBnote: ADDED: "collision check" that will automatically start up surfing if surf was previously activated.
	jr nc, .noCollision
.collision
	ld a, [wChannelSoundIDs + CHAN5]
	cp SFX_COLLISION ; check if collision sound is already playing
	jr z, .setCarry
	ld a, SFX_COLLISION
	rst _PlaySound ; play collision sound (if it's not already playing)
.setCarry
	scf
	ret
.noCollision
	and a
	ret

; function that checks if the tile in front of the player is passable
; clears carry if it is, sets carry if not
CheckTilePassable::
	predef GetTileAndCoordsInFrontOfPlayer ; get tile in front of player
	ld a, [wTileInFrontOfPlayer] ; tile in front of player
;;;;;;;;;; PureRGBnote: CHANGED: unified code for checking if a tile is passable
	ld d, a
	callfar _CheckTilePassable
	jr c, .notPassable
	and a
	ret
.notPassable
;;;;;;;;;;
	scf
	ret

; check if the player is going to jump down a small ledge
; and check for collisions that only occur between certain pairs of tiles
; Input: hl - address of directional collision data
; sets carry if there is a collision and unsets carry if not
CheckForJumpingAndTilePairCollisions::
	push hl
	predef GetTileAndCoordsInFrontOfPlayer ; get the tile in front of the player
	push de
	push bc
	farcall HandleLedges ; check if the player is trying to jump a ledge
	pop bc
	pop de
	pop hl
	and a
	ld a, [wMovementFlags]
	bit BIT_LEDGE_OR_FISHING, a
	ret nz
; if not jumping

CheckForTilePairCollisions2::
	lda_coord 8, 9 ; tile the player is on
	ld [wTilePlayerStandingOn], a

CheckForTilePairCollisions::
	ld a, [wTileInFrontOfPlayer]
	ld c, a
.tilePairCollisionLoop
	ld a, [wCurMapTileset]
	ld b, a
	ld a, [hli]
	cp $ff
	jr z, .noMatch
	cp b
	jr z, .tilesetMatches
	inc hl
.retry
	inc hl
	jr .tilePairCollisionLoop
.tilesetMatches
	ld a, [wTilePlayerStandingOn] ; tile the player is on
	ld b, a
	ld a, [hl]
	cp b
	jr z, .currentTileMatchesFirstInPair
	inc hl
	ld a, [hl]
	cp b
	jr z, .currentTileMatchesSecondInPair
	jr .retry
.currentTileMatchesFirstInPair
	inc hl
	ld a, [hli] ; PureRGBnote: FIXED: performance improvement / fix for strange behaviour when adding new collision pairs
	cp c
	jr z, .foundMatch
	jr .tilePairCollisionLoop
.currentTileMatchesSecondInPair
	dec hl
	ld a, [hli]
	cp c
	inc hl
	jr nz, .tilePairCollisionLoop
.foundMatch
	scf
	ret
.noMatch
	and a
	ret

INCLUDE "data/tilesets/pair_collision_tile_ids.asm"

; this builds a tile map from the tile block map based on the current X/Y coordinates of the player's character
LoadCurrentMapView::
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wTilesetBank] ; tile data ROM bank
	call SetCurBank ; switch to ROM bank that contains tile data
	ld a, [wCurrentTileBlockMapViewPointer] ; address of upper left corner of current map view
	ld e, a
	ld a, [wCurrentTileBlockMapViewPointer + 1]
	ld d, a
	ld hl, wSurroundingTiles
	ld b, SCREEN_BLOCK_HEIGHT
.rowLoop ; each loop iteration fills in one row of tile blocks
	push hl
	push de
	ld c, SCREEN_BLOCK_WIDTH
.rowInnerLoop ; loop to draw each tile block of the current row
	push bc
	push de
	push hl
	ld a, [de]
	ld c, a ; tile block number
	call DrawTileBlock
	pop hl
	pop de
	pop bc
	inc hl
	inc hl
	inc hl
	inc hl
	inc de
	dec c
	jr nz, .rowInnerLoop
; update tile block map pointer to next row's address
	pop de
	ld a, [wCurMapWidth]
	add MAP_BORDER * 2
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
; update tile map pointer to next row's address
	pop hl
	ld a, SURROUNDING_WIDTH * BLOCK_HEIGHT
	add l
	ld l, a
	jr nc, .noCarry2
	inc h
.noCarry2
	dec b
	jr nz, .rowLoop
	ld hl, wSurroundingTiles
	ld bc, 0
.adjustForYCoordWithinTileBlock
	ld a, [wYBlockCoord]
	and a
	jr z, .adjustForXCoordWithinTileBlock
	ld bc, SURROUNDING_WIDTH * 2
	add hl, bc
.adjustForXCoordWithinTileBlock
	ld a, [wXBlockCoord]
	and a
	jr z, .copyToVisibleAreaBuffer
	ld bc, BLOCK_WIDTH / 2
	add hl, bc
.copyToVisibleAreaBuffer
	decoord 0, 0 ; base address for the tiles that are directly transferred to VRAM during V-blank
	ld b, SCREEN_HEIGHT
.rowLoop2
	ld c, SCREEN_WIDTH
.rowInnerLoop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .rowInnerLoop2
	ld a, SURROUNDING_WIDTH - SCREEN_WIDTH
	add l
	ld l, a
	jr nc, .noCarry3
	inc h
.noCarry3
	dec b
	jr nz, .rowLoop2
	pop af
	jp SetCurBank ; restore previous ROM bank

AdvancePlayerSprite::
	ld a, [wSpritePlayerStateData1YStepVector]
	ld b, a
	ld a, [wSpritePlayerStateData1XStepVector]
	ld c, a
	ld hl, wWalkCounter ; walking animation counter
	dec [hl]
	jr nz, .afterUpdateMapCoords
; if it's the end of the animation, update the player's map coordinates
	ld a, [wYCoord]
	add b
	ld [wYCoord], a
	ld a, [wXCoord]
	add c
	ld [wXCoord], a
.afterUpdateMapCoords
	ld a, [wWalkCounter] ; walking animation counter
;;;;;;;;;; shinpokerednote: 60fps
	push bc
	ld b, $0F
	cp b
	pop bc
;;;;;;;;;;
	jp nz, .scrollBackgroundAndSprites
; if this is the first iteration of the animation
	ld a, c
	cp $01
	jr nz, .checkIfMovingWest
; moving east
	ld a, [wMapViewVRAMPointer]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	add $02
	and $1f
	or d
	ld [wMapViewVRAMPointer], a
	jr .adjustXCoordWithinBlock
.checkIfMovingWest
	cp $ff
	jr nz, .checkIfMovingSouth
; moving west
	ld a, [wMapViewVRAMPointer]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	sub $02
	and $1f
	or d
	ld [wMapViewVRAMPointer], a
	jr .adjustXCoordWithinBlock
.checkIfMovingSouth
	ld a, b
	cp $01
	jr nz, .checkIfMovingNorth
; moving south
	ld a, [wMapViewVRAMPointer]
	add $40
	ld [wMapViewVRAMPointer], a
	jr nc, .adjustXCoordWithinBlock
	ld a, [wMapViewVRAMPointer + 1]
	inc a
	and $03
	or $98
	ld [wMapViewVRAMPointer + 1], a
	jr .adjustXCoordWithinBlock
.checkIfMovingNorth
	cp $ff
	jr nz, .adjustXCoordWithinBlock
; moving north
	ld a, [wMapViewVRAMPointer]
	sub $40
	ld [wMapViewVRAMPointer], a
	jr nc, .adjustXCoordWithinBlock
	ld a, [wMapViewVRAMPointer + 1]
	dec a
	and $03
	or $98
	ld [wMapViewVRAMPointer + 1], a
.adjustXCoordWithinBlock
; shinpokerednote: removed some code not needed in 60fps
	ld hl, wXBlockCoord
	ld a, [hl]
	add c
	ld [hl], a
	cp $02
	jr nz, .checkForMoveToWestBlock
; moved into the tile block to the east
	xor a
	ld [hl], a
	ld hl, wXOffsetSinceLastSpecialWarp
	inc [hl]
	ld de, wCurrentTileBlockMapViewPointer
	call MoveTileBlockMapPointerEast
	jr .updateMapView
.checkForMoveToWestBlock
	cp $ff
	jr nz, .adjustYCoordWithinBlock
; moved into the tile block to the west
	ld [hl], 1
	ld hl, wXOffsetSinceLastSpecialWarp
	dec [hl]
	ld de, wCurrentTileBlockMapViewPointer
	call MoveTileBlockMapPointerWest
	jr .updateMapView
.adjustYCoordWithinBlock
	ld hl, wYBlockCoord
	ld a, [hl]
	add b
	ld [hl], a
	cp $02
	jr nz, .checkForMoveToNorthBlock
; moved into the tile block to the south
	xor a
	ld [hl], a
	ld hl, wYOffsetSinceLastSpecialWarp
	inc [hl]
	ld de, wCurrentTileBlockMapViewPointer
	ld a, [wCurMapWidth]
	call MoveTileBlockMapPointerSouth
	jr .updateMapView
.checkForMoveToNorthBlock
	cp $ff
	jr nz, .updateMapView
; moved into the tile block to the north
	ld [hl], 1
	ld hl, wYOffsetSinceLastSpecialWarp
	dec [hl]
	ld de, wCurrentTileBlockMapViewPointer
	ld a, [wCurMapWidth]
	call MoveTileBlockMapPointerNorth
.updateMapView
	call LoadCurrentMapView
	ld a, [wSpritePlayerStateData1YStepVector]
	cp $01
	jr nz, .checkIfMovingNorth2
; if moving south
	call ScheduleSouthRowRedraw
	jr .scrollBackgroundAndSprites
.checkIfMovingNorth2
	cp $ff
	jr nz, .checkIfMovingEast2
; if moving north
	call ScheduleNorthRowRedraw
	jr .scrollBackgroundAndSprites
.checkIfMovingEast2
	ld a, [wSpritePlayerStateData1XStepVector]
	cp $01
	jr nz, .checkIfMovingWest2
; if moving east
	call ScheduleEastColumnRedraw
	jr .scrollBackgroundAndSprites
.checkIfMovingWest2
	cp $ff
; PureRGBnote: OPTIMIZED
	call z, ScheduleWestColumnRedraw
	;jr nz, .scrollBackgroundAndSprites
; if moving west
	;call ScheduleWestColumnRedraw
.scrollBackgroundAndSprites
	ld a, [wSpritePlayerStateData1YStepVector]
	ld b, a
	ld a, [wSpritePlayerStateData1XStepVector]
	ld c, a
	;sla b ; shinpokerednote: 60fps mode doesn't need this
	;sla c
	ldh a, [hSCY]
	add b
	ldh [hSCY], a ; update background scroll Y
	ldh a, [hSCX]
	add c
	ldh [hSCX], a ; update background scroll X
; shift all the sprites in the direction opposite of the player's motion
; so that the player appears to move relative to them
	ld hl, wSprite01StateData1YPixels
	ld a, [wNumSprites] ; number of sprites
	and a ; are there any sprites?
	ret z ;jr z, .done ; PureRGBnote: OPTIMIZED
	ld e, a
.spriteShiftLoop
	ld a, [hl]
	sub b
	ld [hli], a
	inc l
	ld a, [hl]
	sub c
	ld [hl], a
	ld a, $0e
	add l
	ld l, a
	dec e
	jr nz, .spriteShiftLoop
;.done
	ret

; the following four functions are used to move the pointer to the upper left
; corner of the tile block map in the direction of motion

MoveTileBlockMapPointerEast::
	ld a, [de]
	add 1
	ld [de], a
	ret nc
	inc de
	ld a, [de]
	inc a
	ld [de], a
	ret

MoveTileBlockMapPointerWest::
	ld a, [de]
	sub 1
	ld [de], a
	ret nc
	inc de
	ld a, [de]
	dec a
	ld [de], a
	ret

MoveTileBlockMapPointerSouth::
	add MAP_BORDER * 2
	ld b, a
	ld a, [de]
	add b
	ld [de], a
	ret nc
	inc de
	ld a, [de]
	inc a
	ld [de], a
	ret

MoveTileBlockMapPointerNorth::
	add MAP_BORDER * 2
	ld b, a
	ld a, [de]
	sub b
	ld [de], a
	ret nc
	inc de
	ld a, [de]
	dec a
	ld [de], a
	ret

; the following 6 functions are used to tell the V-blank handler to redraw
; the portion of the map that was newly exposed due to the player's movement

ScheduleNorthRowRedraw::
	hlcoord 0, 0
	call CopyToRedrawRowOrColumnSrcTiles
	ld a, [wMapViewVRAMPointer]
	ldh [hRedrawRowOrColumnDest], a
	ld a, [wMapViewVRAMPointer + 1]
	ldh [hRedrawRowOrColumnDest + 1], a
	ld a, REDRAW_ROW
	ldh [hRedrawRowOrColumnMode], a
	ret

CopyToRedrawRowOrColumnSrcTiles::
	ld de, wRedrawRowOrColumnSrcTiles
	ld c, 2 * SCREEN_WIDTH
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

ScheduleSouthRowRedraw::
	hlcoord 0, 16
	call CopyToRedrawRowOrColumnSrcTiles
	hl_deref wMapViewVRAMPointer
	ld bc, $200
	add hl, bc
	ld a, h
	and $03
	or $98
	ldh [hRedrawRowOrColumnDest + 1], a
	ld a, l
	ldh [hRedrawRowOrColumnDest], a
	ld a, REDRAW_ROW
	ldh [hRedrawRowOrColumnMode], a
	ret

ScheduleEastColumnRedraw::
	hlcoord 18, 0
	call ScheduleColumnRedrawHelper
	ld a, [wMapViewVRAMPointer]
	ld c, a
	and $e0
	ld b, a
	ld a, c
	add 18
	and $1f
	or b
	ldh [hRedrawRowOrColumnDest], a
	ld a, [wMapViewVRAMPointer + 1]
	ldh [hRedrawRowOrColumnDest + 1], a
	ld a, REDRAW_COL
	ldh [hRedrawRowOrColumnMode], a
	ret

ScheduleColumnRedrawHelper::
	ld de, wRedrawRowOrColumnSrcTiles
	ld c, SCREEN_HEIGHT
.loop
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, SCREEN_WIDTH - 1
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	dec c
	jr nz, .loop
	ret

ScheduleWestColumnRedraw::
	hlcoord 0, 0
	call ScheduleColumnRedrawHelper
	ld a, [wMapViewVRAMPointer]
	ldh [hRedrawRowOrColumnDest], a
	ld a, [wMapViewVRAMPointer + 1]
	ldh [hRedrawRowOrColumnDest + 1], a
	ld a, REDRAW_COL
	ldh [hRedrawRowOrColumnMode], a
	ret

; function to write the tiles that make up a tile block to memory
; Input: c = tile block ID, hl = destination address
DrawTileBlock::
	push hl
	hl_deref wTilesetBlocksPtr ; pointer to tiles
	ld a, c
	swap a
	ld b, a
	and $f0
	ld c, a
	ld a, b
	and $0f
	ld b, a ; bc = tile block ID * 0x10
	add hl, bc
	ld d, h
	ld e, l ; de = address of the tile block's tiles
	pop hl
	ld c, BLOCK_HEIGHT ; 4 loop iterations
.loop ; each loop iteration, write 4 tile numbers
	push bc
REPT BLOCK_WIDTH - 1
	ld a, [de]
	ld [hli], a
	inc de
ENDR
	ld a, [de]
	ld [hl], a
	inc de
	ld bc, SURROUNDING_WIDTH - (BLOCK_WIDTH - 1)
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	ret

; function to update joypad state and simulate button presses
JoypadOverworld::
	xor a
	ld [wSpritePlayerStateData1YStepVector], a
	ld [wSpritePlayerStateData1XStepVector], a
	call RunMapScript
	call Joypad
	ld a, [wStatusFlags7]
	bit BIT_TRAINER_BATTLE, a
	jr nz, .notForcedDownwards
	ld a, [wCurMap]
	cp ROUTE_17 ; Cycling Road
	jr nz, .notForcedDownwards
	ldh a, [hJoyHeld]
	and D_DOWN | D_UP | D_LEFT | D_RIGHT | B_BUTTON | A_BUTTON
	jr nz, .notForcedDownwards
	ld a, D_DOWN
	ldh [hJoyHeld], a ; on the cycling road, if there isn't a trainer and the player isn't pressing buttons, simulate a down press
.notForcedDownwards
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret z
; if simulating button presses
	ldh a, [hJoyHeld]
	ld b, a
	ld a, [wOverrideSimulatedJoypadStatesMask] ; bit mask for button presses that override simulated ones
	and b
	ret nz ; return if the simulated button presses are overridden
	ld hl, wSimulatedJoypadStatesIndex
;;;;; PureRGBnote: ADDED: spinner auto movement was greatly simplified. We just keep doing the same thing in the auto movement script
;;;;; until the spinner flag is unset.
	ld a, [wMovementFlags]
	bit BIT_SPINNING, a ; is player spinning?
	jr nz, .noDec
	; we will keep the same joypad state index while spinning so we don't have to program the entire movement direction list
	; for every single spinner in the game-instead just simulate the same direction indefinitely until hitting end or another spinner
	dec [hl] 
.noDec
;;;;;
	ld a, [hl]
	cp $ff
	jr z, .doneSimulating ; if the end of the simulated button presses has been reached
	ld hl, wSimulatedJoypadStatesEnd
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, [hl]
	ldh [hJoyHeld], a ; store simulated button press in joypad state
	and a
	ret nz
	ldh [hJoyPressed], a
	ldh [hJoyReleased], a
	ret

; if done simulating button presses
.doneSimulating
	ResetFlag FLAG_FAST_AUTO_MOVEMENT ; PureRGBnote: ADDED: when done auto movement always turn off fast auto movement. Must be enabled per script.
	xor a
	ld [wSimulatedJoypadStatesIndex], a
	ld [wSimulatedJoypadStatesEnd], a
	ld [wJoyIgnore], a
	ldh [hJoyHeld], a
	ld hl, wMovementFlags
	ld a, [hl]
	and (1 << BIT_SPINNING) | (1 << BIT_LEDGE_OR_FISHING) | (1 << 5) | (1 << 4) | (1 << 3)
	ld [hl], a
	ld hl, wStatusFlags5
	res BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ret

; function to check the tile ahead to determine if the character should get on land or keep surfing
; sets carry if there is a collision and clears carry otherwise
; It seems that this function has a bug in it, but due to luck, it doesn't
; show up. After detecting a sprite collision, it jumps to the code that
; checks if the next tile is passable instead of just directly jumping to the
; "collision detected" code. However, it doesn't store the next tile in c,
; so the old value of c is used. 2429 is always called before this function,
; and 2429 always sets c to 0xF0. There is no 0xF0 background tile, so it
; is considered impassable and it is detected as a collision.
;;;; PureRGBnote: FIXED: bug was fixed so collision with sprites is routed directly to the collision code, and reuses the code for using the
;;;; surf item to decide if a surf tile is in front of the player or not instead of duplicating this code.
CollisionCheckOnWater::
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	jp nz, .noCollision ; return and clear carry if button presses are being simulated
	ld a, [wPlayerDirection] ; the direction that the player is trying to go in
	ld d, a
	ld a, [wSpritePlayerStateData1CollisionData]
	and d ; check if a sprite is in the direction the player is trying to go
	jr nz, .collision
	ld hl, TilePairCollisionsWater
	call CheckForJumpingAndTilePairCollisions
	jr c, .collision
	predef GetTileAndCoordsInFrontOfPlayer ; get tile in front of player (puts it in c and [wTileInFrontOfPlayer])
	ld d, c ; put the tile in front of the player into d so the callfar after this doesn't affect the register
	callfar WaterTileSetIsNextTileShoreOrWater
	jr nc, .noCollision
; check if the [land] tile in front of the player is passable
.checkIfNextTileIsPassable
;;;;;;;;;; PureRGBnote: CHANGED: unified code for checking if a tile is passable
	callfar _CheckTilePassable
	jr nc, .stopSurfing
;;;;;;;;;;
.collision
	ld a, [wChannelSoundIDs + CHAN5]
	cp SFX_COLLISION ; check if collision sound is already playing
	jr z, .setCarry
	ld a, SFX_COLLISION
	rst _PlaySound ; play collision sound (if it's not already playing)
.setCarry
	scf
	ret
.noCollision
	and a
	ret
.stopSurfing
;;;;; PureRGBnote: CHANGED: in the volcano we need to wear the lava suit after surfing ends instead of the normal player sprite.
	ld a, [wCurMapTileset]
	cp VOLCANO
	ld a, WALKING
	jr nz, .stopSurfToWalking
	ld a, WEARING_LAVA_SUIT
.stopSurfToWalking
;;;;;
	ld [wWalkBikeSurfState], a
	call nz, PlayDefaultMusic ; play default music if walking but not if lava suit
	call LoadPlayerSpriteGraphics
	jr .noCollision

; function to run the current map's script
RunMapScript::
	push hl
	push de
	push bc
	farcall TryPushingBoulder
	ld a, [wMiscFlags]
	bit BIT_BOULDER_DUST, a
	jr z, .afterBoulderEffect
	farcall DoBoulderDustAnimation
.afterBoulderEffect
	pop bc
	pop de
	pop hl
	call RunNPCMovementScript
	ld a, [wCurMap] ; current map number
	call SwitchToMapRomBank ; change to the ROM bank the map's data is in
	ld hl, wCurMapScriptPtr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call hl_caller ; jump to script
;;;;;;;;;; PureRGBnote: ADDED: code that will fade back in after battle in specific maps with a bit in their header
;;;;;;;;;; used to keep tileblock replacements unseen
	ld hl, wCurrentMapScriptFlags
	bit BIT_MAP_LOADED_AFTER_BATTLE, [hl]
	res BIT_MAP_LOADED_AFTER_BATTLE, [hl]
	ret z
	ld a, [wCurMapConnections]
	bit BIT_DEFER_SHOWING_MAP, a
	ret z
	ld a, [wIsInBattle]
	cp $ff
	ret z
	jp MapFadeAfterBattle
;;;;;;;;;;

;;;;; PureRGBnote: ADDED: when in the volcano the player can wear a special lava suit.
LoadLavaSuitSpriteGraphics::
	ld de, LavaSuitSprite
	lb bc, BANK(LavaSuitSprite), $0c
	jr LoadPlayerSpriteGraphicsArbitrary
;;;;;

LoadWalkingPlayerSpriteGraphics::
	ld de, RedSprite
	jr LoadPlayerSpriteGraphicsCommon

;;;;; PureRGBnote: CHANGED: in the volcano the surfing sprite uses a rhydon instead of seel sprite, since only rhydon and hardened onix can lava surf.
LoadSurfingPlayerSpriteGraphics::
	ld a, [wCurMapTileset]
	cp VOLCANO
	ld de, SeelSprite
	jr nz, LoadPlayerSpriteGraphicsCommon
	ld de, MonsterSwimmingSprite
	lb bc, BANK(MonsterSwimmingSprite), $0c
	jr LoadPlayerSpriteGraphicsArbitrary
;;;;;

LoadBikePlayerSpriteGraphics::
	ld de, RedBikeSprite
LoadPlayerSpriteGraphicsCommon::
	lb bc, BANK(RedSprite), $0c
LoadPlayerSpriteGraphicsArbitrary::
	push bc
	ld hl, vNPCSprites
	push de
	push hl
	call CopyVideoData
	pop hl
	pop de
	ld a, $c0
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
	set 3, h
	pop bc
	jp CopyVideoData

; function to load data from the map header
LoadMapHeader::
	farcall MarkTownVisitedAndLoadMissableObjects
	;ld a, [wCurMapTileset]
	;ld [wUnusedCurMapTilesetCopy], a
	ld a, [wCurMap]
	call SwitchToMapRomBank
	ld a, [wCurMapTileset]
	ld b, a
	res BIT_NO_PREVIOUS_MAP, a
	ld [wCurMapTileset], a
	ldh [hPreviousTileset], a
	bit BIT_NO_PREVIOUS_MAP, b
	ret nz
	ld hl, MapHeaderPointers
	ld a, [wCurMap]
	add a
	jr nc, .noCarry1
	inc h
.noCarry1
	add l
	ld l, a
	jr nc, .noCarry2
	inc h
.noCarry2
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl = base of map header
	ld de, wCurMapHeader
	ld c, wCurMapHeaderEnd - wCurMapHeader
.copyFixedHeaderLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyFixedHeaderLoop
; initialize all the connected maps to disabled at first, before loading the actual values
	ld a, $ff
	ld [wNorthConnectedMap], a
	ld [wSouthConnectedMap], a
	ld [wWestConnectedMap], a
	ld [wEastConnectedMap], a
; copy connection data (if any) to WRAM
	ld a, [wCurMapConnections]
	ld b, a
.checkNorth
	bit NORTH_F, b
	jr z, .checkSouth
	ld de, wNorthConnectionHeader
	call CopyMapConnectionHeader
.checkSouth
	bit SOUTH_F, b
	jr z, .checkWest
	ld de, wSouthConnectionHeader
	call CopyMapConnectionHeader
.checkWest
	bit WEST_F, b
	jr z, .checkEast
	ld de, wWestConnectionHeader
	call CopyMapConnectionHeader
.checkEast
	bit EAST_F, b
	jr z, .getObjectDataPointer
	ld de, wEastConnectionHeader
	call CopyMapConnectionHeader
.getObjectDataPointer
	ld a, [hli]
	ld [wObjectDataPointerTemp], a
	ld a, [hli]
	ld [wObjectDataPointerTemp + 1], a
	hl_deref wObjectDataPointerTemp
	; hl = base of object data
	ld de, wMapBackgroundTile
	ld a, [hli]
	ld [de], a
.loadWarpData
	ld a, [hli]
	ld [wNumberOfWarps], a
	and a
	jr z, .loadSignData
	ld c, a
	ld de, wWarpEntries
.warpLoop ; one warp per loop iteration
	ld b, 4
.warpInnerLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .warpInnerLoop
	dec c
	jr nz, .warpLoop
.loadSignData
	ld a, [hli] ; number of signs
	ld [wNumSigns], a
	and a ; are there any signs?
	jr z, .loadSpriteData ; if not, skip this
	ld c, a
	ld de, wSignTextIDs
	ld a, d
	ldh [hSignCoordPointer], a
	ld a, e
	ldh [hSignCoordPointer + 1], a
	ld de, wSignCoords
.signLoop
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	push de
	ldh a, [hSignCoordPointer]
	ld d, a
	ldh a, [hSignCoordPointer + 1]
	ld e, a
	ld a, [hli]
	ld [de], a
	inc de
	ld a, d
	ldh [hSignCoordPointer], a
	ld a, e
	ldh [hSignCoordPointer + 1], a
	pop de
	dec c
	jr nz, .signLoop
.loadSpriteData
	ld a, [wStatusFlags4]
	bit BIT_BATTLE_OVER_OR_BLACKOUT, a ; did a battle happen immediately before this?
	jp nz, .getRemappedSpriteIDsThenFinishUp ; if so, skip most of this because battle doesn't destroy the data
	ld a, [hli]
	ld [wNumSprites], a ; save the number of sprites
	push hl
; zero out sprite state data for sprites 01-15
	ld hl, wSprite01StateData1
	ld de, wSprite01StateData2
	xor a
	ld b, $f0
.zeroSpriteDataLoop
	ld [hli], a
	ld [de], a
	inc e
	dec b
	jr nz, .zeroSpriteDataLoop
; disable SPRITESTATEDATA1_IMAGEINDEX (set to $ff) for sprites 01-15
	ld hl, wSprite01StateData1ImageIndex
	ld de, $10
	ld c, $0f
.disableSpriteEntriesLoop
	ld [hl], $ff
	add hl, de
	dec c
	jr nz, .disableSpriteEntriesLoop
	pop hl
	ld de, wSprite01StateData1
	ld a, [wNumSprites] ; number of sprites
	and a ; are there any sprites?
	jp z, .finishUp ; if there are no sprites, skip the rest
	ld b, a
	ld c, $00
.loadSpriteLoop
	ld a, [hl]
	push bc
	push de
	ld d, a ; original sprite ID
	ld e, b ; current iteration of sprite loop
	push hl
	callfar CheckRemapSprite ; PureRGBnote: ADDED: code that will remap overworld NPC icons according to options selection (enhanced or original)
	ld a, d ; remapped sprite ID
	pop hl
	pop de
	pop bc
.noMap
	inc hl
	ld [de], a ; x#SPRITESTATEDATA1_PICTUREID
	inc d
	ld a, $04
	add e
	ld e, a
	ld a, [hli]
	ld [de], a ; x#SPRITESTATEDATA2_MAPY
	inc e
	ld a, [hli]
	ld [de], a ; x#SPRITESTATEDATA2_MAPX
	inc e
	ld a, [hli]
	ld [de], a ; x#SPRITESTATEDATA2_MOVEMENTBYTE1
	ld a, [hli]
	ldh [hLoadSpriteTemp1], a ; save movement byte 2
	ld a, [hli]
	ldh [hLoadSpriteTemp2], a ; save text ID and flags byte
	push bc
	push hl
	ld b, $00
	ld hl, wMapSpriteData
	add hl, bc
	ldh a, [hLoadSpriteTemp1]
	ld [hli], a ; store movement byte 2 in byte 0 of sprite entry
	;ldh a, [hLoadSpriteTemp2]
	;ld [hl], a ; this appears pointless, since the value is overwritten immediately after
	ldh a, [hLoadSpriteTemp2]
	ldh [hLoadSpriteTemp1], a
	and $3f
	ld [hl], a ; store text ID in byte 1 of sprite entry
	pop hl
	ldh a, [hLoadSpriteTemp1]
	bit BIT_TRAINER, a
	jr nz, .trainerSprite
	bit BIT_ITEM, a
	jr nz, .itemBallSprite
	jr .regularSprite
.trainerSprite
	ld a, [hli]
	ldh [hLoadSpriteTemp1], a ; save trainer class
	ld a, [hli]
	ldh [hLoadSpriteTemp2], a ; save trainer number (within class)
	push hl
	ld hl, wMapSpriteExtraData
	add hl, bc
	ldh a, [hLoadSpriteTemp1]
	ld [hli], a ; store trainer class in byte 0 of the entry
	ldh a, [hLoadSpriteTemp2]
	ld [hl], a ; store trainer number in byte 1 of the entry
	pop hl
	jr .nextSprite
.itemBallSprite
	ld a, [hli]
	ldh [hLoadSpriteTemp1], a ; save item number
	push hl
	ld hl, wMapSpriteExtraData
	add hl, bc
	ldh a, [hLoadSpriteTemp1]
	ld [hli], a ; store item number in byte 0 of the entry
	xor a
	ld [hl], a ; zero byte 1, since it is not used
	pop hl
	jr .nextSprite
.regularSprite
	push hl
	ld hl, wMapSpriteExtraData
	add hl, bc
; zero both bytes, since regular sprites don't use this extra space
	xor a
	ld [hli], a
	ld [hl], a
	pop hl
.nextSprite
	pop bc
	dec d
	ld a, $0a
	add e
	ld e, a
	inc c
	inc c
	dec b
	jp nz, .loadSpriteLoop
.finishUp
	predef LoadTilesetHeader
	callfar LoadWildData
	ld a, [wCurMapHeight] ; map height in 4x4 tile blocks
	add a ; double it
	ld [wCurrentMapHeight2], a ; store map height in 2x2 tile blocks
	ld a, [wCurMapWidth] ; map width in 4x4 tile blocks
	add a ; double it
	ld [wCurrentMapWidth2], a ; map width in 2x2 tile blocks
	ld a, [wCurMap]
	ld c, a
	ld b, $00
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(MapSongBanks)
	call SetCurBank
	ld hl, MapSongBanks
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wMapMusicSoundID], a ; music 1
	ld a, [hl]
	ld [wMapMusicROMBank], a ; music 2
	pop af
	jp SetCurBank
;;;;; PureRGBnote: ADDED: After battle we have to reload original picture IDs since battle data trashes their wram area.
.getRemappedSpriteIDsThenFinishUp
	ld d, h
	ld e, l
	callfar StoreOriginalPictureIDs
	jr .finishUp
;;;;;

; function to copy map connection data from ROM to WRAM
; Input: hl = source, de = destination
CopyMapConnectionHeader::
	ld c, $0b
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

; function to load map data
LoadMapData::
	ldh a, [hLoadedROMBank]
	push af
	ld a, $98
	ld [wMapViewVRAMPointer + 1], a
	xor a
	ld [wMapViewVRAMPointer], a
	ldh [hSCY], a
	ldh [hSCX], a
	ld [wWalkCounter], a
	;ld [wUnusedCurMapTilesetCopy], a
	ld [wWalkBikeSurfStateCopy], a
	ld [wSpriteSetID], a
	call LoadTextBoxTilePatterns
	call LoadMapHeader

	;call DisableLCD
	ld hl, hFlagsFFFA
	set 3, [hl]

	farcall InitMapSprites ; load tile pattern data for sprites
	call LoadTileBlockMap
	call LoadTilesetTilePatternData
	call LoadCurrentMapView
; copy current map view to VRAM
	hlcoord 0, 0
	ld de, vBGMap0
	lb bc, SCREEN_HEIGHT, SCREEN_WIDTH
.vramCopyLoop
	push bc
	ld b, 0
	call SpecialCopyData
	pop bc

	ld a, BG_MAP_WIDTH - SCREEN_WIDTH
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
	dec b
	jr nz, .vramCopyLoop
	ld a, $01
	ld [wUpdateSpritesEnabled], a
	;call EnableLCD
	ld hl, hFlagsFFFA
	res 3, [hl]
	ld b, SET_PAL_OVERWORLD
	call RunPaletteCommand
	call LoadPlayerSpriteGraphics
	ld a, [wStatusFlags6]
	and (1 << BIT_FLY_WARP) | (1 << BIT_DUNGEON_WARP)
	jr nz, .restoreRomBank
	ld a, [wStatusFlags7]
	bit BIT_NO_MAP_MUSIC, a
	call z, PlayDefaultMusicFadeOutCurrent
	;jr nz, .restoreRomBank
	;call UpdateMusic6Times
	;call PlayDefaultMusicFadeOutCurrent
.restoreRomBank
	pop af
	jp SetCurBank

; function to switch to the ROM bank that a map is stored in
; Input: a = map number
SwitchToMapRomBank::
	push hl
	push bc
	ld c, a
	ld b, $00
	ld a, BANK(MapHeaderBanks)
	call BankswitchHome
	ld hl, MapHeaderBanks
	add hl, bc
	ld a, [hl]
	ldh [hMapROMBank], a
	call BankswitchBack
	ldh a, [hMapROMBank]
	call SetCurBank
	pop bc
	pop hl
	ret

IgnoreInputForHalfSecond:
	ld a, 30
	ld [wIgnoreInputCounter], a
	ld hl, wStatusFlags5
	ld a, [hl]
	or (1 << BIT_DISABLE_JOYPAD) | (1 << BIT_UNKNOWN_5_2) | (1 << BIT_UNKNOWN_5_1)
	ld [hl], a ; set ignore input bit
	ret

ResetUsingStrengthSurfOutOfBattleBits:
	ld a, [wStatusFlags1]
	and 1 << BIT_STRENGTH_ACTIVE | 1 << BIT_AUTOSURF
	ret z
	jpfar CheckResetSurfStrengthFlags ; PureRGBnote: ADDED: sometimes we don't want to reset the strength/surf bits when loading a map

ForceBikeOrSurf::
	ld b, BANK(RedSprite)
	ld hl, LoadPlayerSpriteGraphics ; in bank 0
	rst _Bankswitch
	jp PlayDefaultMusic ; update map/player state?

CheckForUserInterruption::
; Return carry if Up+Select+B, Start or A are pressed in c frames.
; Used only in the intro and title screen.
	rst _DelayFrame

	push bc
	call JoypadLowSensitivity
	pop bc

	ldh a, [hJoyHeld]
	cp D_UP + SELECT + B_BUTTON
	jr z, .input

	ldh a, [hJoy5]
IF DEF(_DEBUG)
	and START | SELECT | A_BUTTON
ELSE
	and START | A_BUTTON
ENDC
	jr nz, .input

	dec c
	jr nz, CheckForUserInterruption

	and a
	ret

.input
	scf
	ret

; function to load position data for destination warp when switching maps
; INPUT:
; a = ID of destination warp within destination map
LoadDestinationWarpPosition::
	ld b, a
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wPredefParentBank]
	call SetCurBank
	ld a, b
	add a
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld bc, 4
	ld de, wCurrentTileBlockMapViewPointer
	rst _CopyData
	pop af
	jp SetCurBank

; PureRGBnote: ADDED: code for setting blackout map on flying or entering a pokecenter (instead of just when healing pokemon)

SetLastBlackoutMap::
	; called when entering pokemon centers
	ld a, [wLastMap]
	jr BlackoutMapCommon

SetCurBlackoutMap::
	; called after using FLY
	ld a, [wCurMap]
BlackoutMapCommon:
	ld [wLastBlackoutMap], a
	ret
