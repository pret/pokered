; this function seems to be used only once
; it store the address of a row and column of the VRAM background map in hl
; INPUT: h - row, l - column, b - high byte of background tile map address in VRAM
GetRowColAddressBgMap::
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
ClearBgMap::
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

; This function redraws a BG row of height 2 or a BG column of width 2.
; One of its main uses is redrawing the row or column that will be exposed upon
; scrolling the BG when the player takes a step. Redrawing only the exposed
; row or column is more efficient than redrawing the entire screen.
; However, this function is also called repeatedly to redraw the whole screen
; when necessary. It is also used in trade animation and elevator code.
RedrawRowOrColumn::
	ld a,[hRedrawRowOrColumnMode]
	and a
	ret z
	ld b,a
	xor a
	ld [hRedrawRowOrColumnMode],a
	dec b
	jr nz,.redrawRow
.redrawColumn
	ld hl,wRedrawRowOrColumnSrcTiles
	ld a,[hRedrawRowOrColumnDest]
	ld e,a
	ld a,[hRedrawRowOrColumnDest + 1]
	ld d,a
	ld c,SCREEN_HEIGHT
.loop1
	ld a,[hli]
	ld [de],a
	inc de
	ld a,[hli]
	ld [de],a
	ld a,BG_MAP_WIDTH - 1
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
	ld [hRedrawRowOrColumnMode],a
	ret
.redrawRow
	ld hl,wRedrawRowOrColumnSrcTiles
	ld a,[hRedrawRowOrColumnDest]
	ld e,a
	ld a,[hRedrawRowOrColumnDest + 1]
	ld d,a
	push de
	call .DrawHalf ; draw upper half
	pop de
	ld a,BG_MAP_WIDTH ; width of VRAM background map
	add e
	ld e,a
	; fall through and draw lower half

.DrawHalf
	ld c,SCREEN_WIDTH / 2
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
; the above function, RedrawRowOrColumn, is used when walking to
; improve efficiency.
AutoBgMapTransfer::
	ld a,[H_AUTOBGTRANSFERENABLED]
	and a
	ret z
	ld hl,sp + 0
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
	coord hl, 0, 12
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
	coord hl, 0, 0
	ld sp,hl
	ld a,[H_AUTOBGTRANSFERDEST + 1]
	ld h,a
	ld a,[H_AUTOBGTRANSFERDEST]
	ld l,a
	ld a,TRANSFERMIDDLE
	jr .doTransfer
.transferMiddleThird
	coord hl, 0, 6
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

TransferBgRows::
; unrolled loop and using pop for speed

	rept 20 / 2 - 1
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

	ld a, 32 - (20 - 1)
	add l
	ld l, a
	jr nc, .ok
	inc h
.ok
	dec b
	jr nz, TransferBgRows

	ld a, [H_SPTEMP]
	ld h, a
	ld a, [H_SPTEMP + 1]
	ld l, a
	ld sp, hl
	ret

; Copies [H_VBCOPYBGNUMROWS] rows from H_VBCOPYBGSRC to H_VBCOPYBGDEST.
; If H_VBCOPYBGSRC is XX00, the transfer is disabled.
VBlankCopyBgMap::
	ld a,[H_VBCOPYBGSRC] ; doubles as enabling byte
	and a
	ret z
	ld hl,sp + 0
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

	ld hl, sp + 0
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

	ld hl, sp + 0
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
; Copy [H_VBCOPYSIZE] 2bpp tiles (or 16 * [H_VBCOPYSIZE] tile map entries)
; from H_VBCOPYSRC to H_VBCOPYDEST.

; Source and destination addresses are updated,
; so transfer can continue in subsequent calls.

	ld a, [H_VBCOPYSIZE]
	and a
	ret z

	ld hl, sp + 0
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

	ld hl, sp + 0
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

	ld a, [hTilesetType]
	and a
	ret z ; no animations if indoors (or if a menu set this to 0)

	ld a, [hMovingBGTilesCounter1]
	inc a
	ld [hMovingBGTilesCounter1], a
	cp 20
	ret c
	cp 21
	jr z, .flower

; water

	ld hl, vTileset + $14 * $10
	ld c, $10

	ld a, [wMovingBGTilesCounter2]
	inc a
	and 7
	ld [wMovingBGTilesCounter2], a

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
	ld a, [hTilesetType]
	rrca
	ret nc
; if in a cave, no flower animations
	xor a
	ld [hMovingBGTilesCounter1], a
	ret

.flower
	xor a
	ld [hMovingBGTilesCounter1], a

	ld a, [wMovingBGTilesCounter2]
	and 3
	cp 2
	ld hl, FlowerTile1
	jr c, .copy
	ld hl, FlowerTile2
	jr z, .copy
	ld hl, FlowerTile3
.copy
	ld de, vTileset + $3 * $10
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
