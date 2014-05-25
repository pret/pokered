INCLUDE "constants.asm"

; The rst vectors are unused.
SECTION "rst00", ROM0[$00]
	rst $38
SECTION "rst08", ROM0[$08]
	rst $38
SECTION "rst10", ROM0[$10]
	rst $38
SECTION "rst18", ROM0[$18]
	rst $38
SECTION "rst20", ROM0[$20]
	rst $38
SECTION "rst28", ROM0[$28]
	rst $38
SECTION "rst30", ROM0[$30]
	rst $38
SECTION "rst38", ROM0[$38]
	rst $38

; interrupts
SECTION "vblank", ROM0[$40]
	jp VBlank
SECTION "lcdc",   ROM0[$48]
	rst $38
SECTION "timer",  ROM0[$50]
	jp Timer
SECTION "serial", ROM0[$58]
	jp Serial
SECTION "joypad", ROM0[$60]
	reti


SECTION "bank0",ROM0[$61]

DisableLCD::
	xor a
	ld [rIF], a
	ld a, [rIE]
	ld b, a
	res 0, a
	ld [rIE], a

.wait
	ld a, [rLY]
	cp LY_VBLANK
	jr nz, .wait

	ld a, [rLCDC]
	and $ff ^ rLCDC_ENABLE_MASK
	ld [rLCDC], a
	ld a, b
	ld [rIE], a
	ret

EnableLCD::
	ld a, [rLCDC]
	set rLCDC_ENABLE, a
	ld [rLCDC], a
	ret

ClearSprites::
	xor a
	ld hl, wOAMBuffer
	ld b, 40 * 4
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

HideSprites::
	ld a, 160
	ld hl, wOAMBuffer
	ld de, 4
	ld b, 40
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	ret

FarCopyData::
; Copy bc bytes from a:hl to de.
	ld [wBuffer], a
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, [wBuffer]
	ld [H_LOADEDROMBANK], a
	ld [MBC3RomBank], a
	call CopyData
	pop af
	ld [H_LOADEDROMBANK], a
	ld [MBC3RomBank], a
	ret

CopyData::
; Copy bc bytes from hl to de.
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, CopyData
	ret


SECTION "Entry", ROM0[$100]
	nop
	jp Start


SECTION "Start", ROM0[$150]

Start::
	cp GBC
	jr z, .gbc
	xor a
	jr .ok
.gbc
	ld a, 0
.ok
	ld [wGBC], a
	jp Init


ReadJoypad::
; Poll joypad input.
; Unlike the hardware register, button
; presses are indicated by a set bit.

	ld a, 1 << 5 ; select direction keys
	ld c, 0

	ld [rJOYP], a
	rept 6
	ld a, [rJOYP]
	endr
	cpl
	and %1111
	swap a
	ld b, a

	ld a, 1 << 4 ; select button keys
	ld [rJOYP], a
	rept 10
	ld a, [rJOYP]
	endr
	cpl
	and %1111
	or b

	ld [H_JOYPADSTATE], a

	ld a, 1 << 4 + 1 << 5 ; deselect keys
	ld [rJOYP], a
	ret

GetJoypadState::
; Update the joypad state variables:
; [H_NEWLYRELEASEDBUTTONS]  keys released since last time
; [H_NEWLYPRESSEDBUTTONS]   keys pressed since last time
; [H_CURRENTPRESSEDBUTTONS] currently pressed keys
	homecall _GetJoypadState
	ret


INCLUDE "data/map_header_pointers.asm"

HandleMidJump::
; Handle the player jumping down
; a ledge in the overworld.
	ld b, BANK(_HandleMidJump)
	ld hl, _HandleMidJump
	jp Bankswitch

EnterMap::
; Load a new map.
	ld a, $ff
	ld [wJoypadForbiddenButtonsMask], a
	call LoadMapData
	callba Func_c335 ; initialize map variables
	ld hl, $d72c
	bit 0, [hl]
	jr z, .doNotCountSteps
	ld a, 3
	ld [$d13c], a ; some kind of step counter (counts up to 3 steps?)
.doNotCountSteps
	ld hl, $d72e
	bit 5, [hl] ; did a battle happen immediately before this?
	res 5, [hl] ; unset the "battle just happened" flag
	call z, Func_12e7
	call nz, MapEntryAfterBattle
	ld hl, $d732
	ld a, [hl]
	and 1 << 4 | 1 << 3
	jr z, .didNotFlyOrTeleportIn
	res 3, [hl]
	callba Func_70510 ; display fly/teleport in graphical effect
	call UpdateSprites
.didNotFlyOrTeleportIn
	callba CheckForceBikeOrSurf ; handle currents in SF islands and forced bike riding in cycling road
	ld hl, $d72d
	res 5, [hl]
	call UpdateSprites
	ld hl, $d126
	set 5, [hl]
	set 6, [hl]
	xor a
	ld [wJoypadForbiddenButtonsMask], a

OverworldLoop::
	call DelayFrame
OverworldLoopLessDelay::
	call DelayFrame
	call LoadGBPal
	ld a,[$d736]
	bit 6,a ; jumping down a ledge?
	call nz, HandleMidJump
	ld a,[wWalkCounter]
	and a
	jp nz,.moveAhead ; if the player sprite has not yet completed the walking animation
	call GetJoypadStateOverworld ; get joypad state (which is possibly simulated)
	callba SafariZoneCheck
	ld a,[$da46]
	and a
	jp nz,WarpFound2
	ld hl,$d72d
	bit 3,[hl]
	res 3,[hl]
	jp nz,WarpFound2
	ld a,[$d732]
	and a,$18
	jp nz,HandleFlyOrTeleportAway
	ld a,[W_CUROPPONENT]
	and a
	jp nz,.newBattle
	ld a,[$d730]
	bit 7,a ; are we simulating button presses?
	jr z,.notSimulating
	ld a,[H_CURRENTPRESSEDBUTTONS]
	jr .checkIfStartIsPressed
.notSimulating
	ld a,[H_NEWLYPRESSEDBUTTONS]
.checkIfStartIsPressed
	bit 3,a ; start button
	jr z,.startButtonNotPressed
; if START is pressed
	xor a
	ld [$ff8c],a ; the $2920 ID for the start menu is 0
	jp .displayDialogue
.startButtonNotPressed
	bit 0,a ; A button
	jp z,.checkIfDownButtonIsPressed
; if A is pressed
	ld a,[$d730]
	bit 2,a
	jp nz,.noDirectionButtonsPressed
	call Func_30fd
	jr nz,.checkForOpponent
	call Func_3eb5 ; check for hidden items, PC's, etc.
	ld a,[$ffeb]
	and a
	jp z,OverworldLoop
	call IsSpriteOrSignInFrontOfPlayer ; check for sign or sprite in front of the player
	ld a,[$ff8c] ; $2920 ID for NPC/sign text, if any
	and a
	jp z,OverworldLoop
.displayDialogue
	ld a,$35
	call Predef ; check what is in front of the player
	call UpdateSprites ; move sprites
	ld a,[wFlags_0xcd60]
	bit 2,a
	jr nz,.checkForOpponent
	bit 0,a
	jr nz,.checkForOpponent
	FuncCoord 8, 9 ; $c45c
	ld a,[Coord]
	ld [$cf0e],a
	call DisplayTextID ; display either the start menu or the NPC/sign text
	ld a,[$cc47]
	and a
	jr z,.checkForOpponent
	dec a
	ld a,$00
	ld [$cc47],a
	jr z,.changeMap
	ld a,$52
	call Predef
	ld a,[W_CURMAP]
	ld [$d71a],a
	call Func_62ce
	ld a,[W_CURMAP]
	call SwitchToMapRomBank ; switch to the ROM bank of the current map
	ld hl,$d367
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
	call UpdateSprites ; move sprites
	ld a,$01
	ld [$cc4b],a
	ld a,[$d528] ; the direction that was pressed last time
	and a
	jp z,OverworldLoop
; if a direction was pressed last time
	ld [$d529],a ; save the last direction
	xor a
	ld [$d528],a ; zero the direction
	jp OverworldLoop
.checkIfDownButtonIsPressed
	ld a,[H_CURRENTPRESSEDBUTTONS] ; current joypad state
	bit 7,a ; down button
	jr z,.checkIfUpButtonIsPressed
	ld a,$01
	ld [$c103],a
	ld a,$04
	jr .handleDirectionButtonPress
.checkIfUpButtonIsPressed
	bit 6,a ; up button
	jr z,.checkIfLeftButtonIsPressed
	ld a,$ff
	ld [$c103],a
	ld a,$08
	jr .handleDirectionButtonPress
.checkIfLeftButtonIsPressed
	bit 5,a ; left button
	jr z,.checkIfRightButtonIsPressed
	ld a,$ff
	ld [$c105],a
	ld a,$02
	jr .handleDirectionButtonPress
.checkIfRightButtonIsPressed
	bit 4,a ; right button
	jr z,.noDirectionButtonsPressed
	ld a,$01
	ld [$c105],a
.handleDirectionButtonPress
	ld [$d52a],a ; new direction
	ld a,[$d730]
	bit 7,a ; are we simulating button presses?
	jr nz,.noDirectionChange ; ignore direction changes if we are
	ld a,[$cc4b]
	and a
	jr z,.noDirectionChange
	ld a,[$d52a] ; new direction
	ld b,a
	ld a,[$d529] ; old direction
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
	ld [$d528],a
	jr .oddLoop
.notDownToUp
	cp a,$84 ; change dir from up to down
	jr nz,.notUpToDown
	ld a,$01
	ld [$d528],a
	jr .oddLoop
.notUpToDown
	cp a,$12 ; change dir from right to left
	jr nz,.notRightToLeft
	ld a,$04
	ld [$d528],a
	jr .oddLoop
.notRightToLeft
	cp a,$21 ; change dir from left to right
	jr nz,.oddLoop
	ld a,$08
	ld [$d528],a
.oddLoop
	ld hl,wFlags_0xcd60
	set 2,[hl]
	ld hl,$cc4b
	dec [hl]
	jr nz,.oddLoop
	ld a,[$d52a]
	ld [$d528],a
	call NewBattle
	jp c,.battleOccurred
	jp OverworldLoop
.noDirectionChange
	ld a,[$d52a] ; current direction
	ld [$d528],a ; save direction
	call UpdateSprites ; move sprites
	ld a,[$d700]
	cp a,$02 ; surfing
	jr z,.surfing
; not surfing
	call CollisionCheckOnLand
	jr nc,.noCollision
	push hl
	ld hl,$d736
	bit 2,[hl]
	pop hl
	jp z,OverworldLoop
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
	ld a,[$d736]
	bit 7,a
	jr z,.noSpinning
	callba LoadSpinnerArrowTiles ; spin while moving
.noSpinning
	call UpdateSprites ; move sprites
.moveAhead2
	ld hl,wFlags_0xcd60
	res 2,[hl]
	ld a,[$d700]
	dec a ; riding a bike?
	jr nz,.normalPlayerSpriteAdvancement
	ld a,[$d736]
	bit 6,a ; jumping a ledge?
	jr nz,.normalPlayerSpriteAdvancement
	call BikeSpeedup ; if riding a bike and not jumping a ledge
.normalPlayerSpriteAdvancement
	call AdvancePlayerSprite
	ld a,[wWalkCounter]
	and a
	jp nz,CheckMapConnections ; it seems like this check will never succeed (the other place where CheckMapConnections is run works)
; walking animation finished
	ld a,[$d730]
	bit 7,a
	jr nz,.doneStepCounting ; if button presses are being simulated, don't count steps
; step counting
	ld hl,$d13b ; step counter
	dec [hl]
	ld a,[$d72c]
	bit 0,a
	jr z,.doneStepCounting
	ld hl,$d13c
	dec [hl]
	jr nz,.doneStepCounting
	ld hl,$d72c
	res 0,[hl]
.doneStepCounting
	ld a,[$d790]
	bit 7,a ; in the safari zone?
	jr z,.notSafariZone
	callba SafariZoneCheckSteps
	ld a,[$da46]
	and a
	jp nz,WarpFound2
.notSafariZone
	ld a,[W_ISINBATTLE]
	and a
	jp nz,CheckWarpsNoCollision
	ld a,$13
	call Predef ; decrement HP of poisoned pokemon
	ld a,[$d12d]
	and a
	jp nz,HandleBlackOut ; if all pokemon fainted
.newBattle
	call NewBattle
	ld hl,$d736
	res 2,[hl]
	jp nc,CheckWarpsNoCollision ; check for warps if there was no battle
.battleOccurred
	ld hl,$d72d
	res 6,[hl]
	ld hl,W_FLAGS_D733
	res 3,[hl]
	ld hl,$d126
	set 5,[hl]
	set 6,[hl]
	xor a
	ld [H_CURRENTPRESSEDBUTTONS],a ; clear joypad state
	ld a,[W_CURMAP]
	cp a,CINNABAR_GYM
	jr nz,.notCinnabarGym
	ld hl,$d79b
	set 7,[hl]
.notCinnabarGym
	ld hl,$d72e
	set 5,[hl]
	ld a,[W_CURMAP]
	cp a,OAKS_LAB
	jp z,.noFaintCheck
	callab AnyPlayerPokemonAliveCheck ; check if all the player's pokemon fainted
	ld a,d
	and a
	jr z,.allPokemonFainted
.noFaintCheck
	ld c,$0a
	call DelayFrames
	jp EnterMap
.allPokemonFainted
	ld a,$ff
	ld [$d057],a
	call RunMapScript
	jp HandleBlackOut

; function to determine if there will be a battle and execute it (either a trainer battle or wild battle)
; sets carry if a battle occurred and unsets carry if not
NewBattle:: ; 0683 (0:0683)
	ld a,[$d72d]
	bit 4,a
	jr nz,.noBattle
	call Func_30fd
	jr nz,.noBattle
	ld a,[$d72e]
	bit 4,a
	jr nz,.noBattle
	ld b, BANK(InitBattle)
	ld hl, InitBattle
	jp Bankswitch ; determines if a battle will occur and runs the battle if so
.noBattle
	and a
	ret

; function to make bikes twice as fast as walking
BikeSpeedup:: ; 06a0 (0:06a0)
	ld a,[$cc57]
	and a
	ret nz
	ld a,[W_CURMAP]
	cp a,ROUTE_17 ; Cycling Road
	jr nz,.goFaster
	ld a,[H_CURRENTPRESSEDBUTTONS] ; current joypad state
	and a,%01110000 ; bit mask for up, left, right buttons
	ret nz
.goFaster
	jp AdvancePlayerSprite

; check if the player has stepped onto a warp after having not collided
CheckWarpsNoCollision:: ; 06b4 (0:06b4)
	ld a,[$d3ae] ; number of warps
	and a
	jp z,CheckMapConnections
	ld a,[$d3ae] ; number of warps
	ld b,$00
	ld c,a
	ld a,[W_YCOORD]
	ld d,a
	ld a,[W_XCOORD]
	ld e,a
	ld hl,$d3af ; start of warp entries
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
	ld hl,$d736
	set 2,[hl]
	callba Func_c49d ; check if the player sprite is standing on a "door" tile
	pop bc
	pop hl
	jr c,WarpFound1 ; if it is, go to 0735
	push hl
	push bc
	call ExtraWarpCheck ; sets carry if the warp is confirmed
	pop bc
	pop hl
	jr nc,CheckWarpsNoCollisionRetry2
; if the extra check passed
	ld a,[W_FLAGS_D733]
	bit 2,a
	jr nz,WarpFound1
	push de
	push bc
	call GetJoypadState
	pop bc
	pop de
	ld a,[H_CURRENTPRESSEDBUTTONS] ; current joypad state
	and a,%11110000 ; bit mask for directional buttons
	jr z,CheckWarpsNoCollisionRetry2 ; if directional buttons aren't being pressed, do not pass through the warp
	jr WarpFound1

; check if the player has stepped onto a warp after having collided
CheckWarpsCollision:: ; 0706 (0:0706)
	ld a,[$d3ae] ; number of warps
	ld c,a
	ld hl,$d3af ; start of warp entries
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
	ld [$d42f],a ; save target warp ID
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
	ld [$d42f],a ; save target warp ID
	ld a,[hli]
	ld [$ff8b],a ; save target map

WarpFound2:: ; 073c (0:073c)
	ld a,[$d3ae] ; number of warps
	sub c
	ld [$d73b],a ; save ID of used warp
	ld a,[W_CURMAP]
	ld [$d73c],a
	call CheckIfInOutsideMap
	jr nz,.indoorMaps
; this is for handling "outside" maps that can't have the 0xFF destination map
	ld a,[W_CURMAP]
	ld [wLastMap],a
	ld a,[W_CURMAPWIDTH]
	ld [$d366],a
	ld a,[$ff8b] ; destination map number
	ld [W_CURMAP],a ; change current map to destination map
	cp a,ROCK_TUNNEL_1
	jr nz,.notRockTunnel
	ld a,$06
	ld [$d35d],a
	call GBFadeIn1
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
	callba Func_70787 ; check if the warp was a Silph Co. teleporter
	ld a,[$cd5b]
	dec a
	jr nz,.notTeleporter
; if it's a Silph Co. teleporter
	ld hl,$d732
	set 3,[hl]
	call DoFlyOrTeleportAwayGraphics
	jr .skipMapChangeSound
.notTeleporter
	call PlayMapChangeSound
.skipMapChangeSound
	ld hl,$d736
	res 0,[hl]
	res 1,[hl]
	jr .done
.goBackOutside
	ld a,[wLastMap]
	ld [W_CURMAP],a
	call PlayMapChangeSound
	xor a
	ld [$d35d],a
.done
	ld hl,$d736
	set 0,[hl]
	call Func_12da
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
	ld a,[$d387]
	ld [W_CURMAP],a
	ld a,[$d38f] ; new X coordinate upon entering west map
	ld [W_XCOORD],a
	ld a,[W_YCOORD]
	ld c,a
	ld a,[$d38e] ; Y adjustment upon entering west map
	add c
	ld c,a
	ld [W_YCOORD],a
	ld a,[$d390] ; pointer to upper left corner of map without adjustment for Y position
	ld l,a
	ld a,[$d391]
	ld h,a
	srl c
	jr z,.savePointer1
.pointerAdjustmentLoop1
	ld a,[$d38d] ; width of connected map
	add a,$06
	ld e,a
	ld d,$00
	ld b,$00
	add hl,de
	dec c
	jr nz,.pointerAdjustmentLoop1
.savePointer1
	ld a,l
	ld [$d35f],a ; pointer to upper left corner of current tile block map section
	ld a,h
	ld [$d360],a
	jp .loadNewMap
.checkEastMap
	ld b,a
	ld a,[$d525] ; map width
	cp b
	jr nz,.checkNorthMap
	ld a,[$d392]
	ld [W_CURMAP],a
	ld a,[$d39a] ; new X coordinate upon entering east map
	ld [W_XCOORD],a
	ld a,[W_YCOORD]
	ld c,a
	ld a,[$d399] ; Y adjustment upon entering east map
	add c
	ld c,a
	ld [W_YCOORD],a
	ld a,[$d39b] ; pointer to upper left corner of map without adjustment for Y position
	ld l,a
	ld a,[$d39c]
	ld h,a
	srl c
	jr z,.savePointer2
.pointerAdjustmentLoop2
	ld a,[$d398]
	add a,$06
	ld e,a
	ld d,$00
	ld b,$00
	add hl,de
	dec c
	jr nz,.pointerAdjustmentLoop2
.savePointer2
	ld a,l
	ld [$d35f],a ; pointer to upper left corner of current tile block map section
	ld a,h
	ld [$d360],a
	jp .loadNewMap
.checkNorthMap
	ld a,[W_YCOORD]
	cp a,$ff
	jr nz,.checkSouthMap
	ld a,[$d371]
	ld [W_CURMAP],a
	ld a,[$d378] ; new Y coordinate upon entering north map
	ld [W_YCOORD],a
	ld a,[W_XCOORD]
	ld c,a
	ld a,[$d379] ; X adjustment upon entering north map
	add c
	ld c,a
	ld [W_XCOORD],a
	ld a,[$d37a] ; pointer to upper left corner of map without adjustment for X position
	ld l,a
	ld a,[$d37b]
	ld h,a
	ld b,$00
	srl c
	add hl,bc
	ld a,l
	ld [$d35f],a ; pointer to upper left corner of current tile block map section
	ld a,h
	ld [$d360],a
	jp .loadNewMap
.checkSouthMap
	ld b,a
	ld a,[$d524]
	cp b
	jr nz,.didNotEnterConnectedMap
	ld a,[$d37c]
	ld [W_CURMAP],a
	ld a,[$d383] ; new Y coordinate upon entering south map
	ld [W_YCOORD],a
	ld a,[W_XCOORD]
	ld c,a
	ld a,[$d384] ; X adjustment upon entering south map
	add c
	ld c,a
	ld [W_XCOORD],a
	ld a,[$d385] ; pointer to upper left corner of map without adjustment for X position
	ld l,a
	ld a,[$d386]
	ld h,a
	ld b,$00
	srl c
	add hl,bc
	ld a,l
	ld [$d35f],a ; pointer to upper left corner of current tile block map section
	ld a,h
	ld [$d360],a
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
	FuncCoord 8, 8 ; $c448
	ld a,[Coord] ; upper left tile of the 4x4 square the player's sprite is standing on
	cp a,$0b ; door tile in tileset 0
	jr nz,.didNotGoThroughDoor
	ld a,(SFX_02_57 - SFX_Headers_02) / 3
	jr .playSound
.didNotGoThroughDoor
	ld a,(SFX_02_5c - SFX_Headers_02) / 3
.playSound
	call PlaySound
	ld a,[$d35d]
	and a
	ret nz
	jp GBFadeIn1

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
	ld hl, Func_c3ff
	jr .doBankswitch
.useFunction2
	ld hl, Func_c44e
.doBankswitch
	ld b, BANK(Func_c44e)
	jp Bankswitch

MapEntryAfterBattle:: ; 091f (0:091f)
	callba Func_c35f ; function that appears to disable warp testing after collisions if the player is standing on a warp
	ld a,[$d35d]
	and a
	jp z,GBFadeIn2
	jp LoadGBPal

HandleBlackOut::
; For when all the player's pokemon faint.
; Does not print the "blacked out" message.

	call GBFadeIn1
	ld a, $08
	call StopMusic
	ld hl, $d72e
	res 5, [hl]
	ld a, Bank(Func_40b0) ; Bank(Func_40b0) and Bank(Func_62ce) need to be equal.
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	call Func_40b0
	call Func_62ce
	call Func_2312
	jp Func_5d5f

StopMusic::
	ld [wMusicHeaderPointer], a
	ld a, $ff
	ld [$c0ee], a
	call PlaySound
.wait
	ld a, [wMusicHeaderPointer]
	and a
	jr nz, .wait
	jp StopAllSounds

HandleFlyOrTeleportAway::
	call UpdateSprites
	call Delay3
	xor a
	ld [$cf0b], a
	ld [$d700], a
	ld [$d057], a
	ld [$d35d], a
	ld hl, $d732
	set 2, [hl]
	res 5, [hl]
	call DoFlyOrTeleportAwayGraphics
	ld a, Bank(Func_62ce)
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	call Func_62ce
	jp Func_5d5f

DoFlyOrTeleportAwayGraphics::
	ld b, BANK(_DoFlyOrTeleportAwayGraphics)
	ld hl, _DoFlyOrTeleportAwayGraphics
	jp Bankswitch

LoadPlayerSpriteGraphics::
; Load sprite graphics based on whether the player is standing, biking, or surfing.

	; 0: standing
	; 1: biking
	; 2: surfing

	ld a, [$d700]
	dec a
	jr z, .ridingBike

	ld a, [$ffd7]
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
	ld [$d700], a
	ld [$d11a], a
	jp LoadWalkingPlayerSpriteGraphics

.determineGraphics
	ld a, [$d700]
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
	ld a,[$d52e]
	ld l,a
	ld a,[$d52f]
	ld h,a
	ld de,$9000
	ld bc,$0600
	ld a,[$d52b]
	jp FarCopyData2

; this loads the current maps complete tile map (which references blocks, not individual tiles) to C6E8
; it can also load partial tile maps of connected maps into a border of length 3 around the current map
LoadTileBlockMap:: ; 09fc (0:09fc)
; fill C6E8-CBFB with the background tile
	ld hl,$c6e8
	ld a,[$d3ad] ; background tile number
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
	ld hl,$c6e8
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
	ld a,[$d36a] ; tile map pointer
	ld e,a
	ld a,[$d36b]
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
	ld a,[$d371]
	cp a,$ff
	jr z,.southConnection
	call SwitchToMapRomBank
	ld a,[$d372]
	ld l,a
	ld a,[$d373]
	ld h,a
	ld a,[$d374]
	ld e,a
	ld a,[$d375]
	ld d,a
	ld a,[$d376]
	ld [$ff8b],a
	ld a,[$d377]
	ld [$ff8c],a
	call LoadNorthSouthConnectionsTileMap
.southConnection
	ld a,[$d37c]
	cp a,$ff
	jr z,.westConnection
	call SwitchToMapRomBank
	ld a,[$d37d]
	ld l,a
	ld a,[$d37e]
	ld h,a
	ld a,[$d37f]
	ld e,a
	ld a,[$d380]
	ld d,a
	ld a,[$d381]
	ld [$ff8b],a
	ld a,[$d382]
	ld [$ff8c],a
	call LoadNorthSouthConnectionsTileMap
.westConnection
	ld a,[$d387]
	cp a,$ff
	jr z,.eastConnection
	call SwitchToMapRomBank
	ld a,[$d388]
	ld l,a
	ld a,[$d389]
	ld h,a
	ld a,[$d38a]
	ld e,a
	ld a,[$d38b]
	ld d,a
	ld a,[$d38c]
	ld b,a
	ld a,[$d38d]
	ld [$ff8b],a
	call LoadEastWestConnectionsTileMap
.eastConnection
	ld a,[$d392]
	cp a,$ff
	jr z,.done
	call SwitchToMapRomBank
	ld a,[$d393]
	ld l,a
	ld a,[$d394]
	ld h,a
	ld a,[$d395]
	ld e,a
	ld a,[$d396]
	ld d,a
	ld a,[$d397]
	ld b,a
	ld a,[$d398]
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
; if so, it is stored in [$FF8C]
; if not, [$FF8C] is set to 0
IsSpriteOrSignInFrontOfPlayer:: ; 0b23 (0:0b23)
	xor a
	ld [$ff8c],a
	ld a,[$d4b0] ; number of signs in the map
	and a
	jr z,.extendRangeOverCounter
; if there are signs
	ld a,$35
	call Predef ; get the coordinates in front of the player in de
	ld hl,$d4b1 ; start of sign coordinates
	ld a,[$d4b0] ; number of signs in the map
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
	ld hl,$d4d1 ; start of sign text ID's
	ld b,$00
	dec c
	add hl,bc
	ld a,[hl]
	ld [$ff8c],a ; store sign text ID
	pop bc
	pop hl
	ret
.retry
	dec b
	jr nz,.signLoop
; check if the player is front of a counter in a pokemon center, pokemart, etc. and if so, extend the range at which he can talk to the NPC
.extendRangeOverCounter
	ld a,$35
	call Predef ; get the tile in front of the player in c
	ld hl,$d532 ; list of tiles that extend talking range (counter tiles)
	ld b,$03
	ld d,$20 ; talking range in pixels (long range)
.counterTilesLoop
	ld a,[hli]
	cp c
	jr z,IsSpriteInFrontOfPlayer2 ; jumps if the tile in front of the player is a counter tile
	dec b
	jr nz,.counterTilesLoop

; part of the above function, but sometimes its called on its own, when signs are irrelevant
; the caller must zero [$FF8C]
IsSpriteInFrontOfPlayer:: ; 0b6b (0:0b6b)
	ld d,$10 ; talking range in pixels (normal range)
IsSpriteInFrontOfPlayer2:: ; 0b6d (0:0b6d)
	ld bc,$3c40 ; Y and X position of player sprite
	ld a,[$c109] ; direction the player is facing
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
	ld [$d52a],a
	ld a,[$d4e1] ; number of sprites
	and a
	ret z
; if there are sprites
	ld hl,$c110
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
	ld [$ff8c],a ; store sprite ID
	ret

; function to check if the player will jump down a ledge and check if the tile ahead is passable (when not surfing)
; sets the carry flag if there is a collision, and unsets it if there isn't a collision
CollisionCheckOnLand:: ; 0bd1 (0:0bd1)
	ld a,[$d736]
	bit 6,a ; is the player jumping?
	jr nz,.noCollision
; if not jumping a ledge
	ld a,[$cd38]
	and a
	jr nz,.noCollision
	ld a,[$d52a] ; the direction that the player is trying to go in
	ld d,a
	ld a,[$c10c] ; the player sprite's collision data (bit field) (set in the sprite movement code)
	and d ; check if a sprite is in the direction the player is trying to go
	jr nz,.collision
	xor a
	ld [$ff8c],a
	call IsSpriteInFrontOfPlayer ; check for sprite collisions again? when does the above check fail to detect a sprite collision?
	ld a,[$ff8c]
	and a ; was there a sprite collision?
	jr nz,.collision
; if no sprite collision
	ld hl,TilePairCollisionsLand
	call CheckForJumpingAndTilePairCollisions
	jr c,.collision
	call CheckTilePassable
	jr nc,.noCollision
.collision
	ld a,[$c02a]
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
	ld a,$35
	call Predef ; get tile in front of player
	ld a,[$cfc6] ; tile in front of player
	ld c,a
	ld hl,$d530 ; pointer to list of passable tiles
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
	ld a,$35
	call Predef ; get the tile in front of the player
	push de
	push bc
	callba HandleLedges ; check if the player is trying to jump a ledge
	pop bc
	pop de
	pop hl
	and a
	ld a,[$d736]
	bit 6,a ; is the player jumping?
	ret nz
; if not jumping

Func_c44:: ; 0c44 (0:0c44)
	FuncCoord 8, 9 ; $c45c
	ld a,[Coord] ; tile the player is on
	ld [$cf0e],a

CheckForTilePairCollisions:: ; 0c4a (0:0c4a)
	ld a,[$cfc6] ; tile in front of the player
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
	ld a,[$cf0e] ; tile the player is on
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
	ld a,[$d52b] ; tile data ROM bank
	ld [H_LOADEDROMBANK],a
	ld [$2000],a ; switch to ROM bank that contains tile data
	ld a,[$d35f] ; address of upper left corner of current map view
	ld e,a
	ld a,[$d360]
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
	ld a,[$c103] ; delta Y
	ld b,a
	ld a,[$c105] ; delta X
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
	ld a,[$d526]
	ld e,a
	and a,$e0
	ld d,a
	ld a,e
	add a,$02
	and a,$1f
	or d
	ld [$d526],a
	jr .adjustXCoordWithinBlock
.checkIfMovingWest
	cp a,$ff
	jr nz,.checkIfMovingSouth
; moving west
	ld a,[$d526]
	ld e,a
	and a,$e0
	ld d,a
	ld a,e
	sub a,$02
	and a,$1f
	or d
	ld [$d526],a
	jr .adjustXCoordWithinBlock
.checkIfMovingSouth
	ld a,b
	cp a,$01
	jr nz,.checkIfMovingNorth
; moving south
	ld a,[$d526]
	add a,$40
	ld [$d526],a
	jr nc,.adjustXCoordWithinBlock
	ld a,[$d527]
	inc a
	and a,$03
	or a,$98
	ld [$d527],a
	jr .adjustXCoordWithinBlock
.checkIfMovingNorth
	cp a,$ff
	jr nz,.adjustXCoordWithinBlock
; moving north
	ld a,[$d526]
	sub a,$40
	ld [$d526],a
	jr nc,.adjustXCoordWithinBlock
	ld a,[$d527]
	dec a
	and a,$03
	or a,$98
	ld [$d527],a
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
	ld hl,$d4e3
	inc [hl]
	ld de,$d35f
	call MoveTileBlockMapPointerEast
	jr .updateMapView
.checkForMoveToWestBlock
	cp a,$ff
	jr nz,.adjustYCoordWithinBlock
; moved into the tile block to the west
	ld a,$01
	ld [hl],a
	ld hl,$d4e3
	dec [hl]
	ld de,$d35f
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
	ld hl,$d4e2
	inc [hl]
	ld de,$d35f
	ld a,[W_CURMAPWIDTH]
	call MoveTileBlockMapPointerSouth
	jr .updateMapView
.checkForMoveToNorthBlock
	cp a,$ff
	jr nz,.updateMapView
; moved into the tile block to the north
	ld a,$01
	ld [hl],a
	ld hl,$d4e2
	dec [hl]
	ld de,$d35f
	ld a,[W_CURMAPWIDTH]
	call MoveTileBlockMapPointerNorth
.updateMapView
	call LoadCurrentMapView
	ld a,[$c103] ; delta Y
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
	ld a,[$c105] ; delta X
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
	ld a,[$c103] ; delta Y
	ld b,a
	ld a,[$c105] ; delta X
	ld c,a
	sla b
	sla c
	ld a,[$ffaf]
	add b
	ld [$ffaf],a ; update background scroll Y
	ld a,[$ffae]
	add c
	ld [$ffae],a ; update background scroll X
; shift all the sprites in the direction opposite of the player's motion
; so that the player appears to move relative to them
	ld hl,$c114
	ld a,[$d4e1] ; number of sprites
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
	FuncCoord 0, 0
	ld hl,Coord
	call ScheduleRowRedrawHelper
	ld a,[$d526]
	ld [H_SCREENEDGEREDRAWADDR],a
	ld a,[$d527]
	ld [H_SCREENEDGEREDRAWADDR + 1],a
	ld a,REDRAWROW
	ld [H_SCREENEDGEREDRAW],a
	ret

ScheduleRowRedrawHelper:: ; 0ea6 (0:0ea6)
	ld de,wScreenEdgeTiles
	ld c,$28
.loop
	ld a,[hli]
	ld [de],a
	inc de
	dec c
	jr nz,.loop
	ret

ScheduleSouthRowRedraw:: ; 0eb2 (0:0eb2)
	FuncCoord 0,16
	ld hl,Coord
	call ScheduleRowRedrawHelper
	ld a,[$d526]
	ld l,a
	ld a,[$d527]
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
	FuncCoord 18,0
	ld hl,Coord
	call ScheduleColumnRedrawHelper
	ld a,[$d526]
	ld c,a
	and a,$e0
	ld b,a
	ld a,c
	add a,18
	and a,$1f
	or b
	ld [H_SCREENEDGEREDRAWADDR],a
	ld a,[$d527]
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
	FuncCoord 0,0
	ld hl,Coord
	call ScheduleColumnRedrawHelper
	ld a,[$d526]
	ld [H_SCREENEDGEREDRAWADDR],a
	ld a,[$d527]
	ld [H_SCREENEDGEREDRAWADDR + 1],a
	ld a,REDRAWCOL
	ld [H_SCREENEDGEREDRAW],a
	ret

; function to write the tiles that make up a tile block to memory
; Input: c = tile block ID, hl = destination address
DrawTileBlock:: ; 0f1d (0:0f1d)
	push hl
	ld a,[$d52c] ; pointer to tiles
	ld l,a
	ld a,[$d52d]
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
GetJoypadStateOverworld:: ; 0f4d (0:0f4d)
	xor a
	ld [$c103],a
	ld [$c105],a
	call RunMapScript
	call GetJoypadState
	ld a,[W_FLAGS_D733]
	bit 3,a ; check if a trainer wants a challenge
	jr nz,.notForcedDownwards
	ld a,[W_CURMAP]
	cp a,ROUTE_17 ; Cycling Road
	jr nz,.notForcedDownwards
	ld a,[H_CURRENTPRESSEDBUTTONS] ; current joypad state
	and a,%11110011 ; bit mask for all directions and A/B
	jr nz,.notForcedDownwards
	ld a,%10000000 ; down pressed
	ld [H_CURRENTPRESSEDBUTTONS],a ; on the cycling road, if there isn't a trainer and the player isn't pressing buttons, simulate a down press
.notForcedDownwards
	ld a,[$d730]
	bit 7,a
	ret z
; if simulating button presses
	ld a,[H_CURRENTPRESSEDBUTTONS] ; current joypad state
	ld b,a
	ld a,[$cd3b] ; bit mask for button presses that override simulated ones
	and b
	ret nz ; return if the simulated button presses are overridden
	ld hl,$cd38 ; index of current simulated button press
	dec [hl]
	ld a,[hl]
	cp a,$ff
	jr z,.doneSimulating ; if the end of the simulated button presses has been reached
	ld hl,$ccd3 ; base address of simulated button presses
; add offset to base address
	add l
	ld l,a
	jr nc,.noCarry
	inc h
.noCarry
	ld a,[hl]
	ld [H_CURRENTPRESSEDBUTTONS],a ; store simulated button press in joypad state
	and a
	ret nz
	ld [H_NEWLYPRESSEDBUTTONS],a
	ld [H_NEWLYRELEASEDBUTTONS],a
	ret
; if done simulating button presses
.doneSimulating
	xor a
	ld [$cd3a],a
	ld [$cd38],a
	ld [$ccd3],a
	ld [wJoypadForbiddenButtonsMask],a
	ld [H_CURRENTPRESSEDBUTTONS],a
	ld hl,$d736
	ld a,[hl]
	and a,$f8
	ld [hl],a
	ld hl,$d730
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
	ld a,[$d730]
	bit 7,a
	jp nz,.noCollision ; return and clear carry if button presses are being simulated
	ld a,[$d52a] ; the direction that the player is trying to go in
	ld d,a
	ld a,[$c10c] ; the player sprite's collision data (bit field) (set in the sprite movement code)
	and d ; check if a sprite is in the direction the player is trying to go
	jr nz,.checkIfNextTileIsPassable ; bug?
	ld hl,TilePairCollisionsWater
	call CheckForJumpingAndTilePairCollisions
	jr c,.collision
	ld a,$35
	call Predef ; get tile in front of player (puts it in c and [$CFC6])
	ld a,[$cfc6] ; tile in front of player
	cp a,$14 ; water tile
	jr z,.noCollision ; keep surfing if it's a water tile
	cp a,$32 ; either the left tile of the S.S. Anne boarding platform or the tile on eastern coastlines (depending on the current tileset)
	jr z,.checkIfVermilionDockTileset
	cp a,$48 ; tile on right on coast lines in Safari Zone
	jr z,.noCollision ; keep surfing
; check if the [land] tile in front of the player is passable
.checkIfNextTileIsPassable
	ld hl,$d530 ; pointer to list of passable tiles
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
	ld a,[$c02a]
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
	ld [$d700],a
	call LoadPlayerSpriteGraphics
	call Func_2307
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
	callba Func_f225 ; check if the player is pushing a boulder
	ld a,[wFlags_0xcd60]
	bit 1,a ; is the player pushing a boulder?
	jr z,.afterBoulderEffect
	callba Func_f2b5 ; displays dust effect when pushing a boulder
.afterBoulderEffect
	pop bc
	pop de
	pop hl
	call Func_310e
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
	ld hl,$8000
	jr LoadPlayerSpriteGraphicsCommon

LoadSurfingPlayerSpriteGraphics:: ; 1055 (0:1055)
	ld de,SeelSprite
	ld hl,$8000
	jr LoadPlayerSpriteGraphicsCommon

LoadBikePlayerSpriteGraphics:: ; 105d (0:105d)
	ld de,RedCyclingSprite
	ld hl,$8000

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
	callba Func_f113
	ld a,[W_CURMAPTILESET]
	ld [$d119],a
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
	ld de,$d367
	ld c,$0a
.copyFixedHeaderLoop
	ld a,[hli]
	ld [de],a
	inc de
	dec c
	jr nz,.copyFixedHeaderLoop
; initialize all the connected maps to disabled at first, before loading the actual values
	ld a,$ff
	ld [$d371],a
	ld [$d37c],a
	ld [$d387],a
	ld [$d392],a
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
	ld [$d3a9],a
	ld a,[hli]
	ld [$d3aa],a
	push hl
	ld a,[$d3a9]
	ld l,a
	ld a,[$d3aa]
	ld h,a ; hl = base of object data
	ld de,$d3ad ; background tile ID
	ld a,[hli]
	ld [de],a ; save background tile ID
.loadWarpData
	ld a,[hli] ; number of warps
	ld [$d3ae],a ; save the number of warps
	and a ; are there any warps?
	jr z,.loadSignData ; if not, skip this
	ld c,a
	ld de,$d3af ; base address of warps
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
	ld [$d4b0],a ; save the number of signs
	and a ; are there any signs?
	jr z,.loadSpriteData ; if not, skip this
	ld c,a
	ld de,$d4d1 ; base address of sign text IDs
	ld a,d
	ld [$ff95],a
	ld a,e
	ld [$ff96],a
	ld de,$d4b1 ; base address of sign coordinates
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
	ld a,[$d72e]
	bit 5,a ; did a battle happen immediately before this?
	jp nz,.finishUp ; if so, skip this because battles don't destroy this data
	ld a,[hli]
	ld [$d4e1],a ; save the number of sprites
	push hl
; zero C110-C1FF and C210-C2FF
	ld hl,$c110
	ld de,$c210
	xor a
	ld b,$f0
.zeroSpriteDataLoop
	ld [hli],a
	ld [de],a
	inc e
	dec b
	jr nz,.zeroSpriteDataLoop
; initialize all C100-C1FF sprite entries to disabled (other than player's)
	ld hl,$c112
	ld de,$0010
	ld c,$0f
.disableSpriteEntriesLoop
	ld [hl],$ff
	add hl,de
	dec c
	jr nz,.disableSpriteEntriesLoop
	pop hl
	ld de,$c110
	ld a,[$d4e1] ; number of sprites
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
	ld a,$19
	call Predef ; load tileset data
	callab LoadWildData ; load wild pokemon data
	pop hl ; restore hl from before going to the warp/sign/sprite data (this value was saved for seemingly no purpose)
	ld a,[W_CURMAPHEIGHT] ; map height in 4x4 tile blocks
	add a ; double it
	ld [$d524],a ; store map height in 2x2 tile blocks
	ld a,[W_CURMAPWIDTH] ; map width in 4x4 tile blocks
	add a ; double it
	ld [$d525],a ; map width in 2x2 tile blocks
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
	ld [$d35b],a ; music 1
	ld a,[hl]
	ld [$d35c],a ; music 2
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
	ld [$d527],a
	xor a
	ld [$d526],a
	ld [$ffaf],a
	ld [$ffae],a
	ld [wWalkCounter],a
	ld [$d119],a
	ld [$d11a],a
	ld [$d3a8],a
	call LoadTextBoxTilePatterns
	call LoadMapHeader
	callba InitMapSprites ; load tile pattern data for sprites
	call LoadTileBlockMap
	call LoadTilesetTilePatternData
	call LoadCurrentMapView
; copy current map view to VRAM
	ld hl,wTileMap
	ld de,$9800
	ld b,$12
.vramCopyLoop
	ld c,$14
.vramCopyInnerLoop
	ld a,[hli]
	ld [de],a
	inc e
	dec c
	jr nz,.vramCopyInnerLoop
	ld a,$0c
	add e
	ld e,a
	jr nc,.noCarry
	inc d
.noCarry
	dec b
	jr nz,.vramCopyLoop
	ld a,$01
	ld [$cfcb],a
	call EnableLCD
	ld b,$09
	call GoPAL_SET
	call LoadPlayerSpriteGraphics
	ld a,[$d732]
	and a,$18 ; did the player fly or teleport in?
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

Func_12da:: ; 12da (0:12da)
	ld a, $1e
	ld [$d13a], a
	ld hl, $d730
	ld a, [hl]
	or $26
	ld [hl], a
	ret

Func_12e7:: ; 12e7 (0:12e7)
	ld hl, $d728
	res 0, [hl]
	ret

ForceBikeOrSurf:: ; 12ed (0:12ed)
	ld b, BANK(RedSprite)
	ld hl, LoadPlayerSpriteGraphics
	call Bankswitch
	jp Func_2307 ; update map/player state?

; this is used to check if the player wants to interrupt the opening sequence at several points
; XXX is this used anywhere else?
; INPUT:
; c = number of frames to wait
; sets carry if Up+Select+B, Start, or A is pressed within c frames
; unsets carry otherwise
CheckForUserInterruption:: ; 12f8 (0:12f8)
	call DelayFrame
	push bc
	call GetJoypadStateLowSensitivity
	pop bc
	ld a,[H_CURRENTPRESSEDBUTTONS] ; currently pressed buttons
	cp a,%01000110 ; Up, Select button, B button
	jr z,.setCarry ; if all three keys are pressed
	ld a,[$ffb5] ; either newly pressed buttons or currently pressed buttons at low sampling rate
	and a,%00001001 ; Start button, A button
	jr nz,.setCarry ; if either key is pressed
	dec c
	jr nz,CheckForUserInterruption
.unsetCarry
	and a
	ret
.setCarry
	scf
	ret

; function to load position data for destination warp when switching maps
; INPUT:
; a = ID of destination warp within destination map
LoadDestinationWarpPosition:: ; 1313 (0:1313)
	ld b,a
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,[wPredefParentBank]
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ld a,b
	add a
	add a
	ld c,a
	ld b,0
	add hl,bc
	ld bc,4
	ld de,$d35f
	call CopyData
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

; INPUT:
; c: if nonzero, show at least a sliver of health
; d = number of HP bar sections (normally 6)
; e = health (in eighths of bar sections) (normally out of 48)
DrawHPBar:: ; 1336 (0:1336)
	push hl
	push de
	push bc
	ld a,$71 ; left of HP bar tile 1
	ld [hli],a
	ld a,$62 ; left of HP bar tile 2
	ld [hli],a
	push hl
	ld a,$63 ; empty bar section tile
.drawEmptyBarLoop
	ld [hli],a
	dec d
	jr nz,.drawEmptyBarLoop
	ld a,[$cf94]
	dec a ; what should the right of HP bar tile be?
	ld a,$6d ; right of HP bar tile, in status screen and battles
	jr z,.writeTile
	dec a ; right of HP bar tile, in pokemon menu
.writeTile
	ld [hl],a
	pop hl
	ld a,e
	and a ; is there enough health to show up on the HP bar?
	jr nz,.loop ; if so, draw the HP bar
	ld a,c
	and a ; should a sliver of health be shown no matter what?
	jr z,.done
	ld e,1 ; if so, fill one eighth of a bar section
; loop to draw every full bar section
.loop
	ld a,e
	sub a,8
	jr c,.drawPartialBarSection
	ld e,a
	ld a,$6b ; filled bar section tile
	ld [hli],a
	ld a,e
	and a
	jr z,.done
	jr .loop
; draws a partial bar section at the end (if necessary)
; there are 7 possible partial bar sections from 1/8 to 7/8 full
.drawPartialBarSection
	ld a,$63 ; empty bar section tile
	add e ; add e to get the appropriate partial bar section tile
	ld [hl],a ; write the tile
.done
	pop bc
	pop de
	pop hl
	ret

; loads pokemon data from one of multiple sources to $cf98
; loads base stats to $d0b8
; INPUT:
; [$cf92] = index of pokemon within party/box
; [$cc49] = source
; 00: player's party
; 01: enemy's party
; 02: current box
; 03: daycare
; OUTPUT:
; [$cf91] = pokemon ID
; $cf98 = base address of pokemon data
; $d0b8 = base address of base stats
LoadMonData:: ; 1372 (0:1372)
	ld hl,LoadMonData_
	ld b,BANK(LoadMonData_)
	jp Bankswitch

; writes c to $d0dc+b
Func_137a:: ; 137a (0:137a)
	ld hl, $d0dc
	ld e, b
	ld d, $0
	add hl, de
	ld a, c
	ld [hl], a
	ret

LoadFlippedFrontSpriteByMonIndex:: ; 1384 (0:1384)
	ld a, $1
	ld [W_SPRITEFLIPPED], a

LoadFrontSpriteByMonIndex:: ; 1389 (0:1389)
	push hl
	ld a, [$d11e]
	push af
	ld a, [$cf91]
	ld [$d11e], a
	ld a, $3a
	call Predef ; indirect jump to IndexToPokedex (41010 (10:5010))
	ld hl, $d11e
	ld a, [hl]
	pop bc
	ld [hl], b
	and a
	pop hl
	jr z, .invalidDexNumber  ; dex #0 invalid
	cp 151 + 1
	jr c, .validDexNumber    ; dex >#151 invalid
.invalidDexNumber
	ld a, RHYDON ; $1
	ld [$cf91], a
	ret
.validDexNumber
	push hl
	ld de, $9000
	call LoadMonFrontSprite
	pop hl
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, Bank(asm_3f0d0)
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	xor a
	ld [$ffe1], a
	call asm_3f0d0
	xor a
	ld [W_SPRITEFLIPPED], a
	pop af
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	ret

; plays the cry of a pokemon
; INPUT:
; a = pokemon ID
PlayCry:: ; 13d0 (0:13d0)
	call GetCryData
	call PlaySound ; play cry
	jp WaitForSoundToFinish ; wait for sound to be done playing

; gets a pokemon's cry data
; INPUT:
; a = pokemon ID
GetCryData:: ; 13d9 (0:13d9)
	dec a
	ld c,a
	ld b,0
	ld hl,CryData
	add hl,bc
	add hl,bc
	add hl,bc
	ld a,Bank(CryData)
	call BankswitchHome
	ld a,[hli]
	ld b,a
	ld a,[hli]
	ld [$c0f1],a
	ld a,[hl]
	ld [$c0f2],a
	call BankswitchBack
	ld a,b ; a = cryID
	ld c,$14 ; base sound ID for pokemon cries
	rlca
	add b ; a = cryID * 3
	add c ; a = $14 + cryID * 3
	ret

DisplayPartyMenu:: ; 13fc (0:13fc)
	ld a,[$ffd7]
	push af
	xor a
	ld [$ffd7],a
	call GBPalWhiteOutWithDelay3
	call ClearSprites
	call PartyMenuInit
	call DrawPartyMenu
	jp HandlePartyMenuInput

GoBackToPartyMenu:: ; 1411 (0:1411)
	ld a,[$ffd7]
	push af
	xor a
	ld [$ffd7],a
	call PartyMenuInit
	call RedrawPartyMenu
	jp HandlePartyMenuInput

PartyMenuInit:: ; 1420 (0:1420)
	ld a,$01
	call BankswitchHome
	call LoadHpBarAndStatusTilePatterns
	ld hl,$d730
	set 6,[hl] ; turn off letter printing delay
	xor a
	ld [$cc49],a
	ld [$cc37],a
	ld hl,wTopMenuItemY
	inc a
	ld [hli],a ; top menu item Y
	xor a
	ld [hli],a ; top menu item X
	ld a,[$cc2b]
	push af
	ld [hli],a ; current menu item ID
	inc hl
	ld a,[W_NUMINPARTY]
	and a ; are there more than 0 pokemon in the party?
	jr z,.storeMaxMenuItemID
	dec a
; if party is not empty, the max menu item ID is ([W_NUMINPARTY] - 1)
; otherwise, it is 0
.storeMaxMenuItemID
	ld [hli],a ; max menu item ID
	ld a,[$d11f]
	and a
	ld a,%00000011 ; A button and B button
	jr z,.next
	xor a
	ld [$d11f],a
	inc a
.next
	ld [hli],a ; menu watched keys
	pop af
	ld [hl],a ; old menu item ID
	ret

HandlePartyMenuInput:: ; 145a (0:145a)
	ld a,1
	ld [$cc4a],a
	ld a,$40
	ld [$d09b],a
	call HandleMenuInputPokemonSelection
	call PlaceUnfilledArrowMenuCursor
	ld b,a
	xor a
	ld [$d09b],a
	ld a,[wCurrentMenuItem]
	ld [$cc2b],a
	ld hl,$d730
	res 6,[hl] ; turn on letter printing delay
	ld a,[$cc35]
	and a
	jp nz,.swappingPokemon
	pop af
	ld [$ffd7],a
	bit 1,b
	jr nz,.noPokemonChosen
	ld a,[W_NUMINPARTY]
	and a
	jr z,.noPokemonChosen
	ld a,[wCurrentMenuItem]
	ld [wWhichPokemon],a
	ld hl,W_PARTYMON1
	ld b,0
	ld c,a
	add hl,bc
	ld a,[hl]
	ld [$cf91],a
	ld [$cfd9],a
	call BankswitchBack
	and a
	ret
.noPokemonChosen
	call BankswitchBack
	scf
	ret
.swappingPokemon
	bit 1,b ; was the B button pressed?
	jr z,.handleSwap ; if not, handle swapping the pokemon
.cancelSwap ; if the B button was pressed
	callba ErasePartyMenuCursors
	xor a
	ld [$cc35],a
	ld [$d07d],a
	call RedrawPartyMenu
	jr HandlePartyMenuInput
.handleSwap
	ld a,[wCurrentMenuItem]
	ld [wWhichPokemon],a
	callba SwitchPartyMon
	jr HandlePartyMenuInput

DrawPartyMenu:: ; 14d4 (0:14d4)
	ld hl, DrawPartyMenu_
	jr DrawPartyMenuCommon

RedrawPartyMenu:: ; 14d9 (0:14d9)
	ld hl, RedrawPartyMenu_

DrawPartyMenuCommon:: ; 14dc (0:14dc)
	ld b, BANK(RedrawPartyMenu_)
	jp Bankswitch

; prints a pokemon's status condition
; INPUT:
; de = address of status condition
; hl = destination address
PrintStatusCondition:: ; 14e1 (0:14e1)
	push de
	dec de
	dec de ; de = address of current HP
	ld a,[de]
	ld b,a
	dec de
	ld a,[de]
	or b ; is the pokemon's HP zero?
	pop de
	jr nz,PrintStatusConditionNotFainted
; if the pokemon's HP is 0, print "FNT"
	ld a,"F"
	ld [hli],a
	ld a,"N"
	ld [hli],a
	ld [hl],"T"
	and a
	ret
PrintStatusConditionNotFainted ; 14f6
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,BANK(PrintStatusAilment)
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	call PrintStatusAilment ; print status condition
	pop bc
	ld a,b
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

; function to print pokemon level, leaving off the ":L" if the level is at least 100
; INPUT:
; hl = destination address
; [$cfb9] = level
PrintLevel:: ; 150b (0:150b)
	ld a,$6e ; ":L" tile ID
	ld [hli],a
	ld c,2 ; number of digits
	ld a,[$cfb9] ; level
	cp a,100
	jr c,PrintLevelCommon
; if level at least 100, write over the ":L" tile
	dec hl
	inc c ; increment number of digits to 3
	jr PrintLevelCommon

; prints the level without leaving off ":L" regardless of level
; INPUT:
; hl = destination address
; [$cfb9] = level
PrintLevelFull:: ; 151b (0:151b)
	ld a,$6e ; ":L" tile ID
	ld [hli],a
	ld c,3 ; number of digits
	ld a,[$cfb9] ; level

PrintLevelCommon:: ; 1523 (0:1523)
	ld [$d11e],a
	ld de,$d11e
	ld b,$41 ; no leading zeroes, left-aligned, one byte
	jp PrintNumber

Func_152e:: ; 152e (0:152e)
	ld hl,$d0dc
	ld c,a
	ld b,0
	add hl,bc
	ld a,[hl]
	ret

; copies the base stat data of a pokemon to $D0B8 (W_MONHEADER)
; INPUT:
; [$D0B5] = pokemon ID
GetMonHeader:: ; 1537 (0:1537)
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,BANK(BaseStats)
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	push bc
	push de
	push hl
	ld a,[$d11e]
	push af
	ld a,[$d0b5]
	ld [$d11e],a
	ld de,FossilKabutopsPic
	ld b,$66 ; size of Kabutops fossil and Ghost sprites
	cp a,FOSSIL_KABUTOPS ; Kabutops fossil
	jr z,.specialID
	ld de,GhostPic
	cp a,MON_GHOST ; Ghost
	jr z,.specialID
	ld de,FossilAerodactylPic
	ld b,$77 ; size of Aerodactyl fossil sprite
	cp a,FOSSIL_AERODACTYL ; Aerodactyl fossil
	jr z,.specialID
	cp a,MEW
	jr z,.mew
	ld a,$3a
	call Predef   ; convert pokemon ID in [$D11E] to pokedex number
	ld a,[$d11e]
	dec a
	ld bc,28
	ld hl,BaseStats
	call AddNTimes
	ld de,W_MONHEADER
	ld bc,28
	call CopyData
	jr .done
.specialID
	ld hl,W_MONHSPRITEDIM
	ld [hl],b ; write sprite dimensions
	inc hl
	ld [hl],e ; write front sprite pointer
	inc hl
	ld [hl],d
	jr .done
.mew
	ld hl,MewBaseStats
	ld de,W_MONHEADER
	ld bc,28
	ld a,BANK(MewBaseStats)
	call FarCopyData
.done
	ld a,[$d0b5]
	ld [$d0b8],a
	pop af
	ld [$d11e],a
	pop hl
	pop de
	pop bc
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

; copy party pokemon's name to $CD6D
GetPartyMonName2:: ; 15b4 (0:15b4)
	ld a,[wWhichPokemon] ; index within party
	ld hl,W_PARTYMON1NAME

; this is called more often
GetPartyMonName:: ; 15ba (0:15ba)
	push hl
	push bc
	call SkipFixedLengthTextEntries ; add 11 to hl, a times
	ld de,$cd6d
	push de
	ld bc,11
	call CopyData
	pop de
	pop bc
	pop hl
	ret

; function to print a BCD (Binary-coded decimal) number
; de = address of BCD number
; hl = destination address
; c = flags and length
; bit 7: if set, do not print leading zeroes
;        if unset, print leading zeroes
; bit 6: if set, left-align the string (do not pad empty digits with spaces)
;        if unset, right-align the string
; bit 5: if set, print currency symbol at the beginning of the string
;        if unset, do not print the currency symbol
; bits 0-4: length of BCD number in bytes
; Note that bits 5 and 7 are modified during execution. The above reflects
; their meaning at the beginning of the functions's execution.
PrintBCDNumber:: ; 15cd (0:15cd)
	ld b,c ; save flags in b
	res 7,c
	res 6,c
	res 5,c ; c now holds the length
	bit 5,b
	jr z,.loop
	bit 7,b
	jr nz,.loop
	ld [hl],"¥"
	inc hl
.loop
	ld a,[de]
	swap a
	call PrintBCDDigit ; print upper digit
	ld a,[de]
	call PrintBCDDigit ; print lower digit
	inc de
	dec c
	jr nz,.loop
	bit 7,b ; were any non-zero digits printed?
	jr z,.done ; if so, we are done
.numberEqualsZero ; if every digit of the BCD number is zero
	bit 6,b ; left or right alignment?
	jr nz,.skipRightAlignmentAdjustment
	dec hl ; if the string is right-aligned, it needs to be moved back one space
.skipRightAlignmentAdjustment
	bit 5,b
	jr z,.skipCurrencySymbol
	ld [hl],"¥"
	inc hl
.skipCurrencySymbol
	ld [hl],"0"
	call PrintLetterDelay
	inc hl
.done
	ret

PrintBCDDigit:: ; 1604 (0:1604)
	and a,%00001111
	and a
	jr z,.zeroDigit
.nonzeroDigit
	bit 7,b ; have any non-space characters been printed?
	jr z,.outputDigit
; if bit 7 is set, then no numbers have been printed yet
	bit 5,b ; print the currency symbol?
	jr z,.skipCurrencySymbol
	ld [hl],"¥"
	inc hl
	res 5,b
.skipCurrencySymbol
	res 7,b ; unset 7 to indicate that a nonzero digit has been reached
.outputDigit
	add a,"0"
	ld [hli],a
	jp PrintLetterDelay
.zeroDigit
	bit 7,b ; either printing leading zeroes or already reached a nonzero digit?
	jr z,.outputDigit ; if so, print a zero digit
	bit 6,b ; left or right alignment?
	ret nz
	inc hl ; if right-aligned, "print" a space by advancing the pointer
	ret

; uncompresses the front or back sprite of the specified mon
; assumes the corresponding mon header is already loaded
; hl contains offset to sprite pointer ($b for front or $d for back)
UncompressMonSprite:: ; 1627 (0:1627)
	ld bc,W_MONHEADER
	add hl,bc
	ld a,[hli]
	ld [W_SPRITEINPUTPTR],a    ; fetch sprite input pointer
	ld a,[hl]
	ld [W_SPRITEINPUTPTR+1],a
; define (by index number) the bank that a pokemon's image is in
; index = Mew, bank 1
; index = Kabutops fossil, bank $B
;	index < $1F, bank 9
; $1F ≤ index < $4A, bank $A
; $4A ≤ index < $74, bank $B
; $74 ≤ index < $99, bank $C
; $99 ≤ index,       bank $D
	ld a,[$CF91] ; XXX name for this ram location
	ld b,a
	cp MEW
	ld a,BANK(MewPicFront)
	jr z,.GotBank
	ld a,b
	cp FOSSIL_KABUTOPS
	ld a,BANK(FossilKabutopsPic)
	jr z,.GotBank
	ld a,b
	cp TANGELA + 1
	ld a,BANK(TangelaPicFront)
	jr c,.GotBank
	ld a,b
	cp MOLTRES + 1
	ld a,BANK(MoltresPicFront)
	jr c,.GotBank
	ld a,b
	cp BEEDRILL + 2
	ld a,BANK(BeedrillPicFront)
	jr c,.GotBank
	ld a,b
	cp STARMIE + 1
	ld a,BANK(StarmiePicFront)
	jr c,.GotBank
	ld a,BANK(VictreebelPicFront)
.GotBank
	jp UncompressSpriteData

; de: destination location
LoadMonFrontSprite:: ; 1665 (0:1665)
	push de
	ld hl, W_MONHFRONTSPRITE - W_MONHEADER
	call UncompressMonSprite
	ld hl, W_MONHSPRITEDIM
	ld a, [hli]
	ld c, a
	pop de
	; fall through

; postprocesses uncompressed sprite chunks to a 2bpp sprite and loads it into video ram
; calculates alignment parameters to place both sprite chunks in the center of the 7*7 tile sprite buffers
; de: destination location
; a,c:  sprite dimensions (in tiles of 8x8 each)
LoadUncompressedSpriteData:: ; 1672 (0:1672)
	push de
	and $f
	ld [H_SPRITEWIDTH], a ; each byte contains 8 pixels (in 1bpp), so tiles=bytes for width
	ld b, a
	ld a, $7
	sub b      ; 7-w
	inc a      ; 8-w
	srl a      ; (8-w)/2     ; horizontal center (in tiles, rounded up)
	ld b, a
	add a
	add a
	add a
	sub b      ; 7*((8-w)/2) ; skip for horizontal center (in tiles)
	ld [H_SPRITEOFFSET], a
	ld a, c
	swap a
	and $f
	ld b, a
	add a
	add a
	add a     ; 8*tiles is height in bytes
	ld [H_SPRITEHEIGHT], a ; $ff8c
	ld a, $7
	sub b      ; 7-h         ; skip for vertical center (in tiles, relative to current column)
	ld b, a
	ld a, [H_SPRITEOFFSET]
	add b     ; 7*((8-w)/2) + 7-h ; combined overall offset (in tiles)
	add a
	add a
	add a     ; 8*(7*((8-w)/2) + 7-h) ; combined overall offset (in bytes)
	ld [H_SPRITEOFFSET], a
	xor a
	ld [$4000], a
	ld hl, S_SPRITEBUFFER0
	call ZeroSpriteBuffer   ; zero buffer 0
	ld de, S_SPRITEBUFFER1
	ld hl, S_SPRITEBUFFER0
	call AlignSpriteDataCentered    ; copy and align buffer 1 to 0 (containing the MSB of the 2bpp sprite)
	ld hl, S_SPRITEBUFFER1
	call ZeroSpriteBuffer   ; zero buffer 1
	ld de, S_SPRITEBUFFER2
	ld hl, S_SPRITEBUFFER1
	call AlignSpriteDataCentered    ; copy and align buffer 2 to 1 (containing the LSB of the 2bpp sprite)
	pop de
	jp InterlaceMergeSpriteBuffers

; copies and aligns the sprite data properly inside the sprite buffer
; sprite buffers are 7*7 tiles in size, the loaded sprite is centered within this area
AlignSpriteDataCentered:: ; 16c2 (0:16c2)
	ld a, [H_SPRITEOFFSET]
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [H_SPRITEWIDTH] ; $ff8b
.columnLoop
	push af
	push hl
	ld a, [H_SPRITEHEIGHT] ; $ff8c
	ld c, a
.columnInnerLoop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .columnInnerLoop
	pop hl
	ld bc, 7*8    ; 7 tiles
	add hl, bc    ; advance one full column
	pop af
	dec a
	jr nz, .columnLoop
	ret

; fills the sprite buffer (pointed to in hl) with zeros
ZeroSpriteBuffer:: ; 16df (0:16df)
	ld bc, SPRITEBUFFERSIZE
.nextByteLoop
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .nextByteLoop
	ret

; combines the (7*7 tiles, 1bpp) sprite chunks in buffer 0 and 1 into a 2bpp sprite located in buffer 1 through 2
; in the resulting sprite, the rows of the two source sprites are interlaced
; de: output address
InterlaceMergeSpriteBuffers:: ; 16ea (0:16ea)
	xor a
	ld [$4000], a
	push de
	ld hl, S_SPRITEBUFFER2 + (SPRITEBUFFERSIZE - 1) ; destination: end of buffer 2
	ld de, S_SPRITEBUFFER1 + (SPRITEBUFFERSIZE - 1) ; source 2: end of buffer 1
	ld bc, S_SPRITEBUFFER0 + (SPRITEBUFFERSIZE - 1) ; source 1: end of buffer 0
	ld a, SPRITEBUFFERSIZE/2 ; $c4
	ld [H_SPRITEINTERLACECOUNTER], a ; $ff8b
.interlaceLoop
	ld a, [de]
	dec de
	ld [hld], a   ; write byte of source 2
	ld a, [bc]
	dec bc
	ld [hld], a   ; write byte of source 1
	ld a, [de]
	dec de
	ld [hld], a   ; write byte of source 2
	ld a, [bc]
	dec bc
	ld [hld], a   ; write byte of source 1
	ld a, [H_SPRITEINTERLACECOUNTER] ; $ff8b
	dec a
	ld [H_SPRITEINTERLACECOUNTER], a ; $ff8b
	jr nz, .interlaceLoop
	ld a, [W_SPRITEFLIPPED]
	and a
	jr z, .notFlipped
	ld bc, 2*SPRITEBUFFERSIZE
	ld hl, S_SPRITEBUFFER1
.swapLoop
	swap [hl]    ; if flipped swap nybbles in all bytes
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .swapLoop
.notFlipped
	pop hl
	ld de, S_SPRITEBUFFER1
	ld c, (2*SPRITEBUFFERSIZE)/16 ; $31, number of 16 byte chunks to be copied
	ld a, [H_LOADEDROMBANK]
	ld b, a
	jp CopyVideoData

Underground_Coll:: ; 172f (0:172f)
	INCBIN "gfx/tilesets/underground.tilecoll"
Overworld_Coll:: ; 1735 (0:1735)
	INCBIN "gfx/tilesets/overworld.tilecoll"
RedsHouse1_Coll::
RedsHouse2_Coll:: ; 1749 (0:1749)
	INCBIN "gfx/tilesets/reds_house.tilecoll"
Mart_Coll
Pokecenter_Coll:: ; 1753 (0:1753)
	INCBIN "gfx/tilesets/pokecenter.tilecoll"
Dojo_Coll::
Gym_Coll:: ; 1759 (0:1759)
	INCBIN "gfx/tilesets/gym.tilecoll"
Forest_Coll:: ; 1765 (0:1765)
	INCBIN "gfx/tilesets/forest.tilecoll"
House_Coll:: ; 1775 (0:1775)
	INCBIN "gfx/tilesets/house.tilecoll"
ForestGate_Coll::
Museum_Coll::
Gate_Coll:: ; 177f (0:177f)
	INCBIN "gfx/tilesets/gate.tilecoll"
Ship_Coll:: ; 178a (0:178a)
	INCBIN "gfx/tilesets/ship.tilecoll"
ShipPort_Coll:: ; 1795 (0:1795)
	INCBIN "gfx/tilesets/ship_port.tilecoll"
Cemetery_Coll:: ; 179a (0:179a)
	INCBIN "gfx/tilesets/cemetery.tilecoll"
Interior_Coll:: ; 17a2 (0:17a2)
	INCBIN "gfx/tilesets/interior.tilecoll"
Cavern_Coll:: ; 17ac (0:17ac)
	INCBIN "gfx/tilesets/cavern.tilecoll"
Lobby_Coll:: ; 17b8 (0:17b8)
	INCBIN "gfx/tilesets/lobby.tilecoll"
Mansion_Coll:: ; 17c0 (0:17c0)
	INCBIN "gfx/tilesets/mansion.tilecoll"
Lab_Coll:: ; 17ca (0:17ca)
	INCBIN "gfx/tilesets/lab.tilecoll"
Club_Coll:: ; 17d1 (0:17d1)
	INCBIN "gfx/tilesets/club.tilecoll"
Facility_Coll:: ; 17dd (0:17dd)
	INCBIN "gfx/tilesets/facility.tilecoll"
Plateau_Coll:: ; 17f0 (0:17f0)
	INCBIN "gfx/tilesets/plateau.tilecoll"

; does the same thing as FarCopyData at 009D
; only difference is that it uses [$ff8b] instead of [$cee9] for a temp value
; copy bc bytes of data from a:hl to de
FarCopyData2:: ; 17f7 (0:17f7)
	ld [$ff8b],a
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,[$ff8b]
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	call CopyData
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

; does a far copy but the source is de and the destination is hl
; copy bc bytes of data from a:de to hl
FarCopyData3:: ; 180d (0:180d)
	ld [$ff8b],a
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,[$ff8b]
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	push hl
	push de
	push de
	ld d,h
	ld e,l
	pop hl
	call CopyData
	pop de
	pop hl
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

; copies each source byte to the destination twice (next to each other)
; copy bc source bytes from a:hl to de
FarCopyDataDouble:: ; 182b (0:182b)
	ld [$ff8b],a
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,[$ff8b]
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
.loop
	ld a,[hli]
	ld [de],a
	inc de
	ld [de],a
	inc de
	dec bc
	ld a,c
	or b
	jr nz,.loop
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

; copy (c * 16) bytes from b:de to hl during V-blank
; transfers up to 128 bytes per V-blank
CopyVideoData:: ; 1848 (0:1848)
	ld a,[H_AUTOBGTRANSFERENABLED] ; save auto-transfer enabled flag
	push af
	xor a
	ld [H_AUTOBGTRANSFERENABLED],a ; disable auto-transfer while copying
	ld a,[H_LOADEDROMBANK]
	ld [$ff8b],a
	ld a,b
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ld a,e
	ld [H_VBCOPYSRC],a
	ld a,d
	ld [H_VBCOPYSRC + 1],a
	ld a,l
	ld [H_VBCOPYDEST],a
	ld a,h
	ld [H_VBCOPYDEST + 1],a
.loop
	ld a,c
	cp a,8 ; are there more than 128 bytes left to copy?
	jr nc,.copyMaxSize ; only copy up to 128 bytes at a time
.copyRemainder
	ld [H_VBCOPYSIZE],a
	call DelayFrame ; wait for V-blank handler to perform the copy
	ld a,[$ff8b]
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	pop af
	ld [H_AUTOBGTRANSFERENABLED],a ; restore original auto-transfer enabled flag
	ret
.copyMaxSize
	ld a,8 ; 128 bytes
	ld [H_VBCOPYSIZE],a
	call DelayFrame ; wait for V-blank handler to perform the copy
	ld a,c
	sub a,8
	ld c,a
	jr .loop

; copy (c * 8) source bytes from b:de to hl during V-blank
; copies each source byte to the destination twice (next to each other)
; transfers up to 64 source bytes per V-blank
CopyVideoDataDouble:: ; 1886 (0:1886)
	ld a,[H_AUTOBGTRANSFERENABLED] ; save auto-transfer enabled flag
	push af
	xor a
	ld [H_AUTOBGTRANSFERENABLED],a ; disable auto-transfer while copying
	ld a,[H_LOADEDROMBANK]
	ld [$ff8b],a
	ld a,b
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ld a,e
	ld [H_VBCOPYDOUBLESRC],a
	ld a,d
	ld [H_VBCOPYDOUBLESRC + 1],a
	ld a,l
	ld [H_VBCOPYDOUBLEDEST],a
	ld a,h
	ld [H_VBCOPYDOUBLEDEST + 1],a
.loop
	ld a,c
	cp a,8 ; are there more than 64 source bytes left to copy?
	jr nc,.copyMaxSize ; only copy up to 64 source bytes at a time
.copyRemainder
	ld [H_VBCOPYDOUBLESIZE],a
	call DelayFrame ; wait for V-blank handler to perform the copy
	ld a,[$ff8b]
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	pop af
	ld [H_AUTOBGTRANSFERENABLED],a ; restore original auto-transfer enabled flag
	ret
.copyMaxSize
	ld a,8 ; 64 source bytes
	ld [H_VBCOPYDOUBLESIZE],a
	call DelayFrame ; wait for V-blank handler to perform the copy
	ld a,c
	sub a,8
	ld c,a
	jr .loop

; clears an area of the screen
; INPUT:
; hl = address of upper left corner of the area
; b = height
; c = width
ClearScreenArea:: ; 18c4 (0:18c4)
	ld   a,$7F ; blank tile
	ld   de,20 ; screen width
.loop
	push hl
	push bc
.innerLoop
	ld [hli],a
	dec c
	jr nz,.innerLoop
	pop bc
	pop hl
	add hl,de
	dec b
	jr nz,.loop
	ret

; copies the screen tile buffer from WRAM to VRAM
; copying is done in 3 chunks of 6 rows each
; b: high byte of VRAM destination address ($98 or $9c for window tile map 0 or 1 resp.)
CopyScreenTileBufferToVRAM:: ; 18d6 (0:18d6)
	ld c, $6
	ld hl, $0000
	ld de, wTileMap
	call InitScreenTileBufferTransferParameters
	call DelayFrame
	ld hl, $600
	ld de, wTileMap + 20 * 6 ; $c418
	call InitScreenTileBufferTransferParameters
	call DelayFrame
	ld hl, $c00
	ld de, wTileMap + 20 * 12 ; $c490
	call InitScreenTileBufferTransferParameters
	jp DelayFrame

InitScreenTileBufferTransferParameters:: ; 18fc (0:18fc)
	ld a, d
	ld [H_VBCOPYBGSRC+1], a
	call GetRowColAddressBgMap
	ld a, l
	ld [H_VBCOPYBGDEST], a ; $ffc3
	ld a, h
	ld [H_VBCOPYBGDEST+1], a
	ld a, c
	ld [H_VBCOPYBGNUMROWS], a ; $ffc5
	ld a, e
	ld [H_VBCOPYBGSRC], a ; $ffc1
	ret

ClearScreen:: ; 190f (0:190f)
; clears all tiles in the tilemap,
; then wait three frames
	ld bc,$0168 ; tilemap size
	inc b
	ld hl,wTileMap ; TILEMAP_START
	ld a,$7F    ; $7F is blank tile
.loop
	ld [hli],a
	dec c
	jr nz,.loop
	dec b
	jr nz,.loop
	jp Delay3

TextBoxBorder:: ; 1922 (0:1922)
; draw a text box
; upper-left corner at coordinates hl
; height b
; width c

	; first row
	push hl
	ld a,"┌"
	ld [hli],a
	inc a    ; horizontal border ─
	call NPlaceChar
	inc a    ; upper-right border ┐
	ld [hl],a

	; middle rows
	pop hl
	ld de,20
	add hl,de ; skip the top row

.PlaceRow
	push hl
	ld a,"│"
	ld [hli],a
	ld a," "
	call NPlaceChar
	ld [hl],"│"

	pop hl
	ld de,20
	add hl,de ; move to next row
	dec b
	jr nz,.PlaceRow

	; bottom row
	ld a,"└"
	ld [hli],a
	ld a,"─"
	call NPlaceChar
	ld [hl],"┘"
	ret
;
NPlaceChar:: ; 194f (0:194f)
; place a row of width c of identical characters
	ld d,c
.loop
	ld [hli],a
	dec d
	jr nz,.loop
	ret

PlaceString:: ; 1955 (0:1955)
	push hl
PlaceNextChar:: ; 1956 (0:1956)
	ld a,[de]

	cp "@"
	jr nz,.PlaceText
	ld b,h
	ld c,l
	pop hl
	ret

.PlaceText
	cp $4E
	jr nz,.next
	ld bc,$0028
	ld a,[$FFF6]
	bit 2,a
	jr z,.next2
	ld bc,$14
.next2
	pop hl
	add hl,bc
	push hl
	jp Next19E8

.next
	cp $4F
	jr nz,.next3
	pop hl
	FuncCoord 1, 16 ; $c4e1
	ld hl,Coord
	push hl
	jp Next19E8

.next3 ; Check against a dictionary
	and a
	jp z,Char00
	cp $4C
	jp z,Char4C
	cp $4B
	jp z,Char4B
	cp $51
	jp z,Char51
	cp $49
	jp z,Char49
	cp $52
	jp z,Char52
	cp $53
	jp z,Char53
	cp $54
	jp z,Char54
	cp $5B
	jp z,Char5B
	cp $5E
	jp z,Char5E
	cp $5C
	jp z,Char5C
	cp $5D
	jp z,Char5D
	cp $55
	jp z,Char55
	cp $56
	jp z,Char56
	cp $57
	jp z,Char57
	cp $58
	jp z,Char58
	cp $4A
	jp z,Char4A
	cp $5F
	jp z,Char5F
	cp $59
	jp z,Char59
	cp $5A
	jp z,Char5A
	ld [hli],a
	call PrintLetterDelay
Next19E8:: ; 19e8 (0:19e8)
	inc de
	jp PlaceNextChar

Char00:: ; 19ec (0:19ec)
	ld b,h
	ld c,l
	pop hl
	ld de,Char00Text
	dec de
	ret

Char00Text:: ; 0x19f4 “%d ERROR.”
	TX_FAR _Char00Text
	db "@"

Char52:: ; 0x19f9 player’s name
	push de
	ld de,W_PLAYERNAME
	jr FinishDTE

Char53:: ; 19ff (0:19ff) ; rival’s name
	push de
	ld de,W_RIVALNAME
	jr FinishDTE

Char5D:: ; 1a05 (0:1a05) ; TRAINER
	push de
	ld de,Char5DText
	jr FinishDTE

Char5C:: ; 1a0b (0:1a0b) ; TM
	push de
	ld de,Char5CText
	jr FinishDTE

Char5B:: ; 1a11 (0:1a11) ; PC
	push de
	ld de,Char5BText
	jr FinishDTE

Char5E:: ; 1a17 (0:1a17) ; ROCKET
	push de
	ld de,Char5EText
	jr FinishDTE

Char54:: ; 1a1d (0:1a1d) ; POKé
	push de
	ld de,Char54Text
	jr FinishDTE

Char56:: ; 1a23 (0:1a23) ; ……
	push de
	ld de,Char56Text
	jr FinishDTE

Char4A:: ; 1a29 (0:1a29) ; PKMN
	push de
	ld de,Char4AText
	jr FinishDTE

Char59:: ; 1a2f (0:1a2f)
; depending on whose turn it is, print
; enemy active monster’s name, prefixed with “Enemy ”
; or
; player active monster’s name
; (like Char5A but flipped)
	ld a,[H_WHOSETURN]
	xor 1
	jr MonsterNameCharsCommon

Char5A:: ; 1a35 (0:1a35)
; depending on whose turn it is, print
; player active monster’s name
; or
; enemy active monster’s name, prefixed with “Enemy ”
	ld a,[H_WHOSETURN]
MonsterNameCharsCommon:: ; 1a37 (0:1a37)
	push de
	and a
	jr nz,.Enemy
	ld de,W_PLAYERMONNAME ; player active monster name
	jr FinishDTE

.Enemy ; 1A40
	; print “Enemy ”
	ld de,Char5AText
	call PlaceString

	ld h,b
	ld l,c
	ld de,W_ENEMYMONNAME ; enemy active monster name

FinishDTE:: ; 1a4b (0:1a4b)
	call PlaceString
	ld h,b
	ld l,c
	pop de
	inc de
	jp PlaceNextChar

Char5CText:: ; 1a55 (0:1a55)
	db "TM@"
Char5DText:: ; 1a58 (0:1a58)
	db "TRAINER@"
Char5BText:: ; 1a60 (0:1a60)
	db "PC@"
Char5EText:: ; 1a63 (0:1a63)
	db "ROCKET@"
Char54Text:: ; 1a6a (0:1a6a)
	db "POKé@"
Char56Text:: ; 1a6f (0:1a6f)
	db "……@"
Char5AText:: ; 1a72 (0:1a72)
	db "Enemy @"
Char4AText:: ; 1a79 (0:1a79)
	db $E1,$E2,"@" ; PKMN

Char55:: ; 1a7c (0:1a7c)
	push de
	ld b,h
	ld c,l
	ld hl,Char55Text
	call TextCommandProcessor
	ld h,b
	ld l,c
	pop de
	inc de
	jp PlaceNextChar

Char55Text:: ; 1a8c (0:1a8c)
; equivalent to Char4B
	TX_FAR _Char55Text
	db "@"

Char5F:: ; 1a91 (0:1a91)
; ends a Pokédex entry
	ld [hl],"."
	pop hl
	ret

Char58:: ; 1a95 (0:1a95)
	ld a,[$D12B]
	cp 4
	jp z,Next1AA2
	ld a,$EE
	FuncCoord 18, 16 ; $c4f2
	ld [Coord],a
Next1AA2:: ; 1aa2 (0:1aa2)
	call ProtectedDelay3
	call ManualTextScroll
	ld a,$7F
	FuncCoord 18, 16 ; $c4f2
	ld [Coord],a
Char57:: ; 1aad (0:1aad)
	pop hl
	ld de,Char58Text
	dec de
	ret

Char58Text:: ; 1ab3 (0:1ab3)
	db "@"

Char51:: ; 1ab4 (0:1ab4)
	push de
	ld a,$EE
	FuncCoord 18, 16 ; $c4f2
	ld [Coord],a
	call ProtectedDelay3
	call ManualTextScroll
	FuncCoord 1, 13 ; $c4a5
	ld hl,Coord
	ld bc,$0412
	call ClearScreenArea
	ld c,$14
	call DelayFrames
	pop de
	FuncCoord 1, 14 ; $c4b9
	ld hl,Coord
	jp Next19E8

Char49:: ; 1ad5 (0:1ad5)
	push de
	ld a,$EE
	FuncCoord 18, 16 ; $c4f2
	ld [Coord],a
	call ProtectedDelay3
	call ManualTextScroll
	FuncCoord 1, 10 ; $c469
	ld hl,Coord
	ld bc,$0712
	call ClearScreenArea
	ld c,$14
	call DelayFrames
	pop de
	pop hl
	FuncCoord 1, 11 ; $c47d
	ld hl,Coord
	push hl
	jp Next19E8

Char4B:: ; 1af8 (0:1af8)
	ld a,$EE
	FuncCoord 18, 16 ; $c4f2
	ld [Coord],a
	call ProtectedDelay3
	push de
	call ManualTextScroll
	pop de
	ld a,$7F
	FuncCoord 18, 16 ; $c4f2
	ld [Coord],a
	;fall through
Char4C:: ; 1b0a (0:1b0a)
	push de
	call Next1B18
	call Next1B18
	FuncCoord 1, 16 ; $c4e1
	ld hl,Coord
	pop de
	jp Next19E8

Next1B18:: ; 1b18 (0:1b18)
	FuncCoord 0, 14 ; $c4b8
	ld hl,Coord
	FuncCoord 0, 13 ; $c4a4
	ld de,Coord
	ld b,$3C
.next
	ld a,[hli]
	ld [de],a
	inc de
	dec b
	jr nz,.next
	FuncCoord 1, 16 ; $c4e1
	ld hl,Coord
	ld a,$7F
	ld b,$12
.next2
	ld [hli],a
	dec b
	jr nz,.next2

	; wait five frames
	ld b,5
.WaitFrame
	call DelayFrame
	dec b
	jr nz,.WaitFrame

	ret

ProtectedDelay3:: ; 1b3a (0:1b3a)
	push bc
	call Delay3
	pop bc
	ret

TextCommandProcessor:: ; 1b40 (0:1b40)
	ld a,[$d358]
	push af
	set 1,a
	ld e,a
	ld a,[$fff4]
	xor e
	ld [$d358],a
	ld a,c
	ld [$cc3a],a
	ld a,b
	ld [$cc3b],a

NextTextCommand:: ; 1b55 (0:1b55)
	ld a,[hli]
	cp a, "@" ; terminator
	jr nz,.doTextCommand
	pop af
	ld [$d358],a
	ret
.doTextCommand
	push hl
	cp a,$17
	jp z,TextCommand17
	cp a,$0e
	jp nc,TextCommand0B ; if a != 0x17 and a >= 0xE, go to command 0xB
; if a < 0xE, use a jump table
	ld hl,TextCommandJumpTable
	push bc
	add a
	ld b,$00
	ld c,a
	add hl,bc
	pop bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp [hl]

; draw box
; 04AAAABBCC
; AAAA = address of upper left corner
; BB = height
; CC = width
TextCommand04:: ; 1b78 (0:1b78)
	pop hl
	ld a,[hli]
	ld e,a
	ld a,[hli]
	ld d,a
	ld a,[hli]
	ld b,a
	ld a,[hli]
	ld c,a
	push hl
	ld h,d
	ld l,e
	call TextBoxBorder
	pop hl
	jr NextTextCommand

; place string inline
; 00{string}
TextCommand00:: ; 1b8a (0:1b8a)
	pop hl
	ld d,h
	ld e,l
	ld h,b
	ld l,c
	call PlaceString
	ld h,d
	ld l,e
	inc hl
	jr NextTextCommand

; place string from RAM
; 01AAAA
; AAAA = address of string
TextCommand01:: ; 1b97 (0:1b97)
	pop hl
	ld a,[hli]
	ld e,a
	ld a,[hli]
	ld d,a
	push hl
	ld h,b
	ld l,c
	call PlaceString
	pop hl
	jr NextTextCommand

; print BCD number
; 02AAAABB
; AAAA = address of BCD number
; BB
; bits 0-4 = length in bytes
; bits 5-7 = unknown flags
TextCommand02:: ; 1ba5 (0:1ba5)
	pop hl
	ld a,[hli]
	ld e,a
	ld a,[hli]
	ld d,a
	ld a,[hli]
	push hl
	ld h,b
	ld l,c
	ld c,a
	call PrintBCDNumber
	ld b,h
	ld c,l
	pop hl
	jr NextTextCommand

; repoint destination address
; 03AAAA
; AAAA = new destination address
TextCommand03:: ; 1bb7 (0:1bb7)
	pop hl
	ld a,[hli]
	ld [$cc3a],a
	ld c,a
	ld a,[hli]
	ld [$cc3b],a
	ld b,a
	jp NextTextCommand

; repoint destination to second line of dialogue text box
; 05
; (no arguments)
TextCommand05:: ; 1bc5 (0:1bc5)
	pop hl
	FuncCoord 1, 16 ; $c4e1
	ld bc,Coord ; address of second line of dialogue text box
	jp NextTextCommand

; blink arrow and wait for A or B to be pressed
; 06
; (no arguments)
TextCommand06:: ; 1bcc (0:1bcc)
	ld a,[W_ISLINKBATTLE]
	cp a,$04
	jp z,TextCommand0D
	ld a,$ee ; down arrow
	FuncCoord 18, 16 ; $c4f2
	ld [Coord],a ; place down arrow in lower right corner of dialogue text box
	push bc
	call ManualTextScroll ; blink arrow and wait for A or B to be pressed
	pop bc
	ld a," "
	FuncCoord 18, 16 ; $c4f2
	ld [Coord],a ; overwrite down arrow with blank space
	pop hl
	jp NextTextCommand

; scroll text up one line
; 07
; (no arguments)
TextCommand07:: ; 1be7 (0:1be7)
	ld a," "
	FuncCoord 18, 16 ; $c4f2
	ld [Coord],a ; place blank space in lower right corner of dialogue text box
	call Next1B18 ; scroll up text
	call Next1B18
	pop hl
	FuncCoord 1, 16 ; $c4e1
	ld bc,Coord ; address of second line of dialogue text box
	jp NextTextCommand

; execute asm inline
; 08{code}
TextCommand08:: ; 1bf9 (0:1bf9)
	pop hl
	ld de,NextTextCommand
	push de ; return address
	jp [hl]

; print decimal number (converted from binary number)
; 09AAAABB
; AAAA = address of number
; BB
; bits 0-3 = how many digits to display
; bits 4-7 = how long the number is in bytes
TextCommand09:: ; 1bff (0:1bff)
	pop hl
	ld a,[hli]
	ld e,a
	ld a,[hli]
	ld d,a
	ld a,[hli]
	push hl
	ld h,b
	ld l,c
	ld b,a
	and a,$0f
	ld c,a
	ld a,b
	and a,$f0
	swap a
	set 6,a
	ld b,a
	call PrintNumber
	ld b,h
	ld c,l
	pop hl
	jp NextTextCommand

; wait half a second if the user doesn't hold A or B
; 0A
; (no arguments)
TextCommand0A:: ; 1c1d (0:1c1d)
	push bc
	call GetJoypadState
	ld a,[H_CURRENTPRESSEDBUTTONS]
	and a,%00000011 ; A and B buttons
	jr nz,.skipDelay
	ld c,30
	call DelayFrames
.skipDelay
	pop bc
	pop hl
	jp NextTextCommand

; plays sounds
; this actually handles various command ID's, not just 0B
; (no arguments)
TextCommand0B:: ; 1c31 (0:1c31)
	pop hl
	push bc
	dec hl
	ld a,[hli]
	ld b,a ; b = command number that got us here
	push hl
	ld hl,TextCommandSounds
.loop
	ld a,[hli]
	cp b
	jr z,.matchFound
	inc hl
	jr .loop
.matchFound
	cp a,$14
	jr z,.pokemonCry
	cp a,$15
	jr z,.pokemonCry
	cp a,$16
	jr z,.pokemonCry
	ld a,[hl]
	call PlaySound
	call WaitForSoundToFinish
	pop hl
	pop bc
	jp NextTextCommand
.pokemonCry
	push de
	ld a,[hl]
	call PlayCry
	pop de
	pop hl
	pop bc
	jp NextTextCommand

; format: text command ID, sound ID or cry ID
TextCommandSounds:: ; 1c64 (0:1c64)
	db $0B,(SFX_02_3a - SFX_Headers_02) / 3
	db $12,(SFX_02_46 - SFX_Headers_02) / 3
	db $0E,(SFX_02_41 - SFX_Headers_02) / 3
	db $0F,(SFX_02_3a - SFX_Headers_02) / 3
	db $10,(SFX_02_3b - SFX_Headers_02) / 3
	db $11,(SFX_02_42 - SFX_Headers_02) / 3
	db $13,(SFX_02_44 - SFX_Headers_02) / 3
	db $14,NIDORINA ; used in OakSpeech
	db $15,PIDGEOT  ; used in SaffronCityText12
	db $16,DEWGONG  ; unused?

; draw ellipses
; 0CAA
; AA = number of ellipses to draw
TextCommand0C:: ; 1c78 (0:1c78)
	pop hl
	ld a,[hli]
	ld d,a
	push hl
	ld h,b
	ld l,c
.loop
	ld a,$75 ; ellipsis
	ld [hli],a
	push de
	call GetJoypadState
	pop de
	ld a,[H_CURRENTPRESSEDBUTTONS] ; joypad state
	and a,%00000011 ; is A or B button pressed?
	jr nz,.skipDelay ; if so, skip the delay
	ld c,10
	call DelayFrames
.skipDelay
	dec d
	jr nz,.loop
	ld b,h
	ld c,l
	pop hl
	jp NextTextCommand

; wait for A or B to be pressed
; 0D
; (no arguments)
TextCommand0D:: ; 1c9a (0:1c9a)
	push bc
	call ManualTextScroll ; wait for A or B to be pressed
	pop bc
	pop hl
	jp NextTextCommand

; process text commands in another ROM bank
; 17AAAABB
; AAAA = address of text commands
; BB = bank
TextCommand17:: ; 1ca3 (0:1ca3)
	pop hl
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,[hli]
	ld e,a
	ld a,[hli]
	ld d,a
	ld a,[hli]
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	push hl
	ld l,e
	ld h,d
	call TextCommandProcessor
	pop hl
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	jp NextTextCommand

TextCommandJumpTable:: ; 1cc1 (0:1cc1)
	dw TextCommand00
	dw TextCommand01
	dw TextCommand02
	dw TextCommand03
	dw TextCommand04
	dw TextCommand05
	dw TextCommand06
	dw TextCommand07
	dw TextCommand08
	dw TextCommand09
	dw TextCommand0A
	dw TextCommand0B
	dw TextCommand0C
	dw TextCommand0D

; this function seems to be used only once
; it store the address of a row and column of the VRAM background map in hl
; INPUT: h - row, l - column, b - high byte of background tile map address in VRAM
GetRowColAddressBgMap:: ; 1cdd (0:1cdd)
	xor a
	srl h
	rr a
	srl h
	rr a
	srl h
	rr a
	or l
	ld l,a
	ld a,b
	or h
	ld h,a
	ret

; clears a VRAM background map with blank space tiles
; INPUT: h - high byte of background tile map address in VRAM
ClearBgMap:: ; 1cf0 (0:1cf0)
	ld a," "
	jr .next
	ld a,l
.next
	ld de,$400 ; size of VRAM background map
	ld l,e
.loop
	ld [hli],a
	dec e
	jr nz,.loop
	dec d
	jr nz,.loop
	ret

; When the player takes a step, a row or column of 2x2 tile blocks at the edge
; of the screen toward which they moved is exposed and has to be redrawn.
; This function does the redrawing.
RedrawExposedScreenEdge:: ; 1d01 (0:1d01)
	ld a,[H_SCREENEDGEREDRAW]
	and a
	ret z
	ld b,a
	xor a
	ld [H_SCREENEDGEREDRAW],a
	dec b
	jr nz,.redrawRow
.redrawColumn
	ld hl,wScreenEdgeTiles
	ld a,[H_SCREENEDGEREDRAWADDR]
	ld e,a
	ld a,[H_SCREENEDGEREDRAWADDR + 1]
	ld d,a
	ld c,18 ; screen height
.loop1
	ld a,[hli]
	ld [de],a
	inc de
	ld a,[hli]
	ld [de],a
	ld a,31
	add e
	ld e,a
	jr nc,.noCarry
	inc d
.noCarry
; the following 4 lines wrap us from bottom to top if necessary
	ld a,d
	and a,$03
	or a,$98
	ld d,a
	dec c
	jr nz,.loop1
	xor a
	ld [H_SCREENEDGEREDRAW],a
	ret
.redrawRow
	ld hl,wScreenEdgeTiles
	ld a,[H_SCREENEDGEREDRAWADDR]
	ld e,a
	ld a,[H_SCREENEDGEREDRAWADDR + 1]
	ld d,a
	push de
	call .drawHalf ; draw upper half
	pop de
	ld a,32 ; width of VRAM background map
	add e
	ld e,a
	                 ; draw lower half
.drawHalf
	ld c,10
.loop2
	ld a,[hli]
	ld [de],a
	inc de
	ld a,[hli]
	ld [de],a
	ld a,e
	inc a
; the following 6 lines wrap us from the right edge to the left edge if necessary
	and a,$1f
	ld b,a
	ld a,e
	and a,$e0
	or b
	ld e,a
	dec c
	jr nz,.loop2
	ret

; This function automatically transfers tile number data from the tile map at
; wTileMap to VRAM during V-blank. Note that it only transfers one third of the
; background per V-blank. It cycles through which third it draws.
; This transfer is turned off when walking around the map, but is turned
; on when talking to sprites, battling, using menus, etc. This is because
; the above function, RedrawExposedScreenEdge, is used when walking to
; improve efficiency.
AutoBgMapTransfer:: ; 1d57 (0:1d57)
	ld a,[H_AUTOBGTRANSFERENABLED]
	and a
	ret z
	ld hl,[sp + 0]
	ld a,h
	ld [H_SPTEMP],a
	ld a,l
	ld [H_SPTEMP + 1],a ; save stack pinter
	ld a,[H_AUTOBGTRANSFERPORTION]
	and a
	jr z,.transferTopThird
	dec a
	jr z,.transferMiddleThird
.transferBottomThird
	FuncCoord 0,12
	ld hl,Coord
	ld sp,hl
	ld a,[H_AUTOBGTRANSFERDEST + 1]
	ld h,a
	ld a,[H_AUTOBGTRANSFERDEST]
	ld l,a
	ld de,(12 * 32)
	add hl,de
	xor a ; TRANSFERTOP
	jr .doTransfer
.transferTopThird
	FuncCoord 0,0
	ld hl,Coord
	ld sp,hl
	ld a,[H_AUTOBGTRANSFERDEST + 1]
	ld h,a
	ld a,[H_AUTOBGTRANSFERDEST]
	ld l,a
	ld a,TRANSFERMIDDLE
	jr .doTransfer
.transferMiddleThird
	FuncCoord 0,6
	ld hl,Coord
	ld sp,hl
	ld a,[H_AUTOBGTRANSFERDEST + 1]
	ld h,a
	ld a,[H_AUTOBGTRANSFERDEST]
	ld l,a
	ld de,(6 * 32)
	add hl,de
	ld a,TRANSFERBOTTOM
.doTransfer
	ld [H_AUTOBGTRANSFERPORTION],a ; store next portion
	ld b,6

; unrolled loop and using pop for speed
TransferBgRows:: ; 1d9e (0:1d9e)
	pop de
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	pop de
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	pop de
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	pop de
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	pop de
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	pop de
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	pop de
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	pop de
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	pop de
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	pop de
	ld [hl],e
	inc l
	ld [hl],d
	ld a,13
	add l
	ld l,a
	jr nc,.noCarry
	inc h
.noCarry
	dec b
	jr nz,TransferBgRows
	ld a,[H_SPTEMP]
	ld h,a
	ld a,[H_SPTEMP + 1]
	ld l,a
	ld sp,hl ; restore stack pointer
	ret

; Copies [H_VBCOPYBGNUMROWS] rows from H_VBCOPYBGSRC to H_VBCOPYBGDEST.
; If H_VBCOPYBGSRC is XX00, the transfer is disabled.
VBlankCopyBgMap:: ; 1de1 (0:1de1)
	ld a,[H_VBCOPYBGSRC] ; doubles as enabling byte
	and a
	ret z
	ld hl,[sp + 0]
	ld a,h
	ld [H_SPTEMP],a
	ld a,l
	ld [H_SPTEMP + 1],a ; save stack pointer
	ld a,[H_VBCOPYBGSRC]
	ld l,a
	ld a,[H_VBCOPYBGSRC + 1]
	ld h,a
	ld sp,hl
	ld a,[H_VBCOPYBGDEST]
	ld l,a
	ld a,[H_VBCOPYBGDEST + 1]
	ld h,a
	ld a,[H_VBCOPYBGNUMROWS]
	ld b,a
	xor a
	ld [H_VBCOPYBGSRC],a ; disable transfer so it doesn't continue next V-blank
	jr TransferBgRows


VBlankCopyDouble::
; Copy [H_VBCOPYDOUBLESIZE] 1bpp tiles
; from H_VBCOPYDOUBLESRC to H_VBCOPYDOUBLEDEST.

; While we're here, convert to 2bpp.
; The process is straightforward:
; copy each byte twice.

	ld a, [H_VBCOPYDOUBLESIZE]
	and a
	ret z

	ld hl, [sp + 0]
	ld a, h
	ld [H_SPTEMP], a
	ld a, l
	ld [H_SPTEMP + 1], a

	ld a, [H_VBCOPYDOUBLESRC]
	ld l, a
	ld a, [H_VBCOPYDOUBLESRC + 1]
	ld h, a
	ld sp, hl

	ld a, [H_VBCOPYDOUBLEDEST]
	ld l, a
	ld a, [H_VBCOPYDOUBLEDEST + 1]
	ld h, a

	ld a, [H_VBCOPYDOUBLESIZE]
	ld b, a
	xor a ; transferred
	ld [H_VBCOPYDOUBLESIZE], a

.loop
	rept 3
	pop de
	ld [hl], e
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], d
	inc l
	endr

	pop de
	ld [hl], e
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], d
	inc hl
	dec b
	jr nz, .loop

	ld a, l
	ld [H_VBCOPYDOUBLEDEST], a
	ld a, h
	ld [H_VBCOPYDOUBLEDEST + 1], a

	ld hl, [sp + 0]
	ld a, l
	ld [H_VBCOPYDOUBLESRC], a
	ld a, h
	ld [H_VBCOPYDOUBLESRC + 1], a

	ld a, [H_SPTEMP]
	ld h, a
	ld a, [H_SPTEMP + 1]
	ld l, a
	ld sp, hl

	ret


VBlankCopy::
; Copy [H_VBCOPYSIZE] 2bpp tiles
; from H_VBCOPYSRC to H_VBCOPYDEST.

; Source and destination addresses
; are updated, so transfer can
; continue in subsequent calls.

	ld a, [H_VBCOPYSIZE]
	and a
	ret z

	ld hl, [sp + 0]
	ld a, h
	ld [H_SPTEMP], a
	ld a, l
	ld [H_SPTEMP + 1], a

	ld a, [H_VBCOPYSRC]
	ld l, a
	ld a, [H_VBCOPYSRC + 1]
	ld h, a
	ld sp, hl

	ld a, [H_VBCOPYDEST]
	ld l, a
	ld a, [H_VBCOPYDEST + 1]
	ld h, a

	ld a, [H_VBCOPYSIZE]
	ld b, a
	xor a ; transferred
	ld [H_VBCOPYSIZE], a

.loop
	rept 7
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	endr

	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc hl
	dec b
	jr nz, .loop

	ld a, l
	ld [H_VBCOPYDEST], a
	ld a, h
	ld [H_VBCOPYDEST + 1], a

	ld hl, [sp + 0]
	ld a, l
	ld [H_VBCOPYSRC], a
	ld a, h
	ld [H_VBCOPYSRC + 1], a

	ld a, [H_SPTEMP]
	ld h, a
	ld a, [H_SPTEMP + 1]
	ld l, a
	ld sp, hl

	ret


UpdateMovingBgTiles::
; Animate water and flower
; tiles in the overworld.

	ld a, [$ffd7]
	and a
	ret z

	ld a, [$ffd8]
	inc a
	ld [$ffd8], a
	cp 20
	ret c
	cp 21
	jr z, .flower

	ld hl, $9140
	ld c, $10

	ld a, [$d085]
	inc a
	and 7
	ld [$d085], a

	and 4
	jr nz, .left
.right
	ld a, [hl]
	rrca
	ld [hli], a
	dec c
	jr nz, .right
	jr .done
.left
	ld a, [hl]
	rlca
	ld [hli], a
	dec c
	jr nz, .left
.done
	ld a, [$ffd7]
	rrca
	ret nc
	xor a
	ld [$ffd8], a
	ret

.flower
	xor a
	ld [$ffd8], a

	ld a, [$d085]
	and 3
	cp 2
	ld hl, FlowerTile1
	jr c, .copy
	ld hl, FlowerTile2
	jr z, .copy
	ld hl, FlowerTile3
.copy
	ld de, $9030
	ld c, $10
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

FlowerTile1: INCBIN "gfx/tilesets/flower/flower1.2bpp"
FlowerTile2: INCBIN "gfx/tilesets/flower/flower2.2bpp"
FlowerTile3: INCBIN "gfx/tilesets/flower/flower3.2bpp"


SoftReset::
	call StopAllSounds
	call GBPalWhiteOut
	ld c, $20
	call DelayFrames
	; fallthrough

Init::
;  Program init.

rLCDC_DEFAULT EQU %11100011
; * LCD enabled
; * Window tile map at $9C00
; * Window display enabled
; * BG and window tile data at $8800
; * BG tile map at $9800
; * 8x8 OBJ size
; * OBJ display enabled
; * BG display enabled

	di

	xor a
	ld [rIF], a
	ld [rIE], a
	ld [$ff43], a
	ld [$ff42], a
	ld [$ff01], a
	ld [$ff02], a
	ld [$ff4b], a
	ld [$ff4a], a
	ld [$ff06], a
	ld [$ff07], a
	ld [$ff47], a
	ld [$ff48], a
	ld [$ff49], a

	ld a, rLCDC_ENABLE_MASK
	ld [rLCDC], a
	call DisableLCD

	ld sp, wStack

	ld hl, $c000 ; start of WRAM
	ld bc, $2000 ; size of WRAM
.loop
	ld [hl], 0
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop

	call ClearVram

	ld hl, $ff80
	ld bc, $ffff - $ff80
	call FillMemory

	call ClearSprites

	ld a, Bank(WriteDMACodeToHRAM)
	ld [H_LOADEDROMBANK], a
	ld [MBC3RomBank], a
	call WriteDMACodeToHRAM

	xor a
	ld [$ffd7], a
	ld [$ff41], a
	ld [$ffae], a
	ld [$ffaf], a
	ld [$ff0f], a
	ld a, 1 << VBLANK + 1 << TIMER + 1 << SERIAL
	ld [rIE], a

	ld a, 144 ; move the window off-screen
	ld [$ffb0], a
	ld [rWY], a
	ld a, 7
	ld [rWX], a

	ld a, $ff
	ld [$ffaa], a

	ld h, $9800 / $100 ; bg map 0
	call ClearBgMap
	ld h, $9c00 / $100 ; bg map 1
	call ClearBgMap

	ld a, rLCDC_DEFAULT
	ld [rLCDC], a
	ld a, $10
	ld [H_SOFTRESETCOUNTER], a
	call StopAllSounds

	ei

	ld a, $40 ; PREDEF_SGB_BORDER
	call Predef

	ld a, $1f
	ld [$c0ef], a
	ld [$c0f0], a
	ld a, $9c
	ld [$ffbd], a
	xor a
	ld [$ffbc], a
	dec a
	ld [$cfcb], a

	ld a, $32 ; PREDEF_INTRO
	call Predef

	call DisableLCD
	call ClearVram
	call GBPalNormal
	call ClearSprites
	ld a, rLCDC_DEFAULT
	ld [rLCDC], a

	jp SetDefaultNamesBeforeTitlescreen

ClearVram:
	ld hl, $8000
	ld bc, $2000
	xor a
	jp FillMemory


StopAllSounds::
	ld a, Bank(Func_9876)
	ld [$c0ef], a
	ld [$c0f0], a
	xor a
	ld [wMusicHeaderPointer], a
	ld [$c0ee], a
	ld [$cfca], a
	dec a
	jp PlaySound


VBlank::

	push af
	push bc
	push de
	push hl

	ld a, [H_LOADEDROMBANK]
	ld [$d122], a

	ld a, [$ffae]
	ld [rSCX], a
	ld a, [$ffaf]
	ld [rSCY], a

	ld a, [$d0a0]
	and a
	jr nz, .ok
	ld a, [$ffb0]
	ld [rWY], a
.ok

	call AutoBgMapTransfer
	call VBlankCopyBgMap
	call RedrawExposedScreenEdge
	call VBlankCopy
	call VBlankCopyDouble
	call UpdateMovingBgTiles
	call $ff80 ; hOAMDMA
	ld a, Bank(PrepareOAMData)
	ld [H_LOADEDROMBANK], a
	ld [MBC3RomBank], a
	call PrepareOAMData

	; VBlank-sensitive operations end.

	call Random

	ld a, [H_VBLANKOCCURRED]
	and a
	jr z, .vblanked
	xor a
	ld [H_VBLANKOCCURRED], a
.vblanked

	ld a, [H_FRAMECOUNTER]
	and a
	jr z, .decced
	dec a
	ld [H_FRAMECOUNTER], a
.decced

	call Func_28cb

	ld a, [$c0ef] ; music ROM bank
	ld [H_LOADEDROMBANK], a
	ld [MBC3RomBank], a

	cp BANK(Func_9103)
	jr nz, .notbank2
.bank2
	call Func_9103
	jr .afterMusic
.notbank2
	cp 8
	jr nz, .bank1F
.bank8
	call Func_2136e
	call Func_21879
	jr .afterMusic
.bank1F
	call Func_7d177
.afterMusic

	callba Func_18dee ; keep track of time played

	ld a, [$fff9]
	and a
	call z, ReadJoypad

	ld a, [$d122]
	ld [H_LOADEDROMBANK], a
	ld [MBC3RomBank], a

	pop hl
	pop de
	pop bc
	pop af
	reti


DelayFrame::
; Wait for the next vblank interrupt.
; As a bonus, this saves battery.

NOT_VBLANKED EQU 1

	ld a, NOT_VBLANKED
	ld [H_VBLANKOCCURRED], a
.halt
	; XXX this is a hack--rgbasm adds
	; a nop after halts by default.
	db $76 ; halt

	ld a, [H_VBLANKOCCURRED]
	and a
	jr nz, .halt
	ret


; These routines manage gradual fading
; (e.g., entering a doorway)
LoadGBPal:: ; 20ba (0:20ba)
	ld a,[$d35d] ;tells if cur.map is dark (requires HM5_FLASH?)
	ld b,a
	ld hl,GBPalTable_00	;16
	ld a,l
	sub b
	ld l,a
	jr nc,.jr0
	dec h
.jr0
	ld a,[hli]
	ld [rBGP],a
	ld a,[hli]
	ld [rOBP0],a
	ld a,[hli]
	ld [rOBP1],a
	ret

GBFadeOut1:: ; 20d1 (0:20d1)
	ld hl,IncGradGBPalTable_01	;0d
	ld b,$04
	jr GBFadeOutCommon

GBFadeOut2:: ; 20d8 (0:20d8)
	ld hl,IncGradGBPalTable_02	;1c
	ld b,$03

GBFadeOutCommon:: ; 20dd (0:20dd)
	ld a,[hli]
	ld [rBGP],a
	ld a,[hli]
	ld [rOBP0],a
	ld a,[hli]
	ld [rOBP1],a
	ld c,8
	call DelayFrames
	dec b
	jr nz,GBFadeOutCommon
	ret

GBFadeIn1:: ; 20ef (0:20ef)
	ld hl,DecGradGBPalTable_01	;18
	ld b,$04
	jr GBFadeInCommon

GBFadeIn2:: ; 20f6 (0:20f6)
	ld hl,DecGradGBPalTable_02	;21
	ld b,$03

GBFadeInCommon:: ; 20fb (0:20fb)
	ld a,[hld]
	ld [rOBP1],a
	ld a,[hld]
	ld [rOBP0],a
	ld a,[hld]
	ld [rBGP],a
	ld c,8
	call DelayFrames
	dec b
	jr nz,GBFadeInCommon
	ret

IncGradGBPalTable_01:: ; 210d (0:210d)
	db %11111111 ;BG Pal
	db %11111111 ;OBJ Pal 1
	db %11111111 ;OBJ Pal 2
	             ;and so on...
	db %11111110
	db %11111110
	db %11111000

	db %11111001
	db %11100100
	db %11100100
GBPalTable_00:: ; 2116 (0:2116)
	db %11100100
	db %11010000
DecGradGBPalTable_01:: ; 2118 (0:2118)
	db %11100000
	;19
	db %11100100
	db %11010000
	db %11100000
IncGradGBPalTable_02:: ; 211c (0:211c)
	db %10010000
	db %10000000
	db %10010000

	db %01000000
	db %01000000
DecGradGBPalTable_02:: ; 2121 (0:2121)
	db %01000000

	db %00000000
	db %00000000
	db %00000000

Serial:: ; 2125 (0:2125)
	push af
	push bc
	push de
	push hl
	ld a, [$ffaa]
	inc a
	jr z, .asm_2142
	ld a, [$ff01]
	ld [$ffad], a
	ld a, [$ffac]
	ld [$ff01], a
	ld a, [$ffaa]
	cp $2
	jr z, .asm_2162
	ld a, $80
	ld [$ff02], a
	jr .asm_2162
.asm_2142
	ld a, [$ff01]
	ld [$ffad], a
	ld [$ffaa], a
	cp $2
	jr z, .asm_215f
	xor a
	ld [$ff01], a
	ld a, $3
	ld [rDIV], a ; $ff04
.asm_2153
	ld a, [rDIV] ; $ff04
	bit 7, a
	jr nz, .asm_2153
	ld a, $80
	ld [$ff02], a
	jr .asm_2162
.asm_215f
	xor a
	ld [$ff01], a
.asm_2162
	ld a, $1
	ld [$ffa9], a
	ld a, $fe
	ld [$ffac], a
	pop hl
	pop de
	pop bc
	pop af
	reti

Func_216f:: ; 216f (0:216f)
	ld a, $1
	ld [$ffab], a
.asm_2173
	ld a, [hl]
	ld [$ffac], a
	call Func_219a
	push bc
	ld b, a
	inc hl
	ld a, $30
.asm_217e
	dec a
	jr nz, .asm_217e
	ld a, [$ffab]
	and a
	ld a, b
	pop bc
	jr z, .asm_2192
	dec hl
	cp $fd
	jr nz, .asm_2173
	xor a
	ld [$ffab], a
	jr .asm_2173
.asm_2192
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_2173
	ret

Func_219a:: ; 219a (0:219a)
	xor a
	ld [$ffa9], a
	ld a, [$ffaa]
	cp $2
	jr nz, .asm_21a7
	ld a, $81
	ld [$ff02], a
.asm_21a7
	ld a, [$ffa9]
	and a
	jr nz, .asm_21f1
	ld a, [$ffaa]
	cp $1
	jr nz, .asm_21cc
	call Func_2237
	jr z, .asm_21cc
	call Func_2231
	push hl
	ld hl, $cc48
	inc [hl]
	jr nz, .asm_21c3
	dec hl
	inc [hl]
.asm_21c3
	pop hl
	call Func_2237
	jr nz, .asm_21a7
	jp Func_223f
.asm_21cc
	ld a, [rIE] ; $ffff
	and $f
	cp $8
	jr nz, .asm_21a7
	ld a, [W_NUMHITS] ; $d074
	dec a
	ld [W_NUMHITS], a ; $d074
	jr nz, .asm_21a7
	ld a, [$d075]
	dec a
	ld [$d075], a
	jr nz, .asm_21a7
	ld a, [$ffaa]
	cp $1
	jr z, .asm_21f1
	ld a, $ff
.asm_21ee
	dec a
	jr nz, .asm_21ee
.asm_21f1
	xor a
	ld [$ffa9], a
	ld a, [rIE] ; $ffff
	and $f
	sub $8
	jr nz, .asm_2204
	ld [W_NUMHITS], a ; $d074
	ld a, $50
	ld [$d075], a
.asm_2204
	ld a, [$ffad]
	cp $fe
	ret nz
	call Func_2237
	jr z, .asm_221f
	push hl
	ld hl, $cc48
	ld a, [hl]
	dec a
	ld [hld], a
	inc a
	jr nz, .asm_2219
	dec [hl]
.asm_2219
	pop hl
	call Func_2237
	jr z, Func_223f
.asm_221f
	ld a, [rIE] ; $ffff
	and $f
	cp $8
	ld a, $fe
	ret z
	ld a, [hl]
	ld [$ffac], a
	call DelayFrame
	jp Func_219a

Func_2231:: ; 2231 (0:2231)
	ld a, $f
.asm_2233
	dec a
	jr nz, .asm_2233
	ret

Func_2237:: ; 2237 (0:2237)
	push hl
	ld hl, $cc47
	ld a, [hli]
	or [hl]
	pop hl
	ret

Func_223f:: ; 223f (0:223f)
	dec a
	ld [$cc47], a
	ld [$cc48], a
	ret

Func_2247:: ; 2247 (0:2247)
	ld hl, $cc42
	ld de, $cc3d
	ld c, $2
	ld a, $1
	ld [$ffab], a
.asm_2253
	call DelayFrame
	ld a, [hl]
	ld [$ffac], a
	call Func_219a
	ld b, a
	inc hl
	ld a, [$ffab]
	and a
	ld a, $0
	ld [$ffab], a
	jr nz, .asm_2253
	ld a, b
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2253
	ret

Func_226e:: ; 226e (0:226e)
	call SaveScreenTilesToBuffer1
	callab PrintWaitingText
	call Func_227f
	jp LoadScreenTilesFromBuffer1

Func_227f:: ; 227f (0:227f)
	ld a, $ff
	ld [$cc3e], a
.asm_2284
	call Func_22c3
	call DelayFrame
	call Func_2237
	jr z, .asm_22a0
	push hl
	ld hl, $cc48
	dec [hl]
	jr nz, .asm_229f
	dec hl
	dec [hl]
	jr nz, .asm_229f
	pop hl
	xor a
	jp Func_223f
.asm_229f
	pop hl
.asm_22a0
	ld a, [$cc3e]
	inc a
	jr z, .asm_2284
	ld b, $a
.asm_22a8
	call DelayFrame
	call Func_22c3
	dec b
	jr nz, .asm_22a8
	ld b, $a
.asm_22b3
	call DelayFrame
	call Func_22ed
	dec b
	jr nz, .asm_22b3
	ld a, [$cc3e]
	ld [$cc3d], a
	ret

Func_22c3:: ; 22c3 (0:22c3)
	call asm_22d7
	ld a, [$cc42]
	add $60
	ld [$ffac], a
	ld a, [$ffaa]
	cp $2
	jr nz, asm_22d7
	ld a, $81
	ld [$ff02], a
asm_22d7:: ; 22d7 (0:22d7)
	ld a, [$ffad]
	ld [$cc3d], a
	and $f0
	cp $60
	ret nz
	xor a
	ld [$ffad], a
	ld a, [$cc3d]
	and $f
	ld [$cc3e], a
	ret

Func_22ed:: ; 22ed (0:22ed)
	xor a
	ld [$ffac], a
	ld a, [$ffaa]
	cp $2
	ret nz
	ld a, $81
	ld [$ff02], a
	ret

Func_22fa:: ; 22fa (0:22fa)
	ld a, $2
	ld [$ff01], a
	xor a
	ld [$ffad], a
	ld a, $80
	ld [$ff02], a
	ret

; timer interrupt is apparently not invoked anyway
Timer:: ; 2306 (0:2306)
	reti

Func_2307:: ; 2307 (0:2307)
	call WaitForSoundToFinish
	xor a
	ld c, a
	ld d, a
	ld [$cfca], a
	jr asm_2324

Func_2312:: ; 2312 (0:2312)
	ld c, $a
	ld d, $0
	ld a, [$d72e]
	bit 5, a
	jr z, asm_2324
	xor a
	ld [$cfca], a
	ld c, $8
	ld d, c
asm_2324:: ; 2324 (0:2324)
	ld a, [$d700]
	and a
	jr z, .asm_2343
	cp $2
	jr z, .asm_2332
	ld a, MUSIC_BIKE_RIDING
	jr .asm_2334
.asm_2332
	ld a, MUSIC_SURFING
.asm_2334
	ld b, a
	ld a, d
	and a
	ld a, Bank(Func_7d8ea)
	jr nz, .asm_233e
	ld [$c0ef], a
.asm_233e
	ld [$c0f0], a
	jr .asm_234c
.asm_2343
	ld a, [$d35b]
	ld b, a
	call Func_2385
	jr c, .asm_2351
.asm_234c
	ld a, [$cfca]
	cp b
	ret z
.asm_2351
	ld a, c
	ld [wMusicHeaderPointer], a
	ld a, b
	ld [$cfca], a
	ld [$c0ee], a
	jp PlaySound

Func_235f:: ; 235f (0:235f)
	ld a, [$c0ef]
	ld b, a
	cp $2
	jr nz, .checkForBank08
.bank02
	ld hl, Func_9103
	jr .asm_2378
.checkForBank08
	cp $8
	jr nz, .bank1F
.bank08
	ld hl, Func_21879
	jr .asm_2378
.bank1F
	ld hl, Func_7d177
.asm_2378
	ld c, $6
.asm_237a
	push bc
	push hl
	call Bankswitch
	pop hl
	pop bc
	dec c
	jr nz, .asm_237a
	ret

Func_2385:: ; 2385 (0:2385)
	ld a, [$d35c]
	ld e, a
	ld a, [$c0ef]
	cp e
	jr nz, .asm_2394
	ld [$c0f0], a
	and a
	ret
.asm_2394
	ld a, c
	and a
	ld a, e
	jr nz, .asm_239c
	ld [$c0ef], a
.asm_239c
	ld [$c0f0], a
	scf
	ret

PlayMusic:: ; 23a1 (0:23a1)
	ld b, a
	ld [$c0ee], a
	xor a
	ld [wMusicHeaderPointer], a
	ld a, c
	ld [$c0ef], a
	ld [$c0f0], a
	ld a, b

; plays music specified by a. If value is $ff, music is stopped
PlaySound:: ; 23b1 (0:23b1)
	push hl
	push de
	push bc
	ld b, a
	ld a, [$c0ee]
	and a
	jr z, .asm_23c8
	xor a
	ld [$c02a], a
	ld [$c02b], a
	ld [$c02c], a
	ld [$c02d], a
.asm_23c8
	ld a, [wMusicHeaderPointer]
	and a
	jr z, .asm_23e3
	ld a, [$c0ee]
	and a
	jr z, .asm_2425
	xor a
	ld [$c0ee], a
	ld a, [$cfca]
	cp $ff
	jr nz, .asm_2414
	xor a
	ld [wMusicHeaderPointer], a
.asm_23e3
	xor a
	ld [$c0ee], a
	ld a, [H_LOADEDROMBANK]
	ld [$ffb9], a
	ld a, [$c0ef]
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	cp $2
	jr nz, .checkForBank08
.bank02
	ld a, b
	call Func_9876
	jr .asm_240b
.checkForBank08
	cp $8
	jr nz, .bank1F
.bank08
	ld a, b
	call Func_22035
	jr .asm_240b
.bank1F
	ld a, b
	call Func_7d8ea
.asm_240b
	ld a, [$ffb9]
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	jr .asm_2425
.asm_2414
	ld a, b
	ld [$cfca], a
	ld a, [wMusicHeaderPointer]
	ld [$cfc8], a
	ld [$cfc9], a
	ld a, b
	ld [wMusicHeaderPointer], a
.asm_2425
	pop bc
	pop de
	pop hl
	ret

UpdateSprites:: ; 2429 (0:2429)
	ld a, [$cfcb]
	dec a
	ret nz
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, Bank(_UpdateSprites)
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	call _UpdateSprites
	pop af
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	ret

INCLUDE "data/mart_inventories.asm"

TextScriptEndingChar:: ; 24d6 (0:24d6)
	db "@"
TextScriptEnd:: ; 24d7 (0:24d7)
	ld hl,TextScriptEndingChar
	ret

ExclamationText:: ; 24db (0:24db)
	TX_FAR _ExclamationText
	db "@"

GroundRoseText:: ; 24e0 (0:24e0)
	TX_FAR _GroundRoseText
	db "@"

BoulderText:: ; 24e5 (0:24e5)
	TX_FAR _BoulderText
	db "@"

MartSignText:: ; 24ea (0:24ea)
	TX_FAR _MartSignText
	db "@"

PokeCenterSignText:: ; 24ef (0:24ef)
	TX_FAR _PokeCenterSignText
	db "@"

Predef5CText:: ; 24f4 (0:24f4)
; XXX better label (what does predef $5C do?)
	db $08 ; asm
	ld a, $5c
	call Predef
	jp TextScriptEnd

; bankswitches and runs _UncompressSpriteData
; bank is given in a, sprite input stream is pointed to in W_SPRITEINPUTPTR
UncompressSpriteData:: ; 24fd (0:24fd)
	ld b, a
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, b
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	ld a, $a
	ld [$0], a
	xor a
	ld [$4000], a
	call _UncompressSpriteData
	pop af
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	ret

; initializes necessary data to load a sprite and runs UncompressSpriteDataLoop
_UncompressSpriteData:: ; 251a (0:251a)
	ld hl, S_SPRITEBUFFER1
	ld c, (2*SPRITEBUFFERSIZE) % $100
	ld b, (2*SPRITEBUFFERSIZE) / $100
	xor a
	call FillMemory           ; clear sprite buffer 1 and 2
	ld a, $1
	ld [W_SPRITEINPUTBITCOUNTER], a
	ld a, $3
	ld [W_SPRITEOUTPUTBITOFFSET], a
	xor a
	ld [W_SPRITECURPOSX], a
	ld [W_SPRITECURPOSY], a
	ld [W_SPRITELOADFLAGS], a ; $d0a8
	call ReadNextInputByte    ; first byte of input determines sprite width (high nybble) and height (low nybble) in tiles (8x8 pixels)
	ld b, a
	and $f
	add a
	add a
	add a
	ld [W_SPRITEHEIGHT], a
	ld a, b
	swap a
	and $f
	add a
	add a
	add a
	ld [W_SPRITEWITDH], a
	call ReadNextInputBit
	ld [W_SPRITELOADFLAGS], a ; initialite bit1 to 0 and bit0 to the first input bit
	                          ; this will load two chunks of data to S_SPRITEBUFFER1 and S_SPRITEBUFFER2
	                          ; bit 0 decides in which one the first chunk is placed
	; fall through

; uncompresses a chunk from the sprite input data stream (pointed to at $d0da) into S_SPRITEBUFFER1 or S_SPRITEBUFFER2
; each chunk is a 1bpp sprite. A 2bpp sprite consist of two chunks which are merged afterwards
; note that this is an endless loop which is terminated during a call to MoveToNextBufferPosition by manipulating the stack
UncompressSpriteDataLoop:: ; 2556 (0:2556)
	ld hl, S_SPRITEBUFFER1
	ld a, [W_SPRITELOADFLAGS]  ; $d0a8
	bit 0, a
	jr z, .useSpriteBuffer1    ; check which buffer to use
	ld hl, S_SPRITEBUFFER2
.useSpriteBuffer1
	call StoreSpriteOutputPointer
	ld a, [W_SPRITELOADFLAGS]  ; $d0a8
	bit 1, a
	jr z, .startDecompression  ; check if last iteration
	call ReadNextInputBit      ; if last chunk, read 1-2 bit unpacking mode
	and a
	jr z, .unpackingMode0      ; 0   -> mode 0
	call ReadNextInputBit      ; 1 0 -> mode 1
	inc a                      ; 1 1 -> mode 2
.unpackingMode0
	ld [W_SPRITEUNPACKMODE], a
.startDecompression
	call ReadNextInputBit
	and a
	jr z, .readRLEncodedZeros ; if first bit is 0, the input starts with zeroes, otherwise with (non-zero) input
.readNextInput
	call ReadNextInputBit
	ld c, a
	call ReadNextInputBit
	sla c
	or c                       ; read next two bits into c
	and a
	jr z, .readRLEncodedZeros ; 00 -> RLEncoded zeroes following
	call WriteSpriteBitsToBuffer  ; otherwise write input to output and repeat
	call MoveToNextBufferPosition
	jr .readNextInput
.readRLEncodedZeros
	ld c, $0                   ; number of zeroes it length encoded, the number
.countConsecutiveOnesLoop      ; of consecutive ones determines the number of bits the number has
	call ReadNextInputBit
	and a
	jr z, .countConsecutiveOnesFinished
	inc c
	jr .countConsecutiveOnesLoop
.countConsecutiveOnesFinished
	ld a, c
	add a
	ld hl, LengthEncodingOffsetList
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, [hli]                ; read offset that is added to the number later on
	ld e, a                    ; adding an offset of 2^length - 1 makes every integer uniquely
	ld d, [hl]                 ; representable in the length encoding and saves bits
	push de
	inc c
	ld e, $0
	ld d, e
.readNumberOfZerosLoop        ; reads the next c+1 bits of input
	call ReadNextInputBit
	or e
	ld e, a
	dec c
	jr z, .readNumberOfZerosDone
	sla e
	rl d
	jr .readNumberOfZerosLoop
.readNumberOfZerosDone
	pop hl                     ; add the offset
	add hl, de
	ld e, l
	ld d, h
.writeZerosLoop
	ld b, e
	xor a                      ; write 00 to buffer
	call WriteSpriteBitsToBuffer
	ld e, b
	call MoveToNextBufferPosition
	dec de
	ld a, d
	and a
	jr nz, .continueLoop
	ld a, e
	and a
.continueLoop
	jr nz, .writeZerosLoop
	jr .readNextInput

; moves output pointer to next position
; also cancels the calling function if the all output is done (by removing the return pointer from stack)
; and calls postprocessing functions according to the unpack mode
MoveToNextBufferPosition:: ; 25d8 (0:25d8)
	ld a, [W_SPRITEHEIGHT]
	ld b, a
	ld a, [W_SPRITECURPOSY]
	inc a
	cp b
	jr z, .curColumnDone
	ld [W_SPRITECURPOSY], a
	ld a, [W_SPRITEOUTPUTPTR]
	inc a
	ld [W_SPRITEOUTPUTPTR], a
	ret nz
	ld a, [W_SPRITEOUTPUTPTR+1]
	inc a
	ld [W_SPRITEOUTPUTPTR+1], a
	ret
.curColumnDone
	xor a
	ld [W_SPRITECURPOSY], a
	ld a, [W_SPRITEOUTPUTBITOFFSET]
	and a
	jr z, .bitOffsetsDone
	dec a
	ld [W_SPRITEOUTPUTBITOFFSET], a
	ld hl, W_SPRITEOUTPUTPTRCACHED
	ld a, [hli]
	ld [W_SPRITEOUTPUTPTR], a
	ld a, [hl]
	ld [W_SPRITEOUTPUTPTR+1], a
	ret
.bitOffsetsDone
	ld a, $3
	ld [W_SPRITEOUTPUTBITOFFSET], a
	ld a, [W_SPRITECURPOSX]
	add $8
	ld [W_SPRITECURPOSX], a
	ld b, a
	ld a, [W_SPRITEWITDH]
	cp b
	jr z, .allColumnsDone
	ld a, [W_SPRITEOUTPUTPTR]
	ld l, a
	ld a, [W_SPRITEOUTPUTPTR+1]
	ld h, a
	inc hl
	jp StoreSpriteOutputPointer
.allColumnsDone
	pop hl
	xor a
	ld [W_SPRITECURPOSX], a
	ld a, [W_SPRITELOADFLAGS] ; $d0a8
	bit 1, a
	jr nz, .done            ; test if there is one more sprite to go
	xor $1
	set 1, a
	ld [W_SPRITELOADFLAGS], a ; $d0a8
	jp UncompressSpriteDataLoop
.done
	jp UnpackSprite

; writes 2 bits (from a) to the output buffer (pointed to from W_SPRITEOUTPUTPTR)
WriteSpriteBitsToBuffer:: ; 2649 (0:2649)
	ld e, a
	ld a, [W_SPRITEOUTPUTBITOFFSET]
	and a
	jr z, .offset0
	cp $2
	jr c, .offset1
	jr z, .offset2
	rrc e ; offset 3
	rrc e
	jr .offset0
.offset1
	sla e
	sla e
	jr .offset0
.offset2
	swap e
.offset0
	ld a, [W_SPRITEOUTPUTPTR]
	ld l, a
	ld a, [W_SPRITEOUTPUTPTR+1]
	ld h, a
	ld a, [hl]
	or e
	ld [hl], a
	ret

; reads next bit from input stream and returns it in a
ReadNextInputBit:: ; 2670 (0:2670)
	ld a, [W_SPRITEINPUTBITCOUNTER]
	dec a
	jr nz, .curByteHasMoreBitsToRead
	call ReadNextInputByte
	ld [W_SPRITEINPUTCURBYTE], a
	ld a, $8
.curByteHasMoreBitsToRead
	ld [W_SPRITEINPUTBITCOUNTER], a
	ld a, [W_SPRITEINPUTCURBYTE]
	rlca
	ld [W_SPRITEINPUTCURBYTE], a
	and $1
	ret

; reads next byte from input stream and returns it in a
ReadNextInputByte:: ; 268b (0:268b)
	ld a, [W_SPRITEINPUTPTR]
	ld l, a
	ld a, [W_SPRITEINPUTPTR+1]
	ld h, a
	ld a, [hli]
	ld b, a
	ld a, l
	ld [W_SPRITEINPUTPTR], a
	ld a, h
	ld [W_SPRITEINPUTPTR+1], a
	ld a, b
	ret

; the nth item is 2^n - 1
LengthEncodingOffsetList:: ; 269f (0:269f)
	dw %0000000000000001
	dw %0000000000000011
	dw %0000000000000111
	dw %0000000000001111
	dw %0000000000011111
	dw %0000000000111111
	dw %0000000001111111
	dw %0000000011111111
	dw %0000000111111111
	dw %0000001111111111
	dw %0000011111111111
	dw %0000111111111111
	dw %0001111111111111
	dw %0011111111111111
	dw %0111111111111111
	dw %1111111111111111

; unpacks the sprite data depending on the unpack mode
UnpackSprite:: ; 26bf (0:26bf)
	ld a, [W_SPRITEUNPACKMODE]
	cp $2
	jp z, UnpackSpriteMode2
	and a
	jp nz, XorSpriteChunks
	ld hl, S_SPRITEBUFFER1
	call SpriteDifferentialDecode
	ld hl, S_SPRITEBUFFER2
	; fall through

; decodes differential encoded sprite data
; input bit value 0 preserves the current bit value and input bit value 1 toggles it (starting from initial value 0).
SpriteDifferentialDecode:: ; 26d4 (0:26d4)
	xor a
	ld [W_SPRITECURPOSX], a
	ld [W_SPRITECURPOSY], a
	call StoreSpriteOutputPointer
	ld a, [W_SPRITEFLIPPED]
	and a
	jr z, .notFlipped
	ld hl, DecodeNybble0TableFlipped
	ld de, DecodeNybble1TableFlipped
	jr .storeDecodeTablesPointers
.notFlipped
	ld hl, DecodeNybble0Table
	ld de, DecodeNybble1Table
.storeDecodeTablesPointers
	ld a, l
	ld [W_SPRITEDECODETABLE0PTR], a
	ld a, h
	ld [W_SPRITEDECODETABLE0PTR+1], a
	ld a, e
	ld [W_SPRITEDECODETABLE1PTR], a
	ld a, d
	ld [W_SPRITEDECODETABLE1PTR+1], a
	ld e, $0                          ; last decoded nybble, initialized to 0
.decodeNextByteLoop
	ld a, [W_SPRITEOUTPUTPTR]
	ld l, a
	ld a, [W_SPRITEOUTPUTPTR+1]
	ld h, a
	ld a, [hl]
	ld b, a
	swap a
	and $f
	call DifferentialDecodeNybble     ; decode high nybble
	swap a
	ld d, a
	ld a, b
	and $f
	call DifferentialDecodeNybble     ; decode low nybble
	or d
	ld b, a
	ld a, [W_SPRITEOUTPUTPTR]
	ld l, a
	ld a, [W_SPRITEOUTPUTPTR+1]
	ld h, a
	ld a, b
	ld [hl], a                        ; write back decoded data
	ld a, [W_SPRITEHEIGHT]
	add l                             ; move on to next column
	jr nc, .noCarry
	inc h
.noCarry
	ld [W_SPRITEOUTPUTPTR], a
	ld a, h
	ld [W_SPRITEOUTPUTPTR+1], a
	ld a, [W_SPRITECURPOSX]
	add $8
	ld [W_SPRITECURPOSX], a
	ld b, a
	ld a, [W_SPRITEWITDH]
	cp b
	jr nz, .decodeNextByteLoop        ; test if current row is done
	xor a
	ld e, a
	ld [W_SPRITECURPOSX], a
	ld a, [W_SPRITECURPOSY]           ; move on to next row
	inc a
	ld [W_SPRITECURPOSY], a
	ld b, a
	ld a, [W_SPRITEHEIGHT]
	cp b
	jr z, .done                       ; test if all rows finished
	ld a, [W_SPRITEOUTPUTPTRCACHED]
	ld l, a
	ld a, [W_SPRITEOUTPUTPTRCACHED+1]
	ld h, a
	inc hl
	call StoreSpriteOutputPointer
	jr .decodeNextByteLoop
.done
	xor a
	ld [W_SPRITECURPOSY], a
	ret

; decodes the nybble stored in a. Last decoded data is assumed to be in e (needed to determine if initial value is 0 or 1)
DifferentialDecodeNybble:: ; 276d (0:276d)
	srl a               ; c=a%2, a/=2
	ld c, $0
	jr nc, .evenNumber
	ld c, $1
.evenNumber
	ld l, a
	ld a, [W_SPRITEFLIPPED]
	and a
	jr z, .notFlipped     ; determine if initial value is 0 or one
	bit 3, e              ; if flipped, consider MSB of last data
	jr .selectLookupTable
.notFlipped
	bit 0, e              ; else consider LSB
.selectLookupTable
	ld e, l
	jr nz, .initialValue1 ; load the appropriate table
	ld a, [W_SPRITEDECODETABLE0PTR]
	ld l, a
	ld a, [W_SPRITEDECODETABLE0PTR+1]
	jr .tableLookup
.initialValue1
	ld a, [W_SPRITEDECODETABLE1PTR]
	ld l, a
	ld a, [W_SPRITEDECODETABLE1PTR+1]
.tableLookup
	ld h, a
	ld a, e
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, [hl]
	bit 0, c
	jr nz, .selectLowNybble
	swap a  ; select high nybble
.selectLowNybble
	and $f
	ld e, a ; update last decoded data
	ret

DecodeNybble0Table:: ; 27a7 (0:27a7)
	dn $0, $1
	dn $3, $2
	dn $7, $6
	dn $4, $5
	dn $f, $e
	dn $c, $d
	dn $8, $9
	dn $b, $a
DecodeNybble1Table:: ; 27af (0:27af)
	dn $f, $e
	dn $c, $d
	dn $8, $9
	dn $b, $a
	dn $0, $1
	dn $3, $2
	dn $7, $6
	dn $4, $5
DecodeNybble0TableFlipped:: ; 27b7 (0:27b7)
	dn $0, $8
	dn $c, $4
	dn $e, $6
	dn $2, $a
	dn $f, $7
	dn $3, $b
	dn $1, $9
	dn $d, $5
DecodeNybble1TableFlipped:: ; 27bf (0:27bf)
	dn $f, $7
	dn $3, $b
	dn $1, $9
	dn $d, $5
	dn $0, $8
	dn $c, $4
	dn $e, $6
	dn $2, $a

; combines the two loaded chunks with xor (the chunk loaded second is the destination). The source chunk is differeintial decoded beforehand.
XorSpriteChunks:: ; 27c7 (0:27c7)
	xor a
	ld [W_SPRITECURPOSX], a
	ld [W_SPRITECURPOSY], a
	call ResetSpriteBufferPointers
	ld a, [W_SPRITEOUTPUTPTR]          ; points to buffer 1 or 2, depending on flags
	ld l, a
	ld a, [W_SPRITEOUTPUTPTR+1]
	ld h, a
	call SpriteDifferentialDecode      ; decode buffer 1 or 2, depending on flags
	call ResetSpriteBufferPointers
	ld a, [W_SPRITEOUTPUTPTR]          ; source buffer, points to buffer 1 or 2, depending on flags
	ld l, a
	ld a, [W_SPRITEOUTPUTPTR+1]
	ld h, a
	ld a, [W_SPRITEOUTPUTPTRCACHED]    ; destination buffer, points to buffer 2 or 1, depending on flags
	ld e, a
	ld a, [W_SPRITEOUTPUTPTRCACHED+1]
	ld d, a
.xorChunksLoop
	ld a, [W_SPRITEFLIPPED]
	and a
	jr z, .notFlipped
	push de
	ld a, [de]
	ld b, a
	swap a
	and $f
	call ReverseNybble                 ; if flipped reverse the nybbles in the destination buffer
	swap a
	ld c, a
	ld a, b
	and $f
	call ReverseNybble
	or c
	pop de
	ld [de], a
.notFlipped
	ld a, [hli]
	ld b, a
	ld a, [de]
	xor b
	ld [de], a
	inc de
	ld a, [W_SPRITECURPOSY]
	inc a
	ld [W_SPRITECURPOSY], a             ; go to next row
	ld b, a
	ld a, [W_SPRITEHEIGHT]
	cp b
	jr nz, .xorChunksLoop               ; test if column finished
	xor a
	ld [W_SPRITECURPOSY], a
	ld a, [W_SPRITECURPOSX]
	add $8
	ld [W_SPRITECURPOSX], a             ; go to next column
	ld b, a
	ld a, [W_SPRITEWITDH]
	cp b
	jr nz, .xorChunksLoop               ; test if all columns finished
	xor a
	ld [W_SPRITECURPOSX], a
	ret

; reverses the bits in the nybble given in register a
ReverseNybble:: ; 2837 (0:2837)
	ld de, NybbleReverseTable
	add e
	ld e, a
	jr nc, .asm_283f
	inc d
.asm_283f
	ld a, [de]
	ret

; resets sprite buffer pointers to buffer 1 and 2, depending on W_SPRITELOADFLAGS
ResetSpriteBufferPointers:: ; 2841 (0:2841)
	ld a, [W_SPRITELOADFLAGS] ; $d0a8
	bit 0, a
	jr nz, .buffer2Selected
	ld de, S_SPRITEBUFFER1
	ld hl, S_SPRITEBUFFER2
	jr .storeBufferPointers
.buffer2Selected
	ld de, S_SPRITEBUFFER2
	ld hl, S_SPRITEBUFFER1
.storeBufferPointers
	ld a, l
	ld [W_SPRITEOUTPUTPTR], a
	ld a, h
	ld [W_SPRITEOUTPUTPTR+1], a
	ld a, e
	ld [W_SPRITEOUTPUTPTRCACHED], a
	ld a, d
	ld [W_SPRITEOUTPUTPTRCACHED+1], a
	ret

; maps each nybble to its reverse
NybbleReverseTable:: ; 2867 (0:2867)
	db $0, $8, $4, $c, $2, $a, $6 ,$e, $1, $9, $5, $d, $3, $b, $7 ,$f

; combines the two loaded chunks with xor (the chunk loaded second is the destination). Both chunks are differeintial decoded beforehand.
UnpackSpriteMode2:: ; 2877 (0:2877)
	call ResetSpriteBufferPointers
	ld a, [W_SPRITEFLIPPED]
	push af
	xor a
	ld [W_SPRITEFLIPPED], a            ; temporarily clear flipped flag for decoding the destination chunk
	ld a, [W_SPRITEOUTPUTPTRCACHED]
	ld l, a
	ld a, [W_SPRITEOUTPUTPTRCACHED+1]
	ld h, a
	call SpriteDifferentialDecode
	call ResetSpriteBufferPointers
	pop af
	ld [W_SPRITEFLIPPED], a
	jp XorSpriteChunks

; stores hl into the output pointers
StoreSpriteOutputPointer:: ; 2897 (0:2897)
	ld a, l
	ld [W_SPRITEOUTPUTPTR], a
	ld [W_SPRITEOUTPUTPTRCACHED], a
	ld a, h
	ld [W_SPRITEOUTPUTPTR+1], a
	ld [W_SPRITEOUTPUTPTRCACHED+1], a
	ret

ResetPlayerSpriteData:: ; 28a6 (0:28a6)
	ld hl, wSpriteStateData1
	call ResetPlayerSpriteData_ClearSpriteData
	ld hl, wSpriteStateData2
	call ResetPlayerSpriteData_ClearSpriteData
	ld a, $1
	ld [wSpriteStateData1], a
	ld [$c20e], a
	ld hl, $c104
	ld [hl], $3c     ; set Y screen pos
	inc hl
	inc hl
	ld [hl], $40     ; set X screen pos
	ret

; overwrites sprite data with zeroes
ResetPlayerSpriteData_ClearSpriteData:: ; 28c4 (0:28c4)
	ld bc, $10
	xor a
	jp FillMemory

Func_28cb:: ; 28cb (0:28cb)
	ld a, [wMusicHeaderPointer]
	and a
	jr nz, .asm_28dc
	ld a, [$d72c]
	bit 1, a
	ret nz
	ld a, $77
	ld [$ff24], a
	ret
.asm_28dc
	ld a, [$cfc9]
	and a
	jr z, .asm_28e7
	dec a
	ld [$cfc9], a
	ret
.asm_28e7
	ld a, [$cfc8]
	ld [$cfc9], a
	ld a, [$ff24]
	and a
	jr z, .asm_2903
	ld b, a
	and $f
	dec a
	ld c, a
	ld a, b
	and $f0
	swap a
	dec a
	swap a
	or c
	ld [$ff24], a
	ret
.asm_2903
	ld a, [wMusicHeaderPointer]
	ld b, a
	xor a
	ld [wMusicHeaderPointer], a
	ld a, $ff
	ld [$c0ee], a
	call PlaySound
	ld a, [$c0f0]
	ld [$c0ef], a
	ld a, b
	ld [$c0ee], a
	jp PlaySound

; this function is used to display sign messages, sprite dialog, etc.
; INPUT: [$ff8c] = sprite ID or text ID
DisplayTextID:: ; 2920 (0:2920)
	ld a,[H_LOADEDROMBANK]
	push af
	callba DisplayTextIDInit ; initialization
	ld hl,$cf11
	bit 0,[hl]
	res 0,[hl]
	jr nz,.skipSwitchToMapBank
	ld a,[W_CURMAP]
	call SwitchToMapRomBank
.skipSwitchToMapBank
	ld a,30 ; half a second
	ld [H_FRAMECOUNTER],a ; used as joypad poll timer
	ld hl,W_MAPTEXTPTR
	ld a,[hli]
	ld h,[hl]
	ld l,a ; hl = map text pointer
	ld d,$00
	ld a,[$ff8c] ; text ID
	ld [$cf13],a
	and a
	jp z,DisplayStartMenu
	cp a,$d3 ; safari game over
	jp z,DisplaySafariGameOverText
	cp a,$d0 ; fainted
	jp z,DisplayPokemonFaintedText
	cp a,$d1 ; blacked out
	jp z,DisplayPlayerBlackedOutText
	cp a,$d2 ; repel wore off
	jp z,DisplayRepelWoreOffText
	ld a,[$d4e1] ; number of sprites
	ld e,a
	ld a,[$ff8c] ; sprite ID
	cp e
	jr z,.spriteHandling
	jr nc,.skipSpriteHandling
.spriteHandling
; get the text ID of the sprite
	push hl
	push de
	push bc
	callba Func_13074 ; update the graphics of the sprite the player is talking to (to face the right direction)
	pop bc
	pop de
	ld hl,W_MAPSPRITEDATA ; NPC text entries
	ld a,[$ff8c]
	dec a
	add a
	add l
	ld l,a
	jr nc,.noCarry
	inc h
.noCarry
	inc hl
	ld a,[hl] ; a = text ID of the sprite
	pop hl
.skipSpriteHandling
; look up the address of the text in the map's text entries
	dec a
	ld e,a
	sla e
	add hl,de
	ld a,[hli]
	ld h,[hl]
	ld l,a ; hl = address of the text
	ld a,[hl] ; a = first byte of text
; check first byte of text for special cases
	cp a,$fe   ; Pokemart NPC
	jp z,DisplayPokemartDialogue
	cp a,$ff   ; Pokemon Center NPC
	jp z,DisplayPokemonCenterDialogue
	cp a,$fc   ; Item Storage PC
	jp z,FuncTX_ItemStoragePC
	cp a,$fd   ; Bill's PC
	jp z,FuncTX_BillsPC
	cp a,$f9   ; Pokemon Center PC
	jp z,FuncTX_PokemonCenterPC
	cp a,$f5   ; Vending Machine
	jr nz,.notVendingMachine
	callba VendingMachineMenu 	; jump banks to vending machine routine
	jr AfterDisplayingTextID
.notVendingMachine
	cp a,$f7   ; slot machine
	jp z,FuncTX_SlotMachine
	cp a,$f6   ; cable connection NPC in Pokemon Center
	jr nz,.notSpecialCase
	callab CableClubNPC
	jr AfterDisplayingTextID
.notSpecialCase
	call Func_3c59 ; display the text
	ld a,[$cc3c]
	and a
	jr nz,HoldTextDisplayOpen

AfterDisplayingTextID:: ; 29d6 (0:29d6)
	ld a,[$cc47]
	and a
	jr nz,HoldTextDisplayOpen
	call WaitForTextScrollButtonPress ; wait for a button press after displaying all the text

; loop to hold the dialogue box open as long as the player keeps holding down the A button
HoldTextDisplayOpen:: ; 29df (0:29df)
	call GetJoypadState
	ld a,[H_CURRENTPRESSEDBUTTONS]
	bit 0,a ; is the A button being pressed?
	jr nz,HoldTextDisplayOpen

CloseTextDisplay:: ; 29e8 (0:29e8)
	ld a,[W_CURMAP]
	call SwitchToMapRomBank
	ld a,$90
	ld [$ffb0],a ; move the window off the screen
	call DelayFrame
	call LoadGBPal
	xor a
	ld [H_AUTOBGTRANSFERENABLED],a ; disable continuous WRAM to VRAM transfer each V-blank
; loop to make sprites face the directions they originally faced before the dialogue
	ld hl,$c219
	ld c,$0f
	ld de,$0010
.restoreSpriteFacingDirectionLoop
	ld a,[hl]
	dec h
	ld [hl],a
	inc h
	add hl,de
	dec c
	jr nz,.restoreSpriteFacingDirectionLoop
	ld a,BANK(InitMapSprites)
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	call InitMapSprites ; reload sprite tile pattern data (since it was partially overwritten by text tile patterns)
	ld hl,$cfc4
	res 0,[hl]
	ld a,[$d732]
	bit 3,a
	call z,LoadPlayerSpriteGraphics
	call LoadCurrentMapView
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	jp UpdateSprites ; move sprites

DisplayPokemartDialogue:: ; 2a2e (0:2a2e)
	push hl
	ld hl,PokemartGreetingText
	call PrintText
	pop hl
	inc hl
	call LoadItemList
	ld a,$02
	ld [$cf94],a ; selects between subtypes of menus
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,Bank(DisplayPokemartDialogue_)
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	call DisplayPokemartDialogue_
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	jp AfterDisplayingTextID

PokemartGreetingText:: ; 2a55 (0:2a55)
	TX_FAR _PokemartGreetingText
	db "@"

LoadItemList:: ; 2a5a (0:2a5a)
	ld a,$01
	ld [$cfcb],a
	ld a,h
	ld [$d128],a
	ld a,l
	ld [$d129],a
	ld de,$cf7b
.loop
	ld a,[hli]
	ld [de],a
	inc de
	cp a,$ff
	jr nz,.loop
	ret

DisplayPokemonCenterDialogue:: ; 2a72 (0:2a72)
	xor a
	ld [$ff8b],a
	ld [$ff8c],a
	ld [$ff8d],a
	inc hl
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,Bank(DisplayPokemonCenterDialogue_)
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	call DisplayPokemonCenterDialogue_
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	jp AfterDisplayingTextID

DisplaySafariGameOverText:: ; 2a90 (0:2a90)
	callab PrintSafariGameOverText
	jp AfterDisplayingTextID

DisplayPokemonFaintedText:: ; 2a9b (0:2a9b)
	ld hl,PokemonFaintedText
	call PrintText
	jp AfterDisplayingTextID

PokemonFaintedText:: ; 2aa4 (0:2aa4)
	TX_FAR _PokemonFaintedText
	db "@"

DisplayPlayerBlackedOutText:: ; 2aa9 (0:2aa9)
	ld hl,PlayerBlackedOutText
	call PrintText
	ld a,[$d732]
	res 5,a
	ld [$d732],a
	jp HoldTextDisplayOpen

PlayerBlackedOutText:: ; 2aba (0:2aba)
	TX_FAR _PlayerBlackedOutText
	db "@"

DisplayRepelWoreOffText:: ; 2abf (0:2abf)
	ld hl,RepelWoreOffText
	call PrintText
	jp AfterDisplayingTextID

RepelWoreOffText:: ; 2ac8 (0:2ac8)
	TX_FAR _RepelWoreOffText
	db "@"

INCLUDE "engine/menu/start_menu.asm"

; function to count how many bits are set in a string of bytes
; INPUT:
; hl = address of string of bytes
; b = length of string of bytes
; OUTPUT:
; [$D11E] = number of set bits
CountSetBits:: ; 2b7f (0:2b7f)
	ld c,0
.loop
	ld a,[hli]
	ld e,a
	ld d,8
.innerLoop ; count how many bits are set in the current byte
	srl e
	ld a,0
	adc c
	ld c,a
	dec d
	jr nz,.innerLoop
	dec b
	jr nz,.loop
	ld a,c
	ld [$d11e],a ; store number of set bits
	ret

; subtracts the amount the player paid from their money
; sets carry flag if there is enough money and unsets carry flag if not
SubtractAmountPaidFromMoney:: ; 2b96 (0:2b96)
	ld b,BANK(SubtractAmountPaidFromMoney_)
	ld hl,SubtractAmountPaidFromMoney_
	jp Bankswitch

; adds the amount the player sold to their money
AddAmountSoldToMoney:: ; 2b9e (0:2b9e)
	ld de,wPlayerMoney + 2
	ld hl,$ffa1 ; total price of items
	ld c,3 ; length of money in bytes
	ld a,$0b
	call Predef ; add total price to money
	ld a,$13
	ld [$d125],a
	call DisplayTextBoxID ; redraw money text box
	ld a, (SFX_02_5a - SFX_Headers_02) / 3
	call PlaySoundWaitForCurrent ; play sound
	jp WaitForSoundToFinish ; wait until sound is done playing

; function to remove an item (in varying quantities) from the player's bag or PC box
; INPUT:
; HL = address of inventory (either wNumBagItems or wNumBoxItems)
; [$CF92] = index (within the inventory) of the item to remove
; [$CF96] = quantity to remove
RemoveItemFromInventory:: ; 2bbb (0:2bbb)
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,BANK(RemoveItemFromInventory_)
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	call RemoveItemFromInventory_
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

; function to add an item (in varying quantities) to the player's bag or PC box
; INPUT:
; HL = address of inventory (either wNumBagItems or wNumBoxItems)
; [$CF91] = item ID
; [$CF96] = item quantity
; sets carry flag if successful, unsets carry flag if unsuccessful
AddItemToInventory:: ; 2bcf (0:2bcf)
	push bc
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,BANK(AddItemToInventory_)
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	call AddItemToInventory_
	pop bc
	ld a,b
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	pop bc
	ret

; INPUT:
; [wListMenuID] = list menu ID
; [$cf8b] = address of the list (2 bytes)
DisplayListMenuID:: ; 2be6 (0:2be6)
	xor a
	ld [H_AUTOBGTRANSFERENABLED],a ; disable auto-transfer
	ld a,1
	ld [$ffb7],a ; joypad state update flag
	ld a,[W_BATTLETYPE]
	and a ; is it the Old Man battle?
	jr nz,.specialBattleType
	ld a,$01 ; hardcoded bank
	jr .bankswitch
.specialBattleType ; Old Man battle
	ld a, Bank(OldManItemList)
.bankswitch
	call BankswitchHome
	ld hl,$d730
	set 6,[hl] ; turn off letter printing delay
	xor a
	ld [$cc35],a ; 0 means no item is currently being swapped
	ld [$d12a],a
	ld a,[$cf8b]
	ld l,a
	ld a,[$cf8c]
	ld h,a ; hl = address of the list
	ld a,[hl]
	ld [$d12a],a ; [$d12a] = number of list entries
	ld a,$0d ; list menu text box ID
	ld [$d125],a
	call DisplayTextBoxID ; draw the menu text box
	call UpdateSprites ; move sprites
	FuncCoord 4,2 ; coordinates of upper left corner of menu text box
	ld hl,Coord
	ld de,$090e ; height and width of menu text box
	ld a,[wListMenuID]
	and a ; is it a PC pokemon list?
	jr nz,.skipMovingSprites
	call UpdateSprites ; move sprites
.skipMovingSprites
	ld a,1 ; max menu item ID is 1 if the list has less than 2 entries
	ld [$cc37],a
	ld a,[$d12a]
	cp a,2 ; does the list have less than 2 entries?
	jr c,.setMenuVariables
	ld a,2 ; max menu item ID is 2 if the list has at least 2 entries
.setMenuVariables
	ld [wMaxMenuItem],a
	ld a,4
	ld [wTopMenuItemY],a
	ld a,5
	ld [wTopMenuItemX],a
	ld a,%00000111 ; A button, B button, Select button
	ld [wMenuWatchedKeys],a
	ld c,10
	call DelayFrames

DisplayListMenuIDLoop:: ; 2c53 (0:2c53)
	xor a
	ld [H_AUTOBGTRANSFERENABLED],a ; disable transfer
	call PrintListMenuEntries
	ld a,1
	ld [H_AUTOBGTRANSFERENABLED],a ; enable transfer
	call Delay3
	ld a,[W_BATTLETYPE]
	and a ; is it the Old Man battle?
	jr z,.notOldManBattle
.oldManBattle
	ld a,"▶"
	FuncCoord 5,4
	ld [Coord],a ; place menu cursor in front of first menu entry
	ld c,80
	call DelayFrames
	xor a
	ld [wCurrentMenuItem],a
	ld hl,Coord
	ld a,l
	ld [wMenuCursorLocation],a
	ld a,h
	ld [wMenuCursorLocation + 1],a
	jr .buttonAPressed
.notOldManBattle
	call LoadGBPal
	call HandleMenuInput
	push af
	call PlaceMenuCursor
	pop af
	bit 0,a ; was the A button pressed?
	jp z,.checkOtherKeys
.buttonAPressed
	ld a,[wCurrentMenuItem]
	call PlaceUnfilledArrowMenuCursor
	ld a,$01
	ld [$d12e],a
	ld [$d12d],a
	xor a
	ld [$cc37],a
	ld a,[wCurrentMenuItem]
	ld c,a
	ld a,[wListScrollOffset]
	add c
	ld c,a
	ld a,[$d12a] ; number of list entries
	and a ; is the list empty?
	jp z,ExitListMenu ; if so, exit the menu
	dec a
	cp c ; did the player select Cancel?
	jp c,ExitListMenu ; if so, exit the menu
	ld a,c
	ld [wWhichPokemon],a
	ld a,[wListMenuID]
	cp a,ITEMLISTMENU
	jr nz,.skipMultiplying
; if it's an item menu
	sla c ; item entries are 2 bytes long, so multiply by 2
.skipMultiplying
	ld a,[$cf8b]
	ld l,a
	ld a,[$cf8c]
	ld h,a
	inc hl ; hl = beginning of list entries
	ld b,0
	add hl,bc
	ld a,[hl]
	ld [$cf91],a
	ld a,[wListMenuID]
	and a ; is it a PC pokemon list?
	jr z,.pokemonList
	push hl
	call GetItemPrice
	pop hl
	ld a,[wListMenuID]
	cp a,ITEMLISTMENU
	jr nz,.skipGettingQuantity
; if it's an item menu
	inc hl
	ld a,[hl] ; a = item quantity
	ld [$cf97],a
.skipGettingQuantity
	ld a,[$cf91]
	ld [$d0b5],a
	ld a,$01
	ld [$d0b7],a
	call GetName
	jr .storeChosenEntry
.pokemonList
	ld hl,W_NUMINPARTY
	ld a,[$cf8b]
	cp l ; is it a list of party pokemon or box pokemon?
	ld hl,W_PARTYMON1NAME
	jr z,.getPokemonName
	ld hl, W_BOXMON1NAME ; box pokemon names
.getPokemonName
	ld a,[wWhichPokemon]
	call GetPartyMonName
.storeChosenEntry ; store the menu entry that the player chose and return
	ld de,$cd6d
	call CopyStringToCF4B ; copy name to $cf4b
	ld a,$01
	ld [$d12e],a
	ld a,[wCurrentMenuItem]
	ld [$d12d],a
	xor a
	ld [$ffb7],a ; joypad state update flag
	ld hl,$d730
	res 6,[hl] ; turn on letter printing delay
	jp BankswitchBack
.checkOtherKeys ; check B, SELECT, Up, and Down keys
	bit 1,a ; was the B button pressed?
	jp nz,ExitListMenu ; if so, exit the menu
	bit 2,a ; was the select button pressed?
	jp nz,HandleItemListSwapping ; if so, allow the player to swap menu entries
	ld b,a
	bit 7,b ; was Down pressed?
	ld hl,wListScrollOffset
	jr z,.upPressed
.downPressed
	ld a,[hl]
	add a,3
	ld b,a
	ld a,[$d12a] ; number of list entries
	cp b ; will going down scroll past the Cancel button?
	jp c,DisplayListMenuIDLoop
	inc [hl] ; if not, go down
	jp DisplayListMenuIDLoop
.upPressed
	ld a,[hl]
	and a
	jp z,DisplayListMenuIDLoop
	dec [hl]
	jp DisplayListMenuIDLoop

DisplayChooseQuantityMenu:: ; 2d57 (0:2d57)
; text box dimensions/coordinates for just quantity
	FuncCoord 15,9
	ld hl,Coord
	ld b,1 ; height
	ld c,3 ; width
	ld a,[wListMenuID]
	cp a,PRICEDITEMLISTMENU
	jr nz,.drawTextBox
; text box dimensions/coordinates for quantity and price
	FuncCoord 7,9
	ld hl,Coord
	ld b,1  ; height
	ld c,11 ; width
.drawTextBox
	call TextBoxBorder
	FuncCoord 16,10
	ld hl,Coord
	ld a,[wListMenuID]
	cp a,PRICEDITEMLISTMENU
	jr nz,.printInitialQuantity
	FuncCoord 8,10
	ld hl,Coord
.printInitialQuantity
	ld de,InitialQuantityText
	call PlaceString
	xor a
	ld [$cf96],a ; initialize current quantity to 0
	jp .incrementQuantity
.waitForKeyPressLoop
	call GetJoypadStateLowSensitivity
	ld a,[H_NEWLYPRESSEDBUTTONS] ; newly pressed buttons
	bit 0,a ; was the A button pressed?
	jp nz,.buttonAPressed
	bit 1,a ; was the B button pressed?
	jp nz,.buttonBPressed
	bit 6,a ; was Up pressed?
	jr nz,.incrementQuantity
	bit 7,a ; was Down pressed?
	jr nz,.decrementQuantity
	jr .waitForKeyPressLoop
.incrementQuantity
	ld a,[$cf97] ; max quantity
	inc a
	ld b,a
	ld hl,$cf96 ; current quantity
	inc [hl]
	ld a,[hl]
	cp b
	jr nz,.handleNewQuantity
; wrap to 1 if the player goes above the max quantity
	ld a,1
	ld [hl],a
	jr .handleNewQuantity
.decrementQuantity
	ld hl,$cf96 ; current quantity
	dec [hl]
	jr nz,.handleNewQuantity
; wrap to the max quantity if the player goes below 1
	ld a,[$cf97] ; max quantity
	ld [hl],a
.handleNewQuantity
	FuncCoord 17,10
	ld hl,Coord
	ld a,[wListMenuID]
	cp a,PRICEDITEMLISTMENU
	jr nz,.printQuantity
.printPrice
	ld c,$03
	ld a,[$cf96]
	ld b,a
	ld hl,$ff9f ; total price
; initialize total price to 0
	xor a
	ld [hli],a
	ld [hli],a
	ld [hl],a
.addLoop ; loop to multiply the individual price by the quantity to get the total price
	ld de,$ffa1
	ld hl,$ff8d
	push bc
	ld a,$0b
	call Predef ; add the individual price to the current sum
	pop bc
	dec b
	jr nz,.addLoop
	ld a,[$ff8e]
	and a ; should the price be halved (for selling items)?
	jr z,.skipHalvingPrice
	xor a
	ld [$ffa2],a
	ld [$ffa3],a
	ld a,$02
	ld [$ffa4],a
	ld a,$0d
	call Predef ; halves the price
; store the halved price
	ld a,[$ffa2]
	ld [$ff9f],a
	ld a,[$ffa3]
	ld [$ffa0],a
	ld a,[$ffa4]
	ld [$ffa1],a
.skipHalvingPrice
	FuncCoord 12,10
	ld hl,Coord
	ld de,SpacesBetweenQuantityAndPriceText
	call PlaceString
	ld de,$ff9f ; total price
	ld c,$a3
	call PrintBCDNumber
	FuncCoord 9,10
	ld hl,Coord
.printQuantity
	ld de,$cf96 ; current quantity
	ld bc,$8102 ; print leading zeroes, 1 byte, 2 digits
	call PrintNumber
	jp .waitForKeyPressLoop
.buttonAPressed ; the player chose to make the transaction
	xor a
	ld [$cc35],a ; 0 means no item is currently being swapped
	ret
.buttonBPressed ; the player chose to cancel the transaction
	xor a
	ld [$cc35],a ; 0 means no item is currently being swapped
	ld a,$ff
	ret

InitialQuantityText:: ; 2e30 (0:2e30)
	db "×01@"

SpacesBetweenQuantityAndPriceText:: ; 2e34 (0:2e34)
	db "      @"

ExitListMenu:: ; 2e3b (0:2e3b)
	ld a,[wCurrentMenuItem]
	ld [$d12d],a
	ld a,$02
	ld [$d12e],a
	ld [$cc37],a
	xor a
	ld [$ffb7],a
	ld hl,$d730
	res 6,[hl]
	call BankswitchBack
	xor a
	ld [$cc35],a ; 0 means no item is currently being swapped
	scf
	ret

PrintListMenuEntries:: ; 2e5a (0:2e5a)
	FuncCoord 5, 3 ; $c3e1
	ld hl,Coord
	ld b,$09
	ld c,$0e
	call ClearScreenArea
	ld a,[$cf8b]
	ld e,a
	ld a,[$cf8c]
	ld d,a
	inc de ; de = beginning of list entries
	ld a,[wListScrollOffset]
	ld c,a
	ld a,[wListMenuID]
	cp a,ITEMLISTMENU
	ld a,c
	jr nz,.skipMultiplying
; if it's an item menu
; item entries are 2 bytes long, so multiply by 2
	sla a
	sla c
.skipMultiplying
	add e
	ld e,a
	jr nc,.noCarry
	inc d
.noCarry
	FuncCoord 6,4 ; coordinates of first list entry name
	ld hl,Coord
	ld b,4 ; print 4 names
.loop
	ld a,b
	ld [wWhichPokemon],a
	ld a,[de]
	ld [$d11e],a
	cp a,$ff
	jp z,.printCancelMenuItem
	push bc
	push de
	push hl
	push hl
	push de
	ld a,[wListMenuID]
	and a
	jr z,.pokemonPCMenu
	cp a,$01
	jr z,.movesMenu
.itemMenu
	call GetItemName
	jr .placeNameString
.pokemonPCMenu
	push hl
	ld hl,W_NUMINPARTY
	ld a,[$cf8b]
	cp l ; is it a list of party pokemon or box pokemon?
	ld hl,W_PARTYMON1NAME
	jr z,.getPokemonName
	ld hl, W_BOXMON1NAME ; box pokemon names
.getPokemonName
	ld a,[wWhichPokemon]
	ld b,a
	ld a,4
	sub b
	ld b,a
	ld a,[wListScrollOffset]
	add b
	call GetPartyMonName
	pop hl
	jr .placeNameString
.movesMenu
	call GetMoveName
.placeNameString
	call PlaceString
	pop de
	pop hl
	ld a,[$cf93]
	and a ; should prices be printed?
	jr z,.skipPrintingItemPrice
.printItemPrice
	push hl
	ld a,[de]
	ld de,ItemPrices
	ld [$cf91],a
	call GetItemPrice ; get price
	pop hl
	ld bc,20 + 5 ; 1 row down and 5 columns right
	add hl,bc
	ld c,$a3 ; no leading zeroes, right-aligned, print currency symbol, 3 bytes
	call PrintBCDNumber
.skipPrintingItemPrice
	ld a,[wListMenuID]
	and a
	jr nz,.skipPrintingPokemonLevel
.printPokemonLevel
	ld a,[$d11e]
	push af
	push hl
	ld hl,W_NUMINPARTY
	ld a,[$cf8b]
	cp l ; is it a list of party pokemon or box pokemon?
	ld a,$00
	jr z,.next
	ld a,$02
.next
	ld [$cc49],a
	ld hl,wWhichPokemon
	ld a,[hl]
	ld b,a
	ld a,$04
	sub b
	ld b,a
	ld a,[wListScrollOffset]
	add b
	ld [hl],a
	call LoadMonData ; load pokemon info
	ld a,[$cc49]
	and a ; is it a list of party pokemon or box pokemon?
	jr z,.skipCopyingLevel
.copyLevel
	ld a,[$cf9b]
	ld [$cfb9],a
.skipCopyingLevel
	pop hl
	ld bc,$001c
	add hl,bc
	call PrintLevel ; print level
	pop af
	ld [$d11e],a
.skipPrintingPokemonLevel
	pop hl
	pop de
	inc de
	ld a,[wListMenuID]
	cp a,ITEMLISTMENU
	jr nz,.nextListEntry
.printItemQuantity
	ld a,[$d11e]
	ld [$cf91],a
	call IsKeyItem ; check if item is unsellable
	ld a,[$d124]
	and a ; is the item unsellable?
	jr nz,.skipPrintingItemQuantity ; if so, don't print the quantity
	push hl
	ld bc,20 + 8 ; 1 row down and 8 columns right
	add hl,bc
	ld a,"×"
	ldi [hl],a
	ld a,[$d11e]
	push af
	ld a,[de]
	ld [$cf97],a
	push de
	ld de,$d11e
	ld [de],a
	ld bc,$0102
	call PrintNumber
	pop de
	pop af
	ld [$d11e],a
	pop hl
.skipPrintingItemQuantity
	inc de
	pop bc
	inc c
	push bc
	inc c
	ld a,[$cc35] ; ID of item chosen for swapping (counts from 1)
	and a ; is an item being swapped?
	jr z,.nextListEntry
	sla a
	cp c ; is it this item?
	jr nz,.nextListEntry
	dec hl
	ld a,$ec ; unfilled right arrow menu cursor to indicate an item being swapped
	ld [hli],a
.nextListEntry
	ld bc,2 * 20 ; 2 rows
	add hl,bc
	pop bc
	inc c
	dec b
	jp nz,.loop
	ld bc,-8
	add hl,bc
	ld a,$ee ; down arrow
	ld [hl],a
	ret
.printCancelMenuItem
	ld de,ListMenuCancelText
	jp PlaceString

ListMenuCancelText:: ; 2f97 (0:2f97)
	db "CANCEL@"

GetMonName:: ; 2f9e (0:2f9e)
	push hl
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,BANK(MonsterNames) ; 07
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ld a,[$d11e]
	dec a
	ld hl,MonsterNames ; 421E
	ld c,10
	ld b,0
	call AddNTimes
	ld de,$cd6d
	push de
	ld bc,10
	call CopyData
	ld hl,$cd77
	ld [hl], "@"
	pop de
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	pop hl
	ret

GetItemName:: ; 2fcf (0:2fcf)
; given an item ID at [$D11E], store the name of the item into a string
;     starting at $CD6D
	push hl
	push bc
	ld a,[$D11E]
	cp HM_01 ; is this a TM/HM?
	jr nc,.Machine

	ld [$D0B5],a
	ld a,ITEM_NAME
	ld [W_LISTTYPE],a
	ld a,BANK(ItemNames)
	ld [$D0B7],a
	call GetName
	jr .Finish

.Machine
	call GetMachineName
.Finish
	ld de,$CD6D ; pointer to where item name is stored in RAM
	pop bc
	pop hl
	ret

GetMachineName:: ; 2ff3 (0:2ff3)
; copies the name of the TM/HM in [$D11E] to $CD6D
	push hl
	push de
	push bc
	ld a,[$D11E]
	push af
	cp TM_01 ; is this a TM? [not HM]
	jr nc,.WriteTM
; if HM, then write "HM" and add 5 to the item ID, so we can reuse the
; TM printing code
	add 5
	ld [$D11E],a
	ld hl,HiddenPrefix ; points to "HM"
	ld bc,2
	jr .WriteMachinePrefix
.WriteTM
	ld hl,TechnicalPrefix ; points to "TM"
	ld bc,2
.WriteMachinePrefix
	ld de,$CD6D
	call CopyData

; now get the machine number and convert it to text
	ld a,[$D11E]
	sub TM_01 - 1
	ld b,$F6 ; "0"
.FirstDigit
	sub 10
	jr c,.SecondDigit
	inc b
	jr .FirstDigit
.SecondDigit
	add 10
	push af
	ld a,b
	ld [de],a
	inc de
	pop af
	ld b,$F6 ; "0"
	add b
	ld [de],a
	inc de
	ld a,"@"
	ld [de],a

	pop af
	ld [$D11E],a
	pop bc
	pop de
	pop hl
	ret

TechnicalPrefix:: ; 303c (0:303c)
	db "TM"
HiddenPrefix:: ; 303e (0:303e)
	db "HM"

; sets carry if item is HM, clears carry if item is not HM
; Input: a = item ID
IsItemHM:: ; 3040 (0:3040)
	cp a,HM_01
	jr c,.notHM
	cp a,TM_01
	ret
.notHM
	and a
	ret

; sets carry if move is an HM, clears carry if move is not an HM
; Input: a = move ID
IsMoveHM:: ; 3049 (0:3049)
	ld hl,HMMoves
	ld de,1
	jp IsInArray

HMMoves:: ; 3052 (0:3052)
	db CUT,FLY,SURF,STRENGTH,FLASH
	db $ff ; terminator

GetMoveName:: ; 3058 (0:3058)
	push hl
	ld a,MOVE_NAME
	ld [W_LISTTYPE],a
	ld a,[$d11e]
	ld [$d0b5],a
	ld a,BANK(MoveNames)
	ld [$d0b7],a
	call GetName
	ld de,$cd6d ; pointer to where move name is stored in RAM
	pop hl
	ret

; reloads text box tile patterns, current map view, and tileset tile patterns
ReloadMapData:: ; 3071 (0:3071)
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,[W_CURMAP]
	call SwitchToMapRomBank
	call DisableLCD
	call LoadTextBoxTilePatterns
	call LoadCurrentMapView
	call LoadTilesetTilePatternData
	call EnableLCD
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

; reloads tileset tile patterns
ReloadTilesetTilePatterns:: ; 3090 (0:3090)
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,[W_CURMAP]
	call SwitchToMapRomBank
	call DisableLCD
	call LoadTilesetTilePatternData
	call EnableLCD
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

; shows the town map and lets the player choose a destination to fly to
ChooseFlyDestination:: ; 30a9 (0:30a9)
	ld hl,$d72e
	res 4,[hl]
	ld b, BANK(LoadTownMap_Fly)
	ld hl, LoadTownMap_Fly
	jp Bankswitch

; causes the text box to close waithout waiting for a button press after displaying text
DisableWaitingAfterTextDisplay:: ; 30b6 (0:30b6)
	ld a,$01
	ld [$cc3c],a
	ret

; uses an item
; UseItem is used with dummy items to perform certain other functions as well
; INPUT:
; [$cf91] = item ID
; OUTPUT:
; [$cd6a] = success
; 00: unsucessful
; 01: successful
; 02: not able to be used right now, no extra menu displayed (only certain items use this)
UseItem:: ; 30bc (0:30bc)
	ld b,BANK(UseItem_)
	ld hl,UseItem_
	jp Bankswitch

; confirms the item toss and then tosses the item
; INPUT:
; hl = address of inventory (either wNumBagItems or wNumBoxItems)
; [$cf91] = item ID
; [$cf92] = index of item within inventory
; [$cf96] = quantity to toss
; OUTPUT:
; clears carry flag if the item is tossed, sets carry flag if not
TossItem:: ; 30c4 (0:30c4)
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,BANK(TossItem_)
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	call TossItem_
	pop de
	ld a,d
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

; checks if an item is a key item
; INPUT:
; [$cf91] = item ID
; OUTPUT:
; [$d124] = result
; 00: item is not key item
; 01: item is key item
IsKeyItem:: ; 30d9 (0:30d9)
	push hl
	push de
	push bc
	callba IsKeyItem_
	pop bc
	pop de
	pop hl
	ret

; function to draw various text boxes
; INPUT:
; [$D125] = text box ID
DisplayTextBoxID:: ; 30e8 (0:30e8)
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,BANK(DisplayTextBoxID_)
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	call DisplayTextBoxID_
	pop bc
	ld a,b
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

Func_30fd:: ; 30fd (0:30fd)
	ld a, [$cc57]
	and a
	ret nz
	ld a, [$d736]
	bit 1, a
	ret nz
	ld a, [$d730]
	and $80
	ret

Func_310e:: ; 310e (0:310e)
	ld hl, $d736
	bit 0, [hl]
	res 0, [hl]
	jr nz, .asm_3146
	ld a, [$cc57]
	and a
	ret z
	dec a
	add a
	ld d, $0
	ld e, a
	ld hl, .pointerTable_3140
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, [$cc58]
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	ld a, [$cf10]
	call CallFunctionInTable
	pop af
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	ret
.pointerTable_3140
	dw PointerTable_1a442
	dw PointerTable_1a510
	dw PointerTable_1a57d
.asm_3146
	ld b, BANK(Func_1a3e0)
	ld hl, Func_1a3e0
	jp Bankswitch

Func_314e:: ; 314e (0:314e)
	ld b, BANK(Func_1a41d)
	ld hl, Func_1a41d
	jp Bankswitch

Func_3156:: ; 3156 (0:3156)
	ret

; stores hl in [W_TRAINERHEADERPTR]
StoreTrainerHeaderPointer:: ; 3157 (0:3157)
	ld a, h
	ld [W_TRAINERHEADERPTR], a
	ld a, l
	ld [W_TRAINERHEADERPTR+1], a
	ret

; executes the current map script from the function pointer array provided in hl.
; a: map script index to execute (unless overridden by [$d733] bit 4)
ExecuteCurMapScriptInTable:: ; 3160 (0:3160)
	push af
	push de
	call StoreTrainerHeaderPointer
	pop hl
	pop af
	push hl
	ld hl, W_FLAGS_D733
	bit 4, [hl]
	res 4, [hl]
	jr z, .useProvidedIndex   ; test if map script index was overridden manually
	ld a, [W_CURMAPSCRIPT]
.useProvidedIndex
	pop hl
	ld [W_CURMAPSCRIPT], a
	call CallFunctionInTable
	ld a, [W_CURMAPSCRIPT]
	ret

LoadGymLeaderAndCityName:: ; 317f (0:317f)
	push de
	ld de, wGymCityName
	ld bc, $11
	call CopyData   ; load city name
	pop hl
	ld de, wGymLeaderName
	ld bc, $b
	jp CopyData     ; load gym leader name

; reads specific information from trainer header (pointed to at W_TRAINERHEADERPTR)
; a: offset in header data
;    0 -> flag's bit (into wTrainerHeaderFlagBit)
;    2 -> flag's byte ptr (into hl)
;    4 -> before battle text (into hl)
;    6 -> after battle text (into hl)
;    8 -> end battle text (into hl)
ReadTrainerHeaderInfo:: ; 3193 (0:3193)
	push de
	push af
	ld d, $0
	ld e, a
	ld hl, W_TRAINERHEADERPTR
	ld a, [hli]
	ld l, [hl]
	ld h, a
	add hl, de
	pop af
	and a
	jr nz, .nonZeroOffset
	ld a, [hl]
	ld [wTrainerHeaderFlagBit], a  ; store flag's bit
	jr .done
.nonZeroOffset
	cp $2
	jr z, .readPointer ; read flag's byte ptr
	cp $4
	jr z, .readPointer ; read before battle text
	cp $6
	jr z, .readPointer ; read after battle text
	cp $8
	jr z, .readPointer ; read end battle text
	cp $a
	jr nz, .done
	ld a, [hli]        ; read end battle text (2) but override the result afterwards (XXX why, bug?)
	ld d, [hl]
	ld e, a
	jr .done
.readPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
.done
	pop de
	ret

; calls HandleBitArray
HandleBitArray_Bank0:: ; 31c7 (0:31c7)
	ld a, $10
	jp Predef ; indirect jump to HandleBitArray (f666 (3:7666))

; direct talking to a trainer (rather than getting seen by one)
TalkToTrainer:: ; 31cc (0:31cc)
	call StoreTrainerHeaderPointer
	xor a
	call ReadTrainerHeaderInfo     ; read flag's bit
	ld a, $2
	call ReadTrainerHeaderInfo     ; read flag's byte ptr
	ld a, [wTrainerHeaderFlagBit]
	ld c, a
	ld b, $2
	call HandleBitArray_Bank0      ; read trainer's flag
	ld a, c
	and a
	jr z, .trainerNotYetFought     ; test trainer's flag
	ld a, $6
	call ReadTrainerHeaderInfo     ; print after battle text
	jp PrintText
.trainerNotYetFought ; 0x31ed
	ld a, $4
	call ReadTrainerHeaderInfo     ; print before battle text
	call PrintText
	ld a, $a
	call ReadTrainerHeaderInfo     ; (?) does nothing apparently (maybe bug in ReadTrainerHeaderInfo)
	push de
	ld a, $8
	call ReadTrainerHeaderInfo     ; read end battle text
	pop de
	call PreBattleSaveRegisters
	ld hl, W_FLAGS_D733
	set 4, [hl]                    ; activate map script index override (index is set below)
	ld hl, wFlags_0xcd60
	bit 0, [hl]                    ; test if player is already being engaged by another trainer
	ret nz
	call EngageMapTrainer
	ld hl, W_CURMAPSCRIPT
	inc [hl]      ; progress map script index (assuming it was 0 before) to start pre-battle routines
	jp Func_325d

; checks if any trainers are seeing the player and wanting to fight
CheckFightingMapTrainers:: ; 3219 (0:3219)
	call CheckForEngagingTrainers
	ld a, [$cf13]
	cp $ff
	jr nz, .trainerEngaging
	xor a
	ld [$cf13], a
	ld [wTrainerHeaderFlagBit], a
	ret
.trainerEngaging
	ld hl, W_FLAGS_D733
	set 3, [hl]
	ld [$cd4f], a
	xor a
	ld [$cd50], a
	ld a, $4c
	call Predef
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoypadForbiddenButtonsMask], a
	xor a
	ldh [$b4], a
	call TrainerWalkUpToPlayer_Bank0
	ld hl, W_CURMAPSCRIPT
	inc [hl]      ; progress to battle phase 1 (engaging)
	ret

Func_324c:: ; 324c (0:324c)
	ld a, [$d730]
	and $1
	ret nz
	ld [wJoypadForbiddenButtonsMask], a
	ld a, [$cf13]
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID

Func_325d:: ; 325d (0:325d)
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	call InitBattleEnemyParameters
	ld hl, $d72d
	set 6, [hl]
	set 7, [hl]
	ld hl, $d72e
	set 1, [hl]
	ld hl, W_CURMAPSCRIPT
	inc [hl]        ; progress to battle phase 2 (battling)
	ret

EndTrainerBattle:: ; 3275 (0:3275)
	ld hl, $d126
	set 5, [hl]
	set 6, [hl]
	ld hl, $d72d
	res 7, [hl]
	ld hl, wFlags_0xcd60
	res 0, [hl]                  ; player is no longer engaged by any trainer
	ld a, [W_ISINBATTLE] ; $d057
	cp $ff
	jp z, ResetButtonPressedAndMapScript
	ld a, $2
	call ReadTrainerHeaderInfo
	ld a, [wTrainerHeaderFlagBit]
	ld c, a
	ld b, $1
	call HandleBitArray_Bank0   ; flag trainer as fought
	ld a, [W_ENEMYMONORTRAINERCLASS]
	cp $c8
	jr nc, .skipRemoveSprite    ; test if trainer was fought (in that case skip removing the corresponding sprite)
	ld hl, W_MISSABLEOBJECTLIST
	ld de, $2
	ld a, [$cf13]
	call IsInArray              ; search for sprite ID
	inc hl
	ld a, [hl]
	ld [$cc4d], a               ; load corresponding missable object index and remove it
	ld a, $11
	call Predef ; indirect jump to RemoveMissableObject (f1d7 (3:71d7))
.skipRemoveSprite
	ld hl, $d730
	bit 4, [hl]
	res 4, [hl]
	ret nz

ResetButtonPressedAndMapScript:: ; 32c1 (0:32c1)
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld [H_NEWLYPRESSEDBUTTONS], a
	ld [H_NEWLYRELEASEDBUTTONS], a
	ld [W_CURMAPSCRIPT], a               ; reset battle status
	ret

; calls TrainerWalkUpToPlayer
TrainerWalkUpToPlayer_Bank0:: ; 32cf (0:32cf)
	ld b, BANK(TrainerWalkUpToPlayer)
	ld hl, TrainerWalkUpToPlayer
	jp Bankswitch

; sets opponent type and mon set/lvl based on the engaging trainer data
InitBattleEnemyParameters:: ; 32d7 (0:32d7)
	ld a, [wEngagedTrainerClass]
	ld [W_CUROPPONENT], a ; $d059
	ld [W_ENEMYMONORTRAINERCLASS], a
	cp $c8
	ld a, [wEngagedTrainerSet] ; $cd2e
	jr c, .noTrainer
	ld [W_TRAINERNO], a ; $d05d
	ret
.noTrainer
	ld [W_CURENEMYLVL], a ; $d127
	ret

Func_32ef:: ; 32ef (0:32ef)
	ld hl, Func_567f9
	jr asm_3301

Func_32f4:: ; 32f4 (0:32f4)
	ld hl, Func_56819
	jr asm_3301 ; 0x32f7 $8

Func_32f9:: ; 32f9 (0:32f9)
	ld hl, Func_5683d
	jr asm_3301

Func_32fe:: ; 32fe (0:32fe)
	ld hl, Func_5685d
asm_3301:: ; 3301 (0:3301)
	ld b, BANK(Func_567f9) ; BANK(Func_56819), BANK(Func_5683d), BANK(Func_5685d)
	jp Bankswitch ; indirect jump to one of the four functions

CheckForEngagingTrainers:: ; 3306 (0:3306)
	xor a
	call ReadTrainerHeaderInfo       ; read trainer flag's bit (unused)
	ld d, h                          ; store trainer header address in de
	ld e, l
.trainerLoop
	call StoreTrainerHeaderPointer   ; set trainer header pointer to current trainer
	ld a, [de]
	ld [$cf13], a                     ; store trainer flag's bit
	ld [wTrainerHeaderFlagBit], a
	cp $ff
	ret z
	ld a, $2
	call ReadTrainerHeaderInfo       ; read trainer flag's byte ptr
	ld b, $2
	ld a, [wTrainerHeaderFlagBit]
	ld c, a
	call HandleBitArray_Bank0        ; read trainer flag
	ld a, c
	and a
	jr nz, .trainerAlreadyFought
	push hl
	push de
	push hl
	xor a
	call ReadTrainerHeaderInfo       ; get trainer header pointer
	inc hl
	ld a, [hl]                       ; read trainer engage distance
	pop hl
	ld [wTrainerEngageDistance], a
	ld a, [$cf13]
	swap a
	ld [wTrainerSpriteOffset], a ; $cd3d
	ld a, $39
	call Predef ; indirect jump to CheckEngagePlayer (5690f (15:690f))
	pop de
	pop hl
	ld a, [wTrainerSpriteOffset] ; $cd3d
	and a
	ret nz        ; break if the trainer is engaging
.trainerAlreadyFought
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	jr .trainerLoop

; saves loaded rom bank and hl as well as de registers
PreBattleSaveRegisters:: ; 3354 (0:3354)
	ld a, [H_LOADEDROMBANK]
	ld [W_PBSTOREDROMBANK], a
	ld a, h
	ld [W_PBSTOREDREGISTERH], a
	ld a, l
	ld [W_PBSTOREDREGISTERL], a
	ld a, d
	ld [W_PBSTOREDREGISTERD], a
	ld a, e
	ld [W_PBSTOREDREGISTERE], a
	ret

; loads data of some trainer on the current map and plays pre-battle music
; [$cf13]: sprite ID of trainer who is engaged
EngageMapTrainer:: ; 336a (0:336a)
	ld hl, W_MAPSPRITEEXTRADATA
	ld d, $0
	ld a, [$cf13]
	dec a
	add a
	ld e, a
	add hl, de     ; seek to engaged trainer data
	ld a, [hli]    ; load trainer class
	ld [wEngagedTrainerClass], a
	ld a, [hl]     ; load trainer mon set
	ld [wEnemyMonAttackMod], a ; $cd2e
	jp PlayTrainerMusic

Func_3381:: ; 3381 (0:3381)
	push hl
	ld hl, $d72d
	bit 7, [hl]
	res 7, [hl]
	pop hl
	ret z
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, [W_PBSTOREDROMBANK]
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	push hl
	callba SaveTrainerName
	ld hl, TrainerNameText
	call PrintText
	pop hl
	pop af
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	callba Func_1a5e7
	jp WaitForSoundToFinish

Func_33b7:: ; 33b7 (0:33b7)
	ld a, [$cf0b]
	and a
	jr nz, .asm_33c6
	ld a, [W_PBSTOREDREGISTERH]
	ld h, a
	ld a, [W_PBSTOREDREGISTERL]
	ld l, a
	ret
.asm_33c6
	ld a, [W_PBSTOREDREGISTERD]
	ld h, a
	ld a, [W_PBSTOREDREGISTERE]
	ld l, a
	ret

TrainerNameText:: ; 33cf (0:33cf)
	TX_FAR _TrainerNameText
	db $08

Func_33d4:: ; 33d4 (0:33d4)
	call Func_33b7
	call TextCommandProcessor
	jp TextScriptEnd

Func_33dd:: ; 33dd (0:33dd)
	ld a, [wFlags_0xcd60]
	bit 0, a
	ret nz
	call EngageMapTrainer
	xor a
	ret

PlayTrainerMusic:: ; 33e8 (0:33e8)
	ld a, [wEngagedTrainerClass]
	cp $c8 + SONY1
	ret z
	cp $c8 + SONY2
	ret z
	cp $c8 + SONY3
	ret z
	ld a, [W_GYMLEADERNO] ; $d05c
	and a
	ret nz
	xor a
	ld [wMusicHeaderPointer], a
	ld a, $ff
	call PlaySound      ; stop music
	ld a, BANK(Music_MeetEvilTrainer)
	ld [$c0ef], a
	ld [$c0f0], a
	ld a, [wEngagedTrainerClass]
	ld b, a
	ld hl, EvilTrainerList
.evilTrainerListLoop
	ld a, [hli]
	cp $ff
	jr z, .noEvilTrainer
	cp b
	jr nz, .evilTrainerListLoop
	ld a, MUSIC_MEET_EVIL_TRAINER
	jr .PlaySound
.noEvilTrainer
	ld hl, FemaleTrainerList
.femaleTrainerListLoop
	ld a, [hli]
	cp $ff
	jr z, .maleTrainer
	cp b
	jr nz, .femaleTrainerListLoop
	ld a, MUSIC_MEET_FEMALE_TRAINER
	jr .PlaySound
.maleTrainer
	ld a, MUSIC_MEET_MALE_TRAINER
.PlaySound
	ld [$c0ee], a
	jp PlaySound

INCLUDE "data/trainer_types.asm"

Func_3442:: ; 3442 (0:3442)
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr nz, .asm_345b
	ld a, [hli]
	cp c
	jr nz, .asm_345c
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $ccd3
	call DecodeRLEList
	dec a
	ld [$cd38], a
	ret
.asm_345b
	inc hl
.asm_345c
	inc hl
	inc hl
	jr Func_3442

FuncTX_ItemStoragePC:: ; 3460 (0:3460)
	call SaveScreenTilesToBuffer2
	ld b, BANK(PlayerPC)
	ld hl, PlayerPC
	jr bankswitchAndContinue

FuncTX_BillsPC:: ; 346a (0:346a)
	call SaveScreenTilesToBuffer2
	ld b, BANK(Func_214c2)
	ld hl, Func_214c2
	jr bankswitchAndContinue

FuncTX_SlotMachine:: ; 3474 (0:3474)
; XXX find a better name for this function
; special_F7
	ld b,BANK(CeladonPrizeMenu)
	ld hl,CeladonPrizeMenu
bankswitchAndContinue:: ; 3479 (0:3479)
	call Bankswitch
	jp HoldTextDisplayOpen        ; continue to main text-engine function

FuncTX_PokemonCenterPC:: ; 347f (0:347f)
	ld b, BANK(ActivatePC)
	ld hl, ActivatePC
	jr bankswitchAndContinue

Func_3486:: ; 3486 (0:3486)
	xor a
	ld [$cd3b], a
	ld [$c206], a
	ld hl, $d730
	set 7, [hl]
	ret

IsItemInBag:: ; 3493 (0:3493)
; given an item_id in b
; set zero flag if item isn't in player's bag
; else reset zero flag
; related to Pokémon Tower and ghosts
	ld a,$1C
	call Predef
	ld a,b
	and a
	ret

DisplayPokedex:: ; 349b (0:349b)
	ld [$d11e], a
	ld b, BANK(Func_7c18)
	ld hl, Func_7c18
	jp Bankswitch

Func_34a6:: ; 34a6 (0:34a6)
	call Func_34ae
	ld c, $6
	jp DelayFrames

Func_34ae:: ; 34ae (0:34ae)
	ld a, $9
	ld [H_DOWNARROWBLINKCNT1], a ; $ff8b
	call Func_34fc
	ld a, [$ff8d]
	ld [hl], a
	ret

Func_34b9:: ; 34b9 (0:34b9)
	ld de, $fff9
	add hl, de
	ld [hl], a
	ret

; tests if the player's coordinates are in a specified array
; INPUT:
; hl = address of array
; OUTPUT:
; [$cd3d] = if there is match, the matching array index
; sets carry if the coordinates are in the array, clears carry if not
ArePlayerCoordsInArray:: ; 34bf (0:34bf)
	ld a,[W_YCOORD]
	ld b,a
	ld a,[W_XCOORD]
	ld c,a
	; fallthrough

CheckCoords:: ; 34c7 (0:34c7)
	xor a
	ld [$cd3d],a
.loop
	ld a,[hli]
	cp a,$ff ; reached terminator?
	jr z,.notInArray
	push hl
	ld hl,$cd3d
	inc [hl]
	pop hl
.compareYCoord
	cp b
	jr z,.compareXCoord
	inc hl
	jr .loop
.compareXCoord
	ld a,[hli]
	cp c
	jr nz,.loop
.inArray
	scf
	ret
.notInArray
	and a
	ret

; tests if a boulder's coordinates are in a specified array
; INPUT:
; hl = address of array
; ff8c = which boulder to check? XXX
; OUTPUT:
; [$cd3d] = if there is match, the matching array index
; sets carry if the coordinates are in the array, clears carry if not
CheckBoulderCoords:: ; 34e4 (0:34e4)
	push hl
	ld hl, $c204
	ld a, [$ff8c]
	swap a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	sub $4 ; because sprite coordinates are offset by 4
	ld b, a
	ld a, [hl]
	sub $4 ; because sprite coordinates are offset by 4
	ld c, a
	pop hl
	jp CheckCoords

Func_34fc:: ; 34fc (0:34fc)
	ld h, $c1
	jr asm_3502

Func_3500:: ; 3500 (0:3500)
	ld h, $c2
asm_3502:: ; 3502 (0:3502)
	ld a, [H_DOWNARROWBLINKCNT1] ; $ff8b
	ld b, a
	ld a, [H_DOWNARROWBLINKCNT2] ; $ff8c
	swap a
	add b
	ld l, a
	ret

; decodes a $ff-terminated RLEncoded list
; each entry is a pair of bytes <byte value> <repetitions>
; the final $ff will be replicated in the output list and a contains the number of bytes written
; de: input list
; hl: output list
DecodeRLEList:: ; 350c (0:350c)
	xor a
	ld [wRLEByteCount], a     ; count written bytes here
.listLoop
	ld a, [de]
	cp $ff
	jr z, .endOfList
	ld [H_DOWNARROWBLINKCNT1], a ; store byte value to be written
	inc de
	ld a, [de]
	ld b, $0
	ld c, a                      ; number of bytes to be written
	ld a, [wRLEByteCount]
	add c
	ld [wRLEByteCount], a     ; update total number of written bytes
	ld a, [H_DOWNARROWBLINKCNT1] ; $ff8b
	call FillMemory              ; write a c-times to output
	inc de
	jr .listLoop
.endOfList
	ld a, $ff
	ld [hl], a                   ; write final $ff
	ld a, [wRLEByteCount]
	inc a                        ; include sentinel in counting
	ret

; sets movement byte 1 for sprite [$FF8C] to $FE and byte 2 to [$FF8D]
SetSpriteMovementBytesToFE:: ; 3533 (0:3533)
	push hl
	call GetSpriteMovementByte1Pointer
	ld [hl], $fe
	call GetSpriteMovementByte2Pointer
	ld a, [$ff8d]
	ld [hl], a
	pop hl
	ret

; sets both movement bytes for sprite [$FF8C] to $FF
SetSpriteMovementBytesToFF:: ; 3541 (0:3541)
	push hl
	call GetSpriteMovementByte1Pointer
	ld [hl],$FF
	call GetSpriteMovementByte2Pointer
	ld [hl],$FF ; prevent person from walking?
	pop hl
	ret

; returns the sprite movement byte 1 pointer for sprite [$FF8C] in hl
GetSpriteMovementByte1Pointer:: ; 354e (0:354e)
	ld h,$C2
	ld a,[$FF8C] ; the sprite to move
	swap a
	add a,6
	ld l,a
	ret

; returns the sprite movement byte 2 pointer for sprite [$FF8C] in hl
GetSpriteMovementByte2Pointer:: ; 3558 (0:3558)
	push de
	ld hl,W_MAPSPRITEDATA
	ld a,[$FF8C] ; the sprite to move
	dec a
	add a
	ld d,0
	ld e,a
	add hl,de
	pop de
	ret

GetTrainerInformation:: ; 3566 (0:3566)
	call GetTrainerName
	ld a, [W_ISLINKBATTLE] ; $d12b
	and a
	jr nz, .linkBattle
	ld a, Bank(TrainerPicAndMoneyPointers)
	call BankswitchHome
	ld a, [W_TRAINERCLASS] ; $d031
	dec a
	ld hl, TrainerPicAndMoneyPointers
	ld bc, $5
	call AddNTimes
	ld de, $d033
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld de, $d046
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	jp BankswitchBack
.linkBattle
	ld hl, $d033
	ld de, RedPicFront
	ld [hl], e
	inc hl
	ld [hl], d
	ret

GetTrainerName:: ; 359e (0:359e)
	ld b, BANK(GetTrainerName_)
	ld hl, GetTrainerName_
	jp Bankswitch

; tests if player's money are at least as much as [$ff9f]
; sets carry flag if not enough money
; sets zero flag if amounts match exactly
HasEnoughMoney:: ; 35a6 (0:35a6)
	ld de, wPlayerMoney ; $d347
	ld hl, $ff9f
	ld c, $3
	jp StringCmp

; tests if player's game corner coins are at least as many as [$ffa0]
; sets carry flag if not enough coins
; sets zero flag if amounts match exactly
HasEnoughCoins:: ; 35b1 (0:35b1)
	ld de, wPlayerCoins
	ld hl, $ffa0
	ld c, $2
	jp StringCmp

BankswitchHome:: ; 35bc (0:35bc)
; switches to bank # in a
; Only use this when in the home bank!
	ld [$CF09],a
	ld a,[H_LOADEDROMBANK]
	ld [$CF08],a
	ld a,[$CF09]
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

BankswitchBack:: ; 35cd (0:35cd)
; returns from BankswitchHome
	ld a,[$CF08]
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

Bankswitch:: ; 35d6 (0:35d6)
; self-contained bankswitch, use this when not in the home bank
; switches to the bank in b
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,b
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ld bc,.Return
	push bc
	jp [hl]
.Return
	pop bc
	ld a,b
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

; displays yes/no choice
; yes -> set carry
YesNoChoice:: ; 35ec (0:35ec)
	call SaveScreenTilesToBuffer1
	call InitYesNoTextBoxParameters
	jr DisplayYesNoChoice

Func_35f4:: ; 35f4 (0:35f4)
	ld a, $14
	ld [$d125], a
	call InitYesNoTextBoxParameters
	jp DisplayTextBoxID

InitYesNoTextBoxParameters:: ; 35ff (0:35ff)
	xor a
	ld [$d12c], a
	FuncCoord 14, 7 ; $c43a
	ld hl, Coord
	ld bc, $80f
	ret

YesNoChoicePokeCenter:: ; 360a (0:360a)
	call SaveScreenTilesToBuffer1
	ld a, $6
	ld [$d12c], a
	FuncCoord 11, 6 ; $c423
	ld hl, Coord
	ld bc, $80c
	jr DisplayYesNoChoice

Func_361a:: ; 361a (0:361a)
	call SaveScreenTilesToBuffer1
	ld a, $3
	ld [$d12c], a
	FuncCoord 12, 7 ; $c438
	ld hl, Coord
	ld bc, $080d
DisplayYesNoChoice:: ; 3628 (0:3628)
	ld a, $14
	ld [$d125], a
	call DisplayTextBoxID
	jp LoadScreenTilesFromBuffer1

; calculates the difference |a-b|, setting carry flag if a<b
CalcDifference:: ; 3633 (0:3633)
	sub b
	ret nc
	cpl
	add $1
	scf
	ret

MoveSprite:: ; 363a (0:363a)
; move the sprite [$FF8C] with the movement pointed to by de
; actually only copies the movement data to $CC5B for later
	call SetSpriteMovementBytesToFF
MoveSprite_:: ; 363d (0:363d)
	push hl
	push bc
	call GetSpriteMovementByte1Pointer
	xor a
	ld [hl],a
	ld hl,$CC5B
	ld c,0

.loop
	ld a,[de]
	ld [hli],a
	inc de
	inc c
	cp a,$FF ; have we reached the end of the movement data?
	jr nz,.loop

	ld a,c
	ld [$CF0F],a ; number of steps taken

	pop bc
	ld hl,$D730
	set 0,[hl]
	pop hl
	xor a
	ld [$CD3B],a
	ld [$CCD3],a
	dec a
	ld [wJoypadForbiddenButtonsMask],a
	ld [$CD3A],a
	ret

Func_366b:: ; 366b (0:366b)
	push hl
	ld hl, $ffe7
	xor a
	ld [hld], a
	ld a, [hld]
	and a
	jr z, .asm_367e
	ld a, [hli]
.asm_3676
	sub [hl]
	jr c, .asm_367e
	inc hl
	inc [hl]
	dec hl
	jr .asm_3676
.asm_367e
	pop hl
	ret

; copies the tile patterns for letters and numbers into VRAM
LoadFontTilePatterns:: ; 3680 (0:3680)
	ld a,[rLCDC]
	bit 7,a ; is the LCD enabled?
	jr nz,.lcdEnabled
.lcdDisabled
	ld hl,FontGraphics
	ld de,$8800
	ld bc,$400
	ld a,BANK(FontGraphics)
	jp FarCopyDataDouble ; if LCD is off, transfer all at once
.lcdEnabled
	ld de,FontGraphics
	ld hl,$8800
	ld bc,(BANK(FontGraphics) << 8 | $80)
	jp CopyVideoDataDouble ; if LCD is on, transfer during V-blank

; copies the text box tile patterns into VRAM
LoadTextBoxTilePatterns:: ; 36a0 (0:36a0)
	ld a,[rLCDC]
	bit 7,a ; is the LCD enabled?
	jr nz,.lcdEnabled
.lcdDisabled
	ld hl,TextBoxGraphics
	ld de,$9600
	ld bc,$0200
	ld a,BANK(TextBoxGraphics)
	jp FarCopyData2 ; if LCD is off, transfer all at once
.lcdEnabled
	ld de,TextBoxGraphics
	ld hl,$9600
	ld bc,(BANK(TextBoxGraphics) << 8 | $20)
	jp CopyVideoData ; if LCD is on, transfer during V-blank

; copies HP bar and status display tile patterns into VRAM
LoadHpBarAndStatusTilePatterns:: ; 36c0 (0:36c0)
	ld a,[rLCDC]
	bit 7,a ; is the LCD enabled?
	jr nz,.lcdEnabled
.lcdDisabled
	ld hl,HpBarAndStatusGraphics
	ld de,$9620
	ld bc,$01e0
	ld a,BANK(HpBarAndStatusGraphics)
	jp FarCopyData2 ; if LCD is off, transfer all at once
.lcdEnabled
	ld de,HpBarAndStatusGraphics
	ld hl,$9620
	ld bc,(BANK(HpBarAndStatusGraphics) << 8 | $1e)
	jp CopyVideoData ; if LCD is on, transfer during V-blank

;Fills memory range with the specified byte.
;input registers a = fill_byte, bc = length, hl = address
FillMemory:: ; 36e0 (0:36e0)
	push de
	ld d, a
.loop
	ld a, d
	ldi [hl], a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	pop de
	ret

; loads sprite that de points to
; bank of sprite is given in a
UncompressSpriteFromDE:: ; 36eb (0:36eb)
	ld hl, W_SPRITEINPUTPTR
	ld [hl], e
	inc hl
	ld [hl], d
	jp UncompressSpriteData

SaveScreenTilesToBuffer2:: ; 36f4 (0:36f4)
	ld hl, wTileMap
	ld de, wTileMapBackup2
	ld bc, $168
	call CopyData
	ret

LoadScreenTilesFromBuffer2:: ; 3701 (0:3701)
	call LoadScreenTilesFromBuffer2DisableBGTransfer
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ret

; loads screen tiles stored in wTileMapBackup2 but leaves H_AUTOBGTRANSFERENABLED disabled
LoadScreenTilesFromBuffer2DisableBGTransfer:: ; 3709 (0:3709)
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld hl, wTileMapBackup2
	ld de, wTileMap
	ld bc, $168
	call CopyData
	ret

SaveScreenTilesToBuffer1:: ; 3719 (0:3719)
	ld hl, wTileMap
	ld de, wTileMapBackup
	ld bc, $168
	jp CopyData

LoadScreenTilesFromBuffer1:: ; 3725 (0:3725)
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld hl, wTileMapBackup
	ld de, wTileMap
	ld bc, $168
	call CopyData
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ret

DelayFrames:: ; 3739 (0:3739)
; wait n frames, where n is the value in c
	call DelayFrame
	dec c
	jr nz,DelayFrames
	ret

PlaySoundWaitForCurrent:: ; 3740 (0:3740)
	push af
	call WaitForSoundToFinish
	pop af
	jp PlaySound

; Wait for sound to finish playing
WaitForSoundToFinish:: ; 3748 (0:3748)
	ld a, [$d083]
	and $80
	ret nz
	push hl
.asm_374f
	ld hl, $c02a
	xor a
	or [hl]
	inc hl
	or [hl]
	inc hl
	inc hl
	or [hl]
	jr nz, .asm_374f
	pop hl
	ret

NamePointers:: ; 375d (0:375d)
	dw MonsterNames
	dw MoveNames
	dw UnusedNames
	dw ItemNames
	dw W_PARTYMON1OT ; player's OT names list
	dw W_ENEMYMON1OT ; enemy's OT names list
	dw TrainerNames

GetName:: ; 376b (0:376b)
; arguments:
; [$D0B5] = which name
; [$D0B6] = which list (W_LISTTYPE)
; [$D0B7] = bank of list
;
; returns pointer to name in de
	ld a,[$d0b5]
	ld [$d11e],a
	cp a,$C4        ;it's TM/HM
	jp nc,GetMachineName
	ld a,[H_LOADEDROMBANK]
	push af
	push hl
	push bc
	push de
	ld a,[W_LISTTYPE]    ;List3759_entrySelector
	dec a
	jr nz,.otherEntries
	;1 = MON_NAMES
	call GetMonName
	ld hl,11
	add hl,de
	ld e,l
	ld d,h
	jr .gotPtr
.otherEntries ; $378d
	;2-7 = OTHER ENTRIES
	ld a,[$d0b7]
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ld a,[W_LISTTYPE]    ;VariousNames' entryID
	dec a
	add a
	ld d,0
	ld e,a
	jr nc,.skip
	inc d
.skip ; $37a0
	ld hl,NamePointers
	add hl,de
	ld a,[hli]
	ld [$ff96],a
	ld a,[hl]
	ld [$ff95],a
	ld a,[$ff95]
	ld h,a
	ld a,[$ff96]
	ld l,a
	ld a,[$d0b5]
	ld b,a
	ld c,0
.nextName
	ld d,h
	ld e,l
.nextChar
	ld a,[hli]
	cp a, "@"
	jr nz,.nextChar
	inc c           ;entry counter
	ld a,b          ;wanted entry
	cp c
	jr nz,.nextName
	ld h,d
	ld l,e
	ld de,$cd6d
	ld bc,$0014
	call CopyData
.gotPtr ; $37cd
	ld a,e
	ld [$cf8d],a
	ld a,d
	ld [$cf8e],a
	pop de
	pop bc
	pop hl
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	ret

GetItemPrice:: ; 37df (0:37df)
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, [wListMenuID] ; $cf94
	cp $1
	ld a, $1 ; hardcoded Bank
	jr nz, .asm_37ed
	ld a, $f ; hardcoded Bank
.asm_37ed
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	ld hl, $cf8f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$cf91]
	cp HM_01
	jr nc, .asm_3812
	ld bc, $3
.asm_3802
	add hl, bc
	dec a
	jr nz, .asm_3802
	dec hl
	ld a, [hld]
	ld [$ff8d], a
	ld a, [hld]
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	ld a, [hl]
	ld [H_DOWNARROWBLINKCNT1], a ; $ff8b
	jr .asm_381c
.asm_3812
	ld a, Bank(GetMachinePrice)
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	call GetMachinePrice
.asm_381c
	ld de, H_DOWNARROWBLINKCNT1 ; $ff8b
	pop af
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	ret

; copies a string from [de] to [$cf4b]
CopyStringToCF4B:: ; 3826 (0:3826)
	ld hl, $cf4b
	; fall through

; copies a string from [de] to [hl]
CopyString:: ; 3829 (0:3829)
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, CopyString
	ret

; this function is used when lower button sensitivity is wanted (e.g. menus)
; OUTPUT: [$ffb5] = pressed buttons in usual format
; there are two flags that control its functionality, [$ffb6] and [$ffb7]
; there are esentially three modes of operation
; 1. Get newly pressed buttons only
;    ([$ffb7] == 0, [$ffb6] == any)
;    Just copies [H_NEWLYPRESSEDBUTTONS] to [$ffb5].
; 2. Get currently pressed buttons at low sample rate with delay
;    ([$ffb7] == 1, [$ffb6] != 0)
;    If the user holds down buttons for more than half a second,
;    report buttons as being pressed up to 12 times per second thereafter.
;    If the user holds down buttons for less than half a second,
;    report only one button press.
; 3. Same as 2, but report no buttons as pressed if A or B is held down.
;    ([$ffb7] == 1, [$ffb6] == 0)
GetJoypadStateLowSensitivity:: ; 3831 (0:3831)
	call GetJoypadState
	ld a,[$ffb7] ; flag
	and a ; get all currently pressed buttons or only newly pressed buttons?
	ld a,[H_NEWLYPRESSEDBUTTONS] ; newly pressed buttons
	jr z,.storeButtonState
	ld a,[H_CURRENTPRESSEDBUTTONS] ; all currently pressed buttons
.storeButtonState
	ld [$ffb5],a
	ld a,[H_NEWLYPRESSEDBUTTONS] ; newly pressed buttons
	and a ; have any buttons been newly pressed since last check?
	jr z,.noNewlyPressedButtons
.newlyPressedButtons
	ld a,30 ; half a second delay
	ld [H_FRAMECOUNTER],a
	ret
.noNewlyPressedButtons
	ld a,[H_FRAMECOUNTER]
	and a ; is the delay over?
	jr z,.delayOver
.delayNotOver
	xor a
	ld [$ffb5],a ; report no buttons as pressed
	ret
.delayOver
; if [$ffb6] = 0 and A or B is pressed, report no buttons as pressed
	ld a,[H_CURRENTPRESSEDBUTTONS]
	and a,%00000011 ; A and B buttons
	jr z,.setShortDelay
	ld a,[$ffb6] ; flag
	and a
	jr nz,.setShortDelay
	xor a
	ld [$ffb5],a
.setShortDelay
	ld a,5 ; 1/12 of a second delay
	ld [H_FRAMECOUNTER],a
	ret

WaitForTextScrollButtonPress:: ; 3865 (0:3865)
	ld a, [H_DOWNARROWBLINKCNT1] ; $ff8b
	push af
	ld a, [H_DOWNARROWBLINKCNT2] ; $ff8c
	push af
	xor a
	ld [H_DOWNARROWBLINKCNT1], a ; $ff8b
	ld a, $6
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
.asm_3872
	push hl
	ld a, [$d09b]
	and a
	jr z, .asm_387c
	call Func_716c6
.asm_387c
	FuncCoord 18, 16 ; $c4f2
	ld hl, Coord
	call HandleDownArrowBlinkTiming
	pop hl
	call GetJoypadStateLowSensitivity
	ld a, $2d
	call Predef ; indirect jump to Func_5a5f (5a5f (1:5a5f))
	ld a, [$ffb5]
	and A_BUTTON | B_BUTTON
	jr z, .asm_3872
	pop af
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	pop af
	ld [H_DOWNARROWBLINKCNT1], a ; $ff8b
	ret

; (unlass in link battle) waits for A or B being pressed and outputs the scrolling sound effect
ManualTextScroll:: ; 3898 (0:3898)
	ld a, [W_ISLINKBATTLE] ; $d12b
	cp $4
	jr z, .inLinkBattle
	call WaitForTextScrollButtonPress
	ld a, (SFX_02_40 - SFX_Headers_02) / 3
	jp PlaySound
.inLinkBattle
	ld c, $41
	jp DelayFrames

; function to do multiplication
; all values are big endian
; INPUT
; FF96-FF98 =  multiplicand
; FF99 = multiplier
; OUTPUT
; FF95-FF98 = product
Multiply:: ; 38ac (0:38ac)
	push hl
	push bc
	callab _Multiply
	pop bc
	pop hl
	ret

; function to do division
; all values are big endian
; INPUT
; FF95-FF98 = dividend
; FF99 = divisor
; b = number of bytes in the dividend (starting from FF95)
; OUTPUT
; FF95-FF98 = quotient
; FF99 = remainder
Divide:: ; 38b9 (0:38b9)
	push hl
	push de
	push bc
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,Bank(_Divide)
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	call _Divide
	pop af
	ld [H_LOADEDROMBANK],a
	ld [$2000],a
	pop bc
	pop de
	pop hl
	ret

; This function is used to wait a short period after printing a letter to the
; screen unless the player presses the A/B button or the delay is turned off
; through the [$d730] or [$d358] flags.
PrintLetterDelay:: ; 38d3 (0:38d3)
	ld a,[$d730]
	bit 6,a
	ret nz
	ld a,[$d358]
	bit 1,a
	ret z
	push hl
	push de
	push bc
	ld a,[$d358]
	bit 0,a
	jr z,.waitOneFrame
	ld a,[$d355]
	and a,$0f
	ld [H_FRAMECOUNTER],a
	jr .checkButtons
.waitOneFrame
	ld a,1
	ld [H_FRAMECOUNTER],a
.checkButtons
	call GetJoypadState
	ld a,[H_CURRENTPRESSEDBUTTONS]
.checkAButton
	bit 0,a ; is the A button pressed?
	jr z,.checkBButton
	jr .endWait
.checkBButton
	bit 1,a ; is the B button pressed?
	jr z,.buttonsNotPressed
.endWait
	call DelayFrame
	jr .done
.buttonsNotPressed ; if neither A nor B is pressed
	ld a,[H_FRAMECOUNTER]
	and a
	jr nz,.checkButtons
.done
	pop bc
	pop de
	pop hl
	ret

; Copies [hl, bc) to [de, bc - hl).
; In other words, the source data is from hl up to but not including bc,
; and the destination is de.
CopyDataUntil:: ; 3913 (0:3913)
	ld a,[hli]
	ld [de],a
	inc de
	ld a,h
	cp b
	jr nz,CopyDataUntil
	ld a,l
	cp c
	jr nz,CopyDataUntil
	ret

; Function to remove a pokemon from the party or the current box.
; wWhichPokemon determines the pokemon.
; [$cf95] == 0 specifies the party.
; [$cf95] != 0 specifies the current box.
RemovePokemon:: ; 391f (0:391f)
	ld hl, _RemovePokemon
	ld b, BANK(_RemovePokemon)
	jp Bankswitch

AddPokemonToParty:: ; 3927 (0:3927)
	push hl
	push de
	push bc
	callba _AddPokemonToParty
	pop bc
	pop de
	pop hl
	ret

; calculates all 5 stats of current mon and writes them to [de]
CalcStats:: ; 3936 (0:3936)
	ld c, $0
.statsLoop
	inc c
	call CalcStat
	ld a, [H_MULTIPLICAND+1]
	ld [de], a
	inc de
	ld a, [H_MULTIPLICAND+2]
	ld [de], a
	inc de
	ld a, c
	cp $5
	jr nz, .statsLoop
	ret

; calculates stat c of current mon
; c: stat to calc (HP=1,Atk=2,Def=3,Spd=4,Spc=5)
; b: consider stat exp?
; hl: base ptr to stat exp values ([hl + 2*c - 1] and [hl + 2*c])
CalcStat:: ; 394a (0:394a)
	push hl
	push de
	push bc
	ld a, b
	ld d, a
	push hl
	ld hl, W_MONHEADER
	ld b, $0
	add hl, bc
	ld a, [hl]          ; read base value of stat
	ld e, a
	pop hl
	push hl
	sla c
	ld a, d
	and a
	jr z, .statExpDone  ; consider stat exp?
	add hl, bc          ; skip to corresponding stat exp value
.statExpLoop            ; calculates ceil(Sqrt(stat exp)) in b
	xor a
	ld [H_MULTIPLICAND], a
	ld [H_MULTIPLICAND+1], a
	inc b               ; increment current stat exp bonus
	ld a, b
	cp $ff
	jr z, .statExpDone
	ld [H_MULTIPLICAND+2], a
	ld [H_MULTIPLIER], a
	call Multiply
	ld a, [hld]
	ld d, a
	ld a, [$ff98]
	sub d
	ld a, [hli]
	ld d, a
	ld a, [$ff97]
	sbc d               ; test if (current stat exp bonus)^2 < stat exp
	jr c, .statExpLoop
.statExpDone
	srl c
	pop hl
	push bc
	ld bc, $b           ; skip to stat IV values
	add hl, bc
	pop bc
	ld a, c
	cp $2
	jr z, .getAttackIV
	cp $3
	jr z, .getDefenseIV
	cp $4
	jr z, .getSpeedIV
	cp $5
	jr z, .getSpecialIV
.getHpIV
	push bc
	ld a, [hl]  ; Atk IV
	swap a
	and $1
	sla a
	sla a
	sla a
	ld b, a
	ld a, [hli] ; Def IV
	and $1
	sla a
	sla a
	add b
	ld b, a
	ld a, [hl] ; Spd IV
	swap a
	and $1
	sla a
	add b
	ld b, a
	ld a, [hl] ; Spc IV
	and $1
	add b      ; HP IV: LSB of the other 4 IVs
	pop bc
	jr .calcStatFromIV
.getAttackIV
	ld a, [hl]
	swap a
	and $f
	jr .calcStatFromIV
.getDefenseIV
	ld a, [hl]
	and $f
	jr .calcStatFromIV
.getSpeedIV
	inc hl
	ld a, [hl]
	swap a
	and $f
	jr .calcStatFromIV
.getSpecialIV
	inc hl
	ld a, [hl]
	and $f
.calcStatFromIV
	ld d, $0
	add e
	ld e, a
	jr nc, .noCarry
	inc d                     ; de = Base + IV
.noCarry
	sla e
	rl d                      ; de = (Base + IV) * 2
	srl b
	srl b                     ; b = ceil(Sqrt(stat exp)) / 4
	ld a, b
	add e
	jr nc, .noCarry2
	inc d                     ; da = (Base + IV) * 2 + ceil(Sqrt(stat exp)) / 4
.noCarry2
	ld [H_MULTIPLICAND+2], a
	ld a, d
	ld [H_MULTIPLICAND+1], a
	xor a
	ld [H_MULTIPLICAND], a
	ld a, [W_CURENEMYLVL] ; $d127
	ld [H_MULTIPLIER], a
	call Multiply            ; ((Base + IV) * 2 + ceil(Sqrt(stat exp)) / 4) * Level
	ld a, [H_MULTIPLICAND]
	ld [H_DIVIDEND], a
	ld a, [H_MULTIPLICAND+1]
	ld [H_DIVIDEND+1], a
	ld a, [H_MULTIPLICAND+2]
	ld [H_DIVIDEND+2], a
	ld a, $64
	ld [H_DIVISOR], a
	ld a, $3
	ld b, a
	call Divide             ; (((Base + IV) * 2 + ceil(Sqrt(stat exp)) / 4) * Level) / 100
	ld a, c
	cp $1
	ld a, $5
	jr nz, .notHPStat
	ld a, [W_CURENEMYLVL] ; $d127
	ld b, a
	ld a, [H_MULTIPLICAND+2]
	add b
	ld [H_MULTIPLICAND+2], a
	jr nc, .noCarry3
	ld a, [H_MULTIPLICAND+1]
	inc a
	ld [H_MULTIPLICAND+1], a ; HP: (((Base + IV) * 2 + ceil(Sqrt(stat exp)) / 4) * Level) / 100 + Level
.noCarry3
	ld a, $a
.notHPStat
	ld b, a
	ld a, [H_MULTIPLICAND+2]
	add b
	ld [H_MULTIPLICAND+2], a
	jr nc, .noCarry4
	ld a, [H_MULTIPLICAND+1]
	inc a                    ; non-HP: (((Base + IV) * 2 + ceil(Sqrt(stat exp)) / 4) * Level) / 100 + 5
	ld [H_MULTIPLICAND+1], a ; HP: (((Base + IV) * 2 + ceil(Sqrt(stat exp)) / 4) * Level) / 100 + Level + 10
.noCarry4
	ld a, [H_MULTIPLICAND+1] ; check for overflow (>999)
	cp $4
	jr nc, .overflow
	cp $3
	jr c, .noOverflow
	ld a, [H_MULTIPLICAND+2]
	cp $e8
	jr c, .noOverflow
.overflow
	ld a, $3                 ; overflow: cap at 999
	ld [H_MULTIPLICAND+1], a
	ld a, $e7
	ld [H_MULTIPLICAND+2], a
.noOverflow
	pop bc
	pop de
	pop hl
	ret

AddEnemyMonToPlayerParty:: ; 3a53 (0:3a53)
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, BANK(_AddEnemyMonToPlayerParty)
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	call _AddEnemyMonToPlayerParty
	pop bc
	ld a, b
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	ret

Func_3a68:: ; 3a68 (0:3a68)
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, BANK(Func_f51e)
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	call Func_f51e
	pop bc
	ld a, b
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	ret

; skips a text entries, each of size $b (like trainer name, OT name, rival name, ...)
; hl: base pointer, will be incremented by $b * a
SkipFixedLengthTextEntries:: ; 3a7d (0:3a7d)
	and a
	ret z
	ld bc, $b
.skipLoop
	add hl, bc
	dec a
	jr nz, .skipLoop
	ret

AddNTimes:: ; 3a87 (0:3a87)
; add bc to hl a times
	and a
	ret z
.loop
	add hl,bc
	dec a
	jr nz,.loop
	ret

; Compare strings, c bytes in length, at de and hl.
; Often used to compare big endian numbers in battle calculations.
StringCmp:: ; 3a8e (0:3a8e)
	ld a,[de]
	cp [hl]
	ret nz
	inc de
	inc hl
	dec c
	jr nz,StringCmp
	ret

; INPUT:
; a = oam block index (each block is 4 oam entries)
; b = Y coordinate of upper left corner of sprite
; c = X coordinate of upper left corner of sprite
; de = base address of 4 tile number and attribute pairs
WriteOAMBlock:: ; 3a97 (0:3a97)
	ld h,$c3
	swap a ; multiply by 16
	ld l,a
	call .writeOneEntry ; upper left
	push bc
	ld a,8
	add c
	ld c,a
	call .writeOneEntry ; upper right
	pop bc
	ld a,8
	add b
	ld b,a
	call .writeOneEntry ; lower left
	ld a,8
	add c
	ld c,a
	                      ; lower right
.writeOneEntry
	ld [hl],b ; Y coordinate
	inc hl
	ld [hl],c ; X coordinate
	inc hl
	ld a,[de] ; tile number
	inc de
	ld [hli],a
	ld a,[de] ; attribute
	inc de
	ld [hli],a
	ret

HandleMenuInput:: ; 3abe (0:3abe)
	xor a
	ld [$d09b],a

HandleMenuInputPokemonSelection:: ; 3ac2 (0:3ac2)
	ld a,[H_DOWNARROWBLINKCNT1]
	push af
	ld a,[H_DOWNARROWBLINKCNT2]
	push af ; save existing values on stack
	xor a
	ld [H_DOWNARROWBLINKCNT1],a ; blinking down arrow timing value 1
	ld a,$06
	ld [H_DOWNARROWBLINKCNT2],a ; blinking down arrow timing value 2
.loop1
	xor a
	ld [$d08b],a ; counter for pokemon shaking animation
	call PlaceMenuCursor
	call Delay3
.loop2
	push hl
	ld a,[$d09b]
	and a ; is it a pokemon selection menu?
	jr z,.getJoypadState
	callba AnimatePartyMon ; shake mini sprite of selected pokemon
.getJoypadState
	pop hl
	call GetJoypadStateLowSensitivity
	ld a,[$ffb5]
	and a ; was a key pressed?
	jr nz,.keyPressed
	push hl
	FuncCoord 18,11 ; coordinates of blinking down arrow in some menus
	ld hl,Coord
	call HandleDownArrowBlinkTiming ; blink down arrow (if any)
	pop hl
	ld a,[wMenuJoypadPollCount]
	dec a
	jr z,.giveUpWaiting
	jr .loop2
.giveUpWaiting
; if a key wasn't pressed within the specified number of checks
	pop af
	ld [H_DOWNARROWBLINKCNT2],a
	pop af
	ld [H_DOWNARROWBLINKCNT1],a ; restore previous values
	xor a
	ld [wMenuWrappingEnabled],a ; disable menu wrapping
	ret
.keyPressed
	xor a
	ld [$cc4b],a
	ld a,[$ffb5]
	ld b,a
	bit 6,a ; pressed Up key?
	jr z,.checkIfDownPressed
.upPressed
	ld a,[wCurrentMenuItem] ; selected menu item
	and a ; already at the top of the menu?
	jr z,.alreadyAtTop
.notAtTop
	dec a
	ld [wCurrentMenuItem],a ; move selected menu item up one space
	jr .checkOtherKeys
.alreadyAtTop
	ld a,[wMenuWrappingEnabled]
	and a ; is wrapping around enabled?
	jr z,.noWrappingAround
	ld a,[wMaxMenuItem]
	ld [wCurrentMenuItem],a ; wrap to the bottom of the menu
	jr .checkOtherKeys
.checkIfDownPressed
	bit 7,a
	jr z,.checkOtherKeys
.downPressed
	ld a,[wCurrentMenuItem]
	inc a
	ld c,a
	ld a,[wMaxMenuItem]
	cp c
	jr nc,.notAtBottom
.alreadyAtBottom
	ld a,[wMenuWrappingEnabled]
	and a ; is wrapping around enabled?
	jr z,.noWrappingAround
	ld c,$00 ; wrap from bottom to top
.notAtBottom
	ld a,c
	ld [wCurrentMenuItem],a
.checkOtherKeys
	ld a,[wMenuWatchedKeys]
	and b ; does the menu care about any of the pressed keys?
	jp z,.loop1
.checkIfAButtonOrBButtonPressed
	ld a,[$ffb5]
	and a,%00000011 ; pressed A button or B button?
	jr z,.skipPlayingSound
.AButtonOrBButtonPressed
	push hl
	ld hl,wFlags_0xcd60
	bit 5,[hl]
	pop hl
	jr nz,.skipPlayingSound
	ld a,(SFX_02_40 - SFX_Headers_02) / 3
	call PlaySound ; play sound
.skipPlayingSound
	pop af
	ld [H_DOWNARROWBLINKCNT2],a
	pop af
	ld [H_DOWNARROWBLINKCNT1],a ; restore previous values
	xor a
	ld [wMenuWrappingEnabled],a ; disable menu wrapping
	ld a,[$ffb5]
	ret
.noWrappingAround
	ld a,[$cc37]
	and a ; should we return if the user tried to go past the top or bottom?
	jr z,.checkOtherKeys
	jr .checkIfAButtonOrBButtonPressed

PlaceMenuCursor:: ; 3b7c (0:3b7c)
	ld a,[wTopMenuItemY]
	and a ; is the y coordinate 0?
	jr z,.adjustForXCoord
	ld hl,wTileMap
	ld bc,20 ; screen width
.topMenuItemLoop
	add hl,bc
	dec a
	jr nz,.topMenuItemLoop
.adjustForXCoord
	ld a,[wTopMenuItemX]
	ld b,$00
	ld c,a
	add hl,bc
	push hl
	ld a,[wLastMenuItem]
	and a ; was the previous menu id 0?
	jr z,.checkForArrow1
	push af
	ld a,[$fff6]
	bit 1,a ; is the menu double spaced?
	jr z,.doubleSpaced1
	ld bc,20
	jr .getOldMenuItemScreenPosition
.doubleSpaced1
	ld bc,40
.getOldMenuItemScreenPosition
	pop af
.oldMenuItemLoop
	add hl,bc
	dec a
	jr nz,.oldMenuItemLoop
.checkForArrow1
	ld a,[hl]
	cp a,"▶" ; was an arrow next to the previously selected menu item?
	jr nz,.skipClearingArrow
.clearArrow
	ld a,[wTileBehindCursor]
	ld [hl],a
.skipClearingArrow
	pop hl
	ld a,[wCurrentMenuItem]
	and a
	jr z,.checkForArrow2
	push af
	ld a,[$fff6]
	bit 1,a ; is the menu double spaced?
	jr z,.doubleSpaced2
	ld bc,20
	jr .getCurrentMenuItemScreenPosition
.doubleSpaced2
	ld bc,40
.getCurrentMenuItemScreenPosition
	pop af
.currentMenuItemLoop
	add hl,bc
	dec a
	jr nz,.currentMenuItemLoop
.checkForArrow2
	ld a,[hl]
	cp a,"▶" ; has the right arrow already been placed?
	jr z,.skipSavingTile ; if so, don't lose the saved tile
	ld [wTileBehindCursor],a ; save tile before overwriting with right arrow
.skipSavingTile
	ld a,"▶" ; place right arrow
	ld [hl],a
	ld a,l
	ld [wMenuCursorLocation],a
	ld a,h
	ld [wMenuCursorLocation + 1],a
	ld a,[wCurrentMenuItem]
	ld [wLastMenuItem],a
	ret

; This is used to mark a menu cursor other than the one currently being
; manipulated. In the case of submenus, this is used to show the location of
; the menu cursor in the parent menu. In the case of swapping items in list,
; this is used to mark the item that was first chosen to be swapped.
PlaceUnfilledArrowMenuCursor:: ; 3bec (0:3bec)
	ld b,a
	ld a,[wMenuCursorLocation]
	ld l,a
	ld a,[wMenuCursorLocation + 1]
	ld h,a
	ld [hl],$ec ; outline of right arrow
	ld a,b
	ret

; Replaces the menu cursor with a blank space.
EraseMenuCursor:: ; 3bf9 (0:3bf9)
	ld a,[wMenuCursorLocation]
	ld l,a
	ld a,[wMenuCursorLocation + 1]
	ld h,a
	ld [hl]," "
	ret

; This toggles a blinking down arrow at hl on and off after a delay has passed.
; This is often called even when no blinking is occurring.
; The reason is that most functions that call this initialize H_DOWNARROWBLINKCNT1 to 0.
; The effect is that if the tile at hl is initialized with a down arrow,
; this function will toggle that down arrow on and off, but if the tile isn't
; initliazed with a down arrow, this function does nothing.
; That allows this to be called without worrying about if a down arrow should
; be blinking.
HandleDownArrowBlinkTiming:: ; 3c04 (0:3c04)
	ld a,[hl]
	ld b,a
	ld a,$ee ; down arrow
	cp b
	jr nz,.downArrowOff
.downArrowOn
	ld a,[H_DOWNARROWBLINKCNT1]
	dec a
	ld [H_DOWNARROWBLINKCNT1],a
	ret nz
	ld a,[H_DOWNARROWBLINKCNT2]
	dec a
	ld [H_DOWNARROWBLINKCNT2],a
	ret nz
	ld a," "
	ld [hl],a
	ld a,$ff
	ld [H_DOWNARROWBLINKCNT1],a
	ld a,$06
	ld [H_DOWNARROWBLINKCNT2],a
	ret
.downArrowOff
	ld a,[H_DOWNARROWBLINKCNT1]
	and a
	ret z
	dec a
	ld [H_DOWNARROWBLINKCNT1],a
	ret nz
	dec a
	ld [H_DOWNARROWBLINKCNT1],a
	ld a,[H_DOWNARROWBLINKCNT2]
	dec a
	ld [H_DOWNARROWBLINKCNT2],a
	ret nz
	ld a,$06
	ld [H_DOWNARROWBLINKCNT2],a
	ld a,$ee ; down arrow
	ld [hl],a
	ret

; The following code either enables or disables the automatic drawing of
; text boxes by DisplayTextID. Both functions cause DisplayTextID to wait
; for a button press after displaying text (unless [$cc47] is set).

EnableAutoTextBoxDrawing:: ; 3c3c (0:3c3c)
	xor a
	jr AutoTextBoxDrawingCommon

DisableAutoTextBoxDrawing:: ; 3c3f (0:3c3f)
	ld a,$01

AutoTextBoxDrawingCommon:: ; 3c41 (0:3c41)
	ld [$cf0c],a ; control text box drawing
	xor a
	ld [$cc3c],a ; make DisplayTextID wait for button press
	ret

PrintText:: ; 3c49 (0:3c49)
; given a pointer in hl, print the text there
	push hl
	ld a,1
	ld [$D125],a
	call DisplayTextBoxID
	call UpdateSprites
	call Delay3
	pop hl
Func_3c59:: ; 3c59 (0:3c59)
	FuncCoord 1,14
	ld bc,Coord ;$C4B9
	jp TextCommandProcessor

; converts a big-endian binary number into decimal and prints it
; INPUT:
; b = flags and number of bytes
; bit 7: if set, print leading zeroes
;        if unset, do not print leading zeroes
; bit 6: if set, left-align the string (do not pad empty digits with spaces)
;        if unset, right-align the string
; bits 4-5: unused
; bits 0-3: number of bytes (only 1 - 3 bytes supported)
; c = number of decimal digits
; de = address of the number (big-endian)
PrintNumber:: ; 3c5f (0:3c5f)
	push bc
	xor a
	ld [H_PASTLEADINGZEROES],a
	ld [H_NUMTOPRINT],a
	ld [H_NUMTOPRINT + 1],a
	ld a,b
	and a,%00001111
	cp a,1
	jr z,.oneByte
	cp a,2
	jr z,.twoBytes
.threeBytes
	ld a,[de]
	ld [H_NUMTOPRINT],a
	inc de
	ld a,[de]
	ld [H_NUMTOPRINT + 1],a
	inc de
	ld a,[de]
	ld [H_NUMTOPRINT + 2],a
	jr .checkNumDigits
.twoBytes
	ld a,[de]
	ld [H_NUMTOPRINT + 1],a
	inc de
	ld a,[de]
	ld [H_NUMTOPRINT + 2],a
	jr .checkNumDigits
.oneByte
	ld a,[de]
	ld [H_NUMTOPRINT + 2],a
.checkNumDigits
	push de
	ld d,b
	ld a,c
	ld b,a
	xor a
	ld c,a
	ld a,b ; a = number of decimal digits
	cp a,2
	jr z,.tensPlace
	cp a,3
	jr z,.hundredsPlace
	cp a,4
	jr z,.thousandsPlace
	cp a,5
	jr z,.tenThousandsPlace
	cp a,6
	jr z,.hundredThousandsPlace
.millionsPlace
	ld a,1000000 >> 16
	ld [H_POWEROFTEN],a
	ld a,(1000000 >> 8) & $FF
	ld [H_POWEROFTEN + 1],a
	ld a,1000000 & $FF
	ld [H_POWEROFTEN + 2],a
	call PrintNumber_PrintDigit
	call PrintNumber_AdvancePointer
.hundredThousandsPlace
	ld a,100000 >> 16
	ld [H_POWEROFTEN],a
	ld a,(100000 >> 8) & $FF
	ld [H_POWEROFTEN + 1],a
	ld a,100000 & $FF
	ld [H_POWEROFTEN + 2],a
	call PrintNumber_PrintDigit
	call PrintNumber_AdvancePointer
.tenThousandsPlace
	xor a
	ld [H_POWEROFTEN],a
	ld a,10000 >> 8
	ld [H_POWEROFTEN + 1],a
	ld a,10000 & $FF
	ld [H_POWEROFTEN + 2],a
	call PrintNumber_PrintDigit
	call PrintNumber_AdvancePointer
.thousandsPlace
	xor a
	ld [H_POWEROFTEN],a
	ld a,1000 >> 8
	ld [H_POWEROFTEN + 1],a
	ld a,1000 & $FF
	ld [H_POWEROFTEN + 2],a
	call PrintNumber_PrintDigit
	call PrintNumber_AdvancePointer
.hundredsPlace
	xor a
	ld [H_POWEROFTEN],a
	xor a
	ld [H_POWEROFTEN + 1],a
	ld a,100
	ld [H_POWEROFTEN + 2],a
	call PrintNumber_PrintDigit
	call PrintNumber_AdvancePointer
.tensPlace
	ld c,00
	ld a,[H_NUMTOPRINT + 2]
.loop
	cp a,10
	jr c,.underflow
	sub a,10
	inc c
	jr .loop
.underflow
	ld b,a
	ld a,[H_PASTLEADINGZEROES]
	or c
	ld [H_PASTLEADINGZEROES],a
	jr nz,.pastLeadingZeroes
	call PrintNumber_PrintLeadingZero
	jr .advancePointer
.pastLeadingZeroes
	ld a,"0"
	add c
	ld [hl],a
.advancePointer
	call PrintNumber_AdvancePointer
.onesPlace
	ld a,"0"
	add b
	ld [hli],a
	pop de
	dec de
	pop bc
	ret

; prints a decimal digit
; This works by repeatedely subtracting a power of ten until the number becomes negative.
; The number of subtractions it took in order to make the number negative is the digit for the current number place.
; The last value that the number had before becoming negative is kept as the new value of the number.
; A more succinct description is that the number is divided by a power of ten
; and the quotient becomes the digit while the remainder is stored as the new value of the number.
PrintNumber_PrintDigit:: ; 3d25 (0:3d25)
	ld c,0 ; counts number of loop iterations to determine the decimal digit
.loop
	ld a,[H_POWEROFTEN]
	ld b,a
	ld a,[H_NUMTOPRINT]
	ld [H_SAVEDNUMTOPRINT],a
	cp b
	jr c,.underflow0
	sub b
	ld [H_NUMTOPRINT],a
	ld a,[H_POWEROFTEN + 1]
	ld b,a
	ld a,[H_NUMTOPRINT + 1]
	ld [H_SAVEDNUMTOPRINT + 1],a
	cp b
	jr nc,.noBorrowForByte1
.byte1BorrowFromByte0
	ld a,[H_NUMTOPRINT]
	or a,0
	jr z,.underflow1
	dec a
	ld [H_NUMTOPRINT],a
	ld a,[H_NUMTOPRINT + 1]
.noBorrowForByte1
	sub b
	ld [H_NUMTOPRINT + 1],a
	ld a,[H_POWEROFTEN + 2]
	ld b,a
	ld a,[H_NUMTOPRINT + 2]
	ld [H_SAVEDNUMTOPRINT + 2],a
	cp b
	jr nc,.noBorrowForByte2
.byte2BorrowFromByte1
	ld a,[H_NUMTOPRINT + 1]
	and a
	jr nz,.finishByte2BorrowFromByte1
.byte2BorrowFromByte0
	ld a,[H_NUMTOPRINT]
	and a
	jr z,.underflow2
	dec a
	ld [H_NUMTOPRINT],a
	xor a
.finishByte2BorrowFromByte1
	dec a
	ld [H_NUMTOPRINT + 1],a
	ld a,[H_NUMTOPRINT + 2]
.noBorrowForByte2
	sub b
	ld [H_NUMTOPRINT + 2],a
	inc c
	jr .loop
.underflow2
	ld a,[H_SAVEDNUMTOPRINT + 1]
	ld [H_NUMTOPRINT + 1],a
.underflow1
	ld a,[H_SAVEDNUMTOPRINT]
	ld [H_NUMTOPRINT],a
.underflow0
	ld a,[H_PASTLEADINGZEROES]
	or c
	jr z,PrintNumber_PrintLeadingZero
	ld a,"0"
	add c
	ld [hl],a
	ld [H_PASTLEADINGZEROES],a
	ret

; prints a leading zero unless they are turned off in the flags
PrintNumber_PrintLeadingZero:: ; 3d83 (0:3d83)
	bit 7,d ; print leading zeroes?
	ret z
	ld [hl],"0"
	ret

; increments the pointer unless leading zeroes are not being printed,
; the number is left-aligned, and no nonzero digits have been printed yet
PrintNumber_AdvancePointer:: ; 3d89 (0:3d89)
	bit 7,d ; print leading zeroes?
	jr nz,.incrementPointer
	bit 6,d ; left alignment or right alignment?
	jr z,.incrementPointer
	ld a,[H_PASTLEADINGZEROES]
	and a
	ret z
.incrementPointer
	inc hl
	ret

; calls a function from a table of function pointers
; INPUT:
; a = index within table
; hl = address of function pointer table
CallFunctionInTable:: ; 3d97 (0:3d97)
	push hl
	push de
	push bc
	add a
	ld d,0
	ld e,a
	add hl,de
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld de,.returnAddress
	push de
	jp [hl]
.returnAddress
	pop bc
	pop de
	pop hl
	ret


IsInArray::
; Search an array at hl for the value in a.
; Entry size is de bytes.
; Return count b and carry if found.
	ld b, 0

IsInRestOfArray::
	ld c, a
.loop
	ld a, [hl]
	cp -1
	jr z, .notfound
	cp c
	jr z, .found
	inc b
	add hl, de
	jr .loop

.notfound
	and a
	ret

.found
	scf
	ret


Func_3dbe:: ; 3dbe (0:3dbe)
	call ClearSprites
	ld a, $1
	ld [$cfcb], a
	call Func_3e08
	call LoadScreenTilesFromBuffer2
	call LoadTextBoxTilePatterns
	call GoPAL_SET_CF1C
	jr Delay3


GBPalWhiteOutWithDelay3::
	call GBPalWhiteOut

Delay3::
; The bg map is updated each frame in thirds.
; Wait three frames to let the bg map fully update.
	ld c, 3
	jp DelayFrames

GBPalNormal::
; Reset BGP and OBP0.
	ld a, %11100100 ; 3210
	ld [rBGP], a
	ld a, %11010000 ; 3100
	ld [rOBP0], a
	ret

GBPalWhiteOut::
; White out all palettes.
	xor a
	ld [rBGP],a
	ld [rOBP0],a
	ld [rOBP1],a
	ret


GoPAL_SET_CF1C:: ; 3ded (0:3ded)
	ld b,$ff
GoPAL_SET:: ; 3def (0:3def)
	ld a,[$cf1b]
	and a
	ret z
	ld a,$45
	jp Predef

GetHealthBarColor::
; Return at hl the palette of
; an HP bar e pixels long.
	ld a, e
	cp 27
	ld d, 0 ; green
	jr nc, .gotColor
	cp 10
	inc d ; yellow
	jr nc, .gotColor
	inc d ; red
.gotColor
	ld [hl], d
	ret

Func_3e08:: ; 3e08 (0:3e08)
	ld hl, $cfc4
	ld a, [hl]
	push af
	res 0, [hl]
	push hl
	xor a
	ld [W_SPRITESETID], a ; $d3a8
	call DisableLCD
	callba InitMapSprites
	call EnableLCD
	pop hl
	pop af
	ld [hl], a
	call LoadPlayerSpriteGraphics
	call LoadFontTilePatterns
	jp UpdateSprites


GiveItem::
; Give player quantity c of item b,
; and copy the item's name to $cf4b.
; Return carry on success.
	ld a, b
	ld [$d11e], a
	ld [$cf91], a
	ld a, c
	ld [$cf96], a
	ld hl,wNumBagItems
	call AddItemToInventory
	ret nc
	call GetItemName
	call CopyStringToCF4B
	scf
	ret

GivePokemon::
; Give the player monster b at level c.
	ld a, b
	ld [$cf91], a
	ld a, c
	ld [$d127], a
	xor a
	ld [$cc49], a
	ld b, BANK(_GivePokemon)
	ld hl, _GivePokemon
	jp Bankswitch


Random::
; Return a random number in a.
; For battles, use BattleRandom.
	push hl
	push de
	push bc
	callba Random_
	ld a,[hRandomAdd]
	pop bc
	pop de
	pop hl
	ret


Predef::
; Call predefined function a.
; To preserve other registers, have the
; destination call GetPredefRegisters.

	; Save the predef id for GetPredefPointer.
	ld [wPredefID], a

	; A hack for LoadDestinationWarpPosition.
	; See Func_c754 (predef $19).
	ld a, [H_LOADEDROMBANK]
	ld [wPredefParentBank], a

	push af
	ld a, BANK(GetPredefPointer)
	ld [H_LOADEDROMBANK], a
	ld [$2000], a

	call GetPredefPointer

	ld a, [wPredefBank]
	ld [H_LOADEDROMBANK], a
	ld [$2000], a

	ld de, .done
	push de
	jp [hl]
.done

	pop af
	ld [H_LOADEDROMBANK], a
	ld [$2000], a
	ret

GetPredefRegisters::
; Restore the contents of register pairs
; when GetPredefPointer was called.
	ld a, [wPredefRegisters + 0]
	ld h, a
	ld a, [wPredefRegisters + 1]
	ld l, a
	ld a, [wPredefRegisters + 2]
	ld d, a
	ld a, [wPredefRegisters + 3]
	ld e, a
	ld a, [wPredefRegisters + 4]
	ld b, a
	ld a, [wPredefRegisters + 5]
	ld c, a
	ret


Func_3ead:: ; 3ead (0:3ead)
	ld b, BANK(CinnabarGymQuiz_1eb0a)
	ld hl, CinnabarGymQuiz_1eb0a
	jp Bankswitch

Func_3eb5:: ; 3eb5 (0:3eb5)
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, [H_CURRENTPRESSEDBUTTONS]
	bit 0, a
	jr z, .asm_3eea
	ld a, Bank(Func_469a0)
	ld [$2000], a
	ld [H_LOADEDROMBANK], a
	call Func_469a0
	ld a, [$ffee]
	and a
	jr nz, .asm_3edd
	ld a, [$cd3e]
	ld [$2000], a
	ld [H_LOADEDROMBANK], a
	ld de, .asm_3eda
	push de
	jp [hl]
.asm_3eda
	xor a
	jr .asm_3eec
.asm_3edd
	callba PrintBookshelfText
	ld a, [$ffdb]
	and a
	jr z, .asm_3eec
.asm_3eea
	ld a, $ff
.asm_3eec
	ld [$ffeb], a
	pop af
	ld [$2000], a
	ld [H_LOADEDROMBANK], a
	ret

PrintPredefTextID:: ; 3ef5 (0:3ef5)
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	ld hl, PointerTable_3f22
	call Func_3f0f
	ld hl, $cf11
	set 0, [hl]
	call DisplayTextID

Func_3f05:: ; 3f05 (0:3f05)
	ld hl, W_MAPTEXTPTR ; $d36c
	ld a, [$ffec]
	ld [hli], a
	ld a, [$ffed]
	ld [hl], a
	ret

Func_3f0f:: ; 3f0f (0:3f0f)
	ld a, [W_MAPTEXTPTR] ; $d36c
	ld [$ffec], a
	ld a, [$d36d]
	ld [$ffed], a
	ld a, l
	ld [W_MAPTEXTPTR], a ; $d36c
	ld a, h
	ld [$d36d], a
	ret

PointerTable_3f22:: ; 3f22 (0:3f22)
	dw CardKeySuccessText                   ; id = 01
	dw CardKeyFailText                      ; id = 02
	dw RedBedroomPC                         ; id = 03
	dw RedBedroomSNESText                   ; id = 04
	dw PushStartText                        ; id = 05
	dw SaveOptionText                       ; id = 06
	dw StrengthsAndWeaknessesText           ; id = 07
	dw OakLabEmailText                      ; id = 08
	dw AerodactylFossilText                 ; id = 09
	dw Route15UpstairsBinocularsText        ; id = 0A
	dw KabutopsFossilText                   ; id = 0B
	dw GymStatueText1                       ; id = 0C
	dw GymStatueText2                       ; id = 0D
	dw BookcaseText                         ; id = 0E
	dw ViridianCityPokecenterBenchGuyText   ; id = 0F
	dw PewterCityPokecenterBenchGuyText     ; id = 10
	dw CeruleanCityPokecenterBenchGuyText   ; id = 11
	dw LavenderCityPokecenterBenchGuyText   ; id = 12
	dw VermilionCityPokecenterBenchGuyText  ; id = 13
	dw CeladonCityPokecenterBenchGuyText    ; id = 14
	dw CeladonCityHotelText                 ; id = 15
	dw FuchsiaCityPokecenterBenchGuyText    ; id = 16
	dw CinnabarIslandPokecenterBenchGuyText ; id = 17
	dw SaffronCityPokecenterBenchGuyText    ; id = 18
	dw MtMoonPokecenterBenchGuyText         ; id = 19
	dw RockTunnelPokecenterBenchGuyText     ; id = 1A
	dw UnusedBenchGuyText1                  ; id = 1B
	dw UnusedBenchGuyText2                  ; id = 1C
	dw UnusedBenchGuyText3                  ; id = 1D
	dw TerminatorText_62508                 ; id = 1E
	dw PredefText1f                         ; id = 1F
	dw ViridianSchoolNotebook               ; id = 20
	dw ViridianSchoolBlackboard             ; id = 21
	dw JustAMomentText                      ; id = 22
	dw PredefText23                         ; id = 23
	dw FoundHiddenItemText                  ; id = 24
	dw HiddenItemBagFullText                ; id = 25
	dw VermilionGymTrashText                ; id = 26
	dw IndigoPlateauHQText                  ; id = 27
	dw GameCornerOutOfOrderText             ; id = 28
	dw GameCornerOutToLunchText             ; id = 29
	dw GameCornerSomeonesKeysText           ; id = 2A
	dw FoundHiddenCoinsText                 ; id = 2B
	dw DroppedHiddenCoinsText               ; id = 2C
	dw BillsHouseMonitorText                ; id = 2D
	dw BillsHouseInitiatedText              ; id = 2E
	dw BillsHousePokemonList                ; id = 2F
	dw MagazinesText                        ; id = 30
	dw CinnabarGymQuiz                      ; id = 31
	dw GameCornerNoCoinsText                ; id = 32
	dw GameCornerCoinCaseText               ; id = 33
	dw LinkCableHelp                        ; id = 34
	dw TMNotebook                           ; id = 35
	dw FightingDojoText                     ; id = 36
	dw FightingDojoText_52a10               ; id = 37
	dw FightingDojoText_52a1d               ; id = 38
	dw NewBicycleText                       ; id = 39
	dw IndigoPlateauStatues                 ; id = 3A
	dw VermilionGymTrashSuccesText1         ; id = 3B
	dw VermilionGymTrashSuccesText2         ; id = 3C
	dw VermilionGymTrashSuccesText3         ; id = 3D
	dw VermilionGymTrashFailText            ; id = 3E
	dw TownMapText                          ; id = 3F
	dw BookOrSculptureText                  ; id = 40
	dw ElevatorText                         ; id = 41
	dw PokemonStuffText                     ; id = 42

SECTION "bank1",ROMX,BANK[$1]

SpriteFacingAndAnimationTable: ; 4000 (1:4000)
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; facing down, walk animation frame 0
	dw SpriteFacingDownAndWalking, SpriteOAMParameters         ; facing down, walk animation frame 1
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; facing down, walk animation frame 2
	dw SpriteFacingDownAndWalking, SpriteOAMParametersFlipped  ; facing down, walk animation frame 3
	dw SpriteFacingUpAndStanding, SpriteOAMParameters          ; facing up, walk animation frame 0
	dw SpriteFacingUpAndWalking, SpriteOAMParameters           ; facing up, walk animation frame 1
	dw SpriteFacingUpAndStanding, SpriteOAMParameters          ; facing up, walk animation frame 2
	dw SpriteFacingUpAndWalking, SpriteOAMParametersFlipped    ; facing up, walk animation frame 3
	dw SpriteFacingLeftAndStanding, SpriteOAMParameters        ; facing left, walk animation frame 0
	dw SpriteFacingLeftAndWalking, SpriteOAMParameters         ; facing left, walk animation frame 1
	dw SpriteFacingLeftAndStanding, SpriteOAMParameters        ; facing left, walk animation frame 2
	dw SpriteFacingLeftAndWalking, SpriteOAMParameters         ; facing left, walk animation frame 3
	dw SpriteFacingLeftAndStanding, SpriteOAMParametersFlipped ; facing right, walk animation frame 0
	dw SpriteFacingLeftAndWalking, SpriteOAMParametersFlipped  ; facing right, walk animation frame 1
	dw SpriteFacingLeftAndStanding, SpriteOAMParametersFlipped ; facing right, walk animation frame 2
	dw SpriteFacingLeftAndWalking, SpriteOAMParametersFlipped  ; facing right, walk animation frame 3
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; ---
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; This table is used for sprites $a and $b.
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; All orientation and animation parameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; lead to the same result. Used for immobile
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; sprites like items on the ground
	dw SpriteFacingDownAndStanding, SpriteOAMParameters        ; ---
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters
	dw SpriteFacingDownAndStanding, SpriteOAMParameters

SpriteFacingDownAndStanding: ; 4080 (1:4080)
	db $00,$01,$02,$03
SpriteFacingDownAndWalking: ; 4084 (1:4084)
	db $80,$81,$82,$83
SpriteFacingUpAndStanding: ; 4088 (1:4088)
	db $04,$05,$06,$07
SpriteFacingUpAndWalking: ; 408c (1:408c)
	db $84,$85,$86,$87
SpriteFacingLeftAndStanding: ; 4090 (1:4090)
	db $08,$09,$0a,$0b
SpriteFacingLeftAndWalking: ; 4094 (1:4094)
	db $88,$89,$8a,$8b

SpriteOAMParameters: ; 4098 (1:4098)
	db $00,$00, $00                                      ; top left
	db $00,$08, $00                                      ; top right
	db $08,$00, OAMFLAG_CANBEMASKED                      ; bottom left
	db $08,$08, OAMFLAG_CANBEMASKED | OAMFLAG_ENDOFDATA  ; bottom right
SpriteOAMParametersFlipped: ; 40a4 (1:40a4)
	db $00,$08, OAMFLAG_VFLIPPED
	db $00,$00, OAMFLAG_VFLIPPED
	db $08,$08, OAMFLAG_VFLIPPED | OAMFLAG_CANBEMASKED
	db $08,$00, OAMFLAG_VFLIPPED | OAMFLAG_CANBEMASKED | OAMFLAG_ENDOFDATA

Func_40b0: ; 40b0 (1:40b0)
	xor a
	ld [$cf0b], a
	ld [$d700], a
	ld [W_ISINBATTLE], a ; $d057
	ld [$d35d], a
	ld [$cf10], a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld [$cc57], a
	ld [wFlags_0xcd60], a
	ld [$ff9f], a
	ld [$ffa0], a
	ld [$ffa1], a
	call HasEnoughMoney
	jr c, .asm_40ff
	ld a, [wPlayerMoney] ; $d347
	ld [$ff9f], a
	ld a, [wPlayerMoney + 1] ; $d348
	ld [$ffa0], a
	ld a, [wPlayerMoney + 2] ; $d349
	ld [$ffa1], a
	xor a
	ld [$ffa2], a
	ld [$ffa3], a
	ld a, $2
	ld [$ffa4], a
	ld a, $d
	call Predef ; indirect jump to Func_f71e (f71e (3:771e))
	ld a, [$ffa2]
	ld [wPlayerMoney], a ; $d347
	ld a, [$ffa3]
	ld [wPlayerMoney + 1], a ; $d348
	ld a, [$ffa4]
	ld [wPlayerMoney + 2], a ; $d349
.asm_40ff
	ld hl, $d732
	set 2, [hl]
	res 3, [hl]
	set 6, [hl]
	ld a, $ff
	ld [wJoypadForbiddenButtonsMask], a
	ld a, $7
	jp Predef ; indirect jump to HealParty (f6a5 (3:76a5))

MewPicFront: ; 4112 (1:4112)
	INCBIN "pic/bmon/mew.pic"
MewPicBack: ; 4205 (1:4205)
	INCBIN "pic/monback/mewb.pic"

INCLUDE "data/baseStats/mew.asm"

INCLUDE "engine/battle/safari_zone.asm"

INCLUDE "engine/titlescreen.asm"

NintenText: ; 45aa (1:45aa)
	db "NINTEN@"

SonyText: ; 45b1 (1:45b1)
	db "SONY@"

; loads pokemon data from one of multiple sources to $cf98
; loads base stats to $d0b8
; INPUT:
; [$cf92] = index of pokemon within party/box
; [$cc49] = source
; 00: player's party
; 01: enemy's party
; 02: current box
; 03: daycare
; OUTPUT:
; [$cf91] = pokemon ID
; $cf98 = base address of pokemon data
; $d0b8 = base address of base stats
LoadMonData_: ; 45b6 (1:45b6)
	ld a,[W_DAYCAREMONDATA] ; daycare pokemon ID
	ld [$cf91],a
	ld a,[$cc49]
	cp a,$03
	jr z,.GetMonHeader
	ld a,[wWhichPokemon]
	ld e,a
	callab Func_39c37 ; get pokemon ID
.GetMonHeader
	ld a,[$cf91]
	ld [$d0b5],a ; input for GetMonHeader
	call GetMonHeader ; load base stats to $d0b8
	ld hl,W_PARTYMON1DATA
	ld bc,44
	ld a,[$cc49]
	cp a,$01
	jr c,.getMonEntry
	ld hl,wEnemyMons ; enemy pokemon 1 data
	jr z,.getMonEntry
	cp a,$02
	ld hl,W_BOXMON1DATA ; box pokemon 1 data
	ld bc,33
	jr z,.getMonEntry
	ld hl, W_DAYCAREMONDATA ; daycare pokemon data
	jr .copyMonData
.getMonEntry ; add the product of the index and the size of each entry
	ld a,[wWhichPokemon]
	call AddNTimes
.copyMonData
	ld de,$cf98
	ld bc,44
	jp CopyData

INCLUDE "data/item_prices.asm"

INCLUDE "text/item_names.asm"

UnusedNames: ; 4a92 (1:4a92)
	db "かみなりバッヂ@"
	db "かいがらバッヂ@"
	db "おじぞうバッヂ@"
	db "はやぶさバッヂ@"
	db "ひんやりバッヂ@"
	db "なかよしバッヂ@"
	db "バラバッヂ@"
	db "ひのたまバッヂ@"
	db "ゴールドバッヂ@"
	db "たまご@"
	db "ひよこ@"
	db "ブロンズ@"
	db "シルバー@"
	db "ゴールド@"
	db "プチキャプテン@"
	db "キャプテン@"
	db "プチマスター@"
	db "マスター@"
	db "エクセレント"

; calculates the OAM data for all currently visible sprites and writes it to wOAMBuffer
PrepareOAMData: ; 4b0f (1:4b0f)
	ld a, [$cfcb]
	dec a
	jr z, .asm_4b1e
	cp $ff
	ret nz
	ld [$cfcb], a
	jp HideSprites
.asm_4b1e
	xor a
	ld [$ff90], a
.asm_4b21
	ld [$ff8f], a
	ld d, $c1
	ld a, [$ff8f]
	ld e, a
	ld a, [de]         ; c1x0
	and a
	jp z, .asm_4bad
	inc e
	inc e
	ld a, [de]         ; c1x2 read combined orientation and animation info
	ld [$d5cd], a
	cp $ff
	jr nz, .spriteVisible   ; $ff -> offscreen, don't draw
	call Func_4bd1
	jr .asm_4bad
.spriteVisible
	cp $a0
	jr c, .considerOrientation ; if >= $a0, ignore the sprite orientation and animation (by using a different conversion table)
	and $f
	add $10
	jr .asm_4b48
.considerOrientation
	and $f                     ; the lower nybble contains orientation and animation info
.asm_4b48
	ld l, a
	push de
	inc d
	ld a, e
	add $5
	ld e, a
	ld a, [de]         ; c2x7
	and $80
	ld [$ff94], a          ; temp store bit 7 for later use in OAM flags (draws sprite behind background (used for grass))
	pop de
	ld h, $0
	ld bc, SpriteFacingAndAnimationTable
	add hl, hl
	add hl, hl
	add hl, bc                 ; skip to the table location determined by orientation and animation
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_4bd1
	ld a, [$ff90]
	ld e, a
	ld d, $c3                ; wOAMBuffer+x is buffer for OAM data
.spriteTilesLoop             ; loops 4 times for the 4 tiles a sprite consists of
	ld a, [$ff92]        ; temp for sprite Y position
	add $10                  ; Y=16 is top of screen (Y=0 is invisible)
	add [hl]                 ; add Y offset from table
	ld [de], a               ; write new sprite OAM Y position
	inc hl
	ld a, [$ff91]        ; temp for sprite X position
	add $8                   ; X=8 is left of screen (X=0 is invisible)
	add [hl]                 ; add X offset from table
	inc e
	ld [de], a               ; write new sprite OAM X position
	inc e
	ld a, [bc]               ; read pattern number offset (accomodates orientation (offset 0,4 or 8) and animation (offset 0 or $80))
	inc bc
	push bc
	ld b, a
	ld a, [$d5cd]            ; temp copy of c1x2
	swap a                   ; high nybble determines sprite used (0 is always player sprite, next are some npcs)
	and $f
	cp $b                    ; sprites $a and $b have no orientation or animation and therefore only 4 tiles
	jr nz, .calcTileOffset   ; (instead of 12), so tile b's offset is a special case
	ld a, $7c                ; = $a * 12 + 4
	jr .doneCalcTileOffset
.calcTileOffset
	sla a
	sla a
	ld c, a
	sla a
	add c                    ; a *= 12 (each sprite consists of 12 tiles)
.doneCalcTileOffset
	add b                    ; add orientation and animation offset
	pop bc
	ld [de], a               ; write OAM sprite pattern number
	inc hl
	inc e
	ld a, [hl]
	bit 1, a                 ; bit 1 is ignored for OAM, it's used here as an "always in foregroud" flag.
	jr z, .alwaysInForeground
	ld a, [$ff94]        ; load bit 7 (set to $80 if sprite is in grass and should be drawn behind it)
	or [hl]
.alwaysInForeground
	inc hl
	ld [de], a               ; write OAM sprite flags
	inc e
	bit 0, a                 ; test for OAMFLAG_ENDOFDATA
	jr z, .spriteTilesLoop
	ld a, e
	ld [$ff90], a
.asm_4bad
	ld a, [$ff8f]
	add $10
	cp $0
	jp nz, .asm_4b21
	ld a, [$ff90]
	ld l, a
	ld h, $c3
	ld de, $4
	ld b, $a0
	ld a, [$d736]
	bit 6, a
	ld a, $a0
	jr z, .clearUnusedOAMEntriesLoop
	ld a, $90
.clearUnusedOAMEntriesLoop
	cp l
	ret z
	ld [hl], b
	add hl, de
	jr .clearUnusedOAMEntriesLoop

Func_4bd1: ; 4bd1 (1:4bd1)
	inc e
	inc e
	ld a, [de]            ; c1x4
	ld [$ff92], a
	inc e
	inc e
	ld a, [de]            ; c1x6
	ld [$ff91], a
	ld a, $4
	add e
	ld e, a
	ld a, [$ff92]
	add $4
	and $f0
	ld [de], a            ; c1xa (sprite Y pos (snapped to whole steps (?))
	inc e
	ld a, [$ff91]
	and $f0
	ld [de], a            ; c1xb (sprite X pos (snapped to whole steps (?))
	ret

; copies DMA routine to HRAM. By GB specifications, all DMA needs to be done in HRAM (no other memory section is available during DMA)
WriteDMACodeToHRAM: ; 4bed (1:4bed)
	ld c, $80
	ld b, $a
	ld hl, DMARoutine
.copyLoop
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .copyLoop
	ret

; this routine is copied to HRAM and executed there on every VBlank
DMARoutine: ; 4bfb (1:4bfb)
	ld a, $c3
	ld [$ff46], a   ; start DMA
	ld a, $28
.waitLoop               ; wait for DMA to finish
	dec a
	jr nz, .waitLoop
	ret

PrintWaitingText: ; 4c05 (1:4c05)
	FuncCoord 3, 10 ; $c46b
	ld hl, Coord
	ld b, $1
	ld c, $b
	ld a, [W_ISINBATTLE] ; $d057
	and a
	jr z, .asm_4c17
	call TextBoxBorder
	jr .asm_4c1a
.asm_4c17
	call Func_5ab3
.asm_4c1a
	FuncCoord 4, 11 ; $c480
	ld hl, Coord
	ld de, WaitingText
	call PlaceString
	ld c, $32
	jp DelayFrames

WaitingText: ; 4c28 (1:4c28)
	db "Waiting...!@"

_UpdateSprites: ; 4c34 (1:4c34)
	ld h, $c1
	inc h
	ld a, $e    ; $c20e
.spriteLoop
	ld l, a
	sub $e
	ld c, a
	ld [H_CURRENTSPRITEOFFSET], a
	ld a, [hl]
	and a
	jr z, .skipSprite   ; tests $c2Xe
	push hl
	push de
	push bc
	call .updateCurrentSprite
	pop bc
	pop de
	pop hl
.skipSprite
	ld a, l
	add $10             ; move to next sprite
	cp $e               ; test for overflow (back at $0e)
	jr nz, .spriteLoop
	ret
.updateCurrentSprite ; 4c54 (1:4c54)
	cp $1
	jp nz, UpdateNonPlayerSprite
	jp UpdatePlayerSprite

UpdateNonPlayerSprite: ; 4c5c (1:4c5c)
	dec a
	swap a
	ld [$ff93], a  ; $10 * sprite#
	ld a, [$cf17] ; some sprite offset?
	ld b, a
	ld a, [H_CURRENTSPRITEOFFSET]
	cp b
	jr nz, .unequal
	jp Func_5236
.unequal
	jp Func_4ed1

Func_4c70: ; 4c70 (1:4c70)
	nop
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $0
	ld l, a
	ld a, [hl]
	and a
	ret z
	ld a, l
	add $3
	ld l, a
	ld a, [hli]
	call Func_4d72
	ld a, [hli]
	add $4
	add b
	and $f0
	or c
	ld [$ff90], a
	ld a, [hli]
	call Func_4d72
	ld a, [hl]
	add b
	and $f0
	or c
	ld [$ff91], a
	ld a, l
	add $7
	ld l, a
	xor a
	ld [hld], a
	ld [hld], a
	ld a, [$ff91]
	ld [hld], a
	ld a, [$ff90]
	ld [hl], a
	xor a

Func_4ca5: ; 4ca5 (1:4ca5)
	ld [$ff8f], a
	swap a
	ld e, a
	ld a, [H_CURRENTSPRITEOFFSET]
	cp e
	jp z, .asm_4d69
	ld d, h
	ld a, [de]
	and a
	jp z, .asm_4d69
	inc e
	inc e
	ld a, [de]
	inc a
	jp z, .asm_4d69
	ld a, [H_CURRENTSPRITEOFFSET]
	add $a
	ld l, a
	inc e
	ld a, [de]
	call Func_4d72
	inc e
	ld a, [de]
	add $4
	add b
	and $f0
	or c
	sub [hl]
	jr nc, .asm_4cd4
	cpl
	inc a
.asm_4cd4
	ld [$ff90], a
	push af
	rl c
	pop af
	ccf
	rl c
	ld b, $7
	ld a, [hl]
	and $f
	jr z, .asm_4ce6
	ld b, $9
.asm_4ce6
	ld a, [$ff90]
	sub b
	ld [$ff92], a
	ld a, b
	ld [$ff90], a
	jr c, .asm_4d01
	ld b, $7
	dec e
	ld a, [de]
	inc e
	and a
	jr z, .asm_4cfa
	ld b, $9
.asm_4cfa
	ld a, [$ff92]
	sub b
	jr z, .asm_4d01
	jr nc, .asm_4d69
.asm_4d01
	inc e
	inc l
	ld a, [de]
	push bc
	call Func_4d72
	inc e
	ld a, [de]
	add b
	and $f0
	or c
	pop bc
	sub [hl]
	jr nc, .asm_4d14
	cpl
	inc a
.asm_4d14
	ld [$ff91], a
	push af
	rl c
	pop af
	ccf
	rl c
	ld b, $7
	ld a, [hl]
	and $f
	jr z, .asm_4d26
	ld b, $9
.asm_4d26
	ld a, [$ff91]
	sub b
	ld [$ff92], a
	ld a, b
	ld [$ff91], a
	jr c, .asm_4d41
	ld b, $7
	dec e
	ld a, [de]
	inc e
	and a
	jr z, .asm_4d3a
	ld b, $9
.asm_4d3a
	ld a, [$ff92]
	sub b
	jr z, .asm_4d41
	jr nc, .asm_4d69
.asm_4d41
	ld a, [$ff91]
	ld b, a
	ld a, [$ff90]
	inc l
	cp b
	jr c, .asm_4d4e
	ld b, $c
	jr .asm_4d50
.asm_4d4e
	ld b, $3
.asm_4d50
	ld a, c
	and b
	or [hl]
	ld [hl], a
	ld a, c
	inc l
	inc l
	ld a, [$ff8f]
	ld de, DiagonalLines ; $4d85
	add a
	add e
	ld e, a
	jr nc, .asm_4d62
	inc d
.asm_4d62
	ld a, [de]
	or [hl]
	ld [hli], a
	inc de
	ld a, [de]
	or [hl]
	ld [hl], a
.asm_4d69
	ld a, [$ff8f]
	inc a
	cp $10
	jp nz, Func_4ca5
	ret

Func_4d72: ; 4d72 (1:4d72)
	and a
	ld b, $0
	ld c, $0
	jr z, .asm_4d84
	ld c, $9
	cp $ff
	jr z, .asm_4d83
	ld c, $7
	ld a, $0
.asm_4d83
	ld b, a
.asm_4d84
	ret

DiagonalLines: ; 4d85 (1:4d85)
	INCBIN "gfx/diagonal_lines.2bpp"

Func_4da5: ; 4da5 (1:4da5)
	ret

Func_4da6: ; 4da6 (1:4da6)
	call GBPalNormal
	ld a, $80
	ld [W_OBTAINEDBADGES], a
	ld hl, W_FLAGS_D733
	set 0, [hl]
	ld hl, W_NUMINPARTY
	xor a
	ld [hli], a
	dec a
	ld [hl], a
	ld a, $1
	ld [$cf91], a
	ld a, 20
	ld [W_CURENEMYLVL], a
	xor a
	ld [$cc49], a
	ld [W_CURMAP], a
	call AddPokemonToParty
	ld a, RHYDON
	ld [W_CUROPPONENT], a
	ld a, $2c
	call Predef
	ld a, $1
	ld [$cfcb], a
	ld [H_AUTOBGTRANSFERENABLED], a
	jr Func_4da6

PickupItem: ; 4de1 (1:4de1)
	call EnableAutoTextBoxDrawing
	ld a, [H_DOWNARROWBLINKCNT2] ; $ff8c
	ld b, a
	ld hl, W_MISSABLEOBJECTLIST
.missableObjectsListLoop
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr z, .isMissable
	inc hl
	jr .missableObjectsListLoop
.isMissable
	ld a, [hl]
	ld [$ffdb], a
	ld hl, W_MAPSPRITEEXTRADATA
	ld a, [H_DOWNARROWBLINKCNT2] ; $ff8c
	dec a
	add a
	ld d, $0
	ld e, a
	add hl, de        ; seek to item data of found item
	ld a, [hl]        ; read Item type
	ld b, a
	ld c, 1          ; quantity is 1
	call GiveItem
	jr nc, .BagFull
	ld a, [$ffdb]
	ld [$cc4d], a
	ld a, $11
	call Predef ; indirect jump to RemoveMissableObject (f1d7 (3:71d7))
	ld a, $1
	ld [$cc3c], a
	ld hl, FoundItemText
	jr .printText
.BagFull
	ld hl, NoMoreRoomForItemText
.printText
	call PrintText
	ret

FoundItemText: ; 4e26 (1:4e26)
	TX_FAR _FoundItemText
	db $0B
	db "@"

NoMoreRoomForItemText: ; 4e2c (1:4e2c)
	TX_FAR _NoMoreRoomForItemText
	db "@"

UpdatePlayerSprite: ; 4e31 (1:4e31)
	ld a, [wSpriteStateData2]
	and a
	jr z, .asm_4e41
	cp $ff
	jr z, .asm_4e4a
	dec a
	ld [wSpriteStateData2], a
	jr .asm_4e4a
.asm_4e41
	FuncCoord 8, 9 ; $c45c
	ld a, [Coord]
	ld [$ff93], a
	cp $60
	jr c, .asm_4e50
.asm_4e4a
	ld a, $ff
	ld [$c102], a
	ret
.asm_4e50
	call Func_4c70
	ld h, $c1
	ld a, [wWalkCounter] ; $cfc5
	and a
	jr nz, .asm_4e90
	ld a, [$d528]
	bit 2, a
	jr z, .asm_4e65
	xor a
	jr .asm_4e86
.asm_4e65
	bit 3, a
	jr z, .asm_4e6d
	ld a, $4
	jr .asm_4e86
.asm_4e6d
	bit 1, a
	jr z, .asm_4e75
	ld a, $8
	jr .asm_4e86
.asm_4e75
	bit 0, a
	jr z, .asm_4e7d
	ld a, $c
	jr .asm_4e86
.asm_4e7d
	xor a
	ld [$c107], a
	ld [$c108], a
	jr .asm_4eab
.asm_4e86
	ld [$c109], a
	ld a, [$cfc4]
	bit 0, a
	jr nz, .asm_4e7d
.asm_4e90
	ld a, [$d736]
	bit 7, a
	jr nz, .asm_4eb6
	ld a, [H_CURRENTSPRITEOFFSET]
	add $7
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $4
	jr nz, .asm_4eab
	xor a
	ld [hl], a
	inc hl
	ld a, [hl]
	inc a
	and $3
	ld [hl], a
.asm_4eab
	ld a, [$c108]
	ld b, a
	ld a, [$c109]
	add b
	ld [$c102], a
.asm_4eb6
	ld a, [$ff93]
	ld c, a
	ld a, [W_GRASSTILE]
	cp c
	ld a, $0
	jr nz, .asm_4ec3
	ld a, $80
.asm_4ec3
	ld [$c207], a
	ret

Func_4ec7: ; 4ec7 (1:4ec7)
	push bc
	push af
	ld a, [$ffda]
	ld c, a
	pop af
	add c
	ld l, a
	pop bc
	ret

Func_4ed1: ; 4ed1 (1:4ed1)
	ld a, [H_CURRENTSPRITEOFFSET]
	swap a
	dec a
	add a
	ld hl, W_MAPSPRITEDATA ; $d4e4
	add l
	ld l, a
	ld a, [hl]        ; read movement byte 2
	ld [wCurSpriteMovement2], a
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	ld l, a
	inc l
	ld a, [hl]        ; c1x1
	and a
	jp z, InitializeSpriteStatus
	call CheckSpriteAvailability
	ret c             ; if sprite is invisible, on tile >=$60, in grass or player is currently walking
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	ld l, a
	inc l
	ld a, [hl]        ; c1x1
	bit 7, a
	jp nz, InitializeSpriteFacingDirection  ; c1x1 >= $80
	ld b, a
	ld a, [$cfc4]
	bit 0, a
	jp nz, notYetMoving
	ld a, b
	cp $2
	jp z, UpdateSpriteMovementDelay  ; c1x1 == 2
	cp $3
	jp z, UpdateSpriteInWalkingAnimation  ; c1x1 == 3
	ld a, [wWalkCounter] ; $cfc5
	and a
	ret nz           ; don't do anything yet if player is currently moving (redundant, already tested in CheckSpriteAvailability)
	call InitializeSpriteScreenPosition
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $6
	ld l, a
	ld a, [hl]       ; c2x6: movement byte 1
	inc a
	jr z, .asm_4f59  ; value $FF
	inc a
	jr z, .asm_4f59  ; value $FE
	dec a
	ld [hl], a       ; (temporarily) increment movement byte 1
	dec a
	push hl
	ld hl, $cf0f
	dec [hl]         ; decrement $cf0f
	pop hl
	ld de, $cc5b
	call LoadDEPlusA ; a = [$cc5b + movement byte 1]
	cp $e0
	jp z, ChangeFacingDirection
	cp $ff
	jr nz, .asm_4f4b
	ld [hl], a       ; reset movement byte 1 to initial value
	ld hl, $d730
	res 0, [hl]
	xor a
	ld [$cd38], a
	ld [$cd3a], a
	ret
.asm_4f4b
	cp $fe
	jr nz, .asm_4f5f
	ld [hl], $1     ; set movement byte 1 to $1
	ld de, $cc5b
	call LoadDEPlusA ; a = [$cc5b + $fe] (?)
	jr .asm_4f5f
.asm_4f59
	call getTileSpriteStandsOn
	call Random
.asm_4f5f
	ld b, a
	ld a, [wCurSpriteMovement2]
	cp $d0
	jr z, .moveDown    ; movement byte 2 = $d0 forces down
	cp $d1
	jr z, .moveUp      ; movement byte 2 = $d1 forces up
	cp $d2
	jr z, .moveLeft    ; movement byte 2 = $d2 forces left
	cp $d3
	jr z, .moveRight   ; movement byte 2 = $d3 forces right
	ld a, b
	cp $40             ; a < $40: down (or left)
	jr nc, .notDown
	ld a, [wCurSpriteMovement2]
	cp $2
	jr z, .moveLeft    ; movement byte 2 = $2 only allows left or right
.moveDown
	ld de, 2*20
	add hl, de         ; move tile pointer two rows down
	ld de, $100

	ld bc, $400
	jr TryWalking
.notDown
	cp $80             ; $40 <= a < $80: up (or right)
	jr nc, .notUp
	ld a, [wCurSpriteMovement2]
	cp $2
	jr z, .moveRight   ; movement byte 2 = $2 only allows left or right
.moveUp
	ld de, -2*20 ; $ffd8
	add hl, de         ; move tile pointer two rows up
	ld de, $ff00
	ld bc, $804
	jr TryWalking
.notUp
	cp $c0             ; $80 <= a < $c0: left (or up)
	jr nc, .notLeft
	ld a, [wCurSpriteMovement2]
	cp $1
	jr z, .moveUp      ; movement byte 2 = $1 only allows up or down
.moveLeft
	dec hl
	dec hl             ; move tile pointer two columns left
	ld de, $ff
	ld bc, $208
	jr TryWalking
.notLeft              ; $c0 <= a: right (or down)
	ld a, [wCurSpriteMovement2]
	cp $1
	jr z, .moveDown    ; movement byte 2 = $1 only allows up or down
.moveRight
	inc hl
	inc hl             ; move tile pointer two columns right
	ld de, $1
	ld bc, $10c
	jr TryWalking

; changes facing direction by zeroing the movement delta and calling TryWalking
ChangeFacingDirection: ; 4fc8 (1:4fc8)
	ld de, $0
	; fall through

; b: direction (1,2,4 or 8)
; c: new facing direction (0,4,8 or $c)
; d: Y movement delta (-1, 0 or 1)
; e: X movement delta (-1, 0 or 1)
; hl: pointer to tile the sprite would wlak onto
; set carry on failure, clears carry on success
TryWalking: ; 4fcb (1:4fcb)
	push hl
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $9
	ld l, a
	ld [hl], c          ; c1x9 (update facing direction)
	ld a, [H_CURRENTSPRITEOFFSET]
	add $3
	ld l, a
	ld [hl], d          ; c1x3 (update Y movement delta)
	inc l
	inc l
	ld [hl], e          ; c1x5 (update X movement delta)
	pop hl
	push de
	ld c, [hl]          ; read tile to walk onto
	call CanWalkOntoTile
	pop de
	ret c               ; cannot walk there (reinitialization of delay values already done)
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $4
	ld l, a
	ld a, [hl]          ; c2x4: Y position
	add d
	ld [hli], a         ; update Y position
	ld a, [hl]          ; c2x5: X position
	add e
	ld [hl], a          ; update X position
	ld a, [H_CURRENTSPRITEOFFSET]
	ld l, a
	ld [hl], $10        ; c2x0=16: walk animation counter
	dec h
	inc l
	ld [hl], $3         ; c1x1: set movement status to walking
	jp UpdateSpriteImage

; update the walking animation parameters for a sprite that is currently walking
UpdateSpriteInWalkingAnimation: ; 4ffe (1:4ffe)
	ld a, [H_CURRENTSPRITEOFFSET]
	add $7
	ld l, a
	ld a, [hl]                       ; c1x7 (counter until next walk animation frame)
	inc a
	ld [hl], a                       ; c1x7 += 1
	cp $4
	jr nz, .noNextAnimationFrame
	xor a
	ld [hl], a                       ; c1x7 = 0
	inc l
	ld a, [hl]                       ; c1x8 (walk animation frame)
	inc a
	and $3
	ld [hl], a                       ; advance to next animation frame every 4 ticks (16 ticks total for one step)
.noNextAnimationFrame
	ld a, [H_CURRENTSPRITEOFFSET]
	add $3
	ld l, a
	ld a, [hli]                      ; c1x3 (movement Y delta)
	ld b, a
	ld a, [hl]                       ; c1x4 (screen Y position)
	add b
	ld [hli], a                      ; update screen Y position
	ld a, [hli]                      ; c1x5 (movement X delta)
	ld b, a
	ld a, [hl]                       ; c1x6 (screen X position)
	add b
	ld [hl], a                       ; update screen X position
	ld a, [H_CURRENTSPRITEOFFSET]
	ld l, a
	inc h
	ld a, [hl]                       ; c2x0 (walk animantion counter)
	dec a
	ld [hl], a                       ; update walk animantion counter
	ret nz
	ld a, $6                         ; walking finished, update state
	add l
	ld l, a
	ld a, [hl]                       ; c2x6 (movement byte 1)
	cp $fe
	jr nc, .initNextMovementCounter  ; values $fe and $ff
	ld a, [H_CURRENTSPRITEOFFSET]
	inc a
	ld l, a
	dec h
	ld [hl], $1                      ; c1x1 = 1 (movement status ready)
	ret
.initNextMovementCounter
	call Random
	ld a, [H_CURRENTSPRITEOFFSET]
	add $8
	ld l, a
	ld a, [hRandomAdd]
	and $7f
	ld [hl], a                       ; c2x8: set next movement delay to a random value in [0,$7f]
	dec h                            ;       note that value 0 actually makes the delay $100 (bug?)
	ld a, [H_CURRENTSPRITEOFFSET]
	inc a
	ld l, a
	ld [hl], $2                      ; c1x1 = 2 (movement status)
	inc l
	inc l
	xor a
	ld b, [hl]                       ; c1x3 (movement Y delta)
	ld [hli], a                      ; reset movement Y delta
	inc l
	ld c, [hl]                       ; c1x5 (movement X delta)
	ld [hl], a                       ; reset movement X delta
	ret

; update delay value (c2x8) for sprites in the delayed state (c1x1)
UpdateSpriteMovementDelay: ; 5057 (1:5057)
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $6
	ld l, a
	ld a, [hl]              ; c2x6: movement byte 1
	inc l
	inc l
	cp $fe
	jr nc, .tickMoveCounter ; values $fe or $ff
	ld [hl], $0
	jr .moving
.tickMoveCounter
	dec [hl]                ; c2x8: frame counter until next movement
	jr nz, notYetMoving
.moving
	dec h
	ld a, [H_CURRENTSPRITEOFFSET]
	inc a
	ld l, a
	ld [hl], $1             ; c1x1 = 1 (mark as ready to move)
notYetMoving: ; 5073 (1:5073)
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $8
	ld l, a
	ld [hl], $0             ; c1x8 = 0 (walk animation frame)
	jp UpdateSpriteImage

InitializeSpriteFacingDirection: ; 507f (1:507f)
	ld a, [$d72d]
	bit 5, a
	jr nz, notYetMoving
	res 7, [hl]
	ld a, [$d52a]
	bit 3, a
	jr z, .notFacingDown
	ld c, $0                ; make sprite face down
	jr .facingDirectionDetermined
.notFacingDown
	bit 2, a
	jr z, .notFacingUp
	ld c, $4                ; make sprite face up
	jr .facingDirectionDetermined
.notFacingUp
	bit 1, a
	jr z, .notFacingRight
	ld c, $c                ; make sprite face right
	jr .facingDirectionDetermined
.notFacingRight
	ld c, $8                ; make sprite face left
.facingDirectionDetermined
	ld a, [H_CURRENTSPRITEOFFSET]
	add $9
	ld l, a
	ld [hl], c              ; c1x9: set facing direction
	jr notYetMoving

InitializeSpriteStatus: ; 50ad (1:50ad)
	ld [hl], $1   ; $c1x1: set movement status to ready
	inc l
	ld [hl], $ff  ; $c1x2: set sprite image to $ff (invisible/off screen)
	inc h
	ld a, [H_CURRENTSPRITEOFFSET]
	add $2
	ld l, a
	ld a, $8
	ld [hli], a   ; $c2x2: set Y displacement to 8
	ld [hl], a    ; $c2x3: set X displacement to 8
	ret

; calculates the spprite's scrren position form its map position and the player position
InitializeSpriteScreenPosition: ; 50bd (1:50bd)
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $4
	ld l, a
	ld a, [W_YCOORD] ; $d361
	ld b, a
	ld a, [hl]      ; c2x4 (Y position + 4)
	sub b           ; relative to player position
	swap a          ; * 16
	sub $4          ; - 4
	dec h
	ld [hli], a     ; c1x4 (screen Y position)
	inc h
	ld a, [W_XCOORD] ; $d362
	ld b, a
	ld a, [hli]     ; c2x6 (X position + 4)
	sub b           ; relative to player position
	swap a          ; * 16
	dec h
	ld [hl], a      ; c1x6 (screen X position)
	ret

; tests if sprite is off screen or otherwise unable to do anything
CheckSpriteAvailability: ; 50dc (1:50dc)
	ld a, $12
	call Predef ; indirect jump to IsMissableObjectHidden (f1a6 (3:71a6))
	ld a, [$ffe5]
	and a
	jp nz, .spriteInvisible
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $6
	ld l, a
	ld a, [hl]      ; c2x6: movement byte 1
	cp $fe
	jr c, .skipXVisibilityTest ; movement byte 1 < $fe
	ld a, [H_CURRENTSPRITEOFFSET]
	add $4
	ld l, a
	ld b, [hl]      ; c2x4: Y pos (+4)
	ld a, [W_YCOORD] ; $d361
	cp b
	jr z, .skipYVisibilityTest
	jr nc, .spriteInvisible ; above screen region
	add $8                  ; screen is 9 tiles high
	cp b
	jr c, .spriteInvisible  ; below screen region
.skipYVisibilityTest
	inc l
	ld b, [hl]      ; c2x5: X pos (+4)
	ld a, [W_XCOORD] ; $d362
	cp b
	jr z, .skipXVisibilityTest
	jr nc, .spriteInvisible ; left of screen region
	add $9                  ; screen is 10 tiles wide
	cp b
	jr c, .spriteInvisible  ; right of screen region
.skipXVisibilityTest
	call getTileSpriteStandsOn
	ld d, $60
	ld a, [hli]
	cp d
	jr nc, .spriteInvisible ; standing on tile with ID >=$60 (bottom left tile)
	ld a, [hld]
	cp d
	jr nc, .spriteInvisible ; standing on tile with ID >=$60 (bottom right tile)
	ld bc, -20 ; $ffec
	add hl, bc              ; go back one row of tiles
	ld a, [hli]
	cp d
	jr nc, .spriteInvisible ; standing on tile with ID >=$60 (top left tile)
	ld a, [hl]
	cp d
	jr c, .spriteVisible    ; standing on tile with ID >=$60 (top right tile)
.spriteInvisible
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $2
	ld l, a
	ld [hl], $ff       ; c1x2
	scf
	jr .done
.spriteVisible
	ld c, a
	ld a, [wWalkCounter] ; $cfc5
	and a
	jr nz, .done           ; if player is currently walking, we're done
	call UpdateSpriteImage
	inc h
	ld a, [H_CURRENTSPRITEOFFSET]
	add $7
	ld l, a
	ld a, [W_GRASSTILE]
	cp c
	ld a, $0
	jr nz, .notInGrass
	ld a, $80
.notInGrass
	ld [hl], a       ; c2x7
	and a
.done
	ret

UpdateSpriteImage: ; 5157 (1:5157)
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $8
	ld l, a
	ld a, [hli]        ; c1x8: walk animation frame
	ld b, a
	ld a, [hl]         ; c1x9: facing direction
	add b
	ld b, a
	ld a, [$ff93]  ; current sprite offset
	add b
	ld b, a
	ld a, [H_CURRENTSPRITEOFFSET]
	add $2
	ld l, a
	ld [hl], b         ; c1x2: sprite to display
	ret

; tests if sprite can walk the specified direction
; b: direction (1,2,4 or 8)
; c: ID of tile the sprite would walk onto
; d: Y movement delta (-1, 0 or 1)
; e: X movement delta (-1, 0 or 1)
; set carry on failure, clears carry on success
CanWalkOntoTile: ; 516e (1:516e)
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $6
	ld l, a
	ld a, [hl]         ; c2x6 (movement byte 1)
	cp $fe
	jr nc, .canMove    ; values $fe and $ff
	and a
	ret
.canMove
	ld a, [W_TILESETCOLLISIONPTR]
	ld l, a
	ld a, [W_TILESETCOLLISIONPTR+1]
	ld h, a
.tilePassableLoop
	ld a, [hli]
	cp $ff
	jr z, .impassable
	cp c
	jr nz, .tilePassableLoop
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $6
	ld l, a
	ld a, [hl]         ; $c2x6 (movement byte 1)
	inc a
	jr z, .impassable  ; if $ff, no movement allowed (however, changing direction is)
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $4
	ld l, a
	ld a, [hli]        ; c1x4 (screen Y pos)
	add $4             ; align to blocks (Y pos is always 4 pixels off)
	add d              ; add Y delta
	cp $80             ; if value is >$80, the destination is off screen (either $81 or $FF underflow)
	jr nc, .impassable ; don't walk off screen
	inc l
	ld a, [hl]         ; c1x6 (screen X pos)
	add e              ; add X delta
	cp $90             ; if value is >$90, the destination is off screen (either $91 or $FF underflow)
	jr nc, .impassable ; don't walk off screen
	push de
	push bc
	call Func_4c70
	pop bc
	pop de
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $c
	ld l, a
	ld a, [hl]         ; c1xc (forbidden directions flags(?))
	and b              ; check against chosen direction (1,2,4 or 8)
	jr nz, .impassable ; direction forbidden, don't go there
	ld h, $c2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $2
	ld l, a
	ld a, [hli]        ; c2x2 (sprite Y displacement, initialized at $8, keep track of where a sprite did go)
	bit 7, d           ; check if going upwards (d=$ff)
	jr nz, .upwards
	add d
	cp $5
	jr c, .impassable  ; if c2x2+d < 5, don't go ;bug: this tests probably were supposed to prevent sprites
	jr .checkHorizontal                          ; from walking out too far, but this line makes sprites get stuck
.upwards                                         ; whenever they walked upwards 5 steps
	sub $1                                       ; on the other hand, the amount a sprite can walk out to the
	jr c, .impassable  ; if d2x2 == 0, don't go  ; right of bottom is not limited (until the counter overflows)
.checkHorizontal
	ld d, a
	ld a, [hl]         ; c2x3 (sprite X displacement, initialized at $8, keep track of where a sprite did go)
	bit 7, e           ; check if going left (e=$ff)
	jr nz, .left
	add e
	cp $5              ; compare, but no conditional jump like in the vertical check above (bug?)
	jr .passable
.left
	sub $1
	jr c, .impassable  ; if d2x3 == 0, don't go
.passable
	ld [hld], a        ; update c2x3
	ld [hl], d         ; update c2x2
	and a              ; clear carry (marking success)
	ret
.impassable
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	inc a
	ld l, a
	ld [hl], $2        ; c1x1 = 2 (set movement status to delayed)
	inc l
	inc l
	xor a
	ld [hli], a        ; c1x3 = 0 (clear Y movement delta)
	inc l
	ld [hl], a         ; c1x5 = 0 (clear X movement delta)
	inc h
	ld a, [H_CURRENTSPRITEOFFSET]
	add $8
	ld l, a
	call Random
	ld a, [hRandomAdd]
	and $7f
	ld [hl], a         ; c2x8: set next movement delay to a random value in [0,$7f] (again with delay $100 if value is 0)
	scf                ; set carry (marking failure to walk)
	ret

; calculates the tile pointer pointing to the tile the current sprite stancs on
; this is always the lower left tile of the 2x2 tile blocks all sprites are snapped to
; hl: output pointer
getTileSpriteStandsOn: ; 5207 (1:5207)
	ld h, $c1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $4
	ld l, a
	ld a, [hli]     ; c1x4: screen Y position
	add $4          ; align to 2*2 tile blocks (Y position is always off 4 pixels to the top)
	and $f0         ; in case object is currently moving
	srl a           ; screen Y tile * 4
	ld c, a
	ld b, $0
	inc l
	ld a, [hl]      ; c1x6: screen Y position
	srl a
	srl a
	srl a           ; screen X tile
	add $14         ; screen X tile + 20
	ld d, $0
	ld e, a
	ld hl, wTileMap
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, de     ; wTileMap + 20*(screen Y tile + 1) + screen X tile
	ret

; loads [de+a] into a
LoadDEPlusA: ; 522f (1:522f)
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
	ld a, [de]
	ret

Func_5236: ; 5236 (1:5236)
	ld a, [$d730]
	bit 7, a
	ret z
	ld hl, $d72e
	bit 7, [hl]
	set 7, [hl]
	jp z, Func_52a6
	ld hl, $cc97
	ld a, [$cd37]
	add l
	ld l, a
	jr nc, .asm_5251
	inc h
.asm_5251
	ld a, [hl]
	cp $40
	jr nz, .asm_525f
	call Func_52b2
	ld c, $4
	ld a, $fe
	jr .asm_5289
.asm_525f
	cp $0
	jr nz, .asm_526c
	call Func_52b2
	ld c, $0
	ld a, $2
	jr .asm_5289
.asm_526c
	cp $80
	jr nz, .asm_5279
	call Func_52b7
	ld c, $8
	ld a, $fe
	jr .asm_5289
.asm_5279
	cp $c0
	jr nz, .asm_5286
	call Func_52b7
	ld c, $c
	ld a, $2
	jr .asm_5289
.asm_5286
	cp $ff
	ret
.asm_5289
	ld b, a
	ld a, [hl]
	add b
	ld [hl], a
	ld a, [H_CURRENTSPRITEOFFSET]
	add $9
	ld l, a
	ld a, c
	ld [hl], a
	call Func_52c3
	ld hl, $cf18
	dec [hl]
	ret nz
	ld a, $8
	ld [$cf18], a
	ld hl, $cd37
	inc [hl]
	ret

Func_52a6: ; 52a6 (1:52a6)
	xor a
	ld [$cd37], a
	ld a, $8
	ld [$cf18], a
	jp Func_52c3

Func_52b2: ; 52b2 (1:52b2)
	ld a, $4
	ld b, a
	jr asm_52ba

Func_52b7: ; 52b7 (1:52b7)
	ld a, $6
	ld b, a
asm_52ba: ; 52ba (1:52ba)
	ld hl, wSpriteStateData1
	ld a, [H_CURRENTSPRITEOFFSET]
	add l
	add b
	ld l, a
	ret

Func_52c3: ; 52c3 (1:52c3)
	ld hl, wSpriteStateData2
	ld a, [H_CURRENTSPRITEOFFSET]
	add $e
	ld l, a
	ld a, [hl]
	dec a
	swap a
	ld b, a
	ld hl, wSpriteStateData1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $9
	ld l, a
	ld a, [hl]
	cp $0
	jr z, .asm_52ea
	cp $4
	jr z, .asm_52ea
	cp $8
	jr z, .asm_52ea
	cp $c
	jr z, .asm_52ea
	ret
.asm_52ea
	add b
	ld b, a
	ld [$ffe9], a
	call Func_5301
	ld hl, wSpriteStateData1
	ld a, [H_CURRENTSPRITEOFFSET]
	add $2
	ld l, a
	ld a, [$ffe9]
	ld b, a
	ld a, [$ffea]
	add b
	ld [hl], a
	ret

Func_5301: ; 5301 (1:5301)
	ld a, [H_CURRENTSPRITEOFFSET]
	add $7
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $4
	ret nz
	xor a
	ld [hl], a
	inc l
	ld a, [hl]
	inc a
	and $3
	ld [hl], a
	ld [$ffea], a
	ret

INCLUDE "engine/cable_club.asm"

LoadTrainerInfoTextBoxTiles: ; 5ae6 (1:5ae6)
	ld de, TrainerInfoTextBoxTileGraphics ; $7b98
	ld hl, $9760
	ld bc, (BANK(TrainerInfoTextBoxTileGraphics) << 8) +$09
	jp CopyVideoData

INCLUDE "engine/menu/main_menu.asm"

INCLUDE "engine/oak_speech.asm"

Func_62ce: ; 62ce (1:62ce)
	call Func_62ff
	ld a,$19
	call Predef
	ld hl,$D732
	bit 2,[hl]
	res 2,[hl]
	jr z,.next
	ld a,[$D71A]
	jr .next2
.next
	bit 1,[hl]
	jr z,.next3
	call Func_64ea
.next3
	ld a,0
.next2
	ld b,a
	ld a,[$D72D]
	and a
	jr nz,.next4
	ld a,b
.next4
	ld hl,$D732
	bit 4,[hl]
	ret nz
	ld [wLastMap],a
	ret

Func_62ff: ; 62ff (1:62ff)
	ld a, [$d72d]
	cp BATTLE_CENTER
	jr nz, .asm_6314
	ld hl, BattleCenterSpec1 ; $6428
	ld a, [$ffaa]
	cp $2
	jr z, .asm_6334
	ld hl, BattleCenterSpec2 ; $6430
	jr .asm_6334
.asm_6314
	cp TRADE_CENTER
	jr nz, .asm_6326
	ld hl, TradeCenterSpec1 ; $6438
	ld a, [$ffaa]
	cp $2
	jr z, .asm_6334
	ld hl, TradeCenterSpec2 ; $6440
	jr .asm_6334
.asm_6326
	ld a, [$d732]
	bit 1, a
	jr nz, .asm_6346
	bit 2, a
	jr nz, .asm_6346
	ld hl, FirstMapSpec ; $6420
.asm_6334
	ld de, W_CURMAP ; $d35e
	ld c, $7
.asm_6339
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_6339
	ld a, [hli]
	ld [W_CURMAPTILESET], a ; $d367
	xor a
	jr .asm_63b3
.asm_6346
	ld a, [wLastMap]
	ld hl, $d732
	bit 4, [hl]
	jr nz, .asm_635b
	bit 6, [hl]
	res 6, [hl]
	jr z, .asm_638e
	ld a, [wLastBlackoutMap]
	jr .asm_6391
.asm_635b
	ld hl, $d72d
	res 4, [hl]
	ld a, [$d71d]
	ld b, a
	ld [W_CURMAP], a ; $d35e
	ld a, [$d71e]
	ld c, a
	ld hl, DungeonWarpList ; $63bf
	ld de, $0
	ld a, $6
	ld [$d12f], a
.asm_6376
	ld a, [hli]
	cp b
	jr z, .asm_637d
	inc hl
	jr .asm_6381
.asm_637d
	ld a, [hli]
	cp c
	jr z, .asm_6388
.asm_6381
	ld a, [$d12f]
	add e
	ld e, a
	jr .asm_6376
.asm_6388
	ld hl, DungeonWarpData ; $63d8
	add hl, de
	jr .asm_63a4
.asm_638e
	ld a, [$d71a]
.asm_6391
	ld b, a
	ld [W_CURMAP], a ; $d35e
	ld hl, FlyWarpDataPtr ; $6448
.asm_6398
	ld a, [hli]
	inc hl
	cp b
	jr z, .asm_63a1
	inc hl
	inc hl
	jr .asm_6398
.asm_63a1
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_63a4
	ld de, $d35f
	ld c, $6
.asm_63a9
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_63a9
	xor a
	ld [W_CURMAPTILESET], a ; $d367
.asm_63b3
	ld [$d4e2], a
	ld [$d4e3], a
	ld a, $ff
	ld [$d42f], a
	ret

INCLUDE "data/special_warps.asm"

; This function appears to never be used.
; It is likely a debugging feature to give the player Tsunekazu Ishihara's
; favorite Pokemon. This is indicated by the overpowered Exeggutor, which
; Ishihara (president of Creatures Inc.) said was his favorite Pokemon in an ABC
; interview on February 8, 2000.
; "Exeggutor is my favorite. That's because I was always using this character
; while I was debugging the program."
; http://www.ign.com/articles/2000/02/09/abc-news-pokamon-chat-transcript

SetIshiharaTeam: ; 64ca (1:64ca)
	ld de, IshiharaTeam
.loop
	ld a, [de]
	cp $ff
	ret z
	ld [$cf91], a
	inc de
	ld a, [de]
	ld [W_CURENEMYLVL], a
	inc de
	call AddPokemonToParty
	jr .loop

IshiharaTeam: ; 64df (1:64df)
	db EXEGGUTOR,90
	db MEW,20
	db JOLTEON,56
	db DUGTRIO,56
	db ARTICUNO,57
	db $FF

Func_64ea: ; 64ea (1:64ea)
	ret

INCLUDE "engine/menu/naming_screen.asm"

INCLUDE "engine/oak_speech2.asm"

; subtracts the amount the player paid from their money
; sets carry flag if there is enough money and unsets carry flag if not
SubtractAmountPaidFromMoney_: ; 6b21 (1:6b21)
	ld de,wPlayerMoney
	ld hl,$ff9f ; total price of items
	ld c,3 ; length of money in bytes
	call StringCmp
	ret c
	ld de,wPlayerMoney + 2
	ld hl,$ffa1 ; total price of items
	ld c,3 ; length of money in bytes
	ld a,$0c
	call Predef ; subtract total price from money
	ld a,$13
	ld [$d125],a
	call DisplayTextBoxID ; redraw money text box
	and a
	ret

HandleItemListSwapping: ; 6b44 (1:6b44)
	ld a,[wListMenuID]
	cp a,ITEMLISTMENU
	jp nz,DisplayListMenuIDLoop ; only rearrange item list menus
	push hl
	ld hl,$cf8b
	ld a,[hli]
	ld h,[hl]
	ld l,a
	inc hl ; hl = beginning of list entries
	ld a,[wCurrentMenuItem]
	ld b,a
	ld a,[wListScrollOffset]
	add b
	add a
	ld c,a
	ld b,0
	add hl,bc ; hl = address of currently selected item entry
	ld a,[hl]
	pop hl
	inc a
	jp z,DisplayListMenuIDLoop ; ignore attempts to swap the Cancel menu item
	ld a,[$cc35] ; ID of item chosen for swapping (counts from 1)
	and a ; has the first item to swap already been chosen?
	jr nz,.swapItems
; if not, set the currently selected item as the first item
	ld a,[wCurrentMenuItem]
	inc a
	ld b,a
	ld a,[wListScrollOffset] ; index of top (visible) menu item within the list
	add b
	ld [$cc35],a ; ID of item chosen for swapping (counts from 1)
	ld c,20
	call DelayFrames
	jp DisplayListMenuIDLoop
.swapItems
	ld a,[wCurrentMenuItem]
	inc a
	ld b,a
	ld a,[wListScrollOffset]
	add b
	ld b,a
	ld a,[$cc35] ; ID of item chosen for swapping (counts from 1)
	cp b ; is the currently selected item the same as the first item to swap?
	jp z,DisplayListMenuIDLoop ; ignore attempts to swap an item with itself
	dec a
	ld [$cc35],a ; ID of item chosen for swapping (counts from 1)
	ld c,20
	call DelayFrames
	push hl
	push de
	ld hl,$cf8b
	ld a,[hli]
	ld h,[hl]
	ld l,a
	inc hl ; hl = beginning of list entries
	ld d,h
	ld e,l ; de = beginning of list entries
	ld a,[wCurrentMenuItem]
	ld b,a
	ld a,[wListScrollOffset]
	add b
	add a
	ld c,a
	ld b,0
	add hl,bc ; hl = address of currently selected item entry
	ld a,[$cc35] ; ID of item chosen for swapping (counts from 1)
	add a
	add e
	ld e,a
	jr nc,.noCarry
	inc d
.noCarry ; de = address of first item to swap
	ld a,[de]
	ld b,a
	ld a,[hli]
	cp b
	jr z,.swapSameItemType
.swapDifferentItems
	ld [$ff95],a ; [$ff95] = second item ID
	ld a,[hld]
	ld [$ff96],a ; [$ff96] = second item quantity
	ld a,[de]
	ld [hli],a ; put first item ID in second item slot
	inc de
	ld a,[de]
	ld [hl],a ; put first item quantity in second item slot
	ld a,[$ff96]
	ld [de],a ; put second item quantity in first item slot
	dec de
	ld a,[$ff95]
	ld [de],a ; put second item ID in first item slot
	xor a
	ld [$cc35],a ; 0 means no item is currently being swapped
	pop de
	pop hl
	jp DisplayListMenuIDLoop
.swapSameItemType
	inc de
	ld a,[hl]
	ld b,a
	ld a,[de]
	add b ; a = sum of both item quantities
	cp a,100 ; is the sum too big for one item slot?
	jr c,.combineItemSlots
; swap enough items from the first slot to max out the second slot if they can't be combined
	sub a,99
	ld [de],a
	ld a,99
	ld [hl],a
	jr .done
.combineItemSlots
	ld [hl],a ; put the sum in the second item slot
	ld hl,$cf8b
	ld a,[hli]
	ld h,[hl]
	ld l,a
	dec [hl] ; decrease the number of items
	ld a,[hl]
	ld [$d12a],a ; update number of items variable
	cp a,1
	jr nz,.skipSettingMaxMenuItemID
	ld [wMaxMenuItem],a ; if the number of items is only one now, update the max menu item ID
.skipSettingMaxMenuItemID
	dec de
	ld h,d
	ld l,e
	inc hl
	inc hl ; hl = address of item after first item to swap
.moveItemsUpLoop ; erase the first item slot and move up all the following item slots to fill the gap
	ld a,[hli]
	ld [de],a
	inc de
	inc a ; reached the $ff terminator?
	jr z,.afterMovingItemsUp
	ld a,[hli]
	ld [de],a
	inc de
	jr .moveItemsUpLoop
.afterMovingItemsUp
	xor a
	ld [wListScrollOffset],a
	ld [wCurrentMenuItem],a
.done
	xor a
	ld [$cc35],a ; 0 means no item is currently being swapped
	pop de
	pop hl
	jp DisplayListMenuIDLoop

INCLUDE "engine/overworld/pokemart.asm"

INCLUDE "engine/learn_move.asm"

INCLUDE "engine/overworld/pokecenter.asm"

SetLastBlackoutMap:
; Set the map to return to when
; blacking out or using Teleport or Dig.
; Safari rest houses don't count.

	push hl
	ld hl, SafariZoneRestHouses
	ld a, [W_CURMAP]
	ld b, a
.loop
	ld a, [hli]
	cp -1
	jr z, .notresthouse
	cp b
	jr nz, .loop
	jr .done

.notresthouse
	ld a, [wLastMap]
	ld [wLastBlackoutMap], a
.done
	pop hl
	ret

SafariZoneRestHouses:
	db SAFARI_ZONE_REST_HOUSE_2
	db SAFARI_ZONE_REST_HOUSE_3
	db SAFARI_ZONE_REST_HOUSE_4
	db -1

; function that performs initialization for DisplayTextID
DisplayTextIDInit: ; 7096 (1:7096)
	xor a
	ld [$cf94],a
	ld a,[$cf0c]
	bit 0,a
	jr nz,.skipDrawingTextBoxBorder
	ld a,[$ff8c] ; text ID (or sprite ID)
	and a
	jr nz,.notStartMenu
; if text ID is 0 (i.e. the start menu)
; Note that the start menu text border is also drawn in the function directly
; below this, so this seems unnecessary.
	ld a,[$d74b]
	bit 5,a ; does the player have the pokedex?
; start menu with pokedex
	FuncCoord 10, 0 ; $c3aa
	ld hl,Coord
	ld b,$0e
	ld c,$08
	jr nz,.drawTextBoxBorder
; start menu without pokedex
	FuncCoord 10, 0 ; $c3aa
	ld hl,Coord
	ld b,$0c
	ld c,$08
	jr .drawTextBoxBorder
; if text ID is not 0 (i.e. not the start menu) then do a standard dialogue text box
.notStartMenu
	FuncCoord 0, 12 ; $c490
	ld hl,Coord
	ld b,$04
	ld c,$12
.drawTextBoxBorder
	call TextBoxBorder
.skipDrawingTextBoxBorder
	ld hl,$cfc4
	set 0,[hl]
	ld hl,wFlags_0xcd60
	bit 4,[hl]
	res 4,[hl]
	jr nz,.skipMovingSprites
	call UpdateSprites ; move sprites
.skipMovingSprites
; loop to copy C1X9 (direction the sprite is facing) to C2X9 for each sprite
; this is done because when you talk to an NPC, they turn to look your way
; the original direction they were facing must be restored after the dialogue is over
	ld hl,$c119
	ld c,$0f
	ld de,$0010
.spriteFacingDirectionCopyLoop
	ld a,[hl]
	inc h
	ld [hl],a
	dec h
	add hl,de
	dec c
	jr nz,.spriteFacingDirectionCopyLoop
; loop to force all the sprites in the middle of animation to stand still
; (so that they don't like they're frozen mid-step during the dialogue)
	ld hl,$c102
	ld de,$0010
	ld c,e
.spriteStandStillLoop
	ld a,[hl]
	cp a,$ff ; is the sprite visible?
	jr z,.nextSprite
; if it is visible
	and a,$fc
	ld [hl],a
.nextSprite
	add hl,de
	dec c
	jr nz,.spriteStandStillLoop
	ld b,$9c ; window background address
	call CopyScreenTileBufferToVRAM ; transfer background in WRAM to VRAM
	xor a
	ld [$ffb0],a ; put the window on the screen
	call LoadFontTilePatterns
	ld a,$01
	ld [H_AUTOBGTRANSFERENABLED],a ; enable continuous WRAM to VRAM transfer each V-blank
	ret

; function that displays the start menu
DrawStartMenu: ; 710b (1:710b)
	ld a,[$d74b]
	bit 5,a ; does the player have the pokedex?
; menu with pokedex
	FuncCoord 10, 0 ; $c3aa
	ld hl,Coord
	ld b,$0e
	ld c,$08
	jr nz,.drawTextBoxBorder
; shorter menu if the player doesn't have the pokedex
	FuncCoord 10, 0 ; $c3aa
	ld hl,Coord
	ld b,$0c
	ld c,$08
.drawTextBoxBorder
	call TextBoxBorder
	ld a,%11001011 ; bit mask for down, up, start, B, and A buttons
	ld [$cc29],a
	ld a,$02
	ld [$cc24],a ; Y position of first menu choice
	ld a,$0b
	ld [$cc25],a ; X position of first menu choice
	ld a,[$cc2d] ; remembered menu selection from last time
	ld [$cc26],a
	ld [$cc2a],a
	xor a
	ld [$cc37],a
	ld hl,$d730
	set 6,[hl] ; no pauses between printing each letter
	FuncCoord 12, 2 ; $c3d4
	ld hl,Coord
	ld a,[$d74b]
	bit 5,a ; does the player have the pokedex?
; case for not having pokdex
	ld a,$06
	jr z,.storeMenuItemCount
; case for having pokedex
	ld de,StartMenuPokedexText
	call PrintStartMenuItem
	ld a,$07
.storeMenuItemCount
	ld [$cc28],a ; number of menu items
	ld de,StartMenuPokemonText
	call PrintStartMenuItem
	ld de,StartMenuItemText
	call PrintStartMenuItem
	ld de,W_PLAYERNAME ; player's name
	call PrintStartMenuItem
	ld a,[$d72e]
	bit 6,a ; is the player using the link feature?
; case for not using link feature
	ld de,StartMenuSaveText
	jr z,.printSaveOrResetText
; case for using link feature
	ld de,StartMenuResetText
.printSaveOrResetText
	call PrintStartMenuItem
	ld de,StartMenuOptionText
	call PrintStartMenuItem
	ld de,StartMenuExitText
	call PlaceString
	ld hl,$d730
	res 6,[hl] ; turn pauses between printing letters back on
	ret

StartMenuPokedexText: ; 718f (1:718f)
	db "POKéDEX@"

StartMenuPokemonText: ; 7197 (1:7197)
	db "POKéMON@"

StartMenuItemText: ; 719f (1:719f)
	db "ITEM@"

StartMenuSaveText: ; 71a4 (1:71a4)
	db "SAVE@"

StartMenuResetText: ; 71a9 (1:71a9)
	db "RESET@"

StartMenuExitText: ; 71af (1:71af)
	db "EXIT@"

StartMenuOptionText: ; 71b4 (1:71b4)
	db "OPTION@"

PrintStartMenuItem: ; 71bb (1:71bb)
	push hl
	call PlaceString
	pop hl
	ld de,$28
	add hl,de
	ret

INCLUDE "engine/overworld/cable_club_npc.asm"

; function to draw various text boxes
; INPUT:
; [$D125] = text box ID
DisplayTextBoxID_: ; 72ea (1:72ea)
	ld a,[$d125] ; a = text box ID
	cp a,$14
	jp z,DisplayYesNoTextBox
	ld c,a
	ld hl,TextBoxFunctionTable
	ld de,3
	call SearchTextBoxTable
	jr c,.functionTableMatch
	ld hl,TextBoxCoordTable
	ld de,5
	call SearchTextBoxTable
	jr c,.coordTableMatch
	ld hl,TextBoxTextAndCoordTable
	ld de,9
	call SearchTextBoxTable
	jr c,.textAndCoordTableMatch
.done
	ret
.functionTableMatch
	ld a,[hli]
	ld h,[hl]
	ld l,a ; hl = address of function
	ld de,.done
	push de
	jp [hl] ; jump to the function
.coordTableMatch
	call GetTextBoxIDCoords
	call GetAddressOfScreenCoords
	call TextBoxBorder
	ret
.textAndCoordTableMatch
	call GetTextBoxIDCoords
	push hl
	call GetAddressOfScreenCoords
	call TextBoxBorder
	pop hl
	call GetTextBoxIDText
	ld a,[$d730]
	push af
	ld a,[$d730]
	set 6,a ; no pauses between printing each letter
	ld [$d730],a
	call PlaceString
	pop af
	ld [$d730],a
	call UpdateSprites ; move sprites
	ret

; function to search a table terminated with $ff for a byte matching c in increments of de
; sets carry flag if a match is found and clears carry flag if not
SearchTextBoxTable: ; 734c (1:734c)
	dec de
.loop
	ld a,[hli]
	cp a,$ff
	jr z,.notFound
	cp c
	jr z,.found
	add hl,de
	jr .loop
.found
	scf
.notFound
	ret

; function to load coordinates from the TextBoxCoordTable or the TextBoxTextAndCoordTable
; INPUT:
; hl = address of coordinates
; OUTPUT:
; b = height
; c = width
; d = row of upper left corner
; e = column of upper left corner
GetTextBoxIDCoords: ; 735a (1:735a)
	ld a,[hli] ; column of upper left corner
	ld e,a
	ld a,[hli] ; row of upper left corner
	ld d,a
	ld a,[hli] ; column of lower right corner
	sub e
	dec a
	ld c,a     ; c = width
	ld a,[hli] ; row of lower right corner
	sub d
	dec a
	ld b,a     ; b = height
	ret

; function to load a text address and text coordinates from the TextBoxTextAndCoordTable
GetTextBoxIDText: ; 7367 (1:7367)
	ld a,[hli]
	ld e,a
	ld a,[hli]
	ld d,a ; de = address of text
	push de ; save text address
	ld a,[hli]
	ld e,a ; column of upper left corner of text
	ld a,[hl]
	ld d,a ; row of upper left corner of text
	call GetAddressOfScreenCoords
	pop de ; restore text address
	ret

; function to point hl to the screen coordinates
; INPUT:
; d = row
; e = column
; OUTPUT:
; hl = address of upper left corner of text box
GetAddressOfScreenCoords: ; 7375 (1:7375)
	push bc
	ld hl,wTileMap
	ld bc,20
.loop ; loop to add d rows to the base address
	ld a,d
	and a
	jr z,.addedRows
	add hl,bc
	dec d
	jr .loop
.addedRows
	pop bc
	add hl,de
	ret

; Format:
; 00: text box ID
; 01-02: function address
TextBoxFunctionTable: ; 7387 (1:7387)
	dbw $13, Func_74ba
	dbw $15, Func_74ea
	dbw $04, Func_76e1
	db $ff ; terminator

; Format:
; 00: text box ID
; 01: column of upper left corner
; 02: row of upper left corner
; 03: column of lower right corner
; 04: row of lower right corner
TextBoxCoordTable: ; 7391 (1:7391)
	db $01,  0, 12, 19, 17
	db $03,  0,  0, 19, 14
	db $07,  0,  0, 11,  6
	db $0d,  4,  2, 19, 12
	db $10,  7,  0, 19, 17
	db $11,  6,  4, 14, 13
	db $ff ; terminator

; Format:
; 00: text box ID
; 01: column of upper left corner
; 02: row of upper left corner
; 03: column of lower right corner
; 04: row of lower right corner
; 05-06: address of text
; 07: column of beginning of text
; 08: row of beginning of text
; table of window positions and corresponding text [key, start column, start row, end column, end row, text pointer [2 bytes], text column, text row]
TextBoxTextAndCoordTable: ; 73b0 (1:73b0)
	db $05 ; text box ID
	db 0,0,14,17   ; text box coordinates
	dw JapaneseMochimonoText
	db 3,0   ; text coordinates

	db $06 ; text box ID
	db 13,10,19,14 ; text box coordinates
	dw UseTossText
	db 15,11 ; text coordinates

	db $08 ; text box ID
	db 0,0,7,5     ; text box coordinates
	dw JapaneseSaveMessageText
	db 2,2   ; text coordinates

	db $09 ; text box ID
	db 0,6,5,10    ; text box coordinates
	dw JapaneseSpeedOptionsText
	db 2,7   ; text coordinates

	db $0b ; text box ID
	db 8,12,19,17  ; text box coordinates
	dw BattleMenuText
	db 10,14 ; text coordinates

	db $1b ; text box ID
	db 0,12,19,17  ; text box coordinates
	dw SafariZoneBattleMenuText
	db 2,14  ; text coordinates

	db $0c ; text box ID
	db 11,11,19,17 ; text box coordinates
	dw SwitchStatsCancelText
	db 13,12 ; text coordinates

	db $0e ; text box ID
	db 0,0,10,6    ; text box coordinates
	dw BuySellQuitText
	db 2,1   ; text coordinates

	db $0f ; text box ID
	db 11,0,19,2   ; text box coordinates
	dw MoneyText
	db 13,0  ; text coordinates

	db $12 ; text box ID
	db 7,6,11,10   ; text box coordinates
	dw JapaneseAhText
	db 8,8   ; text coordinates

	db $1a ; text box ID
	db 11,8,19,17  ; text box coordinates
	dw JapanesePokedexMenu
	db 12,10 ; text coordinates

; note that there is no terminator

BuySellQuitText: ; 7413 (1:7413)
	db   "BUY"
	next "SELL"
	next "QUIT@@"

UseTossText: ; 7422 (1:7422)
	db   "USE"
	next "TOSS@"

JapaneseSaveMessageText: ; 742b (1:742b)
	db   "きろく"
	next "メッセージ@"

JapaneseSpeedOptionsText: ; 7435 (1:7435)
	db   "はやい"
	next "おそい@"

MoneyText: ; 743d (1:743d)
	db "MONEY@"

JapaneseMochimonoText: ; 7443 (1:7443)
	db "もちもの@"

JapaneseMainMenuText: ; 7448 (1:7448)
	db   "つづきから"
	next "さいしょから@"

BattleMenuText: ; 7455 (1:7455)
	db   "FIGHT ",$E1,$E2
	next "ITEM  RUN@"

SafariZoneBattleMenuText: ; 7468 (1:7468)
	db   "BALL×       BAIT"
	next "THROW ROCK  RUN@"

SwitchStatsCancelText: ; 7489 (1:7489)
	db   "SWITCH"
	next "STATS"
	next "CANCEL@"

JapaneseAhText: ; 749d (1:749d)
	db "アッ!@"

JapanesePokedexMenu: ; 74a1 (1:74a1)
	db   "データをみる"
	next "なきごえ"
	next "ぶんぷをみる"
	next "キャンセル@"

Func_74ba: ; 74ba (1:74ba)
	ld hl, $d730
	set 6, [hl]
	ld a, $f
	ld [$d125], a
	call DisplayTextBoxID
	FuncCoord 13, 1 ; $c3c1
	ld hl, Coord
	ld b, $1
	ld c, $6
	call ClearScreenArea
	FuncCoord 12, 1 ; $c3c0
	ld hl, Coord
	ld de, wPlayerMoney ; $d347
	ld c, $a3
	call PrintBCDNumber
	ld hl, $d730
	res 6, [hl]
	ret

CurrencyString: ; 74e2 (1:74e2)
	db "      ¥@"

Func_74ea: ; 74ea (1:74ea)
	ld a, [$d730]
	set 6, a
	ld [$d730], a
	xor a
	ld [$d12d], a
	ld a, $e
	ld [$d125], a
	call DisplayTextBoxID
	ld a, $3
	ld [wMenuWatchedKeys], a ; $cc29
	ld a, $2
	ld [wMaxMenuItem], a ; $cc28
	ld a, $1
	ld [wTopMenuItemY], a ; $cc24
	ld a, $1
	ld [wTopMenuItemX], a ; $cc25
	xor a
	ld [wCurrentMenuItem], a ; $cc26
	ld [wLastMenuItem], a ; $cc2a
	ld [$cc37], a
	ld a, [$d730]
	res 6, a
	ld [$d730], a
	call HandleMenuInput
	call PlaceUnfilledArrowMenuCursor
	bit 0, a
	jr nz, .asm_7539
	bit 1, a
	jr z, .asm_7539
	ld a, $2
	ld [$d12e], a
	jr .asm_754c
.asm_7539
	ld a, $1
	ld [$d12e], a
	ld a, [wCurrentMenuItem] ; $cc26
	ld [$d12d], a
	ld b, a
	ld a, [wMaxMenuItem] ; $cc28
	cp b
	jr z, .asm_754c
	ret
.asm_754c
	ld a, $2
	ld [$d12e], a
	ld a, [wCurrentMenuItem] ; $cc26
	ld [$d12d], a
	scf
	ret

DisplayYesNoTextBox: ; 7559 (1:7559)
	push hl
	ld a, [$d730]
	set 6, a
	ld [$d730], a
	xor a
	ld [$d12d], a
	ld [$d12e], a
	ld a, $3
	ld [wMenuWatchedKeys], a ; $cc29
	ld a, $1
	ld [wMaxMenuItem], a ; $cc28
	ld a, b
	ld [wTopMenuItemY], a ; $cc24
	ld a, c
	ld [wTopMenuItemX], a ; $cc25
	xor a
	ld [wLastMenuItem], a ; $cc2a
	ld [$cc37], a
	push hl
	ld hl, $d12c
	bit 7, [hl]
	res 7, [hl]
	jr z, .asm_758d
	inc a
.asm_758d
	ld [wCurrentMenuItem], a ; $cc26
	pop hl
	push hl
	push hl
	call Func_763e
	ld a, [$d12c]
	ld hl, MenuStrings ; $7671
	ld e, a
	ld d, $0
	ld a, $5
.loop
	add hl, de
	dec a
	jr nz, .loop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld e, l
	ld d, h
	pop hl
	push de
	ld a, [$d12c]
	cp $5
	jr nz, .asm_75b9
	call Func_5ab3
	jr .asm_75bc
.asm_75b9
	call TextBoxBorder
.asm_75bc
	call UpdateSprites
	pop hl
	ld a, [hli]
	and a
	ld bc, $16
	jr z, .asm_75ca
	ld bc, $2a
.asm_75ca
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	add hl, bc
	call PlaceString
	ld hl, $d730
	res 6, [hl]
	ld a, [$d12c]
	cp $7
	jr nz, .asm_7603
	xor a
	ld [$d12c], a
	ld a, [wFlags_0xcd60]
	push af
	push hl
	ld hl, wFlags_0xcd60
	bit 5, [hl]
	set 5, [hl]
	pop hl
.asm_75f0
	call HandleMenuInput
	bit 1, a
	jr nz, .asm_75f0
	pop af
	pop hl
	ld [wFlags_0xcd60], a
	ld a, (SFX_02_40 - SFX_Headers_02) / 3
	call PlaySound
	jr .asm_760f
.asm_7603
	xor a
	ld [$d12c], a
	call HandleMenuInput
	pop hl
	bit 1, a
	jr nz, .asm_7627
.asm_760f
	ld a, [wCurrentMenuItem] ; $cc26
	ld [$d12d], a
	and a
	jr nz, .asm_7627
	ld a, $1
	ld [$d12e], a
	ld c, $f
	call DelayFrames
	call Func_7656
	and a
	ret
.asm_7627
	ld a, $1
	ld [wCurrentMenuItem], a ; $cc26
	ld [$d12d], a
	ld a, $2
	ld [$d12e], a
	ld c, $f
	call DelayFrames
	call Func_7656
	scf
	ret

Func_763e: ; 763e (1:763e)
	ld de, $cee9
	ld bc, $506
.asm_7644
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_7644
	push bc
	ld bc, $e
	add hl, bc
	pop bc
	ld c, $6
	dec b
	jr nz, .asm_7644
	ret

Func_7656: ; 7656 (1:7656)
	ld de, $cee9
	ld bc, $506
.asm_765c
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_765c
	push bc
	ld bc, $e
	add hl, bc
	pop bc
	ld c, $6
	dec b
	jr nz, .asm_765c
	call UpdateSprites
	ret

MenuStrings: ; 7671 (1:7671)
	db 4,3,0
	dw .YesNoMenu
	db 6,3,0
	dw .NorthWestMenu
	db 6,3,0
	dw .SouthEastMenu
	db 6,3,0
	dw .YesNoMenu
	db 6,3,0
	dw .NorthEastMenu
	db 7,3,0
	dw .TradeCancelMenu
	db 7,4,1
	dw .HealCancelMenu
	db 4,3,0
	dw .NoYesMenu

.NoYesMenu ; 7699 (1:3699)
	db "NO",$4E,"YES@"
.YesNoMenu ; 76a0 (1:36a0)
	db "YES",$4E,"NO@"
.NorthWestMenu ; 76a7 (1:36a7)
	db "NORTH",$4E,"WEST@"
.SouthEastMenu ; 76b2 (1:36b2)
	db "SOUTH",$4E,"EAST@"
.NorthEastMenu ; 76bd (1:36bd)
	db "NORTH",$4E,"EAST@"
.TradeCancelMenu ; 76c8 (1:36c8)
	db "TRADE",$4E,"CANCEL@"
.HealCancelMenu ; 76d5 (1:36d5)
	db "HEAL",$4E,"CANCEL@"

Func_76e1: ; 76e1 (1:36e1)
	xor a
	ld hl, wWhichTrade ; $cd3d
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], $c
	call GetMonFieldMoves
	ld a, [$cd41]
	and a
	jr nz, .asm_770f
	FuncCoord 11, 11 ; $c487
	ld hl, Coord
	ld b, $5
	ld c, $7
	call TextBoxBorder
	call UpdateSprites
	ld a, $c
	ld [$fff7], a
	FuncCoord 13, 12 ; $c49d
	ld hl, Coord
	ld de, PokemonMenuEntries ; $77c2
	jp PlaceString
.asm_770f
	push af
	FuncCoord 0, 11 ; $c47c
	ld hl, Coord
	ld a, [$cd42]
	dec a
	ld e, a
	ld d, $0
	add hl, de
	ld b, $5
	ld a, $12
	sub e
	ld c, a
	pop af
	ld de, $ffd8
.asm_7725
	add hl, de
	inc b
	inc b
	dec a
	jr nz, .asm_7725
	ld de, $ffec
	add hl, de
	inc b
	call TextBoxBorder
	call UpdateSprites
	FuncCoord 0, 12 ; $c490
	ld hl, Coord
	ld a, [$cd42]
	inc a
	ld e, a
	ld d, $0
	add hl, de
	ld de, $ffd8
	ld a, [$cd41]
.asm_7747
	add hl, de
	dec a
	jr nz, .asm_7747
	xor a
	ld [$cd41], a
	ld de, wWhichTrade ; $cd3d
.asm_7752
	push hl
	ld hl, FieldMoveNames ; $778d
	ld a, [de]
	and a
	jr z, .asm_7776
	inc de
	ld b, a
.asm_775c
	dec b
	jr z, .asm_7766
.asm_775f
	ld a, [hli]
	cp $50
	jr nz, .asm_775f
	jr .asm_775c
.asm_7766
	ld b, h
	ld c, l
	pop hl
	push de
	ld d, b
	ld e, c
	call PlaceString
	ld bc, $28
	add hl, bc
	pop de
	jr .asm_7752
.asm_7776
	pop hl
	ld a, [$cd42]
	ld [$fff7], a
	FuncCoord 0, 12 ; $c490
	ld hl, Coord
	ld a, [$cd42]
	inc a
	ld e, a
	ld d, $0
	add hl, de
	ld de, PokemonMenuEntries ; $77c2
	jp PlaceString

FieldMoveNames: ; 778d (1:778d)
	db "CUT@"
	db "FLY@"
	db "@"
	db "SURF@"
	db "STRENGTH@"
	db "FLASH@"
	db "DIG@"
	db "TELEPORT@"
	db "SOFTBOILED@"

PokemonMenuEntries: ; 77c2 (1:77c2)
	db   "STATS"
	next "SWITCH"
	next "CANCEL@"

GetMonFieldMoves: ; 77d6 (1:77d6)
	ld a, [wWhichPokemon] ; $cf92
	ld hl, W_PARTYMON1_MOVE1 ; $d173
	ld bc, $2c
	call AddNTimes
	ld d, h
	ld e, l
	ld c, $5
	ld hl, wWhichTrade ; $cd3d
.asm_77e9
	push hl
.asm_77ea
	dec c
	jr z, .asm_7821
	ld a, [de] ; de is RAM address of move
	and a
	jr z, .asm_7821
	ld b, a
	inc de ; go to next move
	ld hl, FieldMoveDisplayData ; $7823
.asm_77f6
	ld a, [hli]
	cp $ff
	jr z, .asm_77ea
	cp b
	jr z, .asm_7802
	inc hl
	inc hl
	jr .asm_77f6
.asm_7802
	ld a, b
	ld [$cd43], a
	ld a, [hli]
	ld b, [hl]
	pop hl
	ld [hli], a
	ld a, [$cd41]
	inc a
	ld [$cd41], a
	ld a, [$cd42]
	cp b
	jr c, .asm_781b
	ld a, b
	ld [$cd42], a
.asm_781b
	ld a, [$cd43]
	ld b, a
	jr .asm_77e9
.asm_7821
	pop hl
	ret

; Format: [Move id], [list priority], [leftmost tile]
; Move id = id of move
; List priority = lower number means higher priority when field moves are displayed
;                 these priorities must be unique
; Leftmost tile = -1 + tile column in which the first letter of the move's name should be displayed
;                 "SOFTBOILED" is $08 because it has 4 more letters than "SURF", for example, whose value is $0C
FieldMoveDisplayData: ; 7823 (1:7823)
	db CUT, $01, $0C
	db FLY, $02, $0C
	db $B4, $03, $0C ; unused field move
	db SURF, $04, $0C
	db STRENGTH, $05, $0A
	db FLASH, $06, $0C
	db DIG, $07, $0C
	db TELEPORT, $08, $0A
	db SOFTBOILED, $09, $08
	db $ff ; list terminator


INCLUDE "engine/battle/1.asm"

INCLUDE "engine/menu/players_pc.asm"

_RemovePokemon: ; 7b68 (1:7b68)
	ld hl, W_NUMINPARTY ; $d163
	ld a, [$cf95]
	and a
	jr z, .asm_7b74
	ld hl, W_NUMINBOX ; $da80
.asm_7b74
	ld a, [hl]
	dec a
	ld [hli], a
	ld a, [wWhichPokemon] ; $cf92
	ld c, a
	ld b, $0
	add hl, bc
	ld e, l
	ld d, h
	inc de
.asm_7b81
	ld a, [de]
	inc de
	ld [hli], a
	inc a
	jr nz, .asm_7b81
	ld hl, W_PARTYMON1OT ; $d273
	ld d, $5
	ld a, [$cf95]
	and a
	jr z, .asm_7b97
	ld hl, W_BOXMON1OT
	ld d, $13
.asm_7b97
	ld a, [wWhichPokemon] ; $cf92
	call SkipFixedLengthTextEntries
	ld a, [wWhichPokemon] ; $cf92
	cp d
	jr nz, .asm_7ba6
	ld [hl], $ff
	ret
.asm_7ba6
	ld d, h
	ld e, l
	ld bc, $b
	add hl, bc
	ld bc, W_PARTYMON1NAME ; $d2b5
	ld a, [$cf95]
	and a
	jr z, .asm_7bb8
	ld bc, W_BOXMON1NAME
.asm_7bb8
	call CopyDataUntil
	ld hl, W_PARTYMON1_NUM ; $d16b (aliases: W_PARTYMON1DATA)
	ld bc, $2c
	ld a, [$cf95]
	and a
	jr z, .asm_7bcd
	ld hl, W_BOXMON1DATA
	ld bc, $21
.asm_7bcd
	ld a, [wWhichPokemon] ; $cf92
	call AddNTimes
	ld d, h
	ld e, l
	ld a, [$cf95]
	and a
	jr z, .asm_7be4
	ld bc, $21
	add hl, bc
	ld bc, W_BOXMON1OT
	jr .asm_7beb
.asm_7be4
	ld bc, $2c
	add hl, bc
	ld bc, W_PARTYMON1OT ; $d273
.asm_7beb
	call CopyDataUntil
	ld hl, W_PARTYMON1NAME ; $d2b5
	ld a, [$cf95]
	and a
	jr z, .asm_7bfa
	ld hl, W_BOXMON1NAME
.asm_7bfa
	ld bc, $b
	ld a, [wWhichPokemon] ; $cf92
	call AddNTimes
	ld d, h
	ld e, l
	ld bc, $b
	add hl, bc
	ld bc, wPokedexOwned ; $d2f7
	ld a, [$cf95]
	and a
	jr z, .asm_7c15
	ld bc, $dee2
.asm_7c15
	jp CopyDataUntil

Func_7c18: ; 7c18 (1:7c18)
	ld hl, $d730
	set 6, [hl]
	ld a, $3d
	call Predef
	ld hl, $d730
	res 6, [hl]
	call ReloadMapData
	ld c, $a
	call DelayFrames
	ld a, $3a
	call Predef
	ld a, [$d11e]
	dec a
	ld c, a
	ld b, $1
	ld hl, wPokedexSeen
	ld a, $10
	call Predef
	ld a, $1
	ld [$cc3c], a
	ret


SECTION "bank3",ROMX,BANK[$3]

_GetJoypadState: ; c000 (3:4000)
	ld a, [H_JOYPADSTATE]
	cp A_BUTTON | B_BUTTON | SELECT | START ; soft reset sequence
	jp z, HandleJoypadResetButtons
	ld b, a
	ld a, [H_OLDPRESSEDBUTTONS]
	ld e, a
	xor b
	ld d, a
	and e
	ld [H_NEWLYRELEASEDBUTTONS], a
	ld a, d
	and b
	ld [H_NEWLYPRESSEDBUTTONS], a
	ld a, b
	ld [H_OLDPRESSEDBUTTONS], a
	ld a, [$d730]
	bit 5, a
	jr nz, DiscardButtonPresses
	ld a, [H_OLDPRESSEDBUTTONS]
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld a, [wJoypadForbiddenButtonsMask]
	and a
	ret z
	cpl
	ld b, a
	ld a, [H_CURRENTPRESSEDBUTTONS]
	and b
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld a, [H_NEWLYPRESSEDBUTTONS]
	and b
	ld [H_NEWLYPRESSEDBUTTONS], a
	ret

; clears all button presses
DiscardButtonPresses: ; c034 (3:4034)
	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld [H_NEWLYPRESSEDBUTTONS], a
	ld [H_NEWLYRELEASEDBUTTONS], a
	ret

HandleJoypadResetButtons: ; c03c (3:403c)
	call DelayFrame
	ld a, $30
	ld [rJOYP], a ; reset joypad state (to enusre the user really intends to reset)
	ld hl, H_SOFTRESETCOUNTER
	dec [hl]
	jp z, SoftReset
	jp GetJoypadState

INCLUDE "data/map_songs.asm"

INCLUDE "data/map_header_banks.asm"

Func_c335: ; c335 (3:4335)
	ld a, $90
	ld [$ffb0], a
	ld [rWY], a ; $ff4a
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld [$d13b], a
	ld [W_LONEATTACKNO], a ; $d05c
	ld [H_NEWLYPRESSEDBUTTONS], a
	ld [H_NEWLYRELEASEDBUTTONS], a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld [$cd6a], a
	ld [$d5a3], a
	ld hl, $d73f
	ld [hli], a
	ld [hl], a
	ld hl, wWhichTrade ; $cd3d
	ld bc, $1e
	call FillMemory
	ret

Func_c35f: ; c35f (3:435f)
	ld a, [$d3ae]
	and a
	ret z
	ld c, a
	ld hl, $d3af
.asm_c368
	ld a, [W_YCOORD] ; $d361
	cp [hl]
	jr nz, .asm_c383
	inc hl
	ld a, [W_XCOORD] ; $d362
	cp [hl]
	jr nz, .asm_c384
	inc hl
	ld a, [hli]
	ld [$d42f], a
	ld a, [hl]
	ld [H_DOWNARROWBLINKCNT1], a ; $ff8b
	ld hl, $d736
	set 2, [hl]
	ret
.asm_c383
	inc hl
.asm_c384
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .asm_c368
	ret

CheckForceBikeOrSurf: ; c38b (3:438b)
	ld hl, $D732
	bit 5, [hl]
	ret nz
	ld hl, ForcedBikeOrSurfMaps
	ld a, [W_YCOORD]
	ld b, a
	ld a, [W_XCOORD]
	ld c, a
	ld a, [W_CURMAP]
	ld d, a
.loop
	ld a, [hli]
	cp $ff
	ret z ;if we reach FF then it's not part of the list
	cp d ;compare to current map
	jr nz, .incorrectMap
	ld a, [hli]
	cp b ;compare y-coord
	jr nz, .incorrectY
	ld a, [hli]
	cp c ;compare x-coord
	jr nz, .loop ; incorrect x-coord, check next item
	ld a, [W_CURMAP]
	cp SEAFOAM_ISLANDS_4
	ld a, $2
	ld [W_SEAFOAMISLANDS4CURSCRIPT], a
	jr z, .forceSurfing
	ld a, [W_CURMAP]
	cp SEAFOAM_ISLANDS_5
	ld a, $2
	ld [W_SEAFOAMISLANDS5CURSCRIPT], a
	jr z, .forceSurfing
	;force bike riding
	ld hl, $d732
	set 5, [hl]
	ld a, $1
	ld [$d700], a
	ld [$d11a], a
	jp ForceBikeOrSurf
.incorrectMap
	inc hl
.incorrectY
	inc hl
	jr .loop
.forceSurfing
	ld a, $2
	ld [$d700], a
	ld [$d11a], a
	jp ForceBikeOrSurf

INCLUDE "data/force_bike_surf.asm"

Func_c3ff: ; c3ff (3:43ff)
	push hl
	push de
	push bc
	ld a, [$c109]
	srl a
	ld c, a
	ld b, $0
	ld hl, PointerTable_c422 ; $4422
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [W_YCOORD] ; $d361
	ld b, a
	ld a, [W_XCOORD] ; $d362
	ld c, a
	ld de, .asm_c41e ; $441e
	push de
	jp [hl]
.asm_c41e
	pop bc
	pop de
	pop hl
	ret

PointerTable_c422: ; c422 (3:4422)
	dw .asm_c42a
	dw .asm_4434
	dw .asm_443A
	dw .asm_4440

.asm_c42a
	ld a, [W_CURMAPHEIGHT] ; $d368
	add a
	dec a
	cp b
	jr z, .setCarry
	jr .resetCarry

.asm_4434
	ld a, b
	and a
	jr z, .setCarry
	jr .resetCarry

.asm_443A
	ld a, c
	and a
	jr z, .setCarry
	jr .resetCarry

.asm_4440
	ld a, [W_CURMAPWIDTH] ; $d369
	add a
	dec a
	cp c
	jr z, .setCarry
	jr .resetCarry
.resetCarry
	and a
	ret
.setCarry
	scf
	ret

Func_c44e: ; c44e (3:444e)
	push hl
	push de
	push bc
	call Func_c589
	ld a, [W_CURMAP] ; $d35e
	cp SS_ANNE_5
	jr z, .ssAnne5
	ld a, [$c109]
	srl a
	ld c, a
	ld b, $0
	ld hl, .pointerTable_c477 ; $4477
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$cfc6]
	ld de, $1
	call IsInArray
.asm_c473
	pop bc
	pop de
	pop hl
	ret

.pointerTable_c477: ; c477 (3:4477)
	dw .arrayData_c47f
	dw .arrayData_c487
	dw .arrayData_c48a
	dw .arrayData_c48d

.arrayData_c47f
	db $01,$12,$17,$3D,$04,$18,$33,$FF

.arrayData_c487
	db $01,$5C,$FF

.arrayData_c48a
	db $1A,$4B,$FF

.arrayData_c48d
	db $0F,$4E,$FF

.ssAnne5
	ld a, [$cfc6]
	cp $15
	jr nz, .asm_c49a
	scf
	jr .asm_c473
.asm_c49a
	and a
	jr .asm_c473

Func_c49d: ; c49d (3:449d)
	push hl
	push de
	push bc
	callba HandleDoors
	jr c, .asm_c4c8
	ld a, [W_CURMAPTILESET] ; $d367
	add a
	ld c, a
	ld b, $0
	ld hl, WarpTileIDPointers ; $44cc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $1
	FuncCoord 8, 9 ; $c45c
	ld a, [Coord]
	call IsInArray
	jr nc, .asm_c4c8
	ld hl, $d736
	res 2, [hl]
.asm_c4c8
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/warp_tile_ids.asm"

PrintSafariZoneSteps: ; c52f (3:452f)
	ld a, [W_CURMAP] ; $d35e
	cp SAFARI_ZONE_EAST
	ret c
	cp UNKNOWN_DUNGEON_2
	ret nc
	ld hl, wTileMap
	ld b, $3
	ld c, $7
	call TextBoxBorder
	FuncCoord 1, 1 ; $c3b5
	ld hl, Coord
	ld de, wSafariSteps ; $d70d
	ld bc, $203
	call PrintNumber
	FuncCoord 4, 1 ; $c3b8
	ld hl, Coord
	ld de, SafariSteps ; $4579
	call PlaceString
	FuncCoord 1, 3 ; $c3dd
	ld hl, Coord
	ld de, SafariBallText
	call PlaceString
	ld a, [W_NUMSAFARIBALLS] ; $da47
	cp $a
	jr nc, .asm_c56d
	FuncCoord 5, 3 ; $c3e1
	ld hl, Coord
	ld a, $7f
	ld [hl], a
.asm_c56d
	FuncCoord 6, 3 ; $c3e2
	ld hl, Coord
	ld de, W_NUMSAFARIBALLS ; $da47
	ld bc, $102
	jp PrintNumber

SafariSteps: ; c579 (3:4579)
	db "/500@"

SafariBallText: ; c57e (3:457e)
	db "BALL×× @"

Func_c586: ; c586 (3:4586)
	call GetPredefRegisters

Func_c589: ; c589 (3:4589)
	ld a, [W_YCOORD] ; $d361
	ld d, a
	ld a, [W_XCOORD] ; $d362
	ld e, a
	ld a, [$c109]
	and a
	jr nz, .asm_c59d
	FuncCoord 8, 11 ; $c484
	ld a, [Coord]
	inc d
	jr .asm_c5b9
.asm_c59d
	cp $4
	jr nz, .asm_c5a7
	FuncCoord 8, 7 ; $c434
	ld a, [Coord]
	dec d
	jr .asm_c5b9
.asm_c5a7
	cp $8
	jr nz, .asm_c5b1
	FuncCoord 6, 9 ; $c45a
	ld a, [Coord]
	dec e
	jr .asm_c5b9
.asm_c5b1
	cp $c
	jr nz, .asm_c5b9
	FuncCoord 10, 9 ; $c45e
	ld a, [Coord]
	inc e
.asm_c5b9
	ld c, a
	ld [$cfc6], a
	ret

Func_c5be: ; c5be (3:45be)
	xor a
	ld [$ffdb], a
	ld hl, W_YCOORD ; $d361
	ld a, [hli]
	ld d, a
	ld e, [hl]
	ld a, [$c109]
	and a
	jr nz, .asm_c5d8
	ld hl, $ffdb
	set 0, [hl]
	FuncCoord 8, 13 ; $c4ac
	ld a, [Coord]
	inc d
	jr .asm_c603
.asm_c5d8
	cp $4
	jr nz, .asm_c5e7
	ld hl, $ffdb
	set 1, [hl]
	FuncCoord 8, 5 ; $c40c
	ld a, [Coord]
	dec d
	jr .asm_c603
.asm_c5e7
	cp $8
	jr nz, .asm_c5f6
	ld hl, $ffdb
	set 2, [hl]
	FuncCoord 4, 9 ; $c458
	ld a, [Coord]
	dec e
	jr .asm_c603
.asm_c5f6
	cp $c
	jr nz, .asm_c603
	ld hl, $ffdb
	set 3, [hl]
	FuncCoord 12, 9 ; $c460
	ld a, [Coord]
	inc e
.asm_c603
	ld c, a
	ld [$d71c], a
	ld [$cfc6], a
	ret

Func_c60b: ; c60b (3:460b)
	call Func_c5be
	ld hl, $d530
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_c614
	ld a, [hli]
	cp $ff
	jr z, .asm_c632
	cp c
	jr nz, .asm_c614
	ld hl, $c7e
	call Func_c44
	ld a, $ff
	jr c, .asm_c632
	ld a, [$d71c]
	cp $15
	ld a, $ff
	jr z, .asm_c632
	call Func_c636
.asm_c632
	ld [$d71c], a
	ret

Func_c636: ; c636 (3:4636)
	ld a, [$d718]
	dec a
	swap a
	ld d, $0
	ld e, a
	ld hl, $c214
	add hl, de
	ld a, [hli]
	ld [$ffdc], a
	ld a, [hl]
	ld [$ffdd], a
	ld a, [W_NUMSPRITES] ; $d4e1
	ld c, a
	ld de, $f
	ld hl, $c214
	ld a, [$ffdb]
	and $3
	jr z, .asm_c678
.asm_c659
	inc hl
	ld a, [$ffdd]
	cp [hl]
	jr nz, .asm_c672
	dec hl
	ld a, [hli]
	ld b, a
	ld a, [$ffdb]
	rrca
	jr c, .asm_c66c
	ld a, [$ffdc]
	dec a
	jr .asm_c66f
.asm_c66c
	ld a, [$ffdc]
	inc a
.asm_c66f
	cp b
	jr z, .asm_c697
.asm_c672
	dec c
	jr z, .asm_c69a
	add hl, de
	jr .asm_c659
.asm_c678
	ld a, [hli]
	ld b, a
	ld a, [$ffdc]
	cp b
	jr nz, .asm_c691
	ld b, [hl]
	ld a, [$ffdb]
	bit 2, a
	jr nz, .asm_c68b
	ld a, [$ffdd]
	inc a
	jr .asm_c68e
.asm_c68b
	ld a, [$ffdd]
	dec a
.asm_c68e
	cp b
	jr z, .asm_c697
.asm_c691
	dec c
	jr z, .asm_c69a
	add hl, de
	jr .asm_c678
.asm_c697
	ld a, $ff
	ret
.asm_c69a
	xor a
	ret

Func_c69c: ; c69c (3:469c)
	ld a, [$d730]
	add a
	jp c, .asm_c74f
	ld a, [W_NUMINPARTY] ; $d163
	and a
	jp z, .asm_c74f
	call Func_c8de
	ld a, [$d13b]
	and $3
	jp nz, .asm_c74f
	ld [wWhichPokemon], a ; $cf92
	ld hl, W_PARTYMON1_STATUS ; $d16f
	ld de, W_PARTYMON1 ; $d164
.asm_c6be
	ld a, [hl]
	and $8
	jr z, .asm_c6fd
	dec hl
	dec hl
	ld a, [hld]
	ld b, a
	ld a, [hli]
	or b
	jr z, .asm_c6fb
	ld a, [hl]
	dec a
	ld [hld], a
	inc a
	jr nz, .asm_c6d5
	dec [hl]
	inc hl
	jr .asm_c6fb
.asm_c6d5
	ld a, [hli]
	or [hl]
	jr nz, .asm_c6fb
	push hl
	inc hl
	inc hl
	ld [hl], a
	ld a, [de]
	ld [$d11e], a
	push de
	ld a, [wWhichPokemon] ; $cf92
	ld hl, W_PARTYMON1NAME ; $d2b5
	call GetPartyMonName
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	call EnableAutoTextBoxDrawing
	ld a, $d0
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	pop de
	pop hl
.asm_c6fb
	inc hl
	inc hl
.asm_c6fd
	inc de
	ld a, [de]
	inc a
	jr z, .asm_c70e
	ld bc, $2c
	add hl, bc
	push hl
	ld hl, wWhichPokemon ; $cf92
	inc [hl]
	pop hl
	jr .asm_c6be
.asm_c70e
	ld hl, W_PARTYMON1_STATUS ; $d16f
	ld a, [W_NUMINPARTY] ; $d163
	ld d, a
	ld e, $0
.asm_c717
	ld a, [hl]
	and $8
	or e
	ld e, a
	ld bc, $2c
	add hl, bc
	dec d
	jr nz, .asm_c717
	ld a, e
	and a
	jr z, .asm_c733
	ld b, $2
	ld a, $1f
	call Predef ; indirect jump to Func_480eb (480eb (12:40eb))
	ld a, (SFX_02_43 - SFX_Headers_02) / 3
	call PlaySound
.asm_c733
	ld a, $14
	call Predef ; indirect jump to AnyPlayerPokemonAliveCheck (3ca83 (f:4a83))
	ld a, d
	and a
	jr nz, .asm_c74f
	call EnableAutoTextBoxDrawing
	ld a, $d1
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call DisplayTextID
	ld hl, $d72e
	set 5, [hl]
	ld a, $ff
	jr .asm_c750
.asm_c74f
	xor a
.asm_c750
	ld [$d12d], a
	ret

Func_c754: ; c754 (3:4754)
	call GetPredefRegisters
	push hl
	ld d, $0
	ld a, [W_CURMAPTILESET] ; $d367
	add a
	add a
	ld b, a
	add a
	add b
	jr nc, .asm_c765
	inc d
.asm_c765
	ld e, a
	ld hl, Tilesets
	add hl, de
	ld de, $d52b
	ld c, $b
.asm_c76f
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_c76f
	ld a, [hl]
	ld [$ffd7], a
	xor a
	ld [$ffd8], a
	pop hl
	ld a, [W_CURMAPTILESET] ; $d367
	push hl
	push de
	ld hl, DungeonTilesets ; $47b2
	ld de, $1
	call IsInArray
	pop de
	pop hl
	jr c, .asm_c797
	ld a, [W_CURMAPTILESET] ; $d367
	ld b, a
	ld a, [H_DOWNARROWBLINKCNT1] ; $ff8b
	cp b
	jr z, .asm_c7b1
.asm_c797
	ld a, [$d42f]
	cp $ff
	jr z, .asm_c7b1
	call LoadDestinationWarpPosition
	ld a, [W_YCOORD] ; $d361
	and $1
	ld [W_YBLOCKCOORD], a ; $d363
	ld a, [W_XCOORD] ; $d362
	and $1
	ld [W_XBLOCKCOORD], a ; $d364
.asm_c7b1
	ret

INCLUDE "data/dungeon_tilesets.asm"

INCLUDE "data/tileset_headers.asm"

Func_c8de: ; c8de (3:48de)
	ld a, [W_DAYCARE_IN_USE]
	and a
	ret z
	ld hl, $da6f
	inc [hl]
	ret nz
	dec hl
	inc [hl]
	ret nz
	dec hl
	inc [hl]
	ld a, [hl]
	cp $50
	ret c
	ld a, $50
	ld [hl], a
	ret

INCLUDE "data/hide_show_data.asm"

PrintUsedStrengthText: ; cd99 (3:4d99)
	ld hl, $d728
	set 0, [hl]
	ld hl, UsedStrengthText
	call PrintText
	ld hl, CanMoveBouldersText
	jp PrintText

UsedStrengthText: ; cdaa (3:4daa)
	TX_FAR _UsedStrengthText
	db $08 ; asm
	ld a, [$cf91]
	call PlayCry
	call Delay3
	jp TextScriptEnd

CanMoveBouldersText: ; cdbb (3:4dbb)
	TX_FAR _CanMoveBouldersText
	db "@"

CheckForForcedBikeSurf: ; cdc0 (3:4dc0)
	ld hl, $d728
	set 1, [hl]
	ld a, [$d732]
	bit 5, a
	jr nz, .asm_cdec
	ld a, [W_CURMAP] ; $d35e
	cp SEAFOAM_ISLANDS_5
	ret nz
	ld a, [$d881]
	and $3
	cp $3
	ret z
	ld hl, CoordsData_cdf7 ; $4df7
	call ArePlayerCoordsInArray
	ret nc
	ld hl, $d728
	res 1, [hl]
	ld hl, CurrentTooFastText
	jp PrintText
.asm_cdec
	ld hl, $d728
	res 1, [hl]
	ld hl, CyclingIsFunText
	jp PrintText

CoordsData_cdf7: ; cdf7 (3:4df7)
	db $0B,$07,$FF

CurrentTooFastText: ; cdfa (3:4dfa)
	TX_FAR _CurrentTooFastText
	db "@"

CyclingIsFunText: ; cdff (3:4dff)
	TX_FAR _CyclingIsFunText
	db "@"

; function to add an item (in varying quantities) to the player's bag or PC box
; INPUT:
; hl = address of inventory (either wNumBagItems or wNumBoxItems)
; [$CF91] = item ID
; [$CF96] = item quantity
; sets carry flag if successful, unsets carry flag if unsuccessful
AddItemToInventory_: ; ce04 (3:4e04)
	ld a,[$cf96] ; a = item quantity
	push af
	push bc
	push de
	push hl
	push hl
	ld d,50 ; PC box can hold 50 items
	ld a,wNumBagItems & $FF
	cp l
	jr nz,.checkIfInventoryFull
	ld a,wNumBagItems >> 8
	cp h
	jr nz,.checkIfInventoryFull
; if the destination is the bag
	ld d,20 ; bag can hold 20 items
.checkIfInventoryFull
	ld a,[hl]
	sub d
	ld d,a
	ld a,[hli]
	and a
	jr z,.addNewItem
.loop
	ld a,[hli]
	ld b,a ; b = ID of current item in table
	ld a,[$cf91] ; a = ID of item being added
	cp b ; does the current item in the table match the item being added?
	jp z,.increaseItemQuantity ; if so, increase the item's quantity
	inc hl
	ld a,[hl]
	cp a,$ff ; is it the end of the table?
	jr nz,.loop
.addNewItem ; add an item not yet in the inventory
	pop hl
	ld a,d
	and a ; is there room for a new item slot?
	jr z,.done
; if there is room
	inc [hl] ; increment the number of items in the inventory
	ld a,[hl] ; the number of items will be the index of the new item
	add a
	dec a
	ld c,a
	ld b,0
	add hl,bc ; hl = address to store the item
	ld a,[$cf91]
	ld [hli],a ; store item ID
	ld a,[$cf96]
	ld [hli],a ; store item quantity
	ld [hl],$ff ; store terminator
	jp .success
.increaseItemQuantity ; increase the quantity of an item already in the inventory
	ld a,[$cf96]
	ld b,a ; b = quantity to add
	ld a,[hl] ; a = existing item quantity
	add b ; a = new item quantity
	cp a,100
	jp c,.storeNewQuantity ; if the new quantity is less than 100, store it
; if the new quantity is greater than or equal to 100,
; try to max out the current slot and add the rest in a new slot
	sub a,99
	ld [$cf96],a ; a = amount left over (to put in the new slot)
	ld a,d
	and a ; is there room for a new item slot?
	jr z,.increaseItemQuantityFailed
; if so, store 99 in the current slot and store the rest in a new slot
	ld a,99
	ld [hli],a
	jp .loop
.increaseItemQuantityFailed
	pop hl
	and a
	jr .done
.storeNewQuantity
	ld [hl],a
	pop hl
.success
	scf
.done
	pop hl
	pop de
	pop bc
	pop bc
	ld a,b
	ld [$cf96],a ; restore the initial value from when the function was called
	ret

; function to remove an item (in varying quantities) from the player's bag or PC box
; INPUT:
; hl = address of inventory (either wNumBagItems or wNumBoxItems)
; [$CF92] = index (within the inventory) of the item to remove
; [$CF96] = quantity to remove
RemoveItemFromInventory_: ; ce74 (3:4e74)
	push hl
	inc hl
	ld a,[wWhichPokemon] ; index (within the inventory) of the item being removed
	sla a
	add l
	ld l,a
	jr nc,.noCarry
	inc h
.noCarry
	inc hl
	ld a,[$cf96] ; quantity being removed
	ld e,a
	ld a,[hl] ; a = current quantity
	sub e
	ld [hld],a ; store new quantity
	ld [$cf97],a
	and a
	jr nz,.skipMovingUpSlots
; if the remaining quantity is 0,
; remove the emptied item slot and move up all the following item slots
.moveSlotsUp
	ld e,l
	ld d,h
	inc de
	inc de ; de = address of the slot following the emptied one
.loop ; loop to move up the following slots
	ld a,[de]
	inc de
	ld [hli],a
	cp a,$ff
	jr nz,.loop
; update menu info
	xor a
	ld [wListScrollOffset],a
	ld [wCurrentMenuItem],a
	ld [$cc2c],a
	ld [$d07e],a
	pop hl
	ld a,[hl] ; a = number of items in inventory
	dec a ; decrement the number of items
	ld [hl],a ; store new number of items
	ld [$d12a],a
	cp a,2
	jr c,.done
	ld [wMaxMenuItem],a
	jr .done
.skipMovingUpSlots
	pop hl
.done
	ret

; wild pokemon data: from 4EB8 to 55C7

LoadWildData: ; ceb8 (3:4eb8)
	ld hl,WildDataPointers
	ld a,[W_CURMAP]

	; get wild data for current map
	ld c,a
	ld b,0
	add hl,bc
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a       ; hl now points to wild data for current map
	ld a,[hli]
	ld [W_GRASSRATE],a
	and a
	jr z,.NoGrassData ; if no grass data, skip to surfing data
	push hl
	ld de,W_GRASSMONS ; otherwise, load grass data
	ld bc,$0014
	call CopyData
	pop hl
	ld bc,$0014
	add hl,bc
.NoGrassData
	ld a,[hli]
	ld [W_WATERRATE],a
	and a
	ret z        ; if no water data, we're done
	ld de,W_WATERMONS  ; otherwise, load surfing data
	ld bc,$0014
	jp CopyData

INCLUDE "data/wild_mons.asm"

INCLUDE "engine/items/items.asm"

DrawBadges: ; ea03 (3:6a03)
; Draw 4x2 gym leader faces, with the faces replaced by
; badges if they are owned. Used in the player status screen.

; In Japanese versions, names are displayed above faces.
; Instead of removing relevant code, the name graphics were erased.

; Tile ids for face/badge graphics.
	ld de, $cd3f
	ld hl, .FaceBadgeTiles
	ld bc, 8
	call CopyData

; Booleans for each badge.
	ld hl, $cd49
	ld bc, 8
	xor a
	call FillMemory

; Alter these based on owned badges.
	ld de, $cd49
	ld hl, $cd3f
	ld a, [W_OBTAINEDBADGES]
	ld b, a
	ld c, 8
.CheckBadge
	srl b
	jr nc, .NextBadge
	ld a, [hl]
	add 4 ; Badge graphics are after each face
	ld [hl], a
	ld a, 1
	ld [de], a
.NextBadge
	inc hl
	inc de
	dec c
	jr nz, .CheckBadge

; Draw two rows of badges.
	ld hl, $cd3d
	ld a, $d8 ; [1]
	ld [hli], a
	ld [hl], $60 ; First name

	FuncCoord 2, 11
	ld hl, Coord
	ld de, $cd49
	call .DrawBadgeRow

	FuncCoord 2, 14
	ld hl, Coord
	ld de, $cd49 + 4
;	call .DrawBadgeRow
;	ret

.DrawBadgeRow ; ea4c (3:6a4c)
; Draw 4 badges.

	ld c, 4
.DrawBadge
	push de
	push hl

; Badge no.
	ld a, [$cd3d]
	ld [hli], a
	inc a
	ld [$cd3d], a

; Names aren't printed if the badge is owned.
	ld a, [de]
	and a
	ld a, [$cd3e]
	jr nz, .SkipName
	call .PlaceTiles
	jr .PlaceBadge

.SkipName
	inc a
	inc a
	inc hl

.PlaceBadge
	ld [$cd3e], a
	ld de, 20 - 1
	add hl, de
	ld a, [$cd3f]
	call .PlaceTiles
	add hl, de
	call .PlaceTiles

; Shift badge array back one byte.
	push bc
	ld hl, $cd3f + 1
	ld de, $cd3f
	ld bc, 8
	call CopyData
	pop bc

	pop hl
	ld de, 4
	add hl, de

	pop de
	inc de
	dec c
	jr nz, .DrawBadge
	ret

.PlaceTiles
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	ret

.FaceBadgeTiles
	db $20, $28, $30, $38, $40, $48, $50, $58

GymLeaderFaceAndBadgeTileGraphics: ; ea9e (3:6a9e)
	INCBIN "gfx/badges.w16.2bpp"

Func_ee9e: ; ee9e (3:6e9e)
	call GetPredefRegisters
	ld hl, $c6e8
	ld a, [W_CURMAPWIDTH] ; $d369
	add $6
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	add hl, de
	ld e, $3
	add hl, de
	ld e, a
	ld a, b
	and a
	jr z, .asm_eebb
.asm_eeb7
	add hl, de
	dec b
	jr nz, .asm_eeb7
.asm_eebb
	add hl, bc
	ld a, [$d09f]
	ld [hl], a
	ld a, [$d35f]
	ld c, a
	ld a, [$d360]
	ld b, a
	call Func_ef4e
	ret c
	push hl
	ld l, e
	ld h, $0
	ld e, $6
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, bc
	pop bc
	call Func_ef4e
	ret c

Func_eedc: ; eedc (3:6edc)
	ld a, [W_ISINBATTLE] ; $d057
	inc a
	ret z
	ld a, [H_AUTOBGTRANSFERENABLED] ; $ffba
	push af
	ld a, [$ffd7]
	push af
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld [$ffd7], a
	call LoadCurrentMapView
	call GoPAL_SET_CF1C
	ld hl, $d526
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $ffc0
	add hl, de
	ld a, h
	and $3
	or $98
	ld a, l
	ld [$cee9], a
	ld a, h
	ld [$ceea], a
	ld a, $2
	ld [$ffbe], a
	ld c, $9
.asm_ef0f
	push bc
	push hl
	push hl
	ld hl, $c378
	ld de, $14
	ld a, [$ffbe]
.asm_ef1a
	add hl, de
	dec a
	jr nz, .asm_ef1a
	call ScheduleRowRedrawHelper
	pop hl
	ld de, $20
	ld a, [$ffbe]
	ld c, a
.asm_ef28
	add hl, de
	ld a, h
	and $3
	or $98
	dec c
	jr nz, .asm_ef28
	ld [$ffd2], a
	ld a, l
	ld [H_SCREENEDGEREDRAWADDR], a ; $ffd1
	ld a, $2
	ld [H_SCREENEDGEREDRAW], a ; $ffd0
	call DelayFrame
	ld hl, $ffbe
	inc [hl]
	inc [hl]
	pop hl
	pop bc
	dec c
	jr nz, .asm_ef0f
	pop af
	ld [$ffd7], a
	pop af
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ret

Func_ef4e: ; ef4e (3:6f4e)
	ld a, h
	sub b
	ret nz
	ld a, l
	sub c
	ret

INCLUDE "engine/overworld/cut.asm"

Func_f113: ; f113 (3:7113)
	ld a, [W_CURMAP] ; $d35e
	cp ROUTE_1
	jr nc, .notInTown
	ld c, a
	ld b, $1
	ld hl, W_TOWNVISITEDFLAG   ; mark town as visited (for flying)
	ld a, $10
	call Predef ; indirect jump to HandleBitArray (f666 (3:7666))
.notInTown
	ld hl, MapHSPointers
	ld a, [W_CURMAP] ; $d35e
	ld b, $0
	ld c, a
	add hl, bc
	add hl, bc
	ld a, [hli]                ; load missable objects pointer in hl
	ld h, [hl]

Func_f132: ; f132 (3:7132)
	ld l, a
	push hl
	ld de, MapHS00             ; calculate difference between out pointer and the base pointer
	ld a, l
	sub e
	jr nc, .asm_f13c
	dec h
.asm_f13c
	ld l, a
	ld a, h
	sub d
	ld h, a
	ld a, h
	ld [H_DIVIDEND], a
	ld a, l
	ld [H_DIVIDEND+1], a
	xor a
	ld [H_DIVIDEND+2], a
	ld [H_DIVIDEND+3], a
	ld a, $3
	ld [H_DIVISOR], a
	ld b, $2
	call Divide                ; divide difference by 3, resulting in the global offset (number of missable items before ours)
	ld a, [W_CURMAP] ; $d35e
	ld b, a
	ld a, [H_DIVIDEND+3]
	ld c, a                    ; store global offset in c
	ld de, W_MISSABLEOBJECTLIST
	pop hl
.writeMissableObjectsListLoop
	ld a, [hli]
	cp $ff
	jr z, .done     ; end of list
	cp b
	jr nz, .done    ; not for current map anymore
	ld a, [hli]
	inc hl
	ld [de], a                 ; write (map-local) sprite ID
	inc de
	ld a, c
	inc c
	ld [de], a                 ; write (global) missable object index
	inc de
	jr .writeMissableObjectsListLoop
.done
	ld a, $ff
	ld [de], a                 ; write sentinel
	ret

InitializeMissableObjectsFlags: ; f175 (3:7175)
	ld hl, W_MISSABLEOBJECTFLAGS
	ld bc, $20
	xor a
	call FillMemory ; clear missable objects flags
	ld hl, MapHS00
	xor a
	ld [$d048], a
.missableObjectsLoop
	ld a, [hli]
	cp $ff          ; end of list
	ret z
	push hl
	inc hl
	ld a, [hl]
	cp Hide
	jr nz, .asm_f19d
	ld hl, W_MISSABLEOBJECTFLAGS
	ld a, [$d048]
	ld c, a
	ld b, $1
	call HandleBitArray2 ; set flag iff Item is hidden
.asm_f19d
	ld hl, $d048
	inc [hl]
	pop hl
	inc hl
	inc hl
	jr .missableObjectsLoop

; tests if current sprite is a missable object that is hidden/has been removed
IsMissableObjectHidden: ; f1a6 (3:71a6)
	ld a, [H_CURRENTSPRITEOFFSET]
	swap a
	ld b, a
	ld hl, W_MISSABLEOBJECTLIST
.loop
	ld a, [hli]
	cp $ff
	jr z, .notHidden ; not missable -> not hidden
	cp b
	ld a, [hli]
	jr nz, .loop
	ld c, a
	ld b, $2
	ld hl, W_MISSABLEOBJECTFLAGS
	call HandleBitArray2
	ld a, c
	and a
	jr nz, .hidden
.notHidden
	xor a
.hidden
	ld [$ffe5], a
	ret

; adds missable object (items, leg. pokemon, etc.) to the map
; [$cc4d]: index of the missable object to be added (global index)
AddMissableObject: ; f1c8 (3:71c8)
	ld hl, W_MISSABLEOBJECTFLAGS
	ld a, [$cc4d]
	ld c, a
	ld b, $0
	call HandleBitArray2   ; reset "removed" flag
	jp UpdateSprites

; removes missable object (items, leg. pokemon, etc.) from the map
; [$cc4d]: index of the missable object to be removed (global index)
RemoveMissableObject: ; f1d7 (3:71d7)
	ld hl, W_MISSABLEOBJECTFLAGS
	ld a, [$cc4d]
	ld c, a
	ld b, $1
	call HandleBitArray2   ; set "removed" flag
	jp UpdateSprites

; functionally identical to _HandleBitArray, but with less optimized instructions
; executes operations on a field of bits
; b = 0 -> reset bit
; b = 1 -> set bit
; b = 2 -> read bit (into c and z-flag)
; hl: base address
; c: bit index
HandleBitArray2: ; f1e6 (3:71e6)
	push hl
	push de
	push bc
	ld a, c
	ld d, a
	and $7
	ld e, a        ; store bit offset in e
	ld a, d
	srl a
	srl a
	srl a          ; calc byte offset
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	inc e
	ld d, $1
.shiftLeftLoop     ; d = 1 << e, bitmask for the used bit
	dec e
	jr z, .operationSelect
	sla d
	jr .shiftLeftLoop
.operationSelect
	ld a, b
	and a
	jr z, .resetBit
	cp $2
	jr z, .readBit
	ld a, [hl] ; set bit
	ld b, a
	ld a, d
	or b
	ld [hl], a
	jr .done
.resetBit
	ld a, [hl]
	ld b, a
	ld a, d
	xor $ff
	and b
	ld [hl], a
	jr .done
.readBit
	ld a, [hl]
	ld b, a
	ld a, d
	and b
.done
	pop bc
	pop de
	pop hl
	ld c, a
	ret

Func_f225: ; f225 (3:7225)
	ld a, [$d728]
	bit 0, a
	ret z
	ld a, [wFlags_0xcd60]
	bit 1, a
	ret nz
	xor a
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call IsSpriteInFrontOfPlayer
	ld a, [H_DOWNARROWBLINKCNT2] ; $ff8c
	ld [$d718], a
	and a
	jp z, Func_f2dd
	ld hl, $c101
	ld d, $0
	ld a, [H_DOWNARROWBLINKCNT2] ; $ff8c
	swap a
	ld e, a
	add hl, de
	res 7, [hl]
	call GetSpriteMovementByte2Pointer
	ld a, [hl]
	cp $10
	jp nz, Func_f2dd
	ld hl, wFlags_0xcd60
	bit 6, [hl]
	set 6, [hl]
	ret z
	ld a, [H_CURRENTPRESSEDBUTTONS]
	and $f0
	ret z
	ld a, $5a
	call Predef ; indirect jump to Func_c60b (c60b (3:460b))
	ld a, [$d71c]
	and a
	jp nz, Func_f2dd
	ld a, [H_CURRENTPRESSEDBUTTONS]
	ld b, a
	ld a, [$c109]
	cp $4
	jr z, .asm_f289
	cp $8
	jr z, .asm_f291
	cp $c
	jr z, .asm_f299
	bit 7, b
	ret z
	ld de, MovementData_f2af
	jr .asm_f29f
.asm_f289
	bit 6, b
	ret z
	ld de, MovementData_f2ad
	jr .asm_f29f
.asm_f291
	bit 5, b
	ret z
	ld de, MovementData_f2b1
	jr .asm_f29f
.asm_f299
	bit 4, b
	ret z
	ld de, MovementData_f2b3
.asm_f29f
	call MoveSprite
	ld a, (SFX_02_53 - SFX_Headers_02) / 3
	call PlaySound
	ld hl, wFlags_0xcd60
	set 1, [hl]
	ret

MovementData_f2ad: ; f2ad (3:72ad)
	db $40,$FF

MovementData_f2af: ; f2af (3:72af)
	db $00,$FF

MovementData_f2b1: ; f2b1 (3:72b1)
	db $80,$FF

MovementData_f2b3: ; f2b3 (3:72b3)
	db $C0,$FF

Func_f2b5: ; f2b5 (3:72b5)
	ld a, [$d730]
	bit 0, a
	ret nz
	callab Func_79f54
	call DiscardButtonPresses
	ld [wJoypadForbiddenButtonsMask], a
	call Func_f2dd
	set 7, [hl]
	ld a, [$d718]
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	call GetSpriteMovementByte2Pointer
	ld [hl], $10
	ld a, (SFX_02_56 - SFX_Headers_02) / 3
	jp PlaySound

Func_f2dd: ; f2dd (3:72dd)
	ld hl, wFlags_0xcd60
	res 1, [hl]
	res 6, [hl]
	ret

_AddPokemonToParty: ; f2e5 (3:72e5)
	ld de, W_NUMINPARTY ; $d163
	ld a, [$cc49]
	and $f
	jr z, .asm_f2f2
	ld de, wEnemyPartyCount ; $d89c
.asm_f2f2
	ld a, [de]
	inc a
	cp $7
	ret nc
	ld [de], a
	ld a, [de]
	ld [$ffe4], a
	add e
	ld e, a
	jr nc, .asm_f300
	inc d
.asm_f300
	ld a, [$cf91]
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	ld hl, W_PARTYMON1OT ; $d273
	ld a, [$cc49]
	and $f
	jr z, .asm_f315
	ld hl, W_ENEMYMON1OT
.asm_f315
	ld a, [$ffe4]
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	ld hl, W_PLAYERNAME ; $d158
	ld bc, $b
	call CopyData
	ld a, [$cc49]
	and a
	jr nz, .asm_f33f
	ld hl, W_PARTYMON1NAME ; $d2b5
	ld a, [$ffe4]
	dec a
	call SkipFixedLengthTextEntries
	ld a, $2
	ld [$d07d], a
	ld a, $4e
	call Predef ; indirect jump to Func_64eb (64eb (1:64eb))
.asm_f33f
	ld hl, W_PARTYMON1_NUM ; $d16b (aliases: W_PARTYMON1DATA)
	ld a, [$cc49]
	and $f
	jr z, .asm_f34c
	ld hl, wEnemyMons ; $d8a4
.asm_f34c
	ld a, [$ffe4]
	dec a
	ld bc, $2c
	call AddNTimes
	ld e, l
	ld d, h
	push hl
	ld a, [$cf91]
	ld [$d0b5], a
	call GetMonHeader
	ld hl, W_MONHEADER
	ld a, [hli]
	ld [de], a
	inc de
	pop hl
	push hl
	ld a, [$cc49]
	and $f
	ld a, $98     ; set enemy trainer mon IVs to fixed average values
	ld b, $88
	jr nz, .writeFreshMonData
	ld a, [$cf91]
	ld [$d11e], a
	push de
	ld a, $3a
	call Predef ; indirect jump to IndexToPokedex (41010 (10:5010))
	pop de
	ld a, [$d11e]
	dec a
	ld c, a
	ld b, $2
	ld hl, wPokedexOwned ; $d2f7
	call _HandleBitArray
	ld a, c
	ld [$d153], a
	ld a, [$d11e]
	dec a
	ld c, a
	ld b, $1
	push bc
	call _HandleBitArray
	pop bc
	ld hl, wPokedexSeen ; $d30a
	call _HandleBitArray
	pop hl
	push hl
	ld a, [W_ISINBATTLE] ; $d057
	and a
	jr nz, .copyEnemyMonData
	call Random ; generate random IVs
	ld b, a
	call Random
.writeFreshMonData ; f3b3
	push bc
	ld bc, $1b
	add hl, bc
	pop bc
	ld [hli], a
	ld [hl], b         ; write IVs
	ld bc, $fff4
	add hl, bc
	ld a, $1
	ld c, a
	xor a
	ld b, a
	call CalcStat      ; calc HP stat (set cur Hp to max HP)
	ld a, [H_MULTIPLICAND+1]
	ld [de], a
	inc de
	ld a, [H_MULTIPLICAND+2]
	ld [de], a
	inc de
	xor a
	ld [de], a         ; level (?)
	inc de
	ld [de], a         ; status ailments
	inc de
	jr .copyMonTypesAndMoves
.copyEnemyMonData
	ld bc, $1b
	add hl, bc
	ld a, [W_ENEMYMONATKDEFIV] ; copy IVs from cur enemy mon
	ld [hli], a
	ld a, [W_ENEMYMONSPDSPCIV]
	ld [hl], a
	ld a, [W_ENEMYMONCURHP]    ; copy HP from cur enemy mon
	ld [de], a
	inc de
	ld a, [W_ENEMYMONCURHP+1]
	ld [de], a
	inc de
	xor a
	ld [de], a                 ; level (?)
	inc de
	ld a, [W_ENEMYMONSTATUS]   ; copy status ailments from cur enemy mon
	ld [de], a
	inc de
.copyMonTypesAndMoves
	ld hl, W_MONHTYPES
	ld a, [hli]       ; type 1
	ld [de], a
	inc de
	ld a, [hli]       ; type 2
	ld [de], a
	inc de
	ld a, [hli]       ; unused (?)
	ld [de], a
	ld hl, W_MONHMOVES
	ld a, [hli]
	inc de
	push de
	ld [de], a
	ld a, [hli]
	inc de
	ld [de], a
	ld a, [hli]
	inc de
	ld [de], a
	ld a, [hli]
	inc de
	ld [de], a
	push de
	dec de
	dec de
	dec de
	xor a
	ld [$cee9], a
	ld a, $3e
	call Predef ; indirect jump to WriteMonMoves (3afb8 (e:6fb8))
	pop de
	ld a, [wPlayerID]  ; set trainer ID to player ID
	inc de
	ld [de], a
	ld a, [wPlayerID + 1]
	inc de
	ld [de], a
	push de
	ld a, [W_CURENEMYLVL]
	ld d, a
	callab CalcExperience
	pop de
	inc de
	ld a, [H_MULTIPLICAND] ; write experience
	ld [de], a
	inc de
	ld a, [H_MULTIPLICAND+1]
	ld [de], a
	inc de
	ld a, [H_MULTIPLICAND+2]
	ld [de], a
	xor a
	ld b, $a
.writeEVsLoop              ; set all EVs to 0
	inc de
	ld [de], a
	dec b
	jr nz, .writeEVsLoop
	inc de
	inc de
	pop hl
	call AddPokemonToParty_WriteMovePP
	inc de
	ld a, [W_CURENEMYLVL] ; $d127
	ld [de], a
	inc de
	ld a, [W_ISINBATTLE] ; $d057
	dec a
	jr nz, .calcFreshStats
	ld hl, W_ENEMYMONMAXHP ; $cff4
	ld bc, $a
	call CopyData          ; copy stats of cur enemy mon
	pop hl
	jr .done
.calcFreshStats
	pop hl
	ld bc, $10
	add hl, bc
	ld b, $0
	call CalcStats         ; calculate fresh set of stats
.done
	scf
	ret

LoadMovePPs: ; f473 (3:7473)
	call GetPredefRegisters
	; fallthrough
AddPokemonToParty_WriteMovePP: ; f476 (3:7476)
	ld b, $4
.pploop
	ld a, [hli]     ; read move ID
	and a
	jr z, .empty
	dec a
	push hl
	push de
	push bc
	ld hl, Moves
	ld bc, $6
	call AddNTimes
	ld de, $cd6d
	ld a, BANK(Moves)
	call FarCopyData
	pop bc
	pop de
	pop hl
	ld a, [$cd72] ; sixth move byte = pp
.empty
	inc de
	ld [de], a
	dec b
	jr nz, .pploop ; there are still moves to read
	ret

; adds enemy mon [$cf91] (at position [$cf92] in enemy list) to own party
; used in the cable club trade center
_AddEnemyMonToPlayerParty: ; f49d (3:749d)
	ld hl, W_NUMINPARTY
	ld a, [hl]
	cp $6
	scf
	ret z            ; party full, return failure
	inc a
	ld [hl], a       ; add 1 to party members
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [$cf91]
	ld [hli], a      ; add mon as last list entry
	ld [hl], $ff     ; write new sentinel
	ld hl, W_PARTYMON1DATA
	ld a, [W_NUMINPARTY]
	dec a
	ld bc, W_PARTYMON2DATA - W_PARTYMON1DATA
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, $cf98
	call CopyData    ; write new mon's data (from $cf98)
	ld hl, W_PARTYMON1OT
	ld a, [W_NUMINPARTY]
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	ld hl, W_ENEMYMON1OT
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld bc, $000b
	call CopyData    ; write new mon's OT name (from an enemy mon)
	ld hl, W_PARTYMON1NAME
	ld a, [W_NUMINPARTY]
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	ld hl, W_ENEMYMON1NAME
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld bc, $000b
	call CopyData    ; write new mon's nickname (from an enemy mon)
	ld a, [$cf91]
	ld [$d11e], a
	ld a, $3a
	call Predef
	ld a, [$d11e]
	dec a
	ld c, a
	ld b, $1
	ld hl, wPokedexOwned
	push bc
	call _HandleBitArray ; add to owned pokemon
	pop bc
	ld hl, wPokedexSeen
	call _HandleBitArray ; add to seen pokemon
	and a
	ret                  ; return success

Func_f51e: ; f51e (3:751e)
	ld a, [$cf95]
	and a
	jr z, .checkPartyMonSlots
	cp $2
	jr z, .checkPartyMonSlots
	cp $3
	ld hl, W_DAYCAREMONDATA
	jr z, .asm_f575
	ld hl, W_NUMINBOX ; $da80
	ld a, [hl]
	cp $14
	jr nz, .partyOrBoxNotFull
	jr .boxFull
.checkPartyMonSlots
	ld hl, W_NUMINPARTY ; $d163
	ld a, [hl]
	cp $6
	jr nz, .partyOrBoxNotFull
.boxFull
	scf
	ret
.partyOrBoxNotFull
	inc a
	ld [hl], a           ; increment number of mons in party/box
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [$cf95]
	cp $2
	ld a, [W_DAYCAREMONDATA]
	jr z, .asm_f556
	ld a, [$cf91]
.asm_f556
	ld [hli], a          ; write new mon ID
	ld [hl], $ff         ; write new sentinel
	ld a, [$cf95]
	dec a
	ld hl, W_PARTYMON1DATA ; $d16b
	ld bc, W_PARTYMON2DATA - W_PARTYMON1DATA ; $2c
	ld a, [W_NUMINPARTY] ; $d163
	jr nz, .skipToNewMonEntry
	ld hl, W_BOXMON1DATA
	ld bc, W_BOXMON2DATA - W_BOXMON1DATA ; $21
	ld a, [W_NUMINBOX] ; $da80
.skipToNewMonEntry
	dec a
	call AddNTimes
.asm_f575
	push hl
	ld e, l
	ld d, h
	ld a, [$cf95]
	and a
	ld hl, W_BOXMON1DATA
	ld bc, W_BOXMON2DATA - W_BOXMON1DATA ; $21
	jr z, .asm_f591
	cp $2
	ld hl, W_DAYCAREMONDATA
	jr z, .asm_f597
	ld hl, W_PARTYMON1DATA ; $d16b
	ld bc, W_PARTYMON2DATA - W_PARTYMON1DATA ; $2c
.asm_f591
	ld a, [wWhichPokemon] ; $cf92
	call AddNTimes
.asm_f597
	push hl
	push de
	ld bc, $21
	call CopyData
	pop de
	pop hl
	ld a, [$cf95]
	and a
	jr z, .asm_f5b4
	cp $2
	jr z, .asm_f5b4
	ld bc, $21
	add hl, bc
	ld a, [hl]
	inc de
	inc de
	inc de
	ld [de], a
.asm_f5b4
	ld a, [$cf95]
	cp $3
	ld de, W_DAYCAREMONOT
	jr z, .asm_f5d3
	dec a
	ld hl, W_PARTYMON1OT ; $d273
	ld a, [W_NUMINPARTY] ; $d163
	jr nz, .asm_f5cd
	ld hl, W_BOXMON1OT
	ld a, [W_NUMINBOX] ; $da80
.asm_f5cd
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
.asm_f5d3
	ld hl, W_BOXMON1OT
	ld a, [$cf95]
	and a
	jr z, .asm_f5e6
	ld hl, W_DAYCAREMONOT
	cp $2
	jr z, .asm_f5ec
	ld hl, W_PARTYMON1OT ; $d273
.asm_f5e6
	ld a, [wWhichPokemon] ; $cf92
	call SkipFixedLengthTextEntries
.asm_f5ec
	ld bc, $b
	call CopyData
	ld a, [$cf95]
	cp $3
	ld de, W_DAYCAREMONNAME
	jr z, .asm_f611
	dec a
	ld hl, W_PARTYMON1NAME ; $d2b5
	ld a, [W_NUMINPARTY] ; $d163
	jr nz, .asm_f60b
	ld hl, W_BOXMON1NAME
	ld a, [W_NUMINBOX] ; $da80
.asm_f60b
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
.asm_f611
	ld hl, W_BOXMON1NAME
	ld a, [$cf95]
	and a
	jr z, .asm_f624
	ld hl, W_DAYCAREMONNAME
	cp $2
	jr z, .asm_f62a
	ld hl, W_PARTYMON1NAME ; $d2b5
.asm_f624
	ld a, [wWhichPokemon] ; $cf92
	call SkipFixedLengthTextEntries
.asm_f62a
	ld bc, $b
	call CopyData
	pop hl
	ld a, [$cf95]
	cp $1
	jr z, .asm_f664
	cp $3
	jr z, .asm_f664
	push hl
	srl a
	add $2
	ld [$cc49], a
	call LoadMonData
	callba Func_58f43
	ld a, d
	ld [W_CURENEMYLVL], a ; $d127
	pop hl
	ld bc, $21
	add hl, bc
	ld [hli], a
	ld d, h
	ld e, l
	ld bc, $ffee
	add hl, bc
	ld b, $1
	call CalcStats
.asm_f664
	and a
	ret

; predef $10
; executes operations on a field of bits
; b = 0 -> reset bit
; b = 1 -> set bit
; b = 2 -> read bit (into c and z-flag)
; hl: base address
; c: bit index
HandleBitArray: ; f666 (3:7666)
	call GetPredefRegisters

_HandleBitArray: ; f669 (3:7669)
	push hl
	push de
	push bc
	ld a, c
	ld d, a
	and $7
	ld e, a        ; store bit offset in e
	ld a, d
	srl a
	srl a
	srl a          ; calc byte offset
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	inc e
	ld d, $1
.shiftLeftLoop     ; d = 1 << e, bitmask for the used bit
	dec e
	jr z, .operationSelect
	sla d
	jr .shiftLeftLoop
.operationSelect
	ld a, b
	and a
	jr z, .resetBit
	cp $2
	jr z, .readBit
	ld b, [hl] ; set bit
	ld a, d
	or b
	ld [hl], a
	jr .done
.resetBit
	ld b, [hl]
	ld a, d
	xor $ff
	and b
	ld [hl], a
	jr .done
.readBit
	ld b, [hl]
	ld a, d
	and b
.done
	pop bc
	pop de
	pop hl
	ld c, a
	ret

HealParty: ; f6a5 (3:76a5)
	ld hl, W_PARTYMON1
	ld de, W_PARTYMON1_HP
.HealPokemon: ; f6ab (3:76ab)
	ld a, [hli]
	cp $ff
	jr z, .DoneHealing ; End if there's no Pokémon
	push hl
	push de
	ld hl, $0003 ; Status offset
	add hl, de
	xor a
	ld [hl], a ; Clean status conditions
	push de
	ld b, $4 ; A Pokémon has 4 moves
.RestorePP: ; f6bb (3:76bb)
	ld hl, $0007 ; Move offset
	add hl, de
	ld a, [hl]
	and a
	jr z, .HealNext ; Skip if there's no move here
	dec a
	ld hl, $001c ; PP offset
	add hl, de
	push hl
	push de
	push bc
	ld hl, Moves
	ld bc, $0006
	call AddNTimes
	ld de, $cd6d
	ld a, BANK(Moves)
	call FarCopyData ; copy move header to memory
	ld a, [$cd72] ; get default PP
	pop bc
	pop de
	pop hl
	inc de
	push bc
	ld b, a
	ld a, [hl]
	and $c0
	add b
	ld [hl], a
	pop bc
.HealNext: ; f6eb (3:76eb)
	dec b
	jr nz, .RestorePP ; Continue if there's still moves
	pop de
	ld hl, $0021 ; Max HP offset
	add hl, de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a ; Restore full HP
	pop de
	pop hl
	push hl
	ld bc, $002c
	ld h, d
	ld l, e
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	jr .HealPokemon ; Next Pokémon
.DoneHealing
	xor a
	ld [wWhichPokemon], a
	ld [$d11e], a
	ld a, [W_NUMINPARTY]
	ld b, a
.restoreBonusPPLoop ; loop to restore bonus PP from PP Ups
	push bc
	call RestoreBonusPP
	pop bc
	ld hl, wWhichPokemon
	inc [hl]
	dec b
	jr nz,.restoreBonusPPLoop
	ret

; predef $9
; predef $a
; predef $d
; predef $e
Func_f71e: ; f71e (3:771e)
	call GetPredefRegisters
	xor a
	ld [$ffa5], a
	ld [$ffa6], a
	ld [$ffa7], a
	ld d, $1
.asm_f72a
	ld a, [$ffa2]
	and $f0
	jr nz, .asm_f75b
	inc d
	ld a, [$ffa2]
	swap a
	and $f0
	ld b, a
	ld a, [$ffa3]
	swap a
	ld [$ffa3], a
	and $f
	or b
	ld [$ffa2], a
	ld a, [$ffa3]
	and $f0
	ld b, a
	ld a, [$ffa4]
	swap a
	ld [$ffa4], a
	and $f
	or b
	ld [$ffa3], a
	ld a, [$ffa4]
	and $f0
	ld [$ffa4], a
	jr .asm_f72a
.asm_f75b
	push de
	push de
	call Func_f800
	pop de
	ld a, b
	swap a
	and $f0
	ld [$ffa5], a
	dec d
	jr z, .asm_f7bc
	push de
	call Func_f7d7
	call Func_f800
	pop de
	ld a, [$ffa5]
	or b
	ld [$ffa5], a
	dec d
	jr z, .asm_f7bc
	push de
	call Func_f7d7
	call Func_f800
	pop de
	ld a, b
	swap a
	and $f0
	ld [$ffa6], a
	dec d
	jr z, .asm_f7bc
	push de
	call Func_f7d7
	call Func_f800
	pop de
	ld a, [$ffa6]
	or b
	ld [$ffa6], a
	dec d
	jr z, .asm_f7bc
	push de
	call Func_f7d7
	call Func_f800
	pop de
	ld a, b
	swap a
	and $f0
	ld [$ffa7], a
	dec d
	jr z, .asm_f7bc
	push de
	call Func_f7d7
	call Func_f800
	pop de
	ld a, [$ffa7]
	or b
	ld [$ffa7], a
.asm_f7bc
	ld a, [$ffa5]
	ld [$ffa2], a
	ld a, [$ffa6]
	ld [$ffa3], a
	ld a, [$ffa7]
	ld [$ffa4], a
	pop de
	ld a, $6
	sub d
	and a
	ret z
.asm_f7ce
	push af
	call Func_f7d7
	pop af
	dec a
	jr nz, .asm_f7ce
	ret

Func_f7d7: ; f7d7 (3:77d7)
	ld a, [$ffa4]
	swap a
	and $f
	ld b, a
	ld a, [$ffa3]
	swap a
	ld [$ffa3], a
	and $f0
	or b
	ld [$ffa4], a
	ld a, [$ffa3]
	and $f
	ld b, a
	ld a, [$ffa2]
	swap a
	ld [$ffa2], a
	and $f0
	or b
	ld [$ffa3], a
	ld a, [$ffa2]
	and $f
	ld [$ffa2], a
	ret

Func_f800: ; f800 (3:7800)
	ld bc, $3
.asm_f803
	ld de, $ff9f
	ld hl, $ffa2
	push bc
	call StringCmp
	pop bc
	ret c
	inc b
	ld de, $ffa1
	ld hl, $ffa4
	push bc
	call Func_f839
	pop bc
	jr .asm_f803

Func_f81d: ; f81d (3:781d)
	call GetPredefRegisters
	and a
	ld b, c
.asm_f822
	ld a, [de]
	adc [hl]
	daa
	ld [de], a
	dec de
	dec hl
	dec c
	jr nz, .asm_f822
	jr nc, .asm_f835
	ld a, $99
	inc de
.asm_f830
	ld [de], a
	inc de
	dec b
	jr nz, .asm_f830
.asm_f835
	ret

Func_f836: ; f836 (3:7836)
	call GetPredefRegisters

Func_f839: ; f839 (3:7839)
	and a
	ld b, c
.asm_f83b
	ld a, [de]
	sbc [hl]
	daa
	ld [de], a
	dec de
	dec hl
	dec c
	jr nz, .asm_f83b
	jr nc, .asm_f84f
	ld a, $0
	inc de
.asm_f849
	ld [de], a
	inc de
	dec b
	jr nz, .asm_f849
	scf
.asm_f84f
	ret

InitializePlayerData: ; f850 (3:7850)
	call Random
	ld a, [hRandomSub]
	ld [wPlayerID], a          ; set player trainer id
	call Random
	ld a, [hRandomAdd]
	ld [wPlayerID + 1], a
	ld a, $ff
	ld [$d71b], a                 ; XXX what's this?
	ld hl, W_NUMINPARTY ; $d163
	call InitializeEmptyList      ; no party mons
	ld hl, W_NUMINBOX ; $da80
	call InitializeEmptyList      ; no boxed mons
	ld hl, wNumBagItems ; $d31d
	call InitializeEmptyList      ; no items
	ld hl, wNumBoxItems ; $d53a
	call InitializeEmptyList      ; no boxed items
	ld hl, wPlayerMoney + 1 ; $d348
	ld a, $30
	ld [hld], a                   ; set money to 00 30 00 (3000)
	xor a
	ld [hli], a
	inc hl
	ld [hl], a
	ld [$cc49], a                 ; XXX what's this?
	ld hl, W_OBTAINEDBADGES
	ld [hli], a                   ; no badges obtained
	ld [hl], a                    ; XXX what's this?
	ld hl, wPlayerCoins ; $d5a4
	ld [hli], a                   ; no coins
	ld [hl], a
	ld hl, W_GAMEPROGRESSFLAGS ; $d5f0
	ld bc, $c8
	call FillMemory               ; clear all game progress flags
	jp InitializeMissableObjectsFlags

; writes two bytes $00 $ff to hl
InitializeEmptyList: ; f8a0 (3:78a0)
	xor a
	ld [hli], a
	dec a
	ld [hl], a
	ret

IsItemInBag_: ; f8a5 (3:78a5)
	call GetPredefRegisters
	ld hl, wNumBagItems ; $d31d
.asm_f8ab
	inc hl
	ld a, [hli]
	cp $ff
	jr z, .asm_f8b7
	cp b
	jr nz, .asm_f8ab
	ld a, [hl]
	ld b, a
	ret
.asm_f8b7
	ld b, $0
	ret

Func_f8ba: ; f8ba (3:78ba)
	xor a
	ld hl, $ff97
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, $cc97
	ld de, $0

Func_f8c8: ; f8c8 (3:78c8)
	ld a, [H_REMAINDER] ; $ff99 (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	ld b, a
	ld a, [H_DIVIDEND] ; $ff95 (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	call CalcDifference
	ld d, a
	and a
	jr nz, .asm_f8da
	ld a, [$ff98]
	set 0, a
	ld [$ff98], a
.asm_f8da
	ld a, [$ff9a]
	ld b, a
	ld a, [H_NUMTOPRINT] ; $ff96 (aliases: H_MULTIPLICAND)
	call CalcDifference
	ld e, a
	and a
	jr nz, .asm_f8ec
	ld a, [$ff98]
	set 1, a
	ld [$ff98], a
.asm_f8ec
	ld a, [$ff98]
	cp $3
	jr z, .asm_f926
	ld a, e
	cp d
	jr c, .asm_f90a
	ld a, [$ff9d]
	bit 1, a
	jr nz, .asm_f900
	ld d, $c0
	jr .asm_f902
.asm_f900
	ld d, $80
.asm_f902
	ld a, [$ff9a]
	add $1
	ld [$ff9a], a
	jr .asm_f91c
.asm_f90a
	ld a, [$ff9d]
	bit 0, a
	jr nz, .asm_f914
	ld d, $0
	jr .asm_f916
.asm_f914
	ld d, $40
.asm_f916
	ld a, [H_REMAINDER] ; $ff99 (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
	add $1
	ld [H_REMAINDER], a ; $ff99 (aliases: H_DIVISOR, H_MULTIPLIER, H_POWEROFTEN)
.asm_f91c
	ld a, d
	ld [hli], a
	ld a, [$ff97]
	inc a
	ld [$ff97], a
	jp Func_f8c8
.asm_f926
	ld [hl], $ff
	ret

Func_f929: ; f929 (3:7929)
	xor a
	ld [$ff9d], a
	ld a, [$c104]
	ld d, a
	ld a, [$c106]
	ld e, a
	ld hl, wSpriteStateData1
	ld a, [H_DIVIDEND] ; $ff95 (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	add l
	add $4
	ld l, a
	jr nc, .asm_f940
	inc h
.asm_f940
	ld a, d
	ld b, a
	ld a, [hli]
	call CalcDifference
	jr nc, .asm_f953
	push hl
	ld hl, $ff9d
	bit 0, [hl]
	set 0, [hl]
	pop hl
	jr .asm_f95c
.asm_f953
	push hl
	ld hl, $ff9d
	bit 0, [hl]
	res 0, [hl]
	pop hl
.asm_f95c
	push hl
	ld hl, $ffe5
	ld [hli], a
	ld a, $10
	ld [hli], a
	call Func_366b
	ld a, [hl]
	ld [H_DIVIDEND], a ; $ff95 (aliases: H_PRODUCT, H_PASTLEADINGZEROES, H_QUOTIENT)
	pop hl
	inc hl
	ld b, e
	ld a, [hl]
	call CalcDifference
	jr nc, .asm_f97e
	push hl
	ld hl, $ff9d
	bit 1, [hl]
	set 1, [hl]
	pop hl
	jr .asm_f987
.asm_f97e
	push hl
	ld hl, $ff9d
	bit 1, [hl]
	res 1, [hl]
	pop hl
.asm_f987
	ld [$ffe5], a
	ld a, $10
	ld [$ffe6], a
	call Func_366b
	ld a, [$ffe7]
	ld [H_NUMTOPRINT], a ; $ff96 (aliases: H_MULTIPLICAND)
	ld a, [$ff9b]
	and a
	ret z
	ld a, [$ff9d]
	cpl
	and $3
	ld [$ff9d], a
	ret

Func_f9a0: ; f9a0 (3:79a0)
	ld a, [$ff95]
	ld [$cd37], a
	dec a
	ld de, $ccd3
	ld hl, $cc97
	add l
	ld l, a
	jr nc, .asm_f9b1
	inc h
.asm_f9b1
	ld a, [hld]
	call Func_f9bf
	ld [de], a
	inc de
	ld a, [$ff95]
	dec a
	ld [$ff95], a
	jr nz, .asm_f9b1
	ret

Func_f9bf: ; f9bf (3:79bf)
	push hl
	ld b, a
	ld hl, DataTable_f9d2
.asm_f9c4
	ld a, [hli]
	cp $ff
	jr z, .asm_f9d0
	cp b
	jr z, .asm_f9cf
	inc hl
	jr .asm_f9c4
.asm_f9cf
	ld a, [hl]
.asm_f9d0
	pop hl
	ret

DataTable_f9d2: ; f9d2 (3:79d2)
	db $40, $40, $00, $80, $80, $20, $c0, $10, $ff

Func_f9db: ; f9db (3:79db)
	ret

INCLUDE "engine/hp_bar.asm"

INCLUDE "engine/hidden_object_functions3.asm"


SECTION "bank4",ROMX,BANK[$4]

OakAideSprite:         INCBIN "gfx/sprites/oak_aide.2bpp"
RockerSprite:          INCBIN "gfx/sprites/rocker.2bpp"
SwimmerSprite:         INCBIN "gfx/sprites/swimmer.2bpp"
WhitePlayerSprite:     INCBIN "gfx/sprites/white_player.2bpp"
GymHelperSprite:       INCBIN "gfx/sprites/gym_helper.2bpp"
OldPersonSprite:       INCBIN "gfx/sprites/old_person.2bpp"
MartGuySprite:         INCBIN "gfx/sprites/mart_guy.2bpp"
FisherSprite:          INCBIN "gfx/sprites/fisher.2bpp"
OldMediumWomanSprite:  INCBIN "gfx/sprites/old_medium_woman.2bpp"
NurseSprite:           INCBIN "gfx/sprites/nurse.2bpp"
CableClubWomanSprite:  INCBIN "gfx/sprites/cable_club_woman.2bpp"
MrMasterballSprite:    INCBIN "gfx/sprites/mr_masterball.2bpp"
LaprasGiverSprite:     INCBIN "gfx/sprites/lapras_giver.2bpp"
WardenSprite:          INCBIN "gfx/sprites/warden.2bpp"
SsCaptainSprite:       INCBIN "gfx/sprites/ss_captain.2bpp"
Fisher2Sprite:         INCBIN "gfx/sprites/fisher2.2bpp"
BlackbeltSprite:       INCBIN "gfx/sprites/blackbelt.2bpp"
GuardSprite:           INCBIN "gfx/sprites/guard.2bpp"
BallSprite:            INCBIN "gfx/sprites/ball.2bpp"
OmanyteSprite:         INCBIN "gfx/sprites/omanyte.2bpp"
BoulderSprite:         INCBIN "gfx/sprites/boulder.2bpp"
PaperSheetSprite:      INCBIN "gfx/sprites/paper_sheet.2bpp"
BookMapDexSprite:      INCBIN "gfx/sprites/book_map_dex.2bpp"
ClipboardSprite:       INCBIN "gfx/sprites/clipboard.2bpp"
SnorlaxSprite:         INCBIN "gfx/sprites/snorlax.2bpp"
OldAmberSprite:        INCBIN "gfx/sprites/old_amber.2bpp"
LyingOldManSprite:     INCBIN "gfx/sprites/lying_old_man.2bpp"

PokemonLogoGraphics:            INCBIN "gfx/pokemon_logo.w128.2bpp"
FontGraphics:                   INCBIN "gfx/font.w128.1bpp"
ABTiles:                        INCBIN "gfx/AB.2bpp"
HpBarAndStatusGraphics:         INCBIN "gfx/hp_bar_and_status.2bpp"
BattleHudTiles1:                INCBIN "gfx/battle_hud1.1bpp"
BattleHudTiles2:                INCBIN "gfx/battle_hud2.1bpp"
BattleHudTiles3:                INCBIN "gfx/battle_hud3.1bpp"
NintendoCopyrightLogoGraphics:  INCBIN "gfx/copyright.h8.2bpp"
GamefreakLogoGraphics:          INCBIN "gfx/gamefreak.h8.2bpp"
TextBoxGraphics:                INCBIN "gfx/text_box.2bpp"
PokedexTileGraphics:            INCBIN "gfx/pokedex.2bpp"
WorldMapTileGraphics:           INCBIN "gfx/town_map.2bpp"
PlayerCharacterTitleGraphics:   INCBIN "gfx/player_title.2bpp"

INCLUDE "engine/battle/4.asm"
INCLUDE "engine/menu/status_screen.asm"
INCLUDE "engine/menu/party_menu.asm"

RedPicFront: INCBIN "pic/trainer/red.pic"
ShrinkPic1:  INCBIN "pic/trainer/shrink1.pic"
ShrinkPic2:  INCBIN "pic/trainer/shrink2.pic"

INCLUDE "engine/turn_sprite.asm"

INCLUDE "engine/menu/start_sub_menus.asm"

INCLUDE "engine/items/tms.asm"

INCLUDE "engine/battle/4_2.asm"

INCLUDE "engine/random.asm"


SECTION "bank5",ROMX,BANK[$5]

RedCyclingSprite:     INCBIN "gfx/sprites/cycling.2bpp"
RedSprite:            INCBIN "gfx/sprites/red.2bpp"
BlueSprite:           INCBIN "gfx/sprites/blue.2bpp"
OakSprite:            INCBIN "gfx/sprites/oak.2bpp"
BugCatcherSprite:     INCBIN "gfx/sprites/bug_catcher.2bpp"
SlowbroSprite:        INCBIN "gfx/sprites/slowbro.2bpp"
LassSprite:           INCBIN "gfx/sprites/lass.2bpp"
BlackHairBoy1Sprite:  INCBIN "gfx/sprites/black_hair_boy_1.2bpp"
LittleGirlSprite:     INCBIN "gfx/sprites/little_girl.2bpp"
BirdSprite:           INCBIN "gfx/sprites/bird.2bpp"
FatBaldGuySprite:     INCBIN "gfx/sprites/fat_bald_guy.2bpp"
GamblerSprite:        INCBIN "gfx/sprites/gambler.2bpp"
BlackHairBoy2Sprite:  INCBIN "gfx/sprites/black_hair_boy_2.2bpp"
GirlSprite:           INCBIN "gfx/sprites/girl.2bpp"
HikerSprite:          INCBIN "gfx/sprites/hiker.2bpp"
FoulardWomanSprite:   INCBIN "gfx/sprites/foulard_woman.2bpp"
GentlemanSprite:      INCBIN "gfx/sprites/gentleman.2bpp"
DaisySprite:          INCBIN "gfx/sprites/daisy.2bpp"
BikerSprite:          INCBIN "gfx/sprites/biker.2bpp"
SailorSprite:         INCBIN "gfx/sprites/sailor.2bpp"
CookSprite:           INCBIN "gfx/sprites/cook.2bpp"
BikeShopGuySprite:    INCBIN "gfx/sprites/bike_shop_guy.2bpp"
MrFujiSprite:         INCBIN "gfx/sprites/mr_fuji.2bpp"
GiovanniSprite:       INCBIN "gfx/sprites/giovanni.2bpp"
RocketSprite:         INCBIN "gfx/sprites/rocket.2bpp"
MediumSprite:         INCBIN "gfx/sprites/medium.2bpp"
WaiterSprite:         INCBIN "gfx/sprites/waiter.2bpp"
ErikaSprite:          INCBIN "gfx/sprites/erika.2bpp"
MomGeishaSprite:      INCBIN "gfx/sprites/mom_geisha.2bpp"
BrunetteGirlSprite:   INCBIN "gfx/sprites/brunette_girl.2bpp"
LanceSprite:          INCBIN "gfx/sprites/lance.2bpp"
MomSprite:            INCBIN "gfx/sprites/mom.2bpp"
BaldingGuySprite:     INCBIN "gfx/sprites/balding_guy.2bpp"
YoungBoySprite:       INCBIN "gfx/sprites/young_boy.2bpp"
GameboyKidSprite:     INCBIN "gfx/sprites/gameboy_kid.2bpp"
ClefairySprite:       INCBIN "gfx/sprites/clefairy.2bpp"
AgathaSprite:         INCBIN "gfx/sprites/agatha.2bpp"
BrunoSprite:          INCBIN "gfx/sprites/bruno.2bpp"
LoreleiSprite:        INCBIN "gfx/sprites/lorelei.2bpp"
SeelSprite:           INCBIN "gfx/sprites/seel.2bpp"

INCLUDE "engine/load_pokedex_tiles.asm"

INCLUDE "engine/overworld/map_sprites.asm"
INCLUDE "engine/overworld/emotion_bubbles.asm"

INCLUDE "engine/evolve_trade.asm"

INCLUDE "engine/battle/5.asm"

INCLUDE "engine/menu/pc.asm"


SECTION "bank6",ROMX,BANK[$6]

INCLUDE "data/mapHeaders/celadoncity.asm"
INCLUDE "data/mapObjects/celadoncity.asm"
CeladonCityBlocks: INCBIN "maps/celadoncity.blk"

INCLUDE "data/mapHeaders/pallettown.asm"
INCLUDE "data/mapObjects/pallettown.asm"
PalletTownBlocks: INCBIN "maps/pallettown.blk"

INCLUDE "data/mapHeaders/viridiancity.asm"
INCLUDE "data/mapObjects/viridiancity.asm"
ViridianCityBlocks: INCBIN "maps/viridiancity.blk"

INCLUDE "data/mapHeaders/pewtercity.asm"
INCLUDE "data/mapObjects/pewtercity.asm"
PewterCityBlocks: INCBIN "maps/pewtercity.blk"

INCLUDE "data/mapHeaders/ceruleancity.asm"
INCLUDE "data/mapObjects/ceruleancity.asm"
CeruleanCityBlocks: INCBIN "maps/ceruleancity.blk"

INCLUDE "data/mapHeaders/vermilioncity.asm"
INCLUDE "data/mapObjects/vermilioncity.asm"
VermilionCityBlocks: INCBIN "maps/vermilioncity.blk"

INCLUDE "data/mapHeaders/fuchsiacity.asm"
INCLUDE "data/mapObjects/fuchsiacity.asm"
FuchsiaCityBlocks: INCBIN "maps/fuchsiacity.blk"

INCLUDE "engine/play_time.asm"

INCLUDE "scripts/pallettown.asm"
INCLUDE "scripts/viridiancity.asm"
INCLUDE "scripts/pewtercity.asm"
INCLUDE "scripts/ceruleancity.asm"
INCLUDE "scripts/vermilioncity.asm"
INCLUDE "scripts/celadoncity.asm"
INCLUDE "scripts/fuchsiacity.asm"

INCLUDE "data/mapHeaders/blueshouse.asm"
INCLUDE "scripts/blueshouse.asm"
INCLUDE "data/mapObjects/blueshouse.asm"
BluesHouseBlocks: INCBIN "maps/blueshouse.blk"

INCLUDE "data/mapHeaders/vermilionhouse3.asm"
INCLUDE "scripts/vermilionhouse3.asm"
INCLUDE "data/mapObjects/vermilionhouse3.asm"
VermilionHouse3Blocks: INCBIN "maps/vermilionhouse3.blk"

INCLUDE "data/mapHeaders/indigoplateaulobby.asm"
INCLUDE "scripts/indigoplateaulobby.asm"
INCLUDE "data/mapObjects/indigoplateaulobby.asm"
IndigoPlateauLobbyBlocks: INCBIN "maps/indigoplateaulobby.blk"

INCLUDE "data/mapHeaders/silphco4.asm"
INCLUDE "scripts/silphco4.asm"
INCLUDE "data/mapObjects/silphco4.asm"
SilphCo4Blocks: INCBIN "maps/silphco4.blk"

INCLUDE "data/mapHeaders/silphco5.asm"
INCLUDE "scripts/silphco5.asm"
INCLUDE "data/mapObjects/silphco5.asm"
SilphCo5Blocks: INCBIN "maps/silphco5.blk"

INCLUDE "data/mapHeaders/silphco6.asm"
INCLUDE "scripts/silphco6.asm"
INCLUDE "data/mapObjects/silphco6.asm"
SilphCo6Blocks: INCBIN "maps/silphco6.blk"

INCLUDE "engine/overworld/npc_movement.asm"
INCLUDE "engine/overworld/doors.asm"
INCLUDE "engine/overworld/ledges.asm"


SECTION "bank7",ROMX,BANK[$7]

INCLUDE "data/mapHeaders/cinnabarisland.asm"
INCLUDE "data/mapObjects/cinnabarisland.asm"
CinnabarIslandBlocks: INCBIN "maps/cinnabarisland.blk"

INCLUDE "data/mapHeaders/route1.asm"
INCLUDE "data/mapObjects/route1.asm"
Route1Blocks: INCBIN "maps/route1.blk"

UndergroundPathEntranceRoute8Blocks: INCBIN "maps/undergroundpathentranceroute8.blk"

OaksLabBlocks: INCBIN "maps/oakslab.blk"

Route16HouseBlocks:
Route2HouseBlocks:
SaffronHouse1Blocks:
SaffronHouse2Blocks:
VermilionHouse1Blocks:
NameRaterBlocks:
LavenderHouse1Blocks:
LavenderHouse2Blocks:
CeruleanHouse1Blocks:
PewterHouse1Blocks:
PewterHouse2Blocks:
ViridianHouseBlocks: INCBIN "maps/viridianhouse.blk"

CeladonMansion5Blocks:
SchoolBlocks: INCBIN "maps/school.blk"

CeruleanHouseTrashedBlocks: INCBIN "maps/ceruleanhousetrashed.blk"

DiglettsCaveEntranceRoute11Blocks:
DiglettsCaveRoute2Blocks: INCBIN "maps/diglettscaveroute2.blk"

INCLUDE "text/monster_names.asm"

INCLUDE "engine/clear_save.asm"

INCLUDE "engine/predefs7.asm"

INCLUDE "scripts/cinnabarisland.asm"

INCLUDE "scripts/route1.asm"

INCLUDE "data/mapHeaders/oakslab.asm"
INCLUDE "scripts/oakslab.asm"
INCLUDE "data/mapObjects/oakslab.asm"

INCLUDE "data/mapHeaders/viridianmart.asm"
INCLUDE "scripts/viridianmart.asm"
INCLUDE "data/mapObjects/viridianmart.asm"
ViridianMartBlocks: INCBIN "maps/viridianmart.blk"

INCLUDE "data/mapHeaders/school.asm"
INCLUDE "scripts/school.asm"
INCLUDE "data/mapObjects/school.asm"

INCLUDE "data/mapHeaders/viridianhouse.asm"
INCLUDE "scripts/viridianhouse.asm"
INCLUDE "data/mapObjects/viridianhouse.asm"

INCLUDE "data/mapHeaders/pewterhouse1.asm"
INCLUDE "scripts/pewterhouse1.asm"
INCLUDE "data/mapObjects/pewterhouse1.asm"

INCLUDE "data/mapHeaders/pewterhouse2.asm"
INCLUDE "scripts/pewterhouse2.asm"
INCLUDE "data/mapObjects/pewterhouse2.asm"

INCLUDE "data/mapHeaders/ceruleanhousetrashed.asm"
INCLUDE "scripts/ceruleanhousetrashed.asm"
INCLUDE "data/mapObjects/ceruleanhousetrashed.asm"

INCLUDE "data/mapHeaders/ceruleanhouse1.asm"
INCLUDE "scripts/ceruleanhouse1.asm"
INCLUDE "data/mapObjects/ceruleanhouse1.asm"

INCLUDE "data/mapHeaders/bikeshop.asm"
INCLUDE "scripts/bikeshop.asm"
INCLUDE "data/mapObjects/bikeshop.asm"
BikeShopBlocks: INCBIN "maps/bikeshop.blk"

INCLUDE "data/mapHeaders/lavenderhouse1.asm"
INCLUDE "scripts/lavenderhouse1.asm"
INCLUDE "data/mapObjects/lavenderhouse1.asm"

INCLUDE "data/mapHeaders/lavenderhouse2.asm"
INCLUDE "scripts/lavenderhouse2.asm"
INCLUDE "data/mapObjects/lavenderhouse2.asm"

INCLUDE "data/mapHeaders/namerater.asm"
INCLUDE "scripts/namerater.asm"
INCLUDE "data/mapObjects/namerater.asm"

INCLUDE "data/mapHeaders/vermilionhouse1.asm"
INCLUDE "scripts/vermilionhouse1.asm"
INCLUDE "data/mapObjects/vermilionhouse1.asm"

INCLUDE "data/mapHeaders/vermiliondock.asm"
INCLUDE "scripts/vermiliondock.asm"
INCLUDE "data/mapObjects/vermiliondock.asm"
VermilionDockBlocks: INCBIN "maps/vermiliondock.blk"

INCLUDE "data/mapHeaders/celadonmansion5.asm"
INCLUDE "scripts/celadonmansion5.asm"
INCLUDE "data/mapObjects/celadonmansion5.asm"

INCLUDE "data/mapHeaders/fuchsiamart.asm"
INCLUDE "scripts/fuchsiamart.asm"
INCLUDE "data/mapObjects/fuchsiamart.asm"
FuchsiaMartBlocks: INCBIN "maps/fuchsiamart.blk"

INCLUDE "data/mapHeaders/saffronhouse1.asm"
INCLUDE "scripts/saffronhouse1.asm"
INCLUDE "data/mapObjects/saffronhouse1.asm"

INCLUDE "data/mapHeaders/saffronhouse2.asm"
INCLUDE "scripts/saffronhouse2.asm"
INCLUDE "data/mapObjects/saffronhouse2.asm"

INCLUDE "data/mapHeaders/diglettscaveroute2.asm"
INCLUDE "scripts/diglettscaveroute2.asm"
INCLUDE "data/mapObjects/diglettscaveroute2.asm"

INCLUDE "data/mapHeaders/route2house.asm"
INCLUDE "scripts/route2house.asm"
INCLUDE "data/mapObjects/route2house.asm"

INCLUDE "data/mapHeaders/route5gate.asm"
INCLUDE "scripts/route5gate.asm"
INCLUDE "data/mapObjects/route5gate.asm"
Route5GateBlocks: INCBIN "maps/route5gate.blk"

INCLUDE "data/mapHeaders/route6gate.asm"
INCLUDE "scripts/route6gate.asm"
INCLUDE "data/mapObjects/route6gate.asm"
Route6GateBlocks: INCBIN "maps/route6gate.blk"

INCLUDE "data/mapHeaders/route7gate.asm"
INCLUDE "scripts/route7gate.asm"
INCLUDE "data/mapObjects/route7gate.asm"
Route7GateBlocks: INCBIN "maps/route7gate.blk"

INCLUDE "data/mapHeaders/route8gate.asm"
INCLUDE "scripts/route8gate.asm"
INCLUDE "data/mapObjects/route8gate.asm"
Route8GateBlocks: INCBIN "maps/route8gate.blk"

INCLUDE "data/mapHeaders/undergroundpathentranceroute8.asm"
INCLUDE "scripts/undergroundpathentranceroute8.asm"
INCLUDE "data/mapObjects/undergroundpathentranceroute8.asm"

INCLUDE "data/mapHeaders/powerplant.asm"
INCLUDE "scripts/powerplant.asm"
INCLUDE "data/mapObjects/powerplant.asm"
PowerPlantBlocks: INCBIN "maps/powerplant.blk"

INCLUDE "data/mapHeaders/diglettscaveroute11.asm"
INCLUDE "scripts/diglettscaveroute11.asm"
INCLUDE "data/mapObjects/diglettscaveroute11.asm"

INCLUDE "data/mapHeaders/route16house.asm"
INCLUDE "scripts/route16house.asm"
INCLUDE "data/mapObjects/route16house.asm"

INCLUDE "data/mapHeaders/route22gate.asm"
INCLUDE "scripts/route22gate.asm"
INCLUDE "data/mapObjects/route22gate.asm"
Route22GateBlocks: INCBIN "maps/route22gate.blk"

INCLUDE "data/mapHeaders/billshouse.asm"
INCLUDE "scripts/billshouse.asm"
INCLUDE "data/mapObjects/billshouse.asm"
BillsHouseBlocks: INCBIN "maps/billshouse.blk"

INCLUDE "engine/menu/oaks_pc.asm"

INCLUDE "engine/hidden_object_functions7.asm"


SECTION "bank9",ROMX,BANK[$9]

RhydonPicFront:      INCBIN "pic/bmon/rhydon.pic"
RhydonPicBack:       INCBIN "pic/monback/rhydonb.pic"
KangaskhanPicFront:  INCBIN "pic/bmon/kangaskhan.pic"
KangaskhanPicBack:   INCBIN "pic/monback/kangaskhanb.pic"
NidoranMPicFront:    INCBIN "pic/bmon/nidoranm.pic"
NidoranMPicBack:     INCBIN "pic/monback/nidoranmb.pic"
ClefairyPicFront:    INCBIN "pic/bmon/clefairy.pic"
ClefairyPicBack:     INCBIN "pic/monback/clefairyb.pic"
SpearowPicFront:     INCBIN "pic/bmon/spearow.pic"
SpearowPicBack:      INCBIN "pic/monback/spearowb.pic"
VoltorbPicFront:     INCBIN "pic/bmon/voltorb.pic"
VoltorbPicBack:      INCBIN "pic/monback/voltorbb.pic"
NidokingPicFront:    INCBIN "pic/bmon/nidoking.pic"
NidokingPicBack:     INCBIN "pic/monback/nidokingb.pic"
SlowbroPicFront:     INCBIN "pic/bmon/slowbro.pic"
SlowbroPicBack:      INCBIN "pic/monback/slowbrob.pic"
IvysaurPicFront:     INCBIN "pic/bmon/ivysaur.pic"
IvysaurPicBack:      INCBIN "pic/monback/ivysaurb.pic"
ExeggutorPicFront:   INCBIN "pic/bmon/exeggutor.pic"
ExeggutorPicBack:    INCBIN "pic/monback/exeggutorb.pic"
LickitungPicFront:   INCBIN "pic/bmon/lickitung.pic"
LickitungPicBack:    INCBIN "pic/monback/lickitungb.pic"
ExeggcutePicFront:   INCBIN "pic/bmon/exeggcute.pic"
ExeggcutePicBack:    INCBIN "pic/monback/exeggcuteb.pic"
GrimerPicFront:      INCBIN "pic/bmon/grimer.pic"
GrimerPicBack:       INCBIN "pic/monback/grimerb.pic"
GengarPicFront:      INCBIN "pic/bmon/gengar.pic"
GengarPicBack:       INCBIN "pic/monback/gengarb.pic"
NidoranFPicFront:    INCBIN "pic/bmon/nidoranf.pic"
NidoranFPicBack:     INCBIN "pic/monback/nidoranfb.pic"
NidoqueenPicFront:   INCBIN "pic/bmon/nidoqueen.pic"
NidoqueenPicBack:    INCBIN "pic/monback/nidoqueenb.pic"
CubonePicFront:      INCBIN "pic/bmon/cubone.pic"
CubonePicBack:       INCBIN "pic/monback/cuboneb.pic"
RhyhornPicFront:     INCBIN "pic/bmon/rhyhorn.pic"
RhyhornPicBack:      INCBIN "pic/monback/rhyhornb.pic"
LaprasPicFront:      INCBIN "pic/bmon/lapras.pic"
LaprasPicBack:       INCBIN "pic/monback/laprasb.pic"
ArcaninePicFront:    INCBIN "pic/bmon/arcanine.pic"
ArcaninePicBack:     INCBIN "pic/monback/arcanineb.pic"
GyaradosPicFront:    INCBIN "pic/bmon/gyarados.pic"
GyaradosPicBack:     INCBIN "pic/monback/gyaradosb.pic"
ShellderPicFront:    INCBIN "pic/bmon/shellder.pic"
ShellderPicBack:     INCBIN "pic/monback/shellderb.pic"
TentacoolPicFront:   INCBIN "pic/bmon/tentacool.pic"
TentacoolPicBack:    INCBIN "pic/monback/tentacoolb.pic"
GastlyPicFront:      INCBIN "pic/bmon/gastly.pic"
GastlyPicBack:       INCBIN "pic/monback/gastlyb.pic"
ScytherPicFront:     INCBIN "pic/bmon/scyther.pic"
ScytherPicBack:      INCBIN "pic/monback/scytherb.pic"
StaryuPicFront:      INCBIN "pic/bmon/staryu.pic"
StaryuPicBack:       INCBIN "pic/monback/staryub.pic"
BlastoisePicFront:   INCBIN "pic/bmon/blastoise.pic"
BlastoisePicBack:    INCBIN "pic/monback/blastoiseb.pic"
PinsirPicFront:      INCBIN "pic/bmon/pinsir.pic"
PinsirPicBack:       INCBIN "pic/monback/pinsirb.pic"
TangelaPicFront:     INCBIN "pic/bmon/tangela.pic"
TangelaPicBack:      INCBIN "pic/monback/tangelab.pic"

INCLUDE "engine/battle/9.asm"


SECTION "bankA",ROMX,BANK[$A]

GrowlithePicFront:   INCBIN "pic/bmon/growlithe.pic"
GrowlithePicBack:    INCBIN "pic/monback/growlitheb.pic"
OnixPicFront:        INCBIN "pic/bmon/onix.pic"
OnixPicBack:         INCBIN "pic/monback/onixb.pic"
FearowPicFront:      INCBIN "pic/bmon/fearow.pic"
FearowPicBack:       INCBIN "pic/monback/fearowb.pic"
PidgeyPicFront:      INCBIN "pic/bmon/pidgey.pic"
PidgeyPicBack:       INCBIN "pic/monback/pidgeyb.pic"
SlowpokePicFront:    INCBIN "pic/bmon/slowpoke.pic"
SlowpokePicBack:     INCBIN "pic/monback/slowpokeb.pic"
KadabraPicFront:     INCBIN "pic/bmon/kadabra.pic"
KadabraPicBack:      INCBIN "pic/monback/kadabrab.pic"
GravelerPicFront:    INCBIN "pic/bmon/graveler.pic"
GravelerPicBack:     INCBIN "pic/monback/gravelerb.pic"
ChanseyPicFront:     INCBIN "pic/bmon/chansey.pic"
ChanseyPicBack:      INCBIN "pic/monback/chanseyb.pic"
MachokePicFront:     INCBIN "pic/bmon/machoke.pic"
MachokePicBack:      INCBIN "pic/monback/machokeb.pic"
MrMimePicFront:      INCBIN "pic/bmon/mr.mime.pic"
MrMimePicBack:       INCBIN "pic/monback/mr.mimeb.pic"
HitmonleePicFront:   INCBIN "pic/bmon/hitmonlee.pic"
HitmonleePicBack:    INCBIN "pic/monback/hitmonleeb.pic"
HitmonchanPicFront:  INCBIN "pic/bmon/hitmonchan.pic"
HitmonchanPicBack:   INCBIN "pic/monback/hitmonchanb.pic"
ArbokPicFront:       INCBIN "pic/bmon/arbok.pic"
ArbokPicBack:        INCBIN "pic/monback/arbokb.pic"
ParasectPicFront:    INCBIN "pic/bmon/parasect.pic"
ParasectPicBack:     INCBIN "pic/monback/parasectb.pic"
PsyduckPicFront:     INCBIN "pic/bmon/psyduck.pic"
PsyduckPicBack:      INCBIN "pic/monback/psyduckb.pic"
DrowzeePicFront:     INCBIN "pic/bmon/drowzee.pic"
DrowzeePicBack:      INCBIN "pic/monback/drowzeeb.pic"
GolemPicFront:       INCBIN "pic/bmon/golem.pic"
GolemPicBack:        INCBIN "pic/monback/golemb.pic"
MagmarPicFront:      INCBIN "pic/bmon/magmar.pic"
MagmarPicBack:       INCBIN "pic/monback/magmarb.pic"
ElectabuzzPicFront:  INCBIN "pic/bmon/electabuzz.pic"
ElectabuzzPicBack:   INCBIN "pic/monback/electabuzzb.pic"
MagnetonPicFront:    INCBIN "pic/bmon/magneton.pic"
MagnetonPicBack:     INCBIN "pic/monback/magnetonb.pic"
KoffingPicFront:     INCBIN "pic/bmon/koffing.pic"
KoffingPicBack:      INCBIN "pic/monback/koffingb.pic"
MankeyPicFront:      INCBIN "pic/bmon/mankey.pic"
MankeyPicBack:       INCBIN "pic/monback/mankeyb.pic"
SeelPicFront:        INCBIN "pic/bmon/seel.pic"
SeelPicBack:         INCBIN "pic/monback/seelb.pic"
DiglettPicFront:     INCBIN "pic/bmon/diglett.pic"
DiglettPicBack:      INCBIN "pic/monback/diglettb.pic"
TaurosPicFront:      INCBIN "pic/bmon/tauros.pic"
TaurosPicBack:       INCBIN "pic/monback/taurosb.pic"
FarfetchdPicFront:   INCBIN "pic/bmon/farfetchd.pic"
FarfetchdPicBack:    INCBIN "pic/monback/farfetchdb.pic"
VenonatPicFront:     INCBIN "pic/bmon/venonat.pic"
VenonatPicBack:      INCBIN "pic/monback/venonatb.pic"
DragonitePicFront:   INCBIN "pic/bmon/dragonite.pic"
DragonitePicBack:    INCBIN "pic/monback/dragoniteb.pic"
DoduoPicFront:       INCBIN "pic/bmon/doduo.pic"
DoduoPicBack:        INCBIN "pic/monback/doduob.pic"
PoliwagPicFront:     INCBIN "pic/bmon/poliwag.pic"
PoliwagPicBack:      INCBIN "pic/monback/poliwagb.pic"
JynxPicFront:        INCBIN "pic/bmon/jynx.pic"
JynxPicBack:         INCBIN "pic/monback/jynxb.pic"
MoltresPicFront:     INCBIN "pic/bmon/moltres.pic"
MoltresPicBack:      INCBIN "pic/monback/moltresb.pic"

INCLUDE "engine/battle/a.asm"


SECTION "bankB",ROMX,BANK[$B]

ArticunoPicFront:    INCBIN "pic/bmon/articuno.pic"
ArticunoPicBack:     INCBIN "pic/monback/articunob.pic"
ZapdosPicFront:      INCBIN "pic/bmon/zapdos.pic"
ZapdosPicBack:       INCBIN "pic/monback/zapdosb.pic"
DittoPicFront:       INCBIN "pic/bmon/ditto.pic"
DittoPicBack:        INCBIN "pic/monback/dittob.pic"
MeowthPicFront:      INCBIN "pic/bmon/meowth.pic"
MeowthPicBack:       INCBIN "pic/monback/meowthb.pic"
KrabbyPicFront:      INCBIN "pic/bmon/krabby.pic"
KrabbyPicBack:       INCBIN "pic/monback/krabbyb.pic"
VulpixPicFront:      INCBIN "pic/bmon/vulpix.pic"
VulpixPicBack:       INCBIN "pic/monback/vulpixb.pic"
NinetalesPicFront:   INCBIN "pic/bmon/ninetales.pic"
NinetalesPicBack:    INCBIN "pic/monback/ninetalesb.pic"
PikachuPicFront:     INCBIN "pic/bmon/pikachu.pic"
PikachuPicBack:      INCBIN "pic/monback/pikachub.pic"
RaichuPicFront:      INCBIN "pic/bmon/raichu.pic"
RaichuPicBack:       INCBIN "pic/monback/raichub.pic"
DratiniPicFront:     INCBIN "pic/bmon/dratini.pic"
DratiniPicBack:      INCBIN "pic/monback/dratinib.pic"
DragonairPicFront:   INCBIN "pic/bmon/dragonair.pic"
DragonairPicBack:    INCBIN "pic/monback/dragonairb.pic"
KabutoPicFront:      INCBIN "pic/bmon/kabuto.pic"
KabutoPicBack:       INCBIN "pic/monback/kabutob.pic"
KabutopsPicFront:    INCBIN "pic/bmon/kabutops.pic"
KabutopsPicBack:     INCBIN "pic/monback/kabutopsb.pic"
HorseaPicFront:      INCBIN "pic/bmon/horsea.pic"
HorseaPicBack:       INCBIN "pic/monback/horseab.pic"
SeadraPicFront:      INCBIN "pic/bmon/seadra.pic"
SeadraPicBack:       INCBIN "pic/monback/seadrab.pic"
SandshrewPicFront:   INCBIN "pic/bmon/sandshrew.pic"
SandshrewPicBack:    INCBIN "pic/monback/sandshrewb.pic"
SandslashPicFront:   INCBIN "pic/bmon/sandslash.pic"
SandslashPicBack:    INCBIN "pic/monback/sandslashb.pic"
OmanytePicFront:     INCBIN "pic/bmon/omanyte.pic"
OmanytePicBack:      INCBIN "pic/monback/omanyteb.pic"
OmastarPicFront:     INCBIN "pic/bmon/omastar.pic"
OmastarPicBack:      INCBIN "pic/monback/omastarb.pic"
JigglypuffPicFront:  INCBIN "pic/bmon/jigglypuff.pic"
JigglypuffPicBack:   INCBIN "pic/monback/jigglypuffb.pic"
WigglytuffPicFront:  INCBIN "pic/bmon/wigglytuff.pic"
WigglytuffPicBack:   INCBIN "pic/monback/wigglytuffb.pic"
EeveePicFront:       INCBIN "pic/bmon/eevee.pic"
EeveePicBack:        INCBIN "pic/monback/eeveeb.pic"
FlareonPicFront:     INCBIN "pic/bmon/flareon.pic"
FlareonPicBack:      INCBIN "pic/monback/flareonb.pic"
JolteonPicFront:     INCBIN "pic/bmon/jolteon.pic"
JolteonPicBack:      INCBIN "pic/monback/jolteonb.pic"
VaporeonPicFront:    INCBIN "pic/bmon/vaporeon.pic"
VaporeonPicBack:     INCBIN "pic/monback/vaporeonb.pic"
MachopPicFront:      INCBIN "pic/bmon/machop.pic"
MachopPicBack:       INCBIN "pic/monback/machopb.pic"
ZubatPicFront:       INCBIN "pic/bmon/zubat.pic"
ZubatPicBack:        INCBIN "pic/monback/zubatb.pic"
EkansPicFront:       INCBIN "pic/bmon/ekans.pic"
EkansPicBack:        INCBIN "pic/monback/ekansb.pic"
ParasPicFront:       INCBIN "pic/bmon/paras.pic"
ParasPicBack:        INCBIN "pic/monback/parasb.pic"
PoliwhirlPicFront:   INCBIN "pic/bmon/poliwhirl.pic"
PoliwhirlPicBack:    INCBIN "pic/monback/poliwhirlb.pic"
PoliwrathPicFront:   INCBIN "pic/bmon/poliwrath.pic"
PoliwrathPicBack:    INCBIN "pic/monback/poliwrathb.pic"
WeedlePicFront:      INCBIN "pic/bmon/weedle.pic"
WeedlePicBack:       INCBIN "pic/monback/weedleb.pic"
KakunaPicFront:      INCBIN "pic/bmon/kakuna.pic"
KakunaPicBack:       INCBIN "pic/monback/kakunab.pic"
BeedrillPicFront:    INCBIN "pic/bmon/beedrill.pic"
BeedrillPicBack:     INCBIN "pic/monback/beedrillb.pic"

FossilKabutopsPic:   INCBIN "pic/bmon/fossilkabutops.pic"

INCLUDE "engine/battle/b.asm"

TrainerInfoTextBoxTileGraphics:  INCBIN "gfx/trainer_info.2bpp"
BlankLeaderNames:                INCBIN "gfx/blank_leader_names.2bpp"
CircleTile:                      INCBIN "gfx/circle_tile.2bpp"
BadgeNumbersTileGraphics:        INCBIN "gfx/badge_numbers.2bpp"

INCLUDE "engine/items/tmhm.asm"
INCLUDE "engine/battle/b_2.asm"
INCLUDE "engine/game_corner_slots2.asm"


SECTION "bankC",ROMX,BANK[$C]

DodrioPicFront:       INCBIN "pic/bmon/dodrio.pic"
DodrioPicBack:        INCBIN "pic/monback/dodriob.pic"
PrimeapePicFront:     INCBIN "pic/bmon/primeape.pic"
PrimeapePicBack:      INCBIN "pic/monback/primeapeb.pic"
DugtrioPicFront:      INCBIN "pic/bmon/dugtrio.pic"
DugtrioPicBack:       INCBIN "pic/monback/dugtriob.pic"
VenomothPicFront:     INCBIN "pic/bmon/venomoth.pic"
VenomothPicBack:      INCBIN "pic/monback/venomothb.pic"
DewgongPicFront:      INCBIN "pic/bmon/dewgong.pic"
DewgongPicBack:       INCBIN "pic/monback/dewgongb.pic"
CaterpiePicFront:     INCBIN "pic/bmon/caterpie.pic"
CaterpiePicBack:      INCBIN "pic/monback/caterpieb.pic"
MetapodPicFront:      INCBIN "pic/bmon/metapod.pic"
MetapodPicBack:       INCBIN "pic/monback/metapodb.pic"
ButterfreePicFront:   INCBIN "pic/bmon/butterfree.pic"
ButterfreePicBack:    INCBIN "pic/monback/butterfreeb.pic"
MachampPicFront:      INCBIN "pic/bmon/machamp.pic"
MachampPicBack:       INCBIN "pic/monback/machampb.pic"
GolduckPicFront:      INCBIN "pic/bmon/golduck.pic"
GolduckPicBack:       INCBIN "pic/monback/golduckb.pic"
HypnoPicFront:        INCBIN "pic/bmon/hypno.pic"
HypnoPicBack:         INCBIN "pic/monback/hypnob.pic"
GolbatPicFront:       INCBIN "pic/bmon/golbat.pic"
GolbatPicBack:        INCBIN "pic/monback/golbatb.pic"
MewtwoPicFront:       INCBIN "pic/bmon/mewtwo.pic"
MewtwoPicBack:        INCBIN "pic/monback/mewtwob.pic"
SnorlaxPicFront:      INCBIN "pic/bmon/snorlax.pic"
SnorlaxPicBack:       INCBIN "pic/monback/snorlaxb.pic"
MagikarpPicFront:     INCBIN "pic/bmon/magikarp.pic"
MagikarpPicBack:      INCBIN "pic/monback/magikarpb.pic"
MukPicFront:          INCBIN "pic/bmon/muk.pic"
MukPicBack:           INCBIN "pic/monback/mukb.pic"
KinglerPicFront:      INCBIN "pic/bmon/kingler.pic"
KinglerPicBack:       INCBIN "pic/monback/kinglerb.pic"
CloysterPicFront:     INCBIN "pic/bmon/cloyster.pic"
CloysterPicBack:      INCBIN "pic/monback/cloysterb.pic"
ElectrodePicFront:    INCBIN "pic/bmon/electrode.pic"
ElectrodePicBack:     INCBIN "pic/monback/electrodeb.pic"
ClefablePicFront:     INCBIN "pic/bmon/clefable.pic"
ClefablePicBack:      INCBIN "pic/monback/clefableb.pic"
WeezingPicFront:      INCBIN "pic/bmon/weezing.pic"
WeezingPicBack:       INCBIN "pic/monback/weezingb.pic"
PersianPicFront:      INCBIN "pic/bmon/persian.pic"
PersianPicBack:       INCBIN "pic/monback/persianb.pic"
MarowakPicFront:      INCBIN "pic/bmon/marowak.pic"
MarowakPicBack:       INCBIN "pic/monback/marowakb.pic"
HaunterPicFront:      INCBIN "pic/bmon/haunter.pic"
HaunterPicBack:       INCBIN "pic/monback/haunterb.pic"
AbraPicFront:         INCBIN "pic/bmon/abra.pic"
AbraPicBack:          INCBIN "pic/monback/abrab.pic"
AlakazamPicFront:     INCBIN "pic/bmon/alakazam.pic"
AlakazamPicBack:      INCBIN "pic/monback/alakazamb.pic"
PidgeottoPicFront:    INCBIN "pic/bmon/pidgeotto.pic"
PidgeottoPicBack:     INCBIN "pic/monback/pidgeottob.pic"
PidgeotPicFront:      INCBIN "pic/bmon/pidgeot.pic"
PidgeotPicBack:       INCBIN "pic/monback/pidgeotb.pic"
StarmiePicFront:      INCBIN "pic/bmon/starmie.pic"
StarmiePicBack:       INCBIN "pic/monback/starmieb.pic"

RedPicBack:           INCBIN "pic/trainer/redb.pic"
OldManPic:            INCBIN "pic/trainer/oldman.pic"

INCLUDE "engine/battle/c.asm"


SECTION "bankD",ROMX,BANK[$D]

BulbasaurPicFront:    INCBIN "pic/bmon/bulbasaur.pic"
BulbasaurPicBack:     INCBIN "pic/monback/bulbasaurb.pic"
VenusaurPicFront:     INCBIN "pic/bmon/venusaur.pic"
VenusaurPicBack:      INCBIN "pic/monback/venusaurb.pic"
TentacruelPicFront:   INCBIN "pic/bmon/tentacruel.pic"
TentacruelPicBack:    INCBIN "pic/monback/tentacruelb.pic"
GoldeenPicFront:      INCBIN "pic/bmon/goldeen.pic"
GoldeenPicBack:       INCBIN "pic/monback/goldeenb.pic"
SeakingPicFront:      INCBIN "pic/bmon/seaking.pic"
SeakingPicBack:       INCBIN "pic/monback/seakingb.pic"
PonytaPicFront:       INCBIN "pic/bmon/ponyta.pic"
RapidashPicFront:     INCBIN "pic/bmon/rapidash.pic"
PonytaPicBack:        INCBIN "pic/monback/ponytab.pic"
RapidashPicBack:      INCBIN "pic/monback/rapidashb.pic"
RattataPicFront:      INCBIN "pic/bmon/rattata.pic"
RattataPicBack:       INCBIN "pic/monback/rattatab.pic"
RaticatePicFront:     INCBIN "pic/bmon/raticate.pic"
RaticatePicBack:      INCBIN "pic/monback/raticateb.pic"
NidorinoPicFront:     INCBIN "pic/bmon/nidorino.pic"
NidorinoPicBack:      INCBIN "pic/monback/nidorinob.pic"
NidorinaPicFront:     INCBIN "pic/bmon/nidorina.pic"
NidorinaPicBack:      INCBIN "pic/monback/nidorinab.pic"
GeodudePicFront:      INCBIN "pic/bmon/geodude.pic"
GeodudePicBack:       INCBIN "pic/monback/geodudeb.pic"
PorygonPicFront:      INCBIN "pic/bmon/porygon.pic"
PorygonPicBack:       INCBIN "pic/monback/porygonb.pic"
AerodactylPicFront:   INCBIN "pic/bmon/aerodactyl.pic"
AerodactylPicBack:    INCBIN "pic/monback/aerodactylb.pic"
MagnemitePicFront:    INCBIN "pic/bmon/magnemite.pic"
MagnemitePicBack:     INCBIN "pic/monback/magnemiteb.pic"
CharmanderPicFront:   INCBIN "pic/bmon/charmander.pic"
CharmanderPicBack:    INCBIN "pic/monback/charmanderb.pic"
SquirtlePicFront:     INCBIN "pic/bmon/squirtle.pic"
SquirtlePicBack:      INCBIN "pic/monback/squirtleb.pic"
CharmeleonPicFront:   INCBIN "pic/bmon/charmeleon.pic"
CharmeleonPicBack:    INCBIN "pic/monback/charmeleonb.pic"
WartortlePicFront:    INCBIN "pic/bmon/wartortle.pic"
WartortlePicBack:     INCBIN "pic/monback/wartortleb.pic"
CharizardPicFront:    INCBIN "pic/bmon/charizard.pic"
CharizardPicBack:     INCBIN "pic/monback/charizardb.pic"
FossilAerodactylPic:  INCBIN "pic/bmon/fossilaerodactyl.pic"
GhostPic:             INCBIN "pic/other/ghost.pic"
OddishPicFront:       INCBIN "pic/bmon/oddish.pic"
OddishPicBack:        INCBIN "pic/monback/oddishb.pic"
GloomPicFront:        INCBIN "pic/bmon/gloom.pic"
GloomPicBack:         INCBIN "pic/monback/gloomb.pic"
VileplumePicFront:    INCBIN "pic/bmon/vileplume.pic"
VileplumePicBack:     INCBIN "pic/monback/vileplumeb.pic"
BellsproutPicFront:   INCBIN "pic/bmon/bellsprout.pic"
BellsproutPicBack:    INCBIN "pic/monback/bellsproutb.pic"
WeepinbellPicFront:   INCBIN "pic/bmon/weepinbell.pic"
WeepinbellPicBack:    INCBIN "pic/monback/weepinbellb.pic"
VictreebelPicFront:   INCBIN "pic/bmon/victreebel.pic"
VictreebelPicBack:    INCBIN "pic/monback/victreebelb.pic"

INCLUDE "engine/titlescreen2.asm"
INCLUDE "engine/battle/d.asm"
INCLUDE "engine/slot_machine.asm"
INCLUDE "engine/overworld/pewter_guys.asm"
INCLUDE "engine/multiply_divide.asm"
INCLUDE "engine/game_corner_slots.asm"


SECTION "bankE",ROMX,BANK[$E]

INCLUDE "data/moves.asm"
BaseStats: INCLUDE "data/base_stats.asm"
INCLUDE "data/cries.asm"
INCLUDE "engine/battle/e.asm"

; tiles for gameboy and link cable graphics used for trading sequence animation
TradingAnimationGraphics:
	INCBIN "gfx/game_boy.norepeat.2bpp"
	INCBIN "gfx/link_cable.2bpp"

; 4 tiles for actual wire transfer animation (pokeball wandering inside wire)
TradingAnimationGraphics2:
	INCBIN "gfx/trade2.2bpp"

INCLUDE "engine/evos_moves.asm"
INCLUDE "engine/battle/e_2.asm"


SECTION "bankF",ROMX,BANK[$F]

INCLUDE "engine/battle/core.asm"


SECTION "bank10",ROMX,BANK[$10]

INCLUDE "engine/menu/pokedex.asm"
INCLUDE "engine/trade.asm"
INCLUDE "engine/intro.asm"
INCLUDE "engine/trade2.asm"


SECTION "bank11",ROMX,BANK[$11]

INCLUDE "data/mapHeaders/lavendertown.asm"
INCLUDE "data/mapObjects/lavendertown.asm"
LavenderTownBlocks: INCBIN "maps/lavendertown.blk"

ViridianPokecenterBlocks: INCBIN "maps/viridianpokecenter.blk"

SafariZoneRestHouse1Blocks:
SafariZoneRestHouse2Blocks:
SafariZoneRestHouse3Blocks:
SafariZoneRestHouse4Blocks: INCBIN "maps/safarizoneresthouse1.blk"

INCLUDE "scripts/lavendertown.asm"

INCLUDE "engine/pokedex_rating.asm"

INCLUDE "data/mapHeaders/viridianpokecenter.asm"
INCLUDE "scripts/viridianpokecenter.asm"
INCLUDE "data/mapObjects/viridianpokecenter.asm"

INCLUDE "data/mapHeaders/mansion1.asm"
INCLUDE "scripts/mansion1.asm"
INCLUDE "data/mapObjects/mansion1.asm"
Mansion1Blocks: INCBIN "maps/mansion1.blk"

INCLUDE "data/mapHeaders/rocktunnel1.asm"
INCLUDE "scripts/rocktunnel1.asm"
INCLUDE "data/mapObjects/rocktunnel1.asm"
RockTunnel1Blocks: INCBIN "maps/rocktunnel1.blk"

INCLUDE "data/mapHeaders/seafoamislands1.asm"
INCLUDE "scripts/seafoamislands1.asm"
INCLUDE "data/mapObjects/seafoamislands1.asm"
SeafoamIslands1Blocks: INCBIN "maps/seafoamislands1.blk"

INCLUDE "data/mapHeaders/ssanne3.asm"
INCLUDE "scripts/ssanne3.asm"
INCLUDE "data/mapObjects/ssanne3.asm"
SSAnne3Blocks: INCBIN "maps/ssanne3.blk"

INCLUDE "data/mapHeaders/victoryroad3.asm"
INCLUDE "scripts/victoryroad3.asm"
INCLUDE "data/mapObjects/victoryroad3.asm"
VictoryRoad3Blocks: INCBIN "maps/victoryroad3.blk"

INCLUDE "data/mapHeaders/rockethideout1.asm"
INCLUDE "scripts/rockethideout1.asm"
INCLUDE "data/mapObjects/rockethideout1.asm"
RocketHideout1Blocks: INCBIN "maps/rockethideout1.blk"

INCLUDE "data/mapHeaders/rockethideout2.asm"
INCLUDE "scripts/rockethideout2.asm"
INCLUDE "data/mapObjects/rockethideout2.asm"
RocketHideout2Blocks: INCBIN "maps/rockethideout2.blk"

INCLUDE "data/mapHeaders/rockethideout3.asm"
INCLUDE "scripts/rockethideout3.asm"
INCLUDE "data/mapObjects/rockethideout3.asm"
RocketHideout3Blocks: INCBIN "maps/rockethideout3.blk"

INCLUDE "data/mapHeaders/rockethideout4.asm"
INCLUDE "scripts/rockethideout4.asm"
INCLUDE "data/mapObjects/rockethideout4.asm"
RocketHideout4Blocks: INCBIN "maps/rockethideout4.blk"

INCLUDE "data/mapHeaders/rockethideoutelevator.asm"
INCLUDE "scripts/rockethideoutelevator.asm"
INCLUDE "data/mapObjects/rockethideoutelevator.asm"
RocketHideoutElevatorBlocks: INCBIN "maps/rockethideoutelevator.blk"

INCLUDE "data/mapHeaders/silphcoelevator.asm"
INCLUDE "scripts/silphcoelevator.asm"
INCLUDE "data/mapObjects/silphcoelevator.asm"
SilphCoElevatorBlocks: INCBIN "maps/silphcoelevator.blk"

INCLUDE "data/mapHeaders/safarizoneeast.asm"
INCLUDE "scripts/safarizoneeast.asm"
INCLUDE "data/mapObjects/safarizoneeast.asm"
SafariZoneEastBlocks: INCBIN "maps/safarizoneeast.blk"

INCLUDE "data/mapHeaders/safarizonenorth.asm"
INCLUDE "scripts/safarizonenorth.asm"
INCLUDE "data/mapObjects/safarizonenorth.asm"
SafariZoneNorthBlocks: INCBIN "maps/safarizonenorth.blk"

INCLUDE "data/mapHeaders/safarizonecenter.asm"
INCLUDE "scripts/safarizonecenter.asm"
INCLUDE "data/mapObjects/safarizonecenter.asm"
SafariZoneCenterBlocks: INCBIN "maps/safarizonecenter.blk"

INCLUDE "data/mapHeaders/safarizoneresthouse1.asm"
INCLUDE "scripts/safarizoneresthouse1.asm"
INCLUDE "data/mapObjects/safarizoneresthouse1.asm"

INCLUDE "data/mapHeaders/safarizoneresthouse2.asm"
INCLUDE "scripts/safarizoneresthouse2.asm"
INCLUDE "data/mapObjects/safarizoneresthouse2.asm"

INCLUDE "data/mapHeaders/safarizoneresthouse3.asm"
INCLUDE "scripts/safarizoneresthouse3.asm"
INCLUDE "data/mapObjects/safarizoneresthouse3.asm"

INCLUDE "data/mapHeaders/safarizoneresthouse4.asm"
INCLUDE "scripts/safarizoneresthouse4.asm"
INCLUDE "data/mapObjects/safarizoneresthouse4.asm"

INCLUDE "data/mapHeaders/unknowndungeon2.asm"
INCLUDE "scripts/unknowndungeon2.asm"
INCLUDE "data/mapObjects/unknowndungeon2.asm"
UnknownDungeon2Blocks: INCBIN "maps/unknowndungeon2.blk"

INCLUDE "data/mapHeaders/unknowndungeon3.asm"
INCLUDE "scripts/unknowndungeon3.asm"
INCLUDE "data/mapObjects/unknowndungeon3.asm"
UnknownDungeon3Blocks: INCBIN "maps/unknowndungeon3.blk"

INCLUDE "data/mapHeaders/rocktunnel2.asm"
INCLUDE "scripts/rocktunnel2.asm"
INCLUDE "data/mapObjects/rocktunnel2.asm"
RockTunnel2Blocks: INCBIN "maps/rocktunnel2.blk"

INCLUDE "data/mapHeaders/seafoamislands2.asm"
INCLUDE "scripts/seafoamislands2.asm"
INCLUDE "data/mapObjects/seafoamislands2.asm"
SeafoamIslands2Blocks: INCBIN "maps/seafoamislands2.blk"

INCLUDE "data/mapHeaders/seafoamislands3.asm"
INCLUDE "scripts/seafoamislands3.asm"
INCLUDE "data/mapObjects/seafoamislands3.asm"
SeafoamIslands3Blocks: INCBIN "maps/seafoamislands3.blk"

INCLUDE "data/mapHeaders/seafoamislands4.asm"
INCLUDE "scripts/seafoamislands4.asm"
INCLUDE "data/mapObjects/seafoamislands4.asm"
SeafoamIslands4Blocks: INCBIN "maps/seafoamislands4.blk"

INCLUDE "data/mapHeaders/seafoamislands5.asm"
INCLUDE "scripts/seafoamislands5.asm"
INCLUDE "data/mapObjects/seafoamislands5.asm"
SeafoamIslands5Blocks: INCBIN "maps/seafoamislands5.blk"

INCLUDE "engine/overworld/hidden_objects.asm"


SECTION "bank12",ROMX,BANK[$12]

INCLUDE "data/mapHeaders/route7.asm"
INCLUDE "data/mapObjects/route7.asm"
Route7Blocks: INCBIN "maps/route7.blk"

CeladonPokecenterBlocks:
RockTunnelPokecenterBlocks:
MtMoonPokecenterBlocks: INCBIN "maps/mtmoonpokecenter.blk"

Route18GateBlocks:
Route15GateBlocks:
Route11GateBlocks: INCBIN "maps/route11gate.blk"

Route18GateUpstairsBlocks:
Route16GateUpstairsBlocks:
Route12GateUpstairsBlocks:
Route15GateUpstairsBlocks:
Route11GateUpstairsBlocks: INCBIN "maps/route11gateupstairs.blk"

INCLUDE "engine/predefs12.asm"

INCLUDE "scripts/route7.asm"

INCLUDE "data/mapHeaders/redshouse1f.asm"
INCLUDE "scripts/redshouse1f.asm"
INCLUDE "data/mapObjects/redshouse1f.asm"
RedsHouse1FBlocks: INCBIN "maps/redshouse1f.blk"

INCLUDE "data/mapHeaders/celadonmart3.asm"
INCLUDE "scripts/celadonmart3.asm"
INCLUDE "data/mapObjects/celadonmart3.asm"
CeladonMart3Blocks: INCBIN "maps/celadonmart3.blk"

INCLUDE "data/mapHeaders/celadonmart4.asm"
INCLUDE "scripts/celadonmart4.asm"
INCLUDE "data/mapObjects/celadonmart4.asm"
CeladonMart4Blocks: INCBIN "maps/celadonmart4.blk"

INCLUDE "data/mapHeaders/celadonmartroof.asm"
INCLUDE "scripts/celadonmartroof.asm"
INCLUDE "data/mapObjects/celadonmartroof.asm"
CeladonMartRoofBlocks: INCBIN "maps/celadonmartroof.blk"

INCLUDE "data/mapHeaders/celadonmartelevator.asm"
INCLUDE "scripts/celadonmartelevator.asm"
INCLUDE "data/mapObjects/celadonmartelevator.asm"
CeladonMartElevatorBlocks: INCBIN "maps/celadonmartelevator.blk"

INCLUDE "data/mapHeaders/celadonmansion1.asm"
INCLUDE "scripts/celadonmansion1.asm"
INCLUDE "data/mapObjects/celadonmansion1.asm"
CeladonMansion1Blocks: INCBIN "maps/celadonmansion1.blk"

INCLUDE "data/mapHeaders/celadonmansion2.asm"
INCLUDE "scripts/celadonmansion2.asm"
INCLUDE "data/mapObjects/celadonmansion2.asm"
CeladonMansion2Blocks: INCBIN "maps/celadonmansion2.blk"

INCLUDE "data/mapHeaders/celadonmansion3.asm"
INCLUDE "scripts/celadonmansion3.asm"
INCLUDE "data/mapObjects/celadonmansion3.asm"
CeladonMansion3Blocks: INCBIN "maps/celadonmansion3.blk"

INCLUDE "data/mapHeaders/celadonmansion4.asm"
INCLUDE "scripts/celadonmansion4.asm"
INCLUDE "data/mapObjects/celadonmansion4.asm"
CeladonMansion4Blocks: INCBIN "maps/celadonmansion4.blk"

INCLUDE "data/mapHeaders/celadonpokecenter.asm"
INCLUDE "scripts/celadonpokecenter.asm"
INCLUDE "data/mapObjects/celadonpokecenter.asm"

INCLUDE "data/mapHeaders/celadongym.asm"
INCLUDE "scripts/celadongym.asm"
INCLUDE "data/mapObjects/celadongym.asm"
CeladonGymBlocks: INCBIN "maps/celadongym.blk"

INCLUDE "data/mapHeaders/celadongamecorner.asm"
INCLUDE "scripts/celadongamecorner.asm"
INCLUDE "data/mapObjects/celadongamecorner.asm"
CeladonGameCornerBlocks: INCBIN "maps/celadongamecorner.blk"

INCLUDE "data/mapHeaders/celadonmart5.asm"
INCLUDE "scripts/celadonmart5.asm"
INCLUDE "data/mapObjects/celadonmart5.asm"
CeladonMart5Blocks: INCBIN "maps/celadonmart5.blk"

INCLUDE "data/mapHeaders/celadonprizeroom.asm"
INCLUDE "scripts/celadonprizeroom.asm"
INCLUDE "data/mapObjects/celadonprizeroom.asm"
CeladonPrizeRoomBlocks: INCBIN "maps/celadonprizeroom.blk"

INCLUDE "data/mapHeaders/celadondiner.asm"
INCLUDE "scripts/celadondiner.asm"
INCLUDE "data/mapObjects/celadondiner.asm"
CeladonDinerBlocks: INCBIN "maps/celadondiner.blk"

INCLUDE "data/mapHeaders/celadonhouse.asm"
INCLUDE "scripts/celadonhouse.asm"
INCLUDE "data/mapObjects/celadonhouse.asm"
CeladonHouseBlocks: INCBIN "maps/celadonhouse.blk"

INCLUDE "data/mapHeaders/celadonhotel.asm"
INCLUDE "scripts/celadonhotel.asm"
INCLUDE "data/mapObjects/celadonhotel.asm"
CeladonHotelBlocks: INCBIN "maps/celadonhotel.blk"

INCLUDE "data/mapHeaders/mtmoonpokecenter.asm"
INCLUDE "scripts/mtmoonpokecenter.asm"
INCLUDE "data/mapObjects/mtmoonpokecenter.asm"

INCLUDE "data/mapHeaders/rocktunnelpokecenter.asm"
INCLUDE "scripts/rocktunnelpokecenter.asm"
INCLUDE "data/mapObjects/rocktunnelpokecenter.asm"

INCLUDE "data/mapHeaders/route11gate.asm"
INCLUDE "scripts/route11gate.asm"
INCLUDE "data/mapObjects/route11gate.asm"

INCLUDE "data/mapHeaders/route11gateupstairs.asm"
INCLUDE "scripts/route11gateupstairs.asm"
INCLUDE "data/mapObjects/route11gateupstairs.asm"

INCLUDE "data/mapHeaders/route12gate.asm"
INCLUDE "scripts/route12gate.asm"
INCLUDE "data/mapObjects/route12gate.asm"
Route12GateBlocks: INCBIN "maps/route12gate.blk"

INCLUDE "data/mapHeaders/route12gateupstairs.asm"
INCLUDE "scripts/route12gateupstairs.asm"
INCLUDE "data/mapObjects/route12gateupstairs.asm"

INCLUDE "data/mapHeaders/route15gate.asm"
INCLUDE "scripts/route15gate.asm"
INCLUDE "data/mapObjects/route15gate.asm"

INCLUDE "data/mapHeaders/route15gateupstairs.asm"
INCLUDE "scripts/route15gateupstairs.asm"
INCLUDE "data/mapObjects/route15gateupstairs.asm"

INCLUDE "data/mapHeaders/route16gate.asm"
INCLUDE "scripts/route16gate.asm"
INCLUDE "data/mapObjects/route16gate.asm"
Route16GateBlocks: INCBIN "maps/route16gate.blk"

INCLUDE "data/mapHeaders/route16gateupstairs.asm"
INCLUDE "scripts/route16gateupstairs.asm"
INCLUDE "data/mapObjects/route16gateupstairs.asm"

INCLUDE "data/mapHeaders/route18gate.asm"
INCLUDE "scripts/route18gate.asm"
INCLUDE "data/mapObjects/route18gate.asm"

INCLUDE "data/mapHeaders/route18gateupstairs.asm"
INCLUDE "scripts/route18gateupstairs.asm"
INCLUDE "data/mapObjects/route18gateupstairs.asm"

INCLUDE "data/mapHeaders/mtmoon1.asm"
INCLUDE "scripts/mtmoon1.asm"
INCLUDE "data/mapObjects/mtmoon1.asm"
MtMoon1Blocks: INCBIN "maps/mtmoon1.blk"

INCLUDE "data/mapHeaders/mtmoon3.asm"
INCLUDE "scripts/mtmoon3.asm"
INCLUDE "data/mapObjects/mtmoon3.asm"
MtMoon3Blocks: INCBIN "maps/mtmoon3.blk"

INCLUDE "data/mapHeaders/safarizonewest.asm"
INCLUDE "scripts/safarizonewest.asm"
INCLUDE "data/mapObjects/safarizonewest.asm"
SafariZoneWestBlocks: INCBIN "maps/safarizonewest.blk"

INCLUDE "data/mapHeaders/safarizonesecrethouse.asm"
INCLUDE "scripts/safarizonesecrethouse.asm"
INCLUDE "data/mapObjects/safarizonesecrethouse.asm"
SafariZoneSecretHouseBlocks:
	INCBIN "maps/safarizonesecrethouse.blk"


SECTION "bank13",ROMX,BANK[$13]

TrainerPics:
YoungsterPic:     INCBIN "pic/trainer/youngster.pic"
BugCatcherPic:    INCBIN "pic/trainer/bugcatcher.pic"
LassPic:          INCBIN "pic/trainer/lass.pic"
SailorPic:        INCBIN "pic/trainer/sailor.pic"
JrTrainerMPic:    INCBIN "pic/trainer/jr.trainerm.pic"
JrTrainerFPic:    INCBIN "pic/trainer/jr.trainerf.pic"
PokemaniacPic:    INCBIN "pic/trainer/pokemaniac.pic"
SuperNerdPic:     INCBIN "pic/trainer/supernerd.pic"
HikerPic:         INCBIN "pic/trainer/hiker.pic"
BikerPic:         INCBIN "pic/trainer/biker.pic"
BurglarPic:       INCBIN "pic/trainer/burglar.pic"
EngineerPic:      INCBIN "pic/trainer/engineer.pic"
FisherPic:        INCBIN "pic/trainer/fisher.pic"
SwimmerPic:       INCBIN "pic/trainer/swimmer.pic"
CueBallPic:       INCBIN "pic/trainer/cueball.pic"
GamblerPic:       INCBIN "pic/trainer/gambler.pic"
BeautyPic:        INCBIN "pic/trainer/beauty.pic"
PsychicPic:       INCBIN "pic/trainer/psychic.pic"
RockerPic:        INCBIN "pic/trainer/rocker.pic"
JugglerPic:       INCBIN "pic/trainer/juggler.pic"
TamerPic:         INCBIN "pic/trainer/tamer.pic"
BirdKeeperPic:    INCBIN "pic/trainer/birdkeeper.pic"
BlackbeltPic:     INCBIN "pic/trainer/blackbelt.pic"
Rival1Pic:        INCBIN "pic/trainer/rival1.pic"
ProfOakPic:       INCBIN "pic/trainer/prof.oak.pic"
ChiefPic:
ScientistPic:     INCBIN "pic/trainer/scientist.pic"
GiovanniPic:      INCBIN "pic/trainer/giovanni.pic"
RocketPic:        INCBIN "pic/trainer/rocket.pic"
CooltrainerMPic:  INCBIN "pic/trainer/cooltrainerm.pic"
CooltrainerFPic:  INCBIN "pic/trainer/cooltrainerf.pic"
BrunoPic:         INCBIN "pic/trainer/bruno.pic"
BrockPic:         INCBIN "pic/trainer/brock.pic"
MistyPic:         INCBIN "pic/trainer/misty.pic"
LtSurgePic:       INCBIN "pic/trainer/lt.surge.pic"
ErikaPic:         INCBIN "pic/trainer/erika.pic"
KogaPic:          INCBIN "pic/trainer/koga.pic"
BlainePic:        INCBIN "pic/trainer/blaine.pic"
SabrinaPic:       INCBIN "pic/trainer/sabrina.pic"
GentlemanPic:     INCBIN "pic/trainer/gentleman.pic"
Rival2Pic:        INCBIN "pic/trainer/rival2.pic"
Rival3Pic:        INCBIN "pic/trainer/rival3.pic"
LoreleiPic:       INCBIN "pic/trainer/lorelei.pic"
ChannelerPic:     INCBIN "pic/trainer/channeler.pic"
AgathaPic:        INCBIN "pic/trainer/agatha.pic"
LancePic:         INCBIN "pic/trainer/lance.pic"

INCLUDE "data/mapHeaders/battlecenterm.asm"
INCLUDE "scripts/battlecenterm.asm"
INCLUDE "data/mapObjects/battlecenterm.asm"
BattleCenterMBlocks: INCBIN "maps/battlecenterm.blk"

INCLUDE "data/mapHeaders/tradecenterm.asm"
INCLUDE "scripts/tradecenterm.asm"
INCLUDE "data/mapObjects/tradecenterm.asm"
TradeCenterMBlocks: INCBIN "maps/tradecenterm.blk"

INCLUDE "engine/give_pokemon.asm"

INCLUDE "engine/predefs.asm"


SECTION "bank14",ROMX,BANK[$14]

INCLUDE "data/mapHeaders/route22.asm"
INCLUDE "data/mapObjects/route22.asm"
Route22Blocks: INCBIN "maps/route22.blk"

INCLUDE "data/mapHeaders/route20.asm"
INCLUDE "data/mapObjects/route20.asm"
Route20Blocks: INCBIN "maps/route20.blk"

INCLUDE "data/mapHeaders/route23.asm"
INCLUDE "data/mapObjects/route23.asm"
Route23Blocks: INCBIN "maps/route23.blk"

INCLUDE "data/mapHeaders/route24.asm"
INCLUDE "data/mapObjects/route24.asm"
Route24Blocks: INCBIN "maps/route24.blk"

INCLUDE "data/mapHeaders/route25.asm"
INCLUDE "data/mapObjects/route25.asm"
Route25Blocks: INCBIN "maps/route25.blk"

INCLUDE "data/mapHeaders/indigoplateau.asm"
INCLUDE "scripts/indigoplateau.asm"
INCLUDE "data/mapObjects/indigoplateau.asm"
IndigoPlateauBlocks: INCBIN "maps/indigoplateau.blk"

INCLUDE "data/mapHeaders/saffroncity.asm"
INCLUDE "data/mapObjects/saffroncity.asm"
SaffronCityBlocks: INCBIN "maps/saffroncity.blk"
INCLUDE "scripts/saffroncity.asm"

INCLUDE "scripts/route20.asm"
INCLUDE "scripts/route22.asm"
INCLUDE "scripts/route23.asm"
INCLUDE "scripts/route24.asm"
INCLUDE "scripts/route25.asm"

INCLUDE "data/mapHeaders/victoryroad2.asm"
INCLUDE "scripts/victoryroad2.asm"
INCLUDE "data/mapObjects/victoryroad2.asm"
VictoryRoad2Blocks: INCBIN "maps/victoryroad2.blk"

INCLUDE "data/mapHeaders/mtmoon2.asm"
INCLUDE "scripts/mtmoon2.asm"
INCLUDE "data/mapObjects/mtmoon2.asm"
MtMoon2Blocks: INCBIN "maps/mtmoon2.blk"

INCLUDE "data/mapHeaders/silphco7.asm"
INCLUDE "scripts/silphco7.asm"
INCLUDE "data/mapObjects/silphco7.asm"
SilphCo7Blocks: INCBIN "maps/silphco7.blk"

INCLUDE "data/mapHeaders/mansion2.asm"
INCLUDE "scripts/mansion2.asm"
INCLUDE "data/mapObjects/mansion2.asm"
Mansion2Blocks: INCBIN "maps/mansion2.blk"

INCLUDE "data/mapHeaders/mansion3.asm"
INCLUDE "scripts/mansion3.asm"
INCLUDE "data/mapObjects/mansion3.asm"
Mansion3Blocks: INCBIN "maps/mansion3.blk"

INCLUDE "data/mapHeaders/mansion4.asm"
INCLUDE "scripts/mansion4.asm"
INCLUDE "data/mapObjects/mansion4.asm"
Mansion4Blocks: INCBIN "maps/mansion4.blk"

INCLUDE "engine/battle/14.asm"

INCLUDE "engine/overworld/card_key.asm"

INCLUDE "engine/menu/prize_menu.asm"

INCLUDE "engine/hidden_object_functions14.asm"


SECTION "bank15",ROMX,BANK[$15]

INCLUDE "data/mapHeaders/route2.asm"
INCLUDE "data/mapObjects/route2.asm"
Route2Blocks: INCBIN "maps/route2.blk"

INCLUDE "data/mapHeaders/route3.asm"
INCLUDE "data/mapObjects/route3.asm"
Route3Blocks: INCBIN "maps/route3.blk"

INCLUDE "data/mapHeaders/route4.asm"
INCLUDE "data/mapObjects/route4.asm"
Route4Blocks: INCBIN "maps/route4.blk"

INCLUDE "data/mapHeaders/route5.asm"
INCLUDE "data/mapObjects/route5.asm"
Route5Blocks: INCBIN "maps/route5.blk"

INCLUDE "data/mapHeaders/route9.asm"
INCLUDE "data/mapObjects/route9.asm"
Route9Blocks: INCBIN "maps/route9.blk"

INCLUDE "data/mapHeaders/route13.asm"
INCLUDE "data/mapObjects/route13.asm"
Route13Blocks: INCBIN "maps/route13.blk"

INCLUDE "data/mapHeaders/route14.asm"
INCLUDE "data/mapObjects/route14.asm"
Route14Blocks: INCBIN "maps/route14.blk"

INCLUDE "data/mapHeaders/route17.asm"
INCLUDE "data/mapObjects/route17.asm"
Route17Blocks: INCBIN "maps/route17.blk"

INCLUDE "data/mapHeaders/route19.asm"
INCLUDE "data/mapObjects/route19.asm"
Route19Blocks: INCBIN "maps/route19.blk"

INCLUDE "data/mapHeaders/route21.asm"
INCLUDE "data/mapObjects/route21.asm"
Route21Blocks: INCBIN "maps/route21.blk"

VermilionHouse2Blocks:
Route12HouseBlocks:
DayCareMBlocks: INCBIN "maps/daycarem.blk"

FuchsiaHouse3Blocks: INCBIN "maps/fuchsiahouse3.blk"

INCLUDE "engine/battle/15.asm"

INCLUDE "scripts/route2.asm"
INCLUDE "scripts/route3.asm"
INCLUDE "scripts/route4.asm"
INCLUDE "scripts/route5.asm"
INCLUDE "scripts/route9.asm"
INCLUDE "scripts/route13.asm"
INCLUDE "scripts/route14.asm"
INCLUDE "scripts/route17.asm"
INCLUDE "scripts/route19.asm"
INCLUDE "scripts/route21.asm"

INCLUDE "data/mapHeaders/vermilionhouse2.asm"
INCLUDE "scripts/vermilionhouse2.asm"
INCLUDE "data/mapObjects/vermilionhouse2.asm"

INCLUDE "data/mapHeaders/celadonmart2.asm"
INCLUDE "scripts/celadonmart2.asm"
INCLUDE "data/mapObjects/celadonmart2.asm"
CeladonMart2Blocks: INCBIN "maps/celadonmart2.blk"

INCLUDE "data/mapHeaders/fuchsiahouse3.asm"
INCLUDE "scripts/fuchsiahouse3.asm"
INCLUDE "data/mapObjects/fuchsiahouse3.asm"

INCLUDE "data/mapHeaders/daycarem.asm"
INCLUDE "scripts/daycarem.asm"
INCLUDE "data/mapObjects/daycarem.asm"

INCLUDE "data/mapHeaders/route12house.asm"
INCLUDE "scripts/route12house.asm"
INCLUDE "data/mapObjects/route12house.asm"

INCLUDE "data/mapHeaders/silphco8.asm"
INCLUDE "scripts/silphco8.asm"
INCLUDE "data/mapObjects/silphco8.asm"
SilphCo8Blocks: INCBIN "maps/silphco8.blk"

INCLUDE "engine/menu/diploma.asm"

INCLUDE "engine/overworld/trainers.asm"


SECTION "bank16",ROMX,BANK[$16]

INCLUDE "data/mapHeaders/route6.asm"
INCLUDE "data/mapObjects/route6.asm"
Route6Blocks: INCBIN "maps/route6.blk"

INCLUDE "data/mapHeaders/route8.asm"
INCLUDE "data/mapObjects/route8.asm"
Route8Blocks: INCBIN "maps/route8.blk"

INCLUDE "data/mapHeaders/route10.asm"
INCLUDE "data/mapObjects/route10.asm"
Route10Blocks: INCBIN "maps/route10.blk"

INCLUDE "data/mapHeaders/route11.asm"
INCLUDE "data/mapObjects/route11.asm"
Route11Blocks: INCBIN "maps/route11.blk"

INCLUDE "data/mapHeaders/route12.asm"
INCLUDE "data/mapObjects/route12.asm"
Route12Blocks: INCBIN "maps/route12.blk"

INCLUDE "data/mapHeaders/route15.asm"
INCLUDE "data/mapObjects/route15.asm"
Route15Blocks: INCBIN "maps/route15.blk"

INCLUDE "data/mapHeaders/route16.asm"
INCLUDE "data/mapObjects/route16.asm"
Route16Blocks: INCBIN "maps/route16.blk"

INCLUDE "data/mapHeaders/route18.asm"
INCLUDE "data/mapObjects/route18.asm"
Route18Blocks: INCBIN "maps/route18.blk"

	INCBIN "maps/unusedblocks58d7d.blk"

INCLUDE "engine/battle/16.asm"

INCLUDE "engine/experience.asm"

INCLUDE "engine/overworld/oaks_aide.asm"

INCLUDE "scripts/route6.asm"
INCLUDE "scripts/route8.asm"
INCLUDE "scripts/route10.asm"
INCLUDE "scripts/route11.asm"
INCLUDE "scripts/route12.asm"
INCLUDE "scripts/route15.asm"
INCLUDE "scripts/route16.asm"
INCLUDE "scripts/route18.asm"

INCLUDE "data/mapHeaders/fanclub.asm"
INCLUDE "scripts/fanclub.asm"
INCLUDE "data/mapObjects/fanclub.asm"
FanClubBlocks:
	INCBIN "maps/fanclub.blk"

INCLUDE "data/mapHeaders/silphco2.asm"
INCLUDE "scripts/silphco2.asm"
INCLUDE "data/mapObjects/silphco2.asm"
SilphCo2Blocks:
	INCBIN "maps/silphco2.blk"

INCLUDE "data/mapHeaders/silphco3.asm"
INCLUDE "scripts/silphco3.asm"
INCLUDE "data/mapObjects/silphco3.asm"
SilphCo3Blocks:
	INCBIN "maps/silphco3.blk"

INCLUDE "data/mapHeaders/silphco10.asm"
INCLUDE "scripts/silphco10.asm"
INCLUDE "data/mapObjects/silphco10.asm"
SilphCo10Blocks:
	INCBIN "maps/silphco10.blk"

INCLUDE "data/mapHeaders/lance.asm"
INCLUDE "scripts/lance.asm"
INCLUDE "data/mapObjects/lance.asm"
LanceBlocks:
	INCBIN "maps/lance.blk"

INCLUDE "data/mapHeaders/halloffameroom.asm"
INCLUDE "scripts/halloffameroom.asm"
INCLUDE "data/mapObjects/halloffameroom.asm"
HallofFameRoomBlocks:
	INCBIN "maps/halloffameroom.blk"

INCLUDE "engine/overworld/saffron_guards.asm"


SECTION "bank17",ROMX,BANK[$17]

SaffronMartBlocks:
LavenderMartBlocks:
CeruleanMartBlocks:
VermilionMartBlocks: INCBIN "maps/vermilionmart.blk"

CopycatsHouse2FBlocks:
RedsHouse2FBlocks: INCBIN "maps/redshouse2f.blk"

Museum1FBlocks: INCBIN "maps/museum1f.blk"

Museum2FBlocks: INCBIN "maps/museum2f.blk"

SaffronPokecenterBlocks:
VermilionPokecenterBlocks:
LavenderPokecenterBlocks:
PewterPokecenterBlocks: INCBIN "maps/pewterpokecenter.blk"

UndergroundPathEntranceRoute7Blocks:
UndergroundPathEntranceRoute7CopyBlocks:
UndergroundPathEntranceRoute6Blocks:
UndergroundPathEntranceRoute5Blocks: INCBIN "maps/undergroundpathentranceroute5.blk"

Route2GateBlocks:
ViridianForestEntranceBlocks:
ViridianForestExitBlocks: INCBIN "maps/viridianforestexit.blk"

INCLUDE "data/mapHeaders/redshouse2f.asm"
INCLUDE "scripts/redshouse2f.asm"
INCLUDE "data/mapObjects/redshouse2f.asm"

INCLUDE "engine/predefs17.asm"

INCLUDE "data/mapHeaders/museum1f.asm"
INCLUDE "scripts/museum1f.asm"
INCLUDE "data/mapObjects/museum1f.asm"

INCLUDE "data/mapHeaders/museum2f.asm"
INCLUDE "scripts/museum2f.asm"
INCLUDE "data/mapObjects/museum2f.asm"

INCLUDE "data/mapHeaders/pewtergym.asm"
INCLUDE "scripts/pewtergym.asm"
INCLUDE "data/mapObjects/pewtergym.asm"
PewterGymBlocks: INCBIN "maps/pewtergym.blk"

INCLUDE "data/mapHeaders/pewterpokecenter.asm"
INCLUDE "scripts/pewterpokecenter.asm"
INCLUDE "data/mapObjects/pewterpokecenter.asm"

INCLUDE "data/mapHeaders/ceruleanpokecenter.asm"
INCLUDE "scripts/ceruleanpokecenter.asm"
INCLUDE "data/mapObjects/ceruleanpokecenter.asm"
CeruleanPokecenterBlocks: INCBIN "maps/ceruleanpokecenter.blk"

INCLUDE "data/mapHeaders/ceruleangym.asm"
INCLUDE "scripts/ceruleangym.asm"
INCLUDE "data/mapObjects/ceruleangym.asm"
CeruleanGymBlocks: INCBIN "maps/ceruleangym.blk"

INCLUDE "data/mapHeaders/ceruleanmart.asm"
INCLUDE "scripts/ceruleanmart.asm"
INCLUDE "data/mapObjects/ceruleanmart.asm"

INCLUDE "data/mapHeaders/lavenderpokecenter.asm"
INCLUDE "scripts/lavenderpokecenter.asm"
INCLUDE "data/mapObjects/lavenderpokecenter.asm"

INCLUDE "data/mapHeaders/lavendermart.asm"
INCLUDE "scripts/lavendermart.asm"
INCLUDE "data/mapObjects/lavendermart.asm"

INCLUDE "data/mapHeaders/vermilionpokecenter.asm"
INCLUDE "scripts/vermilionpokecenter.asm"
INCLUDE "data/mapObjects/vermilionpokecenter.asm"

INCLUDE "data/mapHeaders/vermilionmart.asm"
INCLUDE "scripts/vermilionmart.asm"
INCLUDE "data/mapObjects/vermilionmart.asm"

INCLUDE "data/mapHeaders/vermiliongym.asm"
INCLUDE "scripts/vermiliongym.asm"
INCLUDE "data/mapObjects/vermiliongym.asm"
VermilionGymBlocks: INCBIN "maps/vermiliongym.blk"

INCLUDE "data/mapHeaders/copycatshouse2f.asm"
INCLUDE "scripts/copycatshouse2f.asm"
INCLUDE "data/mapObjects/copycatshouse2f.asm"

INCLUDE "data/mapHeaders/fightingdojo.asm"
INCLUDE "scripts/fightingdojo.asm"
INCLUDE "data/mapObjects/fightingdojo.asm"
FightingDojoBlocks: INCBIN "maps/fightingdojo.blk"

INCLUDE "data/mapHeaders/saffrongym.asm"
INCLUDE "scripts/saffrongym.asm"
INCLUDE "data/mapObjects/saffrongym.asm"
SaffronGymBlocks: INCBIN "maps/saffrongym.blk"

INCLUDE "data/mapHeaders/saffronmart.asm"
INCLUDE "scripts/saffronmart.asm"
INCLUDE "data/mapObjects/saffronmart.asm"

INCLUDE "data/mapHeaders/silphco1.asm"
INCLUDE "scripts/silphco1.asm"
INCLUDE "data/mapObjects/silphco1.asm"
SilphCo1Blocks: INCBIN "maps/silphco1.blk"

INCLUDE "data/mapHeaders/saffronpokecenter.asm"
INCLUDE "scripts/saffronpokecenter.asm"
INCLUDE "data/mapObjects/saffronpokecenter.asm"

INCLUDE "data/mapHeaders/viridianforestexit.asm"
INCLUDE "scripts/viridianforestexit.asm"
INCLUDE "data/mapObjects/viridianforestexit.asm"

INCLUDE "data/mapHeaders/route2gate.asm"
INCLUDE "scripts/route2gate.asm"
INCLUDE "data/mapObjects/route2gate.asm"

INCLUDE "data/mapHeaders/viridianforestentrance.asm"
INCLUDE "scripts/viridianforestentrance.asm"
INCLUDE "data/mapObjects/viridianforestentrance.asm"

INCLUDE "data/mapHeaders/undergroundpathentranceroute5.asm"
INCLUDE "scripts/undergroundpathentranceroute5.asm"
INCLUDE "data/mapObjects/undergroundpathentranceroute5.asm"

INCLUDE "data/mapHeaders/undergroundpathentranceroute6.asm"
INCLUDE "scripts/undergroundpathentranceroute6.asm"
INCLUDE "data/mapObjects/undergroundpathentranceroute6.asm"

INCLUDE "data/mapHeaders/undergroundpathentranceroute7.asm"
INCLUDE "scripts/undergroundpathentranceroute7.asm"
INCLUDE "data/mapObjects/undergroundpathentranceroute7.asm"

INCLUDE "data/mapHeaders/undergroundpathentranceroute7copy.asm"
INCLUDE "scripts/undergroundpathentranceroute7copy.asm"
INCLUDE "data/mapObjects/undergroundpathentranceroute7copy.asm"

INCLUDE "data/mapHeaders/silphco9.asm"
INCLUDE "scripts/silphco9.asm"
INCLUDE "data/mapObjects/silphco9.asm"
SilphCo9Blocks: INCBIN "maps/silphco9.blk"

INCLUDE "data/mapHeaders/victoryroad1.asm"
INCLUDE "scripts/victoryroad1.asm"
INCLUDE "data/mapObjects/victoryroad1.asm"
VictoryRoad1Blocks: INCBIN "maps/victoryroad1.blk"

INCLUDE "engine/predefs17_2.asm"

INCLUDE "engine/hidden_object_functions17.asm"


SECTION "bank18",ROMX,BANK[$18]

ViridianForestBlocks:    INCBIN "maps/viridianforest.blk"
UndergroundPathNSBlocks: INCBIN "maps/undergroundpathns.blk"
UndergroundPathWEBlocks: INCBIN "maps/undergroundpathwe.blk"

	INCBIN "maps/unusedblocks60258.blk"

SSAnne10Blocks:
SSAnne9Blocks: INCBIN "maps/ssanne9.blk"

INCLUDE "data/mapHeaders/pokemontower1.asm"
INCLUDE "scripts/pokemontower1.asm"
INCLUDE "data/mapObjects/pokemontower1.asm"
PokemonTower1Blocks: INCBIN "maps/pokemontower1.blk"

INCLUDE "data/mapHeaders/pokemontower2.asm"
INCLUDE "scripts/pokemontower2.asm"
INCLUDE "data/mapObjects/pokemontower2.asm"
PokemonTower2Blocks: INCBIN "maps/pokemontower2.blk"

INCLUDE "data/mapHeaders/pokemontower3.asm"
INCLUDE "scripts/pokemontower3.asm"
INCLUDE "data/mapObjects/pokemontower3.asm"
PokemonTower3Blocks: INCBIN "maps/pokemontower3.blk"

INCLUDE "data/mapHeaders/pokemontower4.asm"
INCLUDE "scripts/pokemontower4.asm"
INCLUDE "data/mapObjects/pokemontower4.asm"
PokemonTower4Blocks: INCBIN "maps/pokemontower4.blk"

INCLUDE "data/mapHeaders/pokemontower5.asm"
INCLUDE "scripts/pokemontower5.asm"
INCLUDE "data/mapObjects/pokemontower5.asm"
PokemonTower5Blocks: INCBIN "maps/pokemontower5.blk"

INCLUDE "data/mapHeaders/pokemontower6.asm"
INCLUDE "scripts/pokemontower6.asm"
INCLUDE "data/mapObjects/pokemontower6.asm"
PokemonTower6Blocks: INCBIN "maps/pokemontower6.blk"

	INCBIN "maps/unusedblocks60cef.blk"

INCLUDE "data/mapHeaders/pokemontower7.asm"
INCLUDE "scripts/pokemontower7.asm"
INCLUDE "data/mapObjects/pokemontower7.asm"
PokemonTower7Blocks: INCBIN "maps/pokemontower7.blk"

INCLUDE "data/mapHeaders/celadonmart1.asm"
INCLUDE "scripts/celadonmart1.asm"
INCLUDE "data/mapObjects/celadonmart1.asm"
CeladonMart1Blocks: INCBIN "maps/celadonmart1.blk"

INCLUDE "engine/overworld/cinnabar_lab.asm"

INCLUDE "data/mapHeaders/viridianforest.asm"
INCLUDE "scripts/viridianforest.asm"
INCLUDE "data/mapObjects/viridianforest.asm"

INCLUDE "data/mapHeaders/ssanne1.asm"
INCLUDE "scripts/ssanne1.asm"
INCLUDE "data/mapObjects/ssanne1.asm"
SSAnne1Blocks: INCBIN "maps/ssanne1.blk"

INCLUDE "data/mapHeaders/ssanne2.asm"
INCLUDE "scripts/ssanne2.asm"
INCLUDE "data/mapObjects/ssanne2.asm"
SSAnne2Blocks: INCBIN "maps/ssanne2.blk"

INCLUDE "data/mapHeaders/ssanne4.asm"
INCLUDE "scripts/ssanne4.asm"
INCLUDE "data/mapObjects/ssanne4.asm"
SSAnne4Blocks: INCBIN "maps/ssanne4.blk"

INCLUDE "data/mapHeaders/ssanne5.asm"
INCLUDE "scripts/ssanne5.asm"
INCLUDE "data/mapObjects/ssanne5.asm"
SSAnne5Blocks: INCBIN "maps/ssanne5.blk"

INCLUDE "data/mapHeaders/ssanne6.asm"
INCLUDE "scripts/ssanne6.asm"
INCLUDE "data/mapObjects/ssanne6.asm"
SSAnne6Blocks: INCBIN "maps/ssanne6.blk"

INCLUDE "data/mapHeaders/ssanne7.asm"
INCLUDE "scripts/ssanne7.asm"
INCLUDE "data/mapObjects/ssanne7.asm"
SSAnne7Blocks: INCBIN "maps/ssanne7.blk"

INCLUDE "data/mapHeaders/ssanne8.asm"
INCLUDE "scripts/ssanne8.asm"
INCLUDE "data/mapObjects/ssanne8.asm"
SSAnne8Blocks: INCBIN "maps/ssanne8.blk"

INCLUDE "data/mapHeaders/ssanne9.asm"
INCLUDE "scripts/ssanne9.asm"
INCLUDE "data/mapObjects/ssanne9.asm"

INCLUDE "data/mapHeaders/ssanne10.asm"
INCLUDE "scripts/ssanne10.asm"
INCLUDE "data/mapObjects/ssanne10.asm"

INCLUDE "data/mapHeaders/undergroundpathns.asm"
INCLUDE "scripts/undergroundpathns.asm"
INCLUDE "data/mapObjects/undergroundpathns.asm"

INCLUDE "data/mapHeaders/undergroundpathwe.asm"
INCLUDE "scripts/undergroundpathwe.asm"
INCLUDE "data/mapObjects/undergroundpathwe.asm"

INCLUDE "data/mapHeaders/diglettscave.asm"
INCLUDE "scripts/diglettscave.asm"
INCLUDE "data/mapObjects/diglettscave.asm"
DiglettsCaveBlocks: INCBIN "maps/diglettscave.blk"

INCLUDE "data/mapHeaders/silphco11.asm"
INCLUDE "scripts/silphco11.asm"
INCLUDE "data/mapObjects/silphco11.asm"
SilphCo11Blocks: INCBIN "maps/silphco11.blk"

INCLUDE "engine/hidden_object_functions18.asm"


SECTION "bank19",ROMX,BANK[$19]

Overworld_GFX:     INCBIN "gfx/tilesets/overworld.w128.t2.2bpp"
Overworld_Block:   INCBIN "gfx/blocksets/overworld.bst"

RedsHouse1_GFX:
RedsHouse2_GFX:    INCBIN "gfx/tilesets/reds_house.w128.t7.2bpp"
RedsHouse1_Block:
RedsHouse2_Block:  INCBIN "gfx/blocksets/reds_house.bst"

House_GFX:         INCBIN "gfx/tilesets/house.w128.t2.2bpp"
House_Block:       INCBIN "gfx/blocksets/house.bst"
Mansion_GFX:       INCBIN "gfx/tilesets/mansion.w128.t2.2bpp"
Mansion_Block:     INCBIN "gfx/blocksets/mansion.bst"
ShipPort_GFX:      INCBIN "gfx/tilesets/ship_port.w128.t2.2bpp"
ShipPort_Block:    INCBIN "gfx/blocksets/ship_port.bst"
Interior_GFX:      INCBIN "gfx/tilesets/interior.w128.t1.2bpp"
Interior_Block:    INCBIN "gfx/blocksets/interior.bst"
Plateau_GFX:       INCBIN "gfx/tilesets/plateau.w128.t10.2bpp"
Plateau_Block:     INCBIN "gfx/blocksets/plateau.bst"


SECTION "bank1A",ROMX,BANK[$1A]

INCLUDE "engine/battle/1a.asm"

Version_GFX:
IF _RED
	INCBIN "gfx/red/redgreenversion.h8.1bpp" ; 10 tiles
ENDC
IF _BLUE
	INCBIN "gfx/blue/blueversion.h8.1bpp" ; 8 tiles
ENDC

Dojo_GFX:
Gym_GFX:           INCBIN "gfx/tilesets/gym.w128.2bpp"
Dojo_Block:
Gym_Block:         INCBIN "gfx/blocksets/gym.bst"

Mart_GFX:
Pokecenter_GFX:    INCBIN "gfx/tilesets/pokecenter.w128.2bpp"
Mart_Block:
Pokecenter_Block:  INCBIN "gfx/blocksets/pokecenter.bst"

ForestGate_GFX:
Museum_GFX:
Gate_GFX:          INCBIN "gfx/tilesets/gate.w128.t1.2bpp"
ForestGate_Block:
Museum_Block:
Gate_Block:        INCBIN "gfx/blocksets/gate.bst"

Forest_GFX:        INCBIN "gfx/tilesets/forest.w128.2bpp"
Forest_Block:      INCBIN "gfx/blocksets/forest.bst"
Facility_GFX:      INCBIN "gfx/tilesets/facility.w128.2bpp"
Facility_Block:    INCBIN "gfx/blocksets/facility.bst"


SECTION "bank1B",ROMX,BANK[$1B]

Cemetery_GFX:      INCBIN "gfx/tilesets/cemetery.w128.t4.2bpp"
Cemetery_Block:    INCBIN "gfx/blocksets/cemetery.bst"
Cavern_GFX:        INCBIN "gfx/tilesets/cavern.w128.t14.2bpp"
Cavern_Block:      INCBIN "gfx/blocksets/cavern.bst"
Lobby_GFX:         INCBIN "gfx/tilesets/lobby.w128.t2.2bpp"
Lobby_Block:       INCBIN "gfx/blocksets/lobby.bst"
Ship_GFX:          INCBIN "gfx/tilesets/ship.w128.t6.2bpp"
Ship_Block:        INCBIN "gfx/blocksets/ship.bst"
Lab_GFX:           INCBIN "gfx/tilesets/lab.w128.t4.2bpp"
Lab_Block:         INCBIN "gfx/blocksets/lab.bst"
Club_GFX:          INCBIN "gfx/tilesets/club.w128.t5.2bpp"
Club_Block:        INCBIN "gfx/blocksets/club.bst"
Underground_GFX:   INCBIN "gfx/tilesets/underground.w128.t7.2bpp"
Underground_Block: INCBIN "gfx/blocksets/underground.bst"


SECTION "bank1C",ROMX,BANK[$1C]

INCLUDE "engine/gamefreak.asm"
INCLUDE "engine/hall_of_fame.asm"
INCLUDE "engine/overworld/healing_machine.asm"
INCLUDE "engine/overworld/player_animations.asm"
INCLUDE "engine/battle/1c.asm"
INCLUDE "engine/town_map.asm"
INCLUDE "engine/mon_party_sprites.asm"
INCLUDE "engine/in_game_trades.asm"
INCLUDE "engine/palettes.asm"
INCLUDE "engine/save.asm"


SECTION "bank1D",ROMX,BANK[$1D]

CopycatsHouse1FBlocks: INCBIN "maps/copycatshouse1f.blk"

CinnabarMartBlocks:
PewterMartBlocks: INCBIN "maps/pewtermart.blk"

FuchsiaHouse1Blocks: INCBIN "maps/fuchsiahouse1.blk"

CinnabarPokecenterBlocks:
FuchsiaPokecenterBlocks: INCBIN "maps/fuchsiapokecenter.blk"

CeruleanHouse2Blocks: INCBIN "maps/ceruleanhouse2.blk"

INCLUDE "engine/HoF_room_pc.asm"

INCLUDE "engine/status_ailments.asm"

INCLUDE "engine/items/itemfinder.asm"

INCLUDE "scripts/ceruleancity2.asm"

INCLUDE "data/mapHeaders/viridiangym.asm"
INCLUDE "scripts/viridiangym.asm"
INCLUDE "data/mapObjects/viridiangym.asm"
ViridianGymBlocks: INCBIN "maps/viridiangym.blk"

INCLUDE "data/mapHeaders/pewtermart.asm"
INCLUDE "scripts/pewtermart.asm"
INCLUDE "data/mapObjects/pewtermart.asm"

INCLUDE "data/mapHeaders/unknowndungeon1.asm"
INCLUDE "scripts/unknowndungeon1.asm"
INCLUDE "data/mapObjects/unknowndungeon1.asm"
UnknownDungeon1Blocks: INCBIN "maps/unknowndungeon1.blk"

INCLUDE "data/mapHeaders/ceruleanhouse2.asm"
INCLUDE "scripts/ceruleanhouse2.asm"
INCLUDE "data/mapObjects/ceruleanhouse2.asm"

INCLUDE "engine/menu/vending_machine.asm"

INCLUDE "data/mapHeaders/fuchsiahouse1.asm"
INCLUDE "scripts/fuchsiahouse1.asm"
INCLUDE "data/mapObjects/fuchsiahouse1.asm"

INCLUDE "data/mapHeaders/fuchsiapokecenter.asm"
INCLUDE "scripts/fuchsiapokecenter.asm"
INCLUDE "data/mapObjects/fuchsiapokecenter.asm"

INCLUDE "data/mapHeaders/fuchsiahouse2.asm"
INCLUDE "scripts/fuchsiahouse2.asm"
INCLUDE "data/mapObjects/fuchsiahouse2.asm"
FuchsiaHouse2Blocks: INCBIN "maps/fuchsiahouse2.blk"

INCLUDE "data/mapHeaders/safarizoneentrance.asm"
INCLUDE "scripts/safarizoneentrance.asm"
INCLUDE "data/mapObjects/safarizoneentrance.asm"
SafariZoneEntranceBlocks: INCBIN "maps/safarizoneentrance.blk"

INCLUDE "data/mapHeaders/fuchsiagym.asm"
INCLUDE "scripts/fuchsiagym.asm"
INCLUDE "data/mapObjects/fuchsiagym.asm"
FuchsiaGymBlocks: INCBIN "maps/fuchsiagym.blk"

INCLUDE "data/mapHeaders/fuchsiameetingroom.asm"
INCLUDE "scripts/fuchsiameetingroom.asm"
INCLUDE "data/mapObjects/fuchsiameetingroom.asm"
FuchsiaMeetingRoomBlocks: INCBIN "maps/fuchsiameetingroom.blk"

INCLUDE "data/mapHeaders/cinnabargym.asm"
INCLUDE "scripts/cinnabargym.asm"
INCLUDE "data/mapObjects/cinnabargym.asm"
CinnabarGymBlocks: INCBIN "maps/cinnabargym.blk"

INCLUDE "data/mapHeaders/lab1.asm"
INCLUDE "scripts/lab1.asm"
INCLUDE "data/mapObjects/lab1.asm"
Lab1Blocks: INCBIN "maps/lab1.blk"

INCLUDE "data/mapHeaders/lab2.asm"
INCLUDE "scripts/lab2.asm"
INCLUDE "data/mapObjects/lab2.asm"
Lab2Blocks: INCBIN "maps/lab2.blk"

INCLUDE "data/mapHeaders/lab3.asm"
INCLUDE "scripts/lab3.asm"
INCLUDE "data/mapObjects/lab3.asm"
Lab3Blocks: INCBIN "maps/lab3.blk"

INCLUDE "data/mapHeaders/lab4.asm"
INCLUDE "scripts/lab4.asm"
INCLUDE "data/mapObjects/lab4.asm"
Lab4Blocks: INCBIN "maps/lab4.blk"

INCLUDE "data/mapHeaders/cinnabarpokecenter.asm"
INCLUDE "scripts/cinnabarpokecenter.asm"
INCLUDE "data/mapObjects/cinnabarpokecenter.asm"

INCLUDE "data/mapHeaders/cinnabarmart.asm"
INCLUDE "scripts/cinnabarmart.asm"
INCLUDE "data/mapObjects/cinnabarmart.asm"

INCLUDE "data/mapHeaders/copycatshouse1f.asm"
INCLUDE "scripts/copycatshouse1f.asm"
INCLUDE "data/mapObjects/copycatshouse1f.asm"

INCLUDE "data/mapHeaders/gary.asm"
INCLUDE "scripts/gary.asm"
INCLUDE "data/mapObjects/gary.asm"
GaryBlocks: INCBIN "maps/gary.blk"

INCLUDE "data/mapHeaders/lorelei.asm"
INCLUDE "scripts/lorelei.asm"
INCLUDE "data/mapObjects/lorelei.asm"
LoreleiBlocks: INCBIN "maps/lorelei.blk"

INCLUDE "data/mapHeaders/bruno.asm"
INCLUDE "scripts/bruno.asm"
INCLUDE "data/mapObjects/bruno.asm"
BrunoBlocks: INCBIN "maps/bruno.blk"

INCLUDE "data/mapHeaders/agatha.asm"
INCLUDE "scripts/agatha.asm"
INCLUDE "data/mapObjects/agatha.asm"
AgathaBlocks: INCBIN "maps/agatha.blk"

INCLUDE "engine/menu/league_pc.asm"

INCLUDE "engine/overworld/hidden_items.asm"


SECTION "bank1E",ROMX,BANK[$1E]

INCLUDE "engine/battle/animations.asm"

INCLUDE "engine/overworld/cut2.asm"

INCLUDE "engine/overworld/ssanne.asm"

RedFishingTilesFront: INCBIN "gfx/red_fishing_tile_front.2bpp"
RedFishingTilesBack:  INCBIN "gfx/red_fishing_tile_back.2bpp"
RedFishingTilesSide:  INCBIN "gfx/red_fishing_tile_side.2bpp"
RedFishingRodTiles:   INCBIN "gfx/red_fishingrod_tiles.2bpp"

INCLUDE "data/animations.asm"

INCLUDE "engine/evolution.asm"

INCLUDE "engine/overworld/elevator.asm"

INCLUDE "engine/items/tm_prices.asm"
