LoadSpinnerArrowTiles::
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
	ld a, [wSimulatedJoypadStatesIndex]
	bit 0, a
	jr nz, .alternateGraphics
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
	
	ei	;re-enable vblank functions
	ret

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
