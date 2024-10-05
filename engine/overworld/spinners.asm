LoadSpinnerArrowTiles::
	ld a, [wWalkCounter]
	and %11
	ret nz ; only update directions every 4 frames of walk counter
ForceLoadSpinnerArrowTiles:
	ld a, [wSpritePlayerStateData1ImageIndex]
	srl a
	srl a
	ld hl, SpinnerPlayerFacingDirections
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [wSpritePlayerStateData1ImageIndex], a
	ld a, [wCurMapTileset]
	cp FACILITY
	ld hl, FacilitySpinnerArrows
	jr z, .gotSpinnerArrows
	ld hl, GymSpinnerArrows
.gotSpinnerArrows
	; only switch between spinner tiles every 16 frames of walk counter
	ld a, [wWalkCounter]
	and a
	jr nz, .checkEvent
	; toggle spinner toggler
	ld a, [wEventFlags + FLAG_SPINNER_TOGGLER / 8]
	xor 1 << FLAG_SPINNER_TOGGLER % 8
	ld [wEventFlags + FLAG_SPINNER_TOGGLER / 8], a
.checkEvent
	CheckFlag FLAG_SPINNER_TOGGLER
	jr z, .alternateGraphics
	ld de, 6 * 4
	add hl, de
.alternateGraphics
	ld a, 4 ; update all 4 arrow tiles
	ld bc, 0
.loop
	push af
	push hl
	push bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	;call CopyVideoData
	;shinpokerednote: CHANGED: use a new function to update the tiles without so much lag
	call CopySpinnerTiles
	pop bc
	ld a, $6
	add c
	ld c, a
	pop hl
	pop af
	dec a
	jr nz, .loop
	;rst _DelayFrame ; pureRGBnote: CHANGED: make movement while spinning faster
	ret

;DE = tile source address
;C = data length (not used)
;B = source bank (not used)
;HL = tile destination address
CopySpinnerTiles:
	di	;prevent vblank functions from running
	
	;back up destination address
	ld b, h
	ld c, l
	;back up stack pointer
	ld hl, sp + 0
	ld a, h
	ldh [hSPTemp], a
	ld a, l
	ldh [hSPTemp + 1], a
	;set stack pointer to source address
	ld h, d
	ld l, e
	ld sp, hl
	;restore destination address
	ld h, b
	ld l, c
	
	;Stack Pointer = tile source address
	;HL = tile destination address

	ld c, 8
.loop
	pop de ;copies the next 2 bytes of whatever the stack pointer is pointing to (the source address) to de
;wait if in mode 2 or mode 3
;HBLANK length (mode 0) is highly variable. Worst case scenario is 21 cycles.
;Can also write VRAM during OAM scan (mode 2) which is always 20 cycles.
;For more info about timing the HBLANK, see https://gbdev.io/guides/lyc_timing.html
.waitVRAM
	ldh a, [rSTAT]		;read from stat register to get the mode
	and %10				
	jr nz, .waitVRAM	
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	dec c
	jr nz, .loop

	;restore stack spointer
	ldh a, [hSPTemp]
	ld h, a
	ldh a, [hSPTemp + 1]
	ld l, a
	ld sp, hl
	
	reti	;re-enable vblank functions

INCLUDE "data/tilesets/spinner_tiles.asm"

SpinnerPlayerFacingDirections:
; This isn't the order of the facing directions.  Rather, it's a list of
; the facing directions that come next. For example, when the player is
; facing down (00), the next facing direction is left (08).
	db $08 ; down -> left
	db $0C ; up -> right
	db $04 ; left -> up
	db $00 ; right -> down

; these tiles are the animation for the tiles that push the player in dungeons like Rocket HQ
SpinnerArrowAnimTiles:
	INCBIN "gfx/overworld/spinners.2bpp"

;;;;; PureRGBnote: CHANGED: The game used to use DecodeArrowMovementRLEList for checking to start spinning in each map with arrow tiles.
; but this took up a ridiculous amount of space writing down every single direction every arrow tile moved you in full
; instead we will just look at the tiles the player is standing on and figure out if they should be forced to move in a direction
; based on them. We will force the player to keep moving in that direction until they hit another arrow tile or a "stop" tile.
CheckStartStopSpinningLoadArrowTiles:
	call CheckStartStopSpinning
	ld hl, wMovementFlags
	bit BIT_SPINNING, [hl]
	jp z, CheckFightingMapTrainers
	jp LoadSpinnerArrowTiles

CheckStartStopSpinning::
	lda_coord 9, 9 ; bottom right tile under player
	ld c, a
	lda_coord 8, 9 ; bottom left tile under player
	ld b, a
	ld a, [wCurMapTileset]
	cp FACILITY
	ld hl, SpinnerTilesFacilityTileset
	ld a, $5E ; "stop spinning" tile in facility tileset
	jr z, .checkStop
	ld hl, SpinnerTilesGymTileset
	ld a, $3F ; "stop spinning" tile in gym tileset
.checkStop
	cp b
	jr z, .stopSpinning
.loop
	ld a, [hli]
	cp $ff
	ret z ; no match
	cp b 
	jr nz, .next
	ld a, [hli]
	cp c
	jr nz, .next2
	ld a, [hl]
	ld [wSimulatedJoypadStatesEnd], a
	; while spinning wSimulatedJoypadStatesIndex won't be decrementing
	; so despite it being set to 0 here it will still trigger movement
	xor a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld hl, wMovementFlags
	bit BIT_SPINNING, [hl]
	set BIT_SPINNING, [hl]
	ret nz ; if we're already spinning don't replay the sound or reload joyignore
	ld a, SFX_ARROW_TILES
	rst _PlaySound
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ret
.next
	inc hl
.next2
	inc hl
	jr .loop
.stopSpinning
	ld hl, wMovementFlags
	bit BIT_SPINNING, [hl]
	res BIT_SPINNING, [hl]
	ret z ; if we're already stopped, don't do the below stuff again
	xor a
	ld [wJoyIgnore], a
	ResetFlag FLAG_SPINNER_TOGGLER
	jp ForceLoadSpinnerArrowTiles ; reset to default spinner tile

; need to check 2 tiles to figure out spin direction since they reused tiles
; format: 
; 1st byte: bottom left tile player must be standing on
; 2nd byte: bottom right tile player must be standing on
; 3rd byte: direction it should move player
SpinnerTilesFacilityTileset:
	db $30, $30, D_RIGHT
	db $20, $20, D_LEFT
	db $21, $31, D_UP
	db $20, $30, D_DOWN
	db -1

SpinnerTilesGymTileset:
	db $4D, $4D, D_RIGHT
	db $4C, $4C, D_LEFT
	db $3C, $3D, D_UP
	db $4C, $4D, D_DOWN
	db -1
;;;;;