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

TrainerFlagAction::
	ld a, $10 ; FlagActionPredef
	jp Predef

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
	call TrainerFlagAction      ; read trainer's flag
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
	call TrainerFlagAction   ; flag trainer as fought
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
	call TrainerFlagAction        ; read trainer flag
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
