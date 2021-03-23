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
	jr z, .asm_44ff6
	ld hl, GymSpinnerArrows
.asm_44ff6
	ld a, [wSimulatedJoypadStatesIndex]
	bit 0, a
	jr nz, .asm_45001
	ld de, $18
	add hl, de
.asm_45001
	ld a, $4
	ld bc, $0
.asm_45006
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
	call CopyVideoData
	pop bc
	ld a, $6
	add c
	ld c, a
	pop hl
	pop af
	dec a
	jr nz, .asm_45006
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
