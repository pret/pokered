HandleMidJump::
; Handle the player jumping down
; a ledge in the overworld.
	ld b, BANK(_HandleMidJump)
	ld hl, _HandleMidJump
	jp Bankswitch

EnterMap::
; Load a new map.
	ld a, $ff
	ld [wJoyIgnore], a
	call LoadMapData
	callba ClearVariablesAfterLoadingMapData
	ld hl, wd72c
	bit 0, [hl] ; has the player already made 3 steps since the last battle?
	jr z, .skipGivingThreeStepsOfNoRandomBattles
	ld a, 3 ; minimum number of steps between battles
	ld [wNumberOfNoRandomBattleStepsLeft], a
.skipGivingThreeStepsOfNoRandomBattles
	ld hl, wd72e
	bit 5, [hl] ; did a battle happen immediately before this?
	res 5, [hl] ; unset the "battle just happened" flag
	call z, ResetUsingStrengthOutOfBattleBit
	call nz, MapEntryAfterBattle
	ld hl, wd732
	ld a, [hl]
	and 1 << 4 | 1 << 3 ; fly warp or dungeon warp
	jr z, .didNotEnterUsingFlyWarpOrDungeonWarp
	res 3, [hl]
	callba EnterMapAnim
	call UpdateSprites
.didNotEnterUsingFlyWarpOrDungeonWarp
	callba CheckForceBikeOrSurf ; handle currents in SF islands and forced bike riding in cycling road
	ld hl, wd72d
	res 5, [hl]
	call UpdateSprites
	ld hl, wd126
	set 5, [hl]
	set 6, [hl]
	xor a
	ld [wJoyIgnore], a

OverworldLoop::
	call DelayFrame
OverworldLoopLessDelay::
	call DelayFrame
	call LoadGBPal
	ld a,[wd736]
	bit 6,a ; jumping down a ledge?
	call nz, HandleMidJump
	ld a,[wWalkCounter]
	and a
	jp nz,.moveAhead ; if the player sprite has not yet completed the walking animation
	call JoypadOverworld ; get joypad state (which is possibly simulated)
	callba SafariZoneCheck
	ld a,[wSafariZoneGameOver]
	and a
	jp nz,WarpFound2
	ld hl,wd72d
	bit 3,[hl]
	res 3,[hl]
	jp nz,WarpFound2
	ld a,[wd732]
	and a,1 << 4 | 1 << 3 ; fly warp or dungeon warp
	jp nz,HandleFlyWarpOrDungeonWarp
	ld a,[W_CUROPPONENT]
	and a
	jp nz,.newBattle
	ld a,[wd730]
	bit 7,a ; are we simulating button presses?
	jr z,.notSimulating
	ld a,[hJoyHeld]
	jr .checkIfStartIsPressed
.notSimulating
	ld a,[hJoyPressed]
.checkIfStartIsPressed
	bit 3,a ; start button
	jr z,.startButtonNotPressed
; if START is pressed
	xor a
	ld [hSpriteIndexOrTextID],a ; start menu text ID
	jp .displayDialogue
.startButtonNotPressed
	bit 0,a ; A button
	jp z,.checkIfDownButtonIsPressed
; if A is pressed
	ld a,[wd730]
	bit 2,a
	jp nz,.noDirectionButtonsPressed
	call IsPlayerCharacterBeingControlledByGame
	jr nz,.checkForOpponent
	call CheckForHiddenObjectOrBookshelfOrCardKeyDoor
	ld a,[$ffeb]
	and a
	jp z,OverworldLoop ; jump if a hidden object or bookshelf was found, but not if a card key door was found
	call IsSpriteOrSignInFrontOfPlayer
	ld a,[hSpriteIndexOrTextID]
	and a
	jp z,OverworldLoop
.displayDialogue
	predef GetTileAndCoordsInFrontOfPlayer
	call UpdateSprites
	ld a,[wFlags_0xcd60]
	bit 2,a
	jr nz,.checkForOpponent
	bit 0,a
	jr nz,.checkForOpponent
	aCoord 8, 9
	ld [wcf0e],a
	call DisplayTextID ; display either the start menu or the NPC/sign text
	ld a,[wcc47]
	and a
	jr z,.checkForOpponent
	dec a
	ld a,$00
	ld [wcc47],a
	jr z,.changeMap
	predef LoadSAV
	ld a,[W_CURMAP]
	ld [wDestinationMap],a
	call SpecialWarpIn
	ld a,[W_CURMAP]
	call SwitchToMapRomBank ; switch to the ROM bank of the current map
	ld hl,W_CURMAPTILESET
	set 7,[hl]
.changeMap
	jp EnterMap
.checkForOpponent
	ld a,[W_CUROPPONENT]
	and a
	jp nz,.newBattle
	jp OverworldLoop
.noDirectionButtonsPressed
	ld hl,wFlags_0xcd60
	res 2,[hl]
	call UpdateSprites
	ld a,$01
	ld [wcc4b],a
	ld a,[wd528] ; the direction that was pressed last time
	and a
	jp z,OverworldLoop
; if a direction was pressed last time
	ld [wd529],a ; save the last direction
	xor a
	ld [wd528],a ; zero the direction
	jp OverworldLoop
.checkIfDownButtonIsPressed
	ld a,[hJoyHeld] ; current joypad state
	bit 7,a ; down button
	jr z,.checkIfUpButtonIsPressed
	ld a,$01
	ld [wSpriteStateData1 + 3],a
	ld a,$04
	jr .handleDirectionButtonPress
.checkIfUpButtonIsPressed
	bit 6,a ; up button
	jr z,.checkIfLeftButtonIsPressed
	ld a,$ff
	ld [wSpriteStateData1 + 3],a
	ld a,$08
	jr .handleDirectionButtonPress
.checkIfLeftButtonIsPressed
	bit 5,a ; left button
	jr z,.checkIfRightButtonIsPressed
	ld a,$ff
	ld [wSpriteStateData1 + 5],a
	ld a,$02
	jr .handleDirectionButtonPress
.checkIfRightButtonIsPressed
	bit 4,a ; right button
	jr z,.noDirectionButtonsPressed
	ld a,$01
	ld [wSpriteStateData1 + 5],a
.handleDirectionButtonPress
	ld [wd52a],a ; new direction
	ld a,[wd730]
	bit 7,a ; are we simulating button presses?
	jr nz,.noDirectionChange ; ignore direction changes if we are
	ld a,[wcc4b]
	and a
	jr z,.noDirectionChange
	ld a,[wd52a] ; new direction
	ld b,a
	ld a,[wd529] ; old direction
	cp b
	jr z,.noDirectionChange
; the code below is strange
; it computes whether or not the player did a 180 degree turn, but then overwrites the result
; also, it does a seemingly pointless loop afterwards
	swap a ; put old direction in upper half
	or b ; put new direction in lower half
	cp a,$48 ; change dir from down to up
	jr nz,.notDownToUp
	ld a,$02
	ld [wd528],a
	jr .oddLoop
.notDownToUp
	cp a,$84 ; change dir from up to down
	jr nz,.notUpToDown
	ld a,$01
	ld [wd528],a
	jr .oddLoop
.notUpToDown
	cp a,$12 ; change dir from right to left
	jr nz,.notRightToLeft
	ld a,$04
	ld [wd528],a
	jr .oddLoop
.notRightToLeft
	cp a,$21 ; change dir from left to right
	jr nz,.oddLoop
	ld a,$08
	ld [wd528],a
.oddLoop
	ld hl,wFlags_0xcd60
	set 2,[hl]
	ld hl,wcc4b
	dec [hl]
	jr nz,.oddLoop
	ld a,[wd52a]
	ld [wd528],a
	call NewBattle
	jp c,.battleOccurred
	jp OverworldLoop
.noDirectionChange
	ld a,[wd52a] ; current direction
	ld [wd528],a ; save direction
	call UpdateSprites
	ld a,[wWalkBikeSurfState]
	cp a,$02 ; surfing
	jr z,.surfing
; not surfing
	call CollisionCheckOnLand
	jr nc,.noCollision
; collision occurred
	push hl
	ld hl,wd736
	bit 2,[hl] ; standing on warp flag
	pop hl
	jp z,OverworldLoop
; collision occurred while standing on a warp
	push hl
	call ExtraWarpCheck ; sets carry if there is a potential to warp
	pop hl
	jp c,CheckWarpsCollision
	jp OverworldLoop
.surfing
	call CollisionCheckOnWater
	jp c,OverworldLoop
.noCollision
	ld a,$08
	ld [wWalkCounter],a
	jr .moveAhead2
.moveAhead
	ld a,[wd736]
	bit 7,a
	jr z,.noSpinning
	callba LoadSpinnerArrowTiles ; spin while moving
.noSpinning
	call UpdateSprites ; move sprites
.moveAhead2
	ld hl,wFlags_0xcd60
	res 2,[hl]
	ld a,[wWalkBikeSurfState]
	dec a ; riding a bike?
	jr nz,.normalPlayerSpriteAdvancement
	ld a,[wd736]
	bit 6,a ; jumping a ledge?
	jr nz,.normalPlayerSpriteAdvancement
	call BikeSpeedup ; if riding a bike and not jumping a ledge
.normalPlayerSpriteAdvancement
	call AdvancePlayerSprite
	ld a,[wWalkCounter]
	and a
	jp nz,CheckMapConnections ; it seems like this check will never succeed (the other place where CheckMapConnections is run works)
; walking animation finished
	ld a,[wd730]
	bit 7,a
	jr nz,.doneStepCounting ; if button presses are being simulated, don't count steps
; step counting
	ld hl,wStepCounter
	dec [hl]
	ld a,[wd72c]
	bit 0,a
	jr z,.doneStepCounting
	ld hl,wNumberOfNoRandomBattleStepsLeft
	dec [hl]
	jr nz,.doneStepCounting
	ld hl,wd72c
	res 0,[hl] ; indicate that the player has stepped thrice since the last battle
.doneStepCounting
	ld a,[wd790]
	bit 7,a ; in the safari zone?
	jr z,.notSafariZone
	callba SafariZoneCheckSteps
	ld a,[wSafariZoneGameOver]
	and a
	jp nz,WarpFound2
.notSafariZone
	ld a,[W_ISINBATTLE]
	and a
	jp nz,CheckWarpsNoCollision
	predef ApplyOutOfBattlePoisonDamage ; also increment daycare mon exp
	ld a,[wd12d]
	and a
	jp nz,HandleBlackOut ; if all pokemon fainted
.newBattle
	call NewBattle
	ld hl,wd736
	res 2,[hl] ; standing on warp flag
	jp nc,CheckWarpsNoCollision ; check for warps if there was no battle
.battleOccurred
	ld hl,wd72d
	res 6,[hl]
	ld hl,W_FLAGS_D733
	res 3,[hl]
	ld hl,wd126
	set 5,[hl]
	set 6,[hl]
	xor a
	ld [hJoyHeld],a
	ld a,[W_CURMAP]
	cp a,CINNABAR_GYM
	jr nz,.notCinnabarGym
	ld hl,wd79b
	set 7,[hl]
.notCinnabarGym
	ld hl,wd72e
	set 5,[hl]
	ld a,[W_CURMAP]
	cp a,OAKS_LAB
	jp z,.noFaintCheck ; no blacking out if the player lost to the rival in Oak's lab
	callab AnyPartyAlive
	ld a,d
	and a
	jr z,.allPokemonFainted
.noFaintCheck
	ld c,$0a
	call DelayFrames
	jp EnterMap
.allPokemonFainted
	ld a,$ff
	ld [W_ISINBATTLE],a
	call RunMapScript
	jp HandleBlackOut

; function to determine if there will be a battle and execute it (either a trainer battle or wild battle)
; sets carry if a battle occurred and unsets carry if not
NewBattle:: ; 0683 (0:0683)
	ld a,[wd72d]
	bit 4,a
	jr nz,.noBattle
	call IsPlayerCharacterBeingControlledByGame
	jr nz,.noBattle ; no battle if the player character is under the game's control
	ld a,[wd72e]
	bit 4,a
	jr nz,.noBattle
	ld b, BANK(InitBattle)
	ld hl, InitBattle
	jp Bankswitch
.noBattle
	and a
	ret

; function to make bikes twice as fast as walking
BikeSpeedup:: ; 06a0 (0:06a0)
	ld a,[wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a,[W_CURMAP]
	cp a,ROUTE_17 ; Cycling Road
	jr nz,.goFaster
	ld a,[hJoyHeld]
	and a,D_UP | D_LEFT | D_RIGHT
	ret nz
.goFaster
	jp AdvancePlayerSprite

; check if the player has stepped onto a warp after having not collided
CheckWarpsNoCollision:: ; 06b4 (0:06b4)
	ld a,[wNumberOfWarps]
	and a
	jp z,CheckMapConnections
	ld a,[wNumberOfWarps]
	ld b,0
	ld c,a
	ld a,[W_YCOORD]
	ld d,a
	ld a,[W_XCOORD]
	ld e,a
	ld hl,wWarpEntries
CheckWarpsNoCollisionLoop:: ; 06cc (0:06cc)
	ld a,[hli] ; check if the warp's Y position matches
	cp d
	jr nz,CheckWarpsNoCollisionRetry1
	ld a,[hli] ; check if the warp's X position matches
	cp e
	jr nz,CheckWarpsNoCollisionRetry2
; if a match was found
	push hl
	push bc
	ld hl,wd736
	set 2,[hl] ; standing on warp flag
	callba IsPlayerStandingOnDoorTileOrWarpTile
	pop bc
	pop hl
	jr c,WarpFound1 ; jump if standing on door or warp
	push hl
	push bc
	call ExtraWarpCheck
	pop bc
	pop hl
	jr nc,CheckWarpsNoCollisionRetry2
; if the extra check passed
	ld a,[W_FLAGS_D733]
	bit 2,a
	jr nz,WarpFound1
	push de
	push bc
	call Joypad
	pop bc
	pop de
	ld a,[hJoyHeld]
	and a,D_DOWN | D_UP | D_LEFT | D_RIGHT
	jr z,CheckWarpsNoCollisionRetry2 ; if directional buttons aren't being pressed, do not pass through the warp
	jr WarpFound1

; check if the player has stepped onto a warp after having collided
CheckWarpsCollision:: ; 0706 (0:0706)
	ld a,[wNumberOfWarps]
	ld c,a
	ld hl,wWarpEntries
.loop
	ld a,[hli] ; Y coordinate of warp
	ld b,a
	ld a,[W_YCOORD]
	cp b
	jr nz,.retry1
	ld a,[hli] ; X coordinate of warp
	ld b,a
	ld a,[W_XCOORD]
	cp b
	jr nz,.retry2
	ld a,[hli]
	ld [wDestinationWarpID],a
	ld a,[hl]
	ld [$ff8b],a ; save target map
	jr WarpFound2
.retry1
	inc hl
.retry2
	inc hl
	inc hl
	dec c
	jr nz,.loop
	jp OverworldLoop

CheckWarpsNoCollisionRetry1:: ; 072f (0:072f)
	inc hl
CheckWarpsNoCollisionRetry2:: ; 0730 (0:0730)
	inc hl
	inc hl
	jp ContinueCheckWarpsNoCollisionLoop

WarpFound1:: ; 0735 (0:0735)
	ld a,[hli]
	ld [wDestinationWarpID],a
	ld a,[hli]
	ld [$ff8b],a ; save target map

WarpFound2:: ; 073c (0:073c)
	ld a,[wNumberOfWarps]
	sub c
	ld [wd73b],a ; save ID of used warp
	ld a,[W_CURMAP]
	ld [wd73c],a
	call CheckIfInOutsideMap
	jr nz,.indoorMaps
; this is for handling "outside" maps that can't have the 0xFF destination map
	ld a,[W_CURMAP]
	ld [wLastMap],a
	ld a,[W_CURMAPWIDTH]
	ld [wd366],a
	ld a,[$ff8b] ; destination map number
	ld [W_CURMAP],a ; change current map to destination map
	cp a,ROCK_TUNNEL_1
	jr nz,.notRockTunnel
	ld a,$06
	ld [wMapPalOffset],a
	call GBFadeOutToBlack
.notRockTunnel
	call PlayMapChangeSound
	jr .done
; for maps that can have the 0xFF destination map, which means to return to the outside map; not all these maps are necessarily indoors, though
.indoorMaps
	ld a,[$ff8b] ; destination map
	cp a,$ff
	jr z,.goBackOutside
; if not going back to the previous map
	ld [W_CURMAP],a ; current map number
	callba IsPlayerStandingOnWarpPadOrHole
	ld a,[wcd5b]
	dec a ; is the player on a warp pad?
	jr nz,.notWarpPad
; if the player is on a warp pad
	ld hl,wd732
	set 3,[hl]
	call LeaveMapAnim
	jr .skipMapChangeSound
.notWarpPad
	call PlayMapChangeSound
.skipMapChangeSound
	ld hl,wd736
	res 0,[hl]
	res 1,[hl]
	jr .done
.goBackOutside
	ld a,[wLastMap]
	ld [W_CURMAP],a
	call PlayMapChangeSound
	xor a
	ld [wMapPalOffset],a
.done
	ld hl,wd736
	set 0,[hl] ; have the player's sprite step out from the door (if there is one)
	call IgnoreInputForHalfSecond
	jp EnterMap

ContinueCheckWarpsNoCollisionLoop:: ; 07b5 (0:07b5)
	inc b ; increment warp number
	dec c ; decrement number of warps
	jp nz,CheckWarpsNoCollisionLoop

; if no matching warp was found
CheckMapConnections:: ; 07ba (0:07ba)
.checkWestMap
	ld a,[W_XCOORD]
	cp a,$ff
	jr nz,.checkEastMap
	ld a,[W_MAPCONN3PTR]
	ld [W_CURMAP],a
	ld a,[wd38f] ; new X coordinate upon entering west map
	ld [W_XCOORD],a
	ld a,[W_YCOORD]
	ld c,a
	ld a,[wd38e] ; Y adjustment upon entering west map
	add c
	ld c,a
	ld [W_YCOORD],a
	ld a,[wd390] ; pointer to upper left corner of map without adjustment for Y position
	ld l,a
	ld a,[wd391]
	ld h,a
	srl c
	jr z,.savePointer1
.pointerAdjustmentLoop1
	ld a,[wd38d] ; width of connected map
	add a,$06
	ld e,a
	ld d,$00
	ld b,$00
	add hl,de
	dec c
	jr nz,.pointerAdjustmentLoop1
.savePointer1
	ld a,l
	ld [wCurrentTileBlockMapViewPointer],a ; pointer to upper left corner of current tile block map section
	ld a,h
	ld [wCurrentTileBlockMapViewPointer + 1],a
	jp .loadNewMap
.checkEastMap
	ld b,a
	ld a,[wd525] ; map width
	cp b
	jr nz,.checkNorthMap
	ld a,[W_MAPCONN4PTR]
	ld [W_CURMAP],a
	ld a,[wd39a] ; new X coordinate upon entering east map
	ld [W_XCOORD],a
	ld a,[W_YCOORD]
	ld c,a
	ld a,[wd399] ; Y adjustment upon entering east map
	add c
	ld c,a
	ld [W_YCOORD],a
	ld a,[wd39b] ; pointer to upper left corner of map without adjustment for Y position
	ld l,a
	ld a,[wd39c]
	ld h,a
	srl c
	jr z,.savePointer2
.pointerAdjustmentLoop2
	ld a,[wd398]
	add a,$06
	ld e,a
	ld d,$00
	ld b,$00
	add hl,de
	dec c
	jr nz,.pointerAdjustmentLoop2
.savePointer2
	ld a,l
	ld [wCurrentTileBlockMapViewPointer],a ; pointer to upper left corner of current tile block map section
	ld a,h
	ld [wCurrentTileBlockMapViewPointer + 1],a
	jp .loadNewMap
.checkNorthMap
	ld a,[W_YCOORD]
	cp a,$ff
	jr nz,.checkSouthMap
	ld a,[W_MAPCONN1PTR]
	ld [W_CURMAP],a
	ld a,[wd378] ; new Y coordinate upon entering north map
	ld [W_YCOORD],a
	ld a,[W_XCOORD]
	ld c,a
	ld a,[wd379] ; X adjustment upon entering north map
	add c
	ld c,a
	ld [W_XCOORD],a
	ld a,[wd37a] ; pointer to upper left corner of map without adjustment for X position
	ld l,a
	ld a,[wd37b]
	ld h,a
	ld b,$00
	srl c
	add hl,bc
	ld a,l
	ld [wCurrentTileBlockMapViewPointer],a ; pointer to upper left corner of current tile block map section
	ld a,h
	ld [wCurrentTileBlockMapViewPointer + 1],a
	jp .loadNewMap
.checkSouthMap
	ld b,a
	ld a,[wd524]
	cp b
	jr nz,.didNotEnterConnectedMap
	ld a,[W_MAPCONN2PTR]
	ld [W_CURMAP],a
	ld a,[wd383] ; new Y coordinate upon entering south map
	ld [W_YCOORD],a
	ld a,[W_XCOORD]
	ld c,a
	ld a,[wd384] ; X adjustment upon entering south map
	add c
	ld c,a
	ld [W_XCOORD],a
	ld a,[wd385] ; pointer to upper left corner of map without adjustment for X position
	ld l,a
	ld a,[wd386]
	ld h,a
	ld b,$00
	srl c
	add hl,bc
	ld a,l
	ld [wCurrentTileBlockMapViewPointer],a ; pointer to upper left corner of current tile block map section
	ld a,h
	ld [wCurrentTileBlockMapViewPointer + 1],a
.loadNewMap ; load the connected map that was entered
	call LoadMapHeader
	call Func_2312 ; music
	ld b,$09
	call GoPAL_SET
; Since the sprite set shouldn't change, this will just update VRAM slots at
; $C2XE without loading any tile patterns.
	callba InitMapSprites
	call LoadTileBlockMap
	jp OverworldLoopLessDelay
.didNotEnterConnectedMap
	jp OverworldLoop

; function to play a sound when changing maps
PlayMapChangeSound:: ; 08c9 (0:08c9)
	aCoord 8, 8 ; upper left tile of the 4x4 square the player's sprite is standing on
	cp a,$0b ; door tile in tileset 0
	jr nz,.didNotGoThroughDoor
	ld a,(SFX_02_57 - SFX_Headers_02) / 3
	jr .playSound
.didNotGoThroughDoor
	ld a,(SFX_02_5c - SFX_Headers_02) / 3
.playSound
	call PlaySound
	ld a,[wMapPalOffset]
	and a
	ret nz
	jp GBFadeOutToBlack

CheckIfInOutsideMap:: ; 08e1 (0:08e1)
; If the player is in an outside map (a town or route), set the z flag
	ld a, [W_CURMAPTILESET]
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
ExtraWarpCheck:: ; 08e9 (0:08e9)
	ld a, [W_CURMAP]
	cp SS_ANNE_3
	jr z, .useFunction1
	cp ROCKET_HIDEOUT_1
	jr z, .useFunction2
	cp ROCKET_HIDEOUT_2
	jr z, .useFunction2
	cp ROCKET_HIDEOUT_4
	jr z, .useFunction2
	cp ROCK_TUNNEL_1
	jr z, .useFunction2
	ld a, [W_CURMAPTILESET]
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
	jp Bankswitch

MapEntryAfterBattle:: ; 091f (0:091f)
	callba IsPlayerStandingOnWarp ; for enabling warp testing after collisions
	ld a,[wMapPalOffset]
	and a
	jp z,GBFadeInFromWhite
	jp LoadGBPal

HandleBlackOut::
; For when all the player's pokemon faint.
; Does not print the "blacked out" message.

	call GBFadeOutToBlack
	ld a, $08
	call StopMusic
	ld hl, wd72e
	res 5, [hl]
	ld a, Bank(ResetStatusAndHalveMoneyOnBlackout) ; also Bank(SpecialWarpIn) and Bank(SpecialEnterMap)
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a
	call ResetStatusAndHalveMoneyOnBlackout
	call SpecialWarpIn
	call Func_2312
	jp SpecialEnterMap

StopMusic::
	ld [wMusicHeaderPointer], a
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
.wait
	ld a, [wMusicHeaderPointer]
	and a
	jr nz, .wait
	jp StopAllSounds

HandleFlyWarpOrDungeonWarp::
	call UpdateSprites
	call Delay3
	xor a
	ld [wBattleResult], a
	ld [wWalkBikeSurfState], a
	ld [W_ISINBATTLE], a
	ld [wMapPalOffset], a
	ld hl, wd732
	set 2, [hl] ; fly warp or dungeon warp
	res 5, [hl] ; forced to ride bike
	call LeaveMapAnim
	ld a, Bank(SpecialWarpIn)
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	call SpecialWarpIn
	jp SpecialEnterMap

LeaveMapAnim::
	ld b, BANK(_LeaveMapAnim)
	ld hl, _LeaveMapAnim
	jp Bankswitch

LoadPlayerSpriteGraphics::
; Load sprite graphics based on whether the player is standing, biking, or surfing.

	; 0: standing
	; 1: biking
	; 2: surfing

	ld a, [wWalkBikeSurfState]
	dec a
	jr z, .ridingBike

	ld a, [hTilesetType]
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
	jp LoadWalkingPlayerSpriteGraphics

IsBikeRidingAllowed::
; The bike can be used on Route 23 and Indigo Plateau,
; or maps with tilesets in BikeRidingTilesets.
; Return carry if biking is allowed.

	ld a, [W_CURMAP]
	cp ROUTE_23
	jr z, .allowed
	cp INDIGO_PLATEAU
	jr z, .allowed

	ld a, [W_CURMAPTILESET]
	ld b, a
	ld hl, BikeRidingTilesets
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

INCLUDE "data/bike_riding_tilesets.asm"

; load the tile pattern data of the current tileset into VRAM
LoadTilesetTilePatternData:: ; 09e8 (0:09e8)
	ld a,[W_TILESETGFXPTR]
	ld l,a
	ld a,[W_TILESETGFXPTR + 1]
	ld h,a
	ld de,vTileset
	ld bc,$600
	ld a,[W_TILESETBANK]
	jp FarCopyData2

; this loads the current maps complete tile map (which references blocks, not individual tiles) to C6E8
; it can also load partial tile maps of connected maps into a border of length 3 around the current map
LoadTileBlockMap:: ; 09fc (0:09fc)
; fill C6E8-CBFB with the background tile
	ld hl,wOverworldMap
	ld a,[wd3ad] ; background tile number
	ld d,a
	ld bc,$0514
.backgroundTileLoop
	ld a,d
	ld [hli],a
	dec bc
	ld a,c
	or b
	jr nz,.backgroundTileLoop
; load tile map of current map (made of tile block IDs)
; a 3-byte border at the edges of the map is kept so that there is space for map connections
	ld hl,wOverworldMap
	ld a,[W_CURMAPWIDTH]
	ld [$ff8c],a
	add a,$06 ; border (east and west)
	ld [$ff8b],a ; map width + border
	ld b,$00
	ld c,a
; make space for north border (next 3 lines)
	add hl,bc
	add hl,bc
	add hl,bc
	ld c,$03
	add hl,bc ; this puts us past the (west) border
	ld a,[W_MAPDATAPTR] ; tile map pointer
	ld e,a
	ld a,[W_MAPDATAPTR + 1]
	ld d,a ; de = tile map pointer
	ld a,[W_CURMAPHEIGHT]
	ld b,a
.rowLoop ; copy one row each iteration
	push hl
	ld a,[$ff8c] ; map width (without border)
	ld c,a
.rowInnerLoop
	ld a,[de]
	inc de
	ld [hli],a
	dec c
	jr nz,.rowInnerLoop
; add the map width plus the border to the base address of the current row to get the next row's address
	pop hl
	ld a,[$ff8b] ; map width + border
	add l
	ld l,a
	jr nc,.noCarry
	inc h
.noCarry
	dec b
	jr nz,.rowLoop
.northConnection
	ld a,[W_MAPCONN1PTR]
	cp a,$ff
	jr z,.southConnection
	call SwitchToMapRomBank
	ld a,[wd372]
	ld l,a
	ld a,[wd373]
	ld h,a
	ld a,[wd374]
	ld e,a
	ld a,[wd375]
	ld d,a
	ld a,[wd376]
	ld [$ff8b],a
	ld a,[wd377]
	ld [$ff8c],a
	call LoadNorthSouthConnectionsTileMap
.southConnection
	ld a,[W_MAPCONN2PTR]
	cp a,$ff
	jr z,.westConnection
	call SwitchToMapRomBank
	ld a,[wd37d]
	ld l,a
	ld a,[wd37e]
	ld h,a
	ld a,[wd37f]
	ld e,a
	ld a,[wd380]
	ld d,a
	ld a,[wd381]
	ld [$ff8b],a
	ld a,[wd382]
	ld [$ff8c],a
	call LoadNorthSouthConnectionsTileMap
.westConnection
	ld a,[W_MAPCONN3PTR]
	cp a,$ff
	jr z,.eastConnection
	call SwitchToMapRomBank
	ld a,[wd388]
	ld l,a
	ld a,[wd389]
	ld h,a
	ld a,[wd38a]
	ld e,a
	ld a,[wd38b]
	ld d,a
	ld a,[wd38c]
	ld b,a
	ld a,[wd38d]
	ld [$ff8b],a
	call LoadEastWestConnectionsTileMap
.eastConnection
	ld a,[W_MAPCONN4PTR]
	cp a,$ff
	jr z,.done
	call SwitchToMapRomBank
	ld a,[wd393]
	ld l,a
	ld a,[wd394]
	ld h,a
	ld a,[wd395]
	ld e,a
	ld a,[wd396]
	ld d,a
	ld a,[wd397]
	ld b,a
	ld a,[wd398]
	ld [$ff8b],a
	call LoadEastWestConnectionsTileMap
.done
	ret

LoadNorthSouthConnectionsTileMap:: ; 0ade (0:0ade)
	ld c,$03
.loop
	push de
	push hl
	ld a,[$ff8b] ; width of connection
	ld b,a
.innerLoop
	ld a,[hli]
	ld [de],a
	inc de
	dec b
	jr nz,.innerLoop
	pop hl
	pop de
	ld a,[$ff8c] ; width of connected map
	add l
	ld l,a
	jr nc,.noCarry1
	inc h
.noCarry1
	ld a,[W_CURMAPWIDTH]
	add a,$06
	add e
	ld e,a
	jr nc,.noCarry2
	inc d
.noCarry2
	dec c
	jr nz,.loop
	ret

LoadEastWestConnectionsTileMap:: ; 0b02 (0:0b02)
	push hl
	push de
	ld c,$03
.innerLoop
	ld a,[hli]
	ld [de],a
	inc de
	dec c
	jr nz,.innerLoop
	pop de
	pop hl
	ld a,[$ff8b] ; width of connected map
	add l
	ld l,a
	jr nc,.noCarry1
	inc h
.noCarry1
	ld a,[W_CURMAPWIDTH]
	add a,$06
	add e
	ld e,a
	jr nc,.noCarry2
	inc d
.noCarry2
	dec b
	jr nz,LoadEastWestConnectionsTileMap
	ret

; function to check if there is a sign or sprite in front of the player
; if so, it is stored in [hSpriteIndexOrTextID]
; if not, [hSpriteIndexOrTextID] is set to 0
IsSpriteOrSignInFrontOfPlayer:: ; 0b23 (0:0b23)
	xor a
	ld [hSpriteIndexOrTextID],a
	ld a,[wd4b0] ; number of signs in the map
	and a
	jr z,.extendRangeOverCounter
; if there are signs
	predef GetTileAndCoordsInFrontOfPlayer ; get the coordinates in front of the player in de
	ld hl,wd4b1 ; start of sign coordinates
	ld a,[wd4b0] ; number of signs in the map
	ld b,a
	ld c,$00
.signLoop
	inc c
	ld a,[hli] ; sign Y
	cp d
	jr z,.yCoordMatched
	inc hl
	jr .retry
.yCoordMatched
	ld a,[hli] ; sign X
	cp e
	jr nz,.retry
.xCoordMatched
; found sign
	push hl
	push bc
	ld hl,wd4d1 ; start of sign text ID's
	ld b,$00
	dec c
	add hl,bc
	ld a,[hl]
	ld [hSpriteIndexOrTextID],a ; store sign text ID
	pop bc
	pop hl
	ret
.retry
	dec b
	jr nz,.signLoop
; check if the player is front of a counter in a pokemon center, pokemart, etc. and if so, extend the range at which he can talk to the NPC
.extendRangeOverCounter
	predef GetTileAndCoordsInFrontOfPlayer ; get the tile in front of the player in c
	ld hl,W_TILESETTALKINGOVERTILES ; list of tiles that extend talking range (counter tiles)
	ld b,$03
	ld d,$20 ; talking range in pixels (long range)
.counterTilesLoop
	ld a,[hli]
	cp c
	jr z,IsSpriteInFrontOfPlayer2 ; jumps if the tile in front of the player is a counter tile
	dec b
	jr nz,.counterTilesLoop

; part of the above function, but sometimes its called on its own, when signs are irrelevant
; the caller must zero [hSpriteIndexOrTextID]
IsSpriteInFrontOfPlayer:: ; 0b6b (0:0b6b)
	ld d,$10 ; talking range in pixels (normal range)
IsSpriteInFrontOfPlayer2:: ; 0b6d (0:0b6d)
	ld bc,$3c40 ; Y and X position of player sprite
	ld a,[wSpriteStateData1 + 9] ; direction the player is facing
.checkIfPlayerFacingUp
	cp a,$04
	jr nz,.checkIfPlayerFacingDown
; facing up
	ld a,b
	sub d
	ld b,a
	ld a,$08
	jr .doneCheckingDirection
.checkIfPlayerFacingDown
	cp a,$00
	jr nz,.checkIfPlayerFacingRight
; facing down
	ld a,b
	add d
	ld b,a
	ld a,$04
	jr .doneCheckingDirection
.checkIfPlayerFacingRight
	cp a,$0c
	jr nz,.playerFacingLeft
; facing right
	ld a,c
	add d
	ld c,a
	ld a,$01
	jr .doneCheckingDirection
.playerFacingLeft
; facing left
	ld a,c
	sub d
	ld c,a
	ld a,$02
.doneCheckingDirection
	ld [wd52a],a
	ld a,[W_NUMSPRITES] ; number of sprites
	and a
	ret z
; if there are sprites
	ld hl,wSpriteStateData1 + $10
	ld d,a
	ld e,$01
.spriteLoop
	push hl
	ld a,[hli] ; image (0 if no sprite)
	and a
	jr z,.nextSprite
	inc l
	ld a,[hli] ; sprite visibility
	inc a
	jr z,.nextSprite
	inc l
	ld a,[hli] ; Y location
	cp b
	jr nz,.nextSprite
	inc l
	ld a,[hl] ; X location
	cp c
	jr z,.foundSpriteInFrontOfPlayer
.nextSprite
	pop hl
	ld a,l
	add a,$10
	ld l,a
	inc e
	dec d
	jr nz,.spriteLoop
	ret
.foundSpriteInFrontOfPlayer
	pop hl
	ld a,l
	and a,$f0
	inc a
	ld l,a
	set 7,[hl]
	ld a,e
	ld [hSpriteIndexOrTextID],a
	ret

; function to check if the player will jump down a ledge and check if the tile ahead is passable (when not surfing)
; sets the carry flag if there is a collision, and unsets it if there isn't a collision
CollisionCheckOnLand:: ; 0bd1 (0:0bd1)
	ld a,[wd736]
	bit 6,a ; is the player jumping?
	jr nz,.noCollision
; if not jumping a ledge
	ld a,[wSimulatedJoypadStatesIndex]
	and a
	jr nz,.noCollision ; no collisions when the player's movements are being controlled by the game
	ld a,[wd52a] ; the direction that the player is trying to go in
	ld d,a
	ld a,[wSpriteStateData1 + 12] ; the player sprite's collision data (bit field) (set in the sprite movement code)
	and d ; check if a sprite is in the direction the player is trying to go
	jr nz,.collision
	xor a
	ld [hSpriteIndexOrTextID],a
	call IsSpriteInFrontOfPlayer ; check for sprite collisions again? when does the above check fail to detect a sprite collision?
	ld a,[hSpriteIndexOrTextID]
	and a ; was there a sprite collision?
	jr nz,.collision
; if no sprite collision
	ld hl,TilePairCollisionsLand
	call CheckForJumpingAndTilePairCollisions
	jr c,.collision
	call CheckTilePassable
	jr nc,.noCollision
.collision
	ld a,[wc02a]
	cp a,(SFX_02_5b - SFX_Headers_02) / 3 ; check if collision sound is already playing
	jr z,.setCarry
	ld a,(SFX_02_5b - SFX_Headers_02) / 3
	call PlaySound ; play collision sound (if it's not already playing)
.setCarry
	scf
	ret
.noCollision
	and a
	ret

; function that checks if the tile in front of the player is passable
; clears carry if it is, sets carry if not
CheckTilePassable:: ; 0c10 (0:0c10)
	predef GetTileAndCoordsInFrontOfPlayer ; get tile in front of player
	ld a,[wTileInFrontOfPlayer] ; tile in front of player
	ld c,a
	ld hl,W_TILESETCOLLISIONPTR ; pointer to list of passable tiles
	ld a,[hli]
	ld h,[hl]
	ld l,a ; hl now points to passable tiles
.loop
	ld a,[hli]
	cp a,$ff
	jr z,.tileNotPassable
	cp c
	ret z
	jr .loop
.tileNotPassable
	scf
	ret

; check if the player is going to jump down a small ledge
; and check for collisions that only occur between certain pairs of tiles
; Input: hl - address of directional collision data
; sets carry if there is a collision and unsets carry if not
CheckForJumpingAndTilePairCollisions:: ; 0c2a (0:0c2a)
	push hl
	predef GetTileAndCoordsInFrontOfPlayer ; get the tile in front of the player
	push de
	push bc
	callba HandleLedges ; check if the player is trying to jump a ledge
	pop bc
	pop de
	pop hl
	and a
	ld a,[wd736]
	bit 6,a ; is the player jumping?
	ret nz
; if not jumping

CheckForTilePairCollisions2:: ; 0c44 (0:0c44)
	aCoord 8, 9 ; tile the player is on
	ld [wcf0e],a

CheckForTilePairCollisions:: ; 0c4a (0:0c4a)
	ld a,[wTileInFrontOfPlayer]
	ld c,a
.tilePairCollisionLoop
	ld a,[W_CURMAPTILESET] ; tileset number
	ld b,a
	ld a,[hli]
	cp a,$ff
	jr z,.noMatch
	cp b
	jr z,.tilesetMatches
	inc hl
.retry
	inc hl
	jr .tilePairCollisionLoop
.tilesetMatches
	ld a,[wcf0e] ; tile the player is on
	ld b,a
	ld a,[hl]
	cp b
	jr z,.currentTileMatchesFirstInPair
	inc hl
	ld a,[hl]
	cp b
	jr z,.currentTileMatchesSecondInPair
	jr .retry
.currentTileMatchesFirstInPair
	inc hl
	ld a,[hl]
	cp c
	jr z,.foundMatch
	jr .tilePairCollisionLoop
.currentTileMatchesSecondInPair
	dec hl
	ld a,[hli]
	cp c
	inc hl
	jr nz,.tilePairCollisionLoop
.foundMatch
	scf
	ret
.noMatch
	and a
	ret

; FORMAT: tileset number, tile 1, tile 2
; terminated by 0xFF
; these entries indicate that the player may not cross between tile 1 and tile 2
; it's mainly used to simulate differences in elevation

TilePairCollisionsLand:: ; 0c7e (0:0c7e)
	db CAVERN, $20, $05
	db CAVERN, $41, $05
	db FOREST, $30, $2E
	db CAVERN, $2A, $05
	db CAVERN, $05, $21
	db FOREST, $52, $2E
	db FOREST, $55, $2E
	db FOREST, $56, $2E
	db FOREST, $20, $2E
	db FOREST, $5E, $2E
	db FOREST, $5F, $2E
	db $FF

TilePairCollisionsWater:: ; 0ca0 (0:0ca0)
	db FOREST, $14, $2E
	db FOREST, $48, $2E
	db CAVERN, $14, $05
	db $FF

; this builds a tile map from the tile block map based on the current X/Y coordinates of the player's character
LoadCurrentMapView:: ; 0caa (0:0caa)
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,[W_TILESETBANK] ; tile data ROM bank
	ld [H_LOADEDROMBANK],a
	ld [$2000],a ; switch to ROM bank that contains tile data
	ld a,[wCurrentTileBlockMapViewPointer] ; address of upper left corner of current map view
	ld e,a
	ld a,[wCurrentTileBlockMapViewPointer + 1]
	ld d,a
	ld hl,wTileMapBackup
	ld b,$05
.rowLoop ; each loop iteration fills in one row of tile blocks
	push hl
	push de
	ld c,$06
.rowInnerLoop ; loop to draw each tile block of the current row
	push bc
	push de
	push hl
	ld a,[de]
	ld c,a ; tile block number
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
	jr nz,.rowInnerLoop
; update tile block map pointer to next row's address
	pop de
	ld a,[W_CURMAPWIDTH]
	add a,$06
	add e
	ld e,a
	jr nc,.noCarry
	inc d
.noCarry
; update tile map pointer to next row's address
	pop hl
	ld a,$60
	add l
	ld l,a
	jr nc,.noCarry2
	inc h
.noCarry2
	dec b
	jr nz,.rowLoop
	ld hl,wTileMapBackup
	ld bc,$0000
.adjustForYCoordWithinTileBlock
	ld a,[W_YBLOCKCOORD]
	and a
	jr z,.adjustForXCoordWithinTileBlock
	ld bc,$0030
	add hl,bc
.adjustForXCoordWithinTileBlock
	ld a,[W_XBLOCKCOORD]
	and a
	jr z,.copyToVisibleAreaBuffer
	ld bc,$0002
	add hl,bc
.copyToVisibleAreaBuffer
	ld de,wTileMap ; base address for the tiles that are directly transfered to VRAM during V-blank
	ld b,$12
.rowLoop2
	ld c,$14
.rowInnerLoop2
	ld a,[hli]
	ld [de],a
	inc de
	dec c
	jr nz,.rowInnerLoop2
	ld a,$04
	add l
	ld l,a
	jr nc,.noCarry3
	inc h
.noCarry3
	dec b
	jr nz,.rowLoop2
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a ; restore previous ROM bank
	ret

AdvancePlayerSprite:: ; 0d27 (0:0d27)
	ld a,[wSpriteStateData1 + 3] ; delta Y
	ld b,a
	ld a,[wSpriteStateData1 + 5] ; delta X
	ld c,a
	ld hl,wWalkCounter ; walking animation counter
	dec [hl]
	jr nz,.afterUpdateMapCoords
; if it's the end of the animation, update the player's map coordinates
	ld a,[W_YCOORD]
	add b
	ld [W_YCOORD],a
	ld a,[W_XCOORD]
	add c
	ld [W_XCOORD],a
.afterUpdateMapCoords
	ld a,[wWalkCounter] ; walking animation counter
	cp a,$07
	jp nz,.scrollBackgroundAndSprites
; if this is the first iteration of the animation
	ld a,c
	cp a,$01
	jr nz,.checkIfMovingWest
; moving east
	ld a,[wMapViewVRAMPointer]
	ld e,a
	and a,$e0
	ld d,a
	ld a,e
	add a,$02
	and a,$1f
	or d
	ld [wMapViewVRAMPointer],a
	jr .adjustXCoordWithinBlock
.checkIfMovingWest
	cp a,$ff
	jr nz,.checkIfMovingSouth
; moving west
	ld a,[wMapViewVRAMPointer]
	ld e,a
	and a,$e0
	ld d,a
	ld a,e
	sub a,$02
	and a,$1f
	or d
	ld [wMapViewVRAMPointer],a
	jr .adjustXCoordWithinBlock
.checkIfMovingSouth
	ld a,b
	cp a,$01
	jr nz,.checkIfMovingNorth
; moving south
	ld a,[wMapViewVRAMPointer]
	add a,$40
	ld [wMapViewVRAMPointer],a
	jr nc,.adjustXCoordWithinBlock
	ld a,[wMapViewVRAMPointer + 1]
	inc a
	and a,$03
	or a,$98
	ld [wMapViewVRAMPointer + 1],a
	jr .adjustXCoordWithinBlock
.checkIfMovingNorth
	cp a,$ff
	jr nz,.adjustXCoordWithinBlock
; moving north
	ld a,[wMapViewVRAMPointer]
	sub a,$40
	ld [wMapViewVRAMPointer],a
	jr nc,.adjustXCoordWithinBlock
	ld a,[wMapViewVRAMPointer + 1]
	dec a
	and a,$03
	or a,$98
	ld [wMapViewVRAMPointer + 1],a
.adjustXCoordWithinBlock
	ld a,c
	and a
	jr z,.pointlessJump ; mistake?
.pointlessJump
	ld hl,W_XBLOCKCOORD
	ld a,[hl]
	add c
	ld [hl],a
	cp a,$02
	jr nz,.checkForMoveToWestBlock
; moved into the tile block to the east
	xor a
	ld [hl],a
	ld hl,wXOffsetSinceLastSpecialWarp
	inc [hl]
	ld de,wCurrentTileBlockMapViewPointer
	call MoveTileBlockMapPointerEast
	jr .updateMapView
.checkForMoveToWestBlock
	cp a,$ff
	jr nz,.adjustYCoordWithinBlock
; moved into the tile block to the west
	ld a,$01
	ld [hl],a
	ld hl,wXOffsetSinceLastSpecialWarp
	dec [hl]
	ld de,wCurrentTileBlockMapViewPointer
	call MoveTileBlockMapPointerWest
	jr .updateMapView
.adjustYCoordWithinBlock
	ld hl,W_YBLOCKCOORD
	ld a,[hl]
	add b
	ld [hl],a
	cp a,$02
	jr nz,.checkForMoveToNorthBlock
; moved into the tile block to the south
	xor a
	ld [hl],a
	ld hl,wYOffsetSinceLastSpecialWarp
	inc [hl]
	ld de,wCurrentTileBlockMapViewPointer
	ld a,[W_CURMAPWIDTH]
	call MoveTileBlockMapPointerSouth
	jr .updateMapView
.checkForMoveToNorthBlock
	cp a,$ff
	jr nz,.updateMapView
; moved into the tile block to the north
	ld a,$01
	ld [hl],a
	ld hl,wYOffsetSinceLastSpecialWarp
	dec [hl]
	ld de,wCurrentTileBlockMapViewPointer
	ld a,[W_CURMAPWIDTH]
	call MoveTileBlockMapPointerNorth
.updateMapView
	call LoadCurrentMapView
	ld a,[wSpriteStateData1 + 3] ; delta Y
	cp a,$01
	jr nz,.checkIfMovingNorth2
; if moving south
	call ScheduleSouthRowRedraw
	jr .scrollBackgroundAndSprites
.checkIfMovingNorth2
	cp a,$ff
	jr nz,.checkIfMovingEast2
; if moving north
	call ScheduleNorthRowRedraw
	jr .scrollBackgroundAndSprites
.checkIfMovingEast2
	ld a,[wSpriteStateData1 + 5] ; delta X
	cp a,$01
	jr nz,.checkIfMovingWest2
; if moving east
	call ScheduleEastColumnRedraw
	jr .scrollBackgroundAndSprites
.checkIfMovingWest2
	cp a,$ff
	jr nz,.scrollBackgroundAndSprites
; if moving west
	call ScheduleWestColumnRedraw
.scrollBackgroundAndSprites
	ld a,[wSpriteStateData1 + 3] ; delta Y
	ld b,a
	ld a,[wSpriteStateData1 + 5] ; delta X
	ld c,a
	sla b
	sla c
	ld a,[hSCY]
	add b
	ld [hSCY],a ; update background scroll Y
	ld a,[hSCX]
	add c
	ld [hSCX],a ; update background scroll X
; shift all the sprites in the direction opposite of the player's motion
; so that the player appears to move relative to them
	ld hl,wSpriteStateData1 + $14
	ld a,[W_NUMSPRITES] ; number of sprites
	and a ; are there any sprites?
	jr z,.done
	ld e,a
.spriteShiftLoop
	ld a,[hl]
	sub b
	ld [hli],a
	inc l
	ld a,[hl]
	sub c
	ld [hl],a
	ld a,$0e
	add l
	ld l,a
	dec e
	jr nz,.spriteShiftLoop
.done
	ret

; the following four functions are used to move the pointer to the upper left
; corner of the tile block map in the direction of motion

MoveTileBlockMapPointerEast:: ; 0e65 (0:0e65)
	ld a,[de]
	add a,$01
	ld [de],a
	ret nc
	inc de
	ld a,[de]
	inc a
	ld [de],a
	ret

MoveTileBlockMapPointerWest:: ; 0e6f (0:0e6f)
	ld a,[de]
	sub a,$01
	ld [de],a
	ret nc
	inc de
	ld a,[de]
	dec a
	ld [de],a
	ret

MoveTileBlockMapPointerSouth:: ; 0e79 (0:0e79)
	add a,$06
	ld b,a
	ld a,[de]
	add b
	ld [de],a
	ret nc
	inc de
	ld a,[de]
	inc a
	ld [de],a
	ret

MoveTileBlockMapPointerNorth:: ; 0e85 (0:0e85)
	add a,$06
	ld b,a
	ld a,[de]
	sub b
	ld [de],a
	ret nc
	inc de
	ld a,[de]
	dec a
	ld [de],a
	ret

; the following 6 functions are used to tell the V-blank handler to redraw
; the portion of the map that was newly exposed due to the player's movement

ScheduleNorthRowRedraw:: ; 0e91 (0:0e91)
	hlCoord 0, 0
	call CopyToScreenEdgeTiles
	ld a,[wMapViewVRAMPointer]
	ld [H_SCREENEDGEREDRAWADDR],a
	ld a,[wMapViewVRAMPointer + 1]
	ld [H_SCREENEDGEREDRAWADDR + 1],a
	ld a,REDRAWROW
	ld [H_SCREENEDGEREDRAW],a
	ret

CopyToScreenEdgeTiles:: ; 0ea6 (0:0ea6)
	ld de,wScreenEdgeTiles
	ld c,2 * 20
.loop
	ld a,[hli]
	ld [de],a
	inc de
	dec c
	jr nz,.loop
	ret

ScheduleSouthRowRedraw:: ; 0eb2 (0:0eb2)
	hlCoord 0, 16
	call CopyToScreenEdgeTiles
	ld a,[wMapViewVRAMPointer]
	ld l,a
	ld a,[wMapViewVRAMPointer + 1]
	ld h,a
	ld bc,$0200
	add hl,bc
	ld a,h
	and a,$03
	or a,$98
	ld [H_SCREENEDGEREDRAWADDR + 1],a
	ld a,l
	ld [H_SCREENEDGEREDRAWADDR],a
	ld a,REDRAWROW
	ld [H_SCREENEDGEREDRAW],a
	ret

ScheduleEastColumnRedraw:: ; 0ed3 (0:0ed3)
	hlCoord 18, 0
	call ScheduleColumnRedrawHelper
	ld a,[wMapViewVRAMPointer]
	ld c,a
	and a,$e0
	ld b,a
	ld a,c
	add a,18
	and a,$1f
	or b
	ld [H_SCREENEDGEREDRAWADDR],a
	ld a,[wMapViewVRAMPointer + 1]
	ld [H_SCREENEDGEREDRAWADDR + 1],a
	ld a,REDRAWCOL
	ld [H_SCREENEDGEREDRAW],a
	ret

ScheduleColumnRedrawHelper:: ; 0ef2 (0:0ef2)
	ld de,wScreenEdgeTiles
	ld c,$12
.loop
	ld a,[hli]
	ld [de],a
	inc de
	ld a,[hl]
	ld [de],a
	inc de
	ld a,19
	add l
	ld l,a
	jr nc,.noCarry
	inc h
.noCarry
	dec c
	jr nz,.loop
	ret

ScheduleWestColumnRedraw:: ; 0f08 (0:0f08)
	hlCoord 0, 0
	call ScheduleColumnRedrawHelper
	ld a,[wMapViewVRAMPointer]
	ld [H_SCREENEDGEREDRAWADDR],a
	ld a,[wMapViewVRAMPointer + 1]
	ld [H_SCREENEDGEREDRAWADDR + 1],a
	ld a,REDRAWCOL
	ld [H_SCREENEDGEREDRAW],a
	ret

; function to write the tiles that make up a tile block to memory
; Input: c = tile block ID, hl = destination address
DrawTileBlock:: ; 0f1d (0:0f1d)
	push hl
	ld a,[W_TILESETBLOCKSPTR] ; pointer to tiles
	ld l,a
	ld a,[W_TILESETBLOCKSPTR + 1]
	ld h,a
	ld a,c
	swap a
	ld b,a
	and a,$f0
	ld c,a
	ld a,b
	and a,$0f
	ld b,a ; bc = tile block ID * 0x10
	add hl,bc
	ld d,h
	ld e,l ; de = address of the tile block's tiles
	pop hl
	ld c,$04 ; 4 loop iterations
.loop ; each loop iteration, write 4 tile numbers
	push bc
	ld a,[de]
	ld [hli],a
	inc de
	ld a,[de]
	ld [hli],a
	inc de
	ld a,[de]
	ld [hli],a
	inc de
	ld a,[de]
	ld [hl],a
	inc de
	ld bc,$0015
	add hl,bc
	pop bc
	dec c
	jr nz,.loop
	ret

; function to update joypad state and simulate button presses
JoypadOverworld:: ; 0f4d (0:0f4d)
	xor a
	ld [wSpriteStateData1 + 3],a
	ld [wSpriteStateData1 + 5],a
	call RunMapScript
	call Joypad
	ld a,[W_FLAGS_D733]
	bit 3,a ; check if a trainer wants a challenge
	jr nz,.notForcedDownwards
	ld a,[W_CURMAP]
	cp a,ROUTE_17 ; Cycling Road
	jr nz,.notForcedDownwards
	ld a,[hJoyHeld]
	and a,D_DOWN | D_UP | D_LEFT | D_RIGHT | B_BUTTON | A_BUTTON
	jr nz,.notForcedDownwards
	ld a,D_DOWN
	ld [hJoyHeld],a ; on the cycling road, if there isn't a trainer and the player isn't pressing buttons, simulate a down press
.notForcedDownwards
	ld a,[wd730]
	bit 7,a
	ret z
; if simulating button presses
	ld a,[hJoyHeld]
	ld b,a
	ld a,[wOverrideSimulatedJoypadStatesMask] ; bit mask for button presses that override simulated ones
	and b
	ret nz ; return if the simulated button presses are overridden
	ld hl,wSimulatedJoypadStatesIndex
	dec [hl]
	ld a,[hl]
	cp a,$ff
	jr z,.doneSimulating ; if the end of the simulated button presses has been reached
	ld hl,wSimulatedJoypadStatesEnd
	add l
	ld l,a
	jr nc,.noCarry
	inc h
.noCarry
	ld a,[hl]
	ld [hJoyHeld],a ; store simulated button press in joypad state
	and a
	ret nz
	ld [hJoyPressed],a
	ld [hJoyReleased],a
	ret
; if done simulating button presses
.doneSimulating
	xor a
	ld [wWastedByteCD3A],a
	ld [wSimulatedJoypadStatesIndex],a
	ld [wSimulatedJoypadStatesEnd],a
	ld [wJoyIgnore],a
	ld [hJoyHeld],a
	ld hl,wd736
	ld a,[hl]
	and a,$f8
	ld [hl],a
	ld hl,wd730
	res 7,[hl]
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
CollisionCheckOnWater:: ; 0fb7 (0:0fb7)
	ld a,[wd730]
	bit 7,a
	jp nz,.noCollision ; return and clear carry if button presses are being simulated
	ld a,[wd52a] ; the direction that the player is trying to go in
	ld d,a
	ld a,[wSpriteStateData1 + 12] ; the player sprite's collision data (bit field) (set in the sprite movement code)
	and d ; check if a sprite is in the direction the player is trying to go
	jr nz,.checkIfNextTileIsPassable ; bug?
	ld hl,TilePairCollisionsWater
	call CheckForJumpingAndTilePairCollisions
	jr c,.collision
	predef GetTileAndCoordsInFrontOfPlayer ; get tile in front of player (puts it in c and [wTileInFrontOfPlayer])
	ld a,[wTileInFrontOfPlayer] ; tile in front of player
	cp a,$14 ; water tile
	jr z,.noCollision ; keep surfing if it's a water tile
	cp a,$32 ; either the left tile of the S.S. Anne boarding platform or the tile on eastern coastlines (depending on the current tileset)
	jr z,.checkIfVermilionDockTileset
	cp a,$48 ; tile on right on coast lines in Safari Zone
	jr z,.noCollision ; keep surfing
; check if the [land] tile in front of the player is passable
.checkIfNextTileIsPassable
	ld hl,W_TILESETCOLLISIONPTR ; pointer to list of passable tiles
	ld a,[hli]
	ld h,[hl]
	ld l,a
.loop
	ld a,[hli]
	cp a,$ff
	jr z,.collision
	cp c
	jr z,.stopSurfing ; stop surfing if the tile is passable
	jr .loop
.collision
	ld a,[wc02a]
	cp a,(SFX_02_5b - SFX_Headers_02) / 3 ; check if collision sound is already playing
	jr z,.setCarry
	ld a,(SFX_02_5b - SFX_Headers_02) / 3
	call PlaySound ; play collision sound (if it's not already playing)
.setCarry
	scf
	jr .done
.noCollision
	and a
.done
	ret
.stopSurfing
	xor a
	ld [wWalkBikeSurfState],a
	call LoadPlayerSpriteGraphics
	call PlayDefaultMusic
	jr .noCollision
.checkIfVermilionDockTileset
	ld a, [W_CURMAPTILESET] ; tileset
	cp SHIP_PORT ; Vermilion Dock tileset
	jr nz, .noCollision ; keep surfing if it's not the boarding platform tile
	jr .stopSurfing ; if it is the boarding platform tile, stop surfing

; function to run the current map's script
RunMapScript:: ; 101b (0:101b)
	push hl
	push de
	push bc
	callba TryPushingBoulder
	ld a,[wFlags_0xcd60]
	bit 1,a ; play boulder dust animation
	jr z,.afterBoulderEffect
	callba DoBoulderDustAnimation
.afterBoulderEffect
	pop bc
	pop de
	pop hl
	call RunNPCMovementScript
	ld a,[W_CURMAP] ; current map number
	call SwitchToMapRomBank ; change to the ROM bank the map's data is in
	ld hl,W_MAPSCRIPTPTR
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld de,.return
	push de
	jp [hl] ; jump to script
.return
	ret

LoadWalkingPlayerSpriteGraphics:: ; 104d (0:104d)
	ld de,RedSprite ; $4180
	ld hl,vNPCSprites
	jr LoadPlayerSpriteGraphicsCommon

LoadSurfingPlayerSpriteGraphics:: ; 1055 (0:1055)
	ld de,SeelSprite
	ld hl,vNPCSprites
	jr LoadPlayerSpriteGraphicsCommon

LoadBikePlayerSpriteGraphics:: ; 105d (0:105d)
	ld de,RedCyclingSprite
	ld hl,vNPCSprites

LoadPlayerSpriteGraphicsCommon:: ; 1063 (0:1063)
	push de
	push hl
	ld bc,(BANK(RedSprite) << 8) + $0c
	call CopyVideoData
	pop hl
	pop de
	ld a,$c0
	add e
	ld e,a
	jr nc,.noCarry
	inc d
.noCarry
	set 3,h
	ld bc,$050c
	jp CopyVideoData

; function to load data from the map header
LoadMapHeader:: ; 107c (0:107c)
	callba MarkTownVisitedAndLoadMissableObjects
	ld a,[W_CURMAPTILESET]
	ld [wd119],a
	ld a,[W_CURMAP]
	call SwitchToMapRomBank
	ld a,[W_CURMAPTILESET]
	ld b,a
	res 7,a
	ld [W_CURMAPTILESET],a
	ld [$ff8b],a
	bit 7,b
	ret nz
	ld hl,MapHeaderPointers
	ld a,[W_CURMAP]
	sla a
	jr nc,.noCarry1
	inc h
.noCarry1
	add l
	ld l,a
	jr nc,.noCarry2
	inc h
.noCarry2
	ld a,[hli]
	ld h,[hl]
	ld l,a ; hl = base of map header
; copy the first 10 bytes (the fixed area) of the map data to D367-D370
	ld de,W_CURMAPTILESET
	ld c,$0a
.copyFixedHeaderLoop
	ld a,[hli]
	ld [de],a
	inc de
	dec c
	jr nz,.copyFixedHeaderLoop
; initialize all the connected maps to disabled at first, before loading the actual values
	ld a,$ff
	ld [W_MAPCONN1PTR],a
	ld [W_MAPCONN2PTR],a
	ld [W_MAPCONN3PTR],a
	ld [W_MAPCONN4PTR],a
; copy connection data (if any) to WRAM
	ld a,[W_MAPCONNECTIONS]
	ld b,a
.checkNorth
	bit 3,b
	jr z,.checkSouth
	ld de,W_MAPCONN1PTR
	call CopyMapConnectionHeader
.checkSouth
	bit 2,b
	jr z,.checkWest
	ld de,W_MAPCONN2PTR
	call CopyMapConnectionHeader
.checkWest
	bit 1,b
	jr z,.checkEast
	ld de,W_MAPCONN3PTR
	call CopyMapConnectionHeader
.checkEast
	bit 0,b
	jr z,.getObjectDataPointer
	ld de,W_MAPCONN4PTR
	call CopyMapConnectionHeader
.getObjectDataPointer
	ld a,[hli]
	ld [wd3a9],a
	ld a,[hli]
	ld [wd3aa],a
	push hl
	ld a,[wd3a9]
	ld l,a
	ld a,[wd3aa]
	ld h,a ; hl = base of object data
	ld de,wd3ad ; background tile ID
	ld a,[hli]
	ld [de],a ; save background tile ID
.loadWarpData
	ld a,[hli]
	ld [wNumberOfWarps],a
	and a
	jr z,.loadSignData
	ld c,a
	ld de,wWarpEntries
.warpLoop ; one warp per loop iteration
	ld b,$04
.warpInnerLoop
	ld a,[hli]
	ld [de],a
	inc de
	dec b
	jr nz,.warpInnerLoop
	dec c
	jr nz,.warpLoop
.loadSignData
	ld a,[hli] ; number of signs
	ld [wd4b0],a ; save the number of signs
	and a ; are there any signs?
	jr z,.loadSpriteData ; if not, skip this
	ld c,a
	ld de,wd4d1 ; base address of sign text IDs
	ld a,d
	ld [$ff95],a
	ld a,e
	ld [$ff96],a
	ld de,wd4b1 ; base address of sign coordinates
.signLoop
	ld a,[hli]
	ld [de],a
	inc de
	ld a,[hli]
	ld [de],a
	inc de
	push de
	ld a,[$ff95]
	ld d,a
	ld a,[$ff96]
	ld e,a
	ld a,[hli]
	ld [de],a
	inc de
	ld a,d
	ld [$ff95],a
	ld a,e
	ld [$ff96],a
	pop de
	dec c
	jr nz,.signLoop
.loadSpriteData
	ld a,[wd72e]
	bit 5,a ; did a battle happen immediately before this?
	jp nz,.finishUp ; if so, skip this because battles don't destroy this data
	ld a,[hli]
	ld [W_NUMSPRITES],a ; save the number of sprites
	push hl
; zero C110-C1FF and C210-C2FF
	ld hl,wSpriteStateData1 + $10
	ld de,wSpriteStateData2 + $10
	xor a
	ld b,$f0
.zeroSpriteDataLoop
	ld [hli],a
	ld [de],a
	inc e
	dec b
	jr nz,.zeroSpriteDataLoop
; initialize all C100-C1FF sprite entries to disabled (other than player's)
	ld hl,wSpriteStateData1 + $12
	ld de,$0010
	ld c,$0f
.disableSpriteEntriesLoop
	ld [hl],$ff
	add hl,de
	dec c
	jr nz,.disableSpriteEntriesLoop
	pop hl
	ld de,wSpriteStateData1 + $10
	ld a,[W_NUMSPRITES] ; number of sprites
	and a ; are there any sprites?
	jp z,.finishUp ; if there are no sprites, skip the rest
	ld b,a
	ld c,$00
.loadSpriteLoop
	ld a,[hli]
	ld [de],a ; store picture ID at C1X0
	inc d
	ld a,$04
	add e
	ld e,a
	ld a,[hli]
	ld [de],a ; store Y position at C2X4
	inc e
	ld a,[hli]
	ld [de],a ; store X position at C2X5
	inc e
	ld a,[hli]
	ld [de],a ; store movement byte 1 at C2X6
	ld a,[hli]
	ld [$ff8d],a ; save movement byte 2
	ld a,[hli]
	ld [$ff8e],a ; save text ID and flags byte
	push bc
	push hl
	ld b,$00
	ld hl,W_MAPSPRITEDATA
	add hl,bc
	ld a,[$ff8d]
	ld [hli],a ; store movement byte 2 in byte 0 of sprite entry
	ld a,[$ff8e]
	ld [hl],a ; this appears pointless, since the value is overwritten immediately after
	ld a,[$ff8e]
	ld [$ff8d],a
	and a,$3f
	ld [hl],a ; store text ID in byte 1 of sprite entry
	pop hl
	ld a,[$ff8d]
	bit 6,a
	jr nz,.trainerSprite
	bit 7,a
	jr nz,.itemBallSprite
	jr .regularSprite
.trainerSprite
	ld a,[hli]
	ld [$ff8d],a ; save trainer class
	ld a,[hli]
	ld [$ff8e],a ; save trainer number (within class)
	push hl
	ld hl,W_MAPSPRITEEXTRADATA
	add hl,bc
	ld a,[$ff8d]
	ld [hli],a ; store trainer class in byte 0 of the entry
	ld a,[$ff8e]
	ld [hl],a ; store trainer number in byte 1 of the entry
	pop hl
	jr .nextSprite
.itemBallSprite
	ld a,[hli]
	ld [$ff8d],a ; save item number
	push hl
	ld hl,W_MAPSPRITEEXTRADATA
	add hl,bc
	ld a,[$ff8d]
	ld [hli],a ; store item number in byte 0 of the entry
	xor a
	ld [hl],a ; zero byte 1, since it is not used
	pop hl
	jr .nextSprite
.regularSprite
	push hl
	ld hl,W_MAPSPRITEEXTRADATA
	add hl,bc
; zero both bytes, since regular sprites don't use this extra space
	xor a
	ld [hli],a
	ld [hl],a
	pop hl
.nextSprite
	pop bc
	dec d
	ld a,$0a
	add e
	ld e,a
	inc c
	inc c
	dec b
	jp nz,.loadSpriteLoop
.finishUp
	predef LoadTilesetHeader
	callab LoadWildData
	pop hl ; restore hl from before going to the warp/sign/sprite data (this value was saved for seemingly no purpose)
	ld a,[W_CURMAPHEIGHT] ; map height in 4x4 tile blocks
	add a ; double it
	ld [wd524],a ; store map height in 2x2 tile blocks
	ld a,[W_CURMAPWIDTH] ; map width in 4x4 tile blocks
	add a ; double it
	ld [wd525],a ; map width in 2x2 tile blocks
	ld a,[W_CURMAP]
	ld c,a
	ld b,$00
	ld a,[H_LOADEDROMBANK]
	push af
	ld a, BANK(MapSongBanks)
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ld hl, MapSongBanks
	add hl,bc
	add hl,bc
	ld a,[hli]
	ld [wd35b],a ; music 1
	ld a,[hl]
	ld [wd35c],a ; music 2
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

; function to copy map connection data from ROM to WRAM
; Input: hl = source, de = destination
CopyMapConnectionHeader:: ; 1238 (0:1238)
	ld c,$0b
.loop
	ld a,[hli]
	ld [de],a
	inc de
	dec c
	jr nz,.loop
	ret

; function to load map data
LoadMapData:: ; 1241 (0:1241)
	ld a,[H_LOADEDROMBANK]
	push af
	call DisableLCD
	ld a,$98
	ld [wMapViewVRAMPointer + 1],a
	xor a
	ld [wMapViewVRAMPointer],a
	ld [hSCY],a
	ld [hSCX],a
	ld [wWalkCounter],a
	ld [wd119],a
	ld [wWalkBikeSurfStateCopy],a
	ld [W_SPRITESETID],a
	call LoadTextBoxTilePatterns
	call LoadMapHeader
	callba InitMapSprites ; load tile pattern data for sprites
	call LoadTileBlockMap
	call LoadTilesetTilePatternData
	call LoadCurrentMapView
; copy current map view to VRAM
	ld hl,wTileMap
	ld de,vBGMap0
	ld b,18
.vramCopyLoop
	ld c,20
.vramCopyInnerLoop
	ld a,[hli]
	ld [de],a
	inc e
	dec c
	jr nz,.vramCopyInnerLoop
	ld a,32 - 20
	add e
	ld e,a
	jr nc,.noCarry
	inc d
.noCarry
	dec b
	jr nz,.vramCopyLoop
	ld a,$01
	ld [wUpdateSpritesEnabled],a
	call EnableLCD
	ld b,$09
	call GoPAL_SET
	call LoadPlayerSpriteGraphics
	ld a,[wd732]
	and a,1 << 4 | 1 << 3 ; fly warp or dungeon warp
	jr nz,.restoreRomBank
	ld a,[W_FLAGS_D733]
	bit 1,a
	jr nz,.restoreRomBank
	call Func_235f ; music related
	call Func_2312 ; music related
.restoreRomBank
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

; function to switch to the ROM bank that a map is stored in
; Input: a = map number
SwitchToMapRomBank:: ; 12bc (0:12bc)
	push hl
	push bc
	ld c,a
	ld b,$00
	ld a,Bank(MapHeaderBanks)
	call BankswitchHome ; switch to ROM bank 3
	ld hl,MapHeaderBanks
	add hl,bc
	ld a,[hl]
	ld [$ffe8],a ; save map ROM bank
	call BankswitchBack
	ld a,[$ffe8]
	ld [H_LOADEDROMBANK],a
	ld [$2000],a ; switch to map ROM bank
	pop bc
	pop hl
	ret

IgnoreInputForHalfSecond: ; 12da (0:12da)
	ld a, 30
	ld [wIgnoreInputCounter], a
	ld hl, wd730
	ld a, [hl]
	or $26
	ld [hl], a ; set ignore input bit
	ret

ResetUsingStrengthOutOfBattleBit: ; 12e7 (0:12e7)
	ld hl, wd728
	res 0, [hl]
	ret

ForceBikeOrSurf:: ; 12ed (0:12ed)
	ld b, BANK(RedSprite)
	ld hl, LoadPlayerSpriteGraphics
	call Bankswitch
	jp PlayDefaultMusic ; update map/player state?
