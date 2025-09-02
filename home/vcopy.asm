; this function seems to be used only once
; it store the address of a row and column of the VRAM background map in hl
; INPUT: h - row, l - column, b - high byte of background tile map address in VRAM
GetRowColAddressBgMap::
	xor a
	srl h
	rra
	srl h
	rra
	srl h
	rra
	or l
	ld l, a
	ld a, b
	or h
	ld h, a
	ret

; clears a VRAM background map with blank space tiles
; INPUT: h - high byte of background tile map address in VRAM
ClearBgMap::
	ld a, " "
	jr .next
	ld a, l
.next
	ld de, BG_MAP_WIDTH * BG_MAP_HEIGHT
	ld l, e
.loop
	ld [hli], a
	dec e
	jr nz, .loop
	dec d
	jr nz, .loop
	ret

; This function redraws a BG row of height 2 or a BG column of width 2.
; One of its main uses is redrawing the row or column that will be exposed upon
; scrolling the BG when the player takes a step. Redrawing only the exposed
; row or column is more efficient than redrawing the entire screen.
; However, this function is also called repeatedly to redraw the whole screen
; when necessary. It is also used in trade animation and elevator code.
RedrawRowOrColumn::
	ldh a, [hRedrawRowOrColumnMode]
	and a
	ret z
	ld b, a
	xor a
	ldh [hRedrawRowOrColumnMode], a
	dec b
	jr nz, .redrawRow
.redrawColumn
	ld hl, wRedrawRowOrColumnSrcTiles
	ldh a, [hRedrawRowOrColumnDest]
	ld e, a
	ldh a, [hRedrawRowOrColumnDest + 1]
	ld d, a
	ld c, SCREEN_HEIGHT
.loop1
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, BG_MAP_WIDTH - 1
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
; the following 4 lines wrap us from bottom to top if necessary
	ld a, d
	and $3
	or $98
	ld d, a
	dec c
	jr nz, .loop1
	xor a
	ldh [hRedrawRowOrColumnMode], a
	ret
.redrawRow
	ld hl, wRedrawRowOrColumnSrcTiles
	ldh a, [hRedrawRowOrColumnDest]
	ld e, a
	ldh a, [hRedrawRowOrColumnDest + 1]
	ld d, a
	push de
	call .DrawHalf ; draw upper half
	pop de
	ld a, BG_MAP_WIDTH ; width of VRAM background map
	add e
	ld e, a
	; fall through and draw lower half

.DrawHalf
	ld c, SCREEN_WIDTH / 2
.loop2
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, e
	inc a
; the following 6 lines wrap us from the right edge to the left edge if necessary
	; PureRGBnote: OPTIMIZED
	xor e
	and $1f
	xor e
	;and $1f
	;ld b, a
	;ld a, e
	;and $e0
	;or b
	ld e, a
	dec c
	jr nz, .loop2
	ret

; This function automatically transfers tile number data from the tile map at
; wTileMap to VRAM during V-blank. Note that it only transfers one third of the
; background per V-blank. It cycles through which third it draws.
; This transfer is turned off when walking around the map, but is turned
; on when talking to sprites, battling, using menus, etc. This is because
; the above function, RedrawRowOrColumn, is used when walking to
; improve efficiency.
AutoBgMapTransfer::
	ldh a, [hAutoBGTransferEnabled]
	and a
	ret z
;;;;;;;; PureRGBnote: OPTIMIZED 
;;;; 11 cycles
	;ld hl, sp + 0
	;ld a, h
	;ldh [hSPTemp], a
	;ld a, l
	;ldh [hSPTemp + 1], a ; save stack pointer
;;;; 5 cycles
	ld [hSPTemp], sp
;;;;;;;;
;;;;;;;; PureRGBnote: OPTIMIZED
	ld sp, hAutoBGTransferDest
    pop hl
	ldh a, [hAutoBGTransferPortion]
	and a
	jr z, .transferTopThird
	dec a
	jr z, .transferMiddleThird
.transferBottomThird
    coord sp, 0, 12
	ld de, (12 * 32)
	add hl, de
	xor a ; TRANSFERTOP
	jr .doTransfer
.transferTopThird
    coord sp, 0, 0
	ld a, TRANSFERMIDDLE
	jr .doTransfer
.transferMiddleThird
    coord sp, 0, 6
	ld de, (6 * 32)
	add hl, de
	ld a, TRANSFERBOTTOM
;;;;;;;;
.doTransfer
	ldh [hAutoBGTransferPortion], a ; store next portion
	ld b, 6

TransferBgRows::
; unrolled loop and using pop for speed
REPT SCREEN_WIDTH / 2 - 1
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
ENDR
	pop de
	ld [hl], e
	inc l
	ld [hl], d

	ld a, BG_MAP_WIDTH - (SCREEN_WIDTH - 1)
	add l
	ld l, a
	jr nc, .ok
	inc h
.ok
	dec b
	jr nz, TransferBgRows

;;;;;;;; PureRGBnote: OPTIMIZED
;;;;; 8 cycles
	;ldh a, [hSPTemp]
	;ld h, a
	;ldh a, [hSPTemp + 1]
	;ld l, a
;;;;; 6 cycles
	ld sp, hSPTemp
	pop hl
;;;;;;;;
	ld sp, hl
	ret

; Copies [hVBlankCopyBGNumRows] rows from hVBlankCopyBGSource to hVBlankCopyBGDest.
; If hVBlankCopyBGSource is XX00, the transfer is disabled.
VBlankCopyBgMap::
	ldh a, [hVBlankCopyBGSource] ; doubles as enabling byte
	and a
	ret z
;;;;;;;; PureRGBnote: OPTIMIZED
;;;;; 19 cycles
	;ld hl, sp + 0
	;ld a, h
	;ldh [hSPTemp], a
	;ld a, l
	;ldh [hSPTemp + 1], a ; save stack pointer
	;ldh a, [hVBlankCopyBGSource]
	;ld l, a
	;ldh a, [hVBlankCopyBGSource + 1]
	;ld h, a
;;;;; 11 cycles
	ld [hSPTemp], sp
	ld sp, hVBlankCopyBGSource
	pop hl
;;;;;;;;
	ld sp, hl
	ldh a, [hVBlankCopyBGDest]
	ld l, a
	ldh a, [hVBlankCopyBGDest + 1]
	ld h, a
	ldh a, [hVBlankCopyBGNumRows]
	ld b, a
	xor a
	ldh [hVBlankCopyBGSource], a ; disable transfer so it doesn't continue next V-blank
	jr TransferBgRows


VBlankCopyDouble::
; Copy [hVBlankCopyDoubleSize] 1bpp tiles
; from hVBlankCopyDoubleSource to hVBlankCopyDoubleDest.

; While we're here, convert to 2bpp.
; The process is straightforward:
; copy each byte twice.

	ldh a, [hVBlankCopyDoubleSize]
	and a
	ret z
;;;;;;;; PureRGBnote: OPTIMIZED
;;;; 19 cycles
	;ld hl, sp + 0
	;ld a, h
	;ldh [hSPTemp], a
	;ld a, l
	;ldh [hSPTemp + 1], a

	;ldh a, [hVBlankCopyDoubleSource]
	;ld l, a
	;ldh a, [hVBlankCopyDoubleSource + 1]
	;ld h, a
;;;; 11 cycles
	ld [hSPTemp], sp
	ld sp, hVBlankCopyDoubleSource
	pop hl
;;;;;;;;
	ld sp, hl

	ldh a, [hVBlankCopyDoubleDest]
	ld l, a
	ldh a, [hVBlankCopyDoubleDest + 1]
	ld h, a

	ldh a, [hVBlankCopyDoubleSize]
	ld b, a
	xor a ; transferred
	ldh [hVBlankCopyDoubleSize], a

.loop
;;;;;;;; PureRGBnote: OPTIMIZED
;;;; More cycles
;REPT LEN_2BPP_TILE / 4 - 1
;	pop de
;	ld [hl], e
;	inc l
;	ld [hl], e
;	inc l
;	ld [hl], d
;	inc l
;	ld [hl], d
;	inc l
;ENDR
;	pop de
;	ld [hl], e
;	inc l
;	ld [hl], e
;	inc l
;	ld [hl], d
;	inc l
;	ld a, d
;	ld [hli], a
;;;; Less cycles
REPT LEN_2BPP_TILE / 4
	pop de
	ld a, e
	ld [hli], a
	ld [hli], a
	ld a, d
	ld [hli], a
	ld [hli], a
ENDR
;;;;;;;;
	dec b
	jr nz, .loop
;;;;;;;; PureRGBnote: OPTIMIZED
;;;; 27 cycles
	;ld a, l
	;ldh [hVBlankCopyDoubleDest], a
	;ld a, h
	;ldh [hVBlankCopyDoubleDest + 1], a

	;ld hl, sp + 0
	;ld a, l
	;ldh [hVBlankCopyDoubleSource], a
	;ld a, h
	;ldh [hVBlankCopyDoubleSource + 1], a

	;ldh a, [hSPTemp]
	;ld h, a
	;ldh a, [hSPTemp + 1]
	;ld l, a
;;;; 18 cycles
	ld [hVBlankCopyDoubleSource], sp
	ld sp, hVBlankCopyDoubleDest + 2
	push hl
	ld sp, hSPTemp
	pop hl
;;;;;;;;	
	ld sp, hl
	ret


VBlankCopy::
; Copy [hVBlankCopySize] 2bpp tiles (or 16 * [hVBlankCopySize] tile map entries)
; from hVBlankCopySource to hVBlankCopyDest.

; Source and destination addresses are updated,
; so transfer can continue in subsequent calls.

	ldh a, [hVBlankCopySize]
	and a
	ret z
;;;;;;;; PureRGBnote: OPTIMIZED
;;;; 19 cycles
	;ld hl, sp + 0
	;ld a, h
	;ldh [hSPTemp], a
	;ld a, l
	;ldh [hSPTemp + 1], a

	;ldh a, [hVBlankCopySource]
	;ld l, a
	;ldh a, [hVBlankCopySource + 1]
	;ld h, a
;;;; 15 cycles
	ld [hSPTemp], sp
	ld sp, hVBlankCopySource
	pop hl
	pop de
;;;;;;;;
	ld sp, hl

;;;;;;;;; PureRGBnote: OPTIMIZED
;;;; 11 cycles
	;ldh a, [hVBlankCopyDest]
	;ld l, a
	;ldh a, [hVBlankCopyDest + 1]
	;ld h, a
	;ldh a, [hVBlankCopySize]
;;;; 2 cycles
	ld h, d
	ld l, e
;;;;;;;;;
	ld b, a
	xor a ; transferred
	ldh [hVBlankCopySize], a

.loop
;;;;;;;; PureRGBnote: OPTIMIZED
REPT LEN_2BPP_TILE / 2
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
ENDR
;;;;;;;;
	dec b
	jr nz, .loop

;;;;;;;; PureRGBnote: OPTIMIZED
;;;; 27 cycles
	;ld a, l
	;ldh [hVBlankCopyDest], a
	;ld a, h
	;ldh [hVBlankCopyDest + 1], a

	;ld hl, sp + 0
	;ld a, l
	;ldh [hVBlankCopySource], a
	;ld a, h
	;ldh [hVBlankCopySource + 1], a

	;ldh a, [hSPTemp]
	;ld h, a
	;ldh a, [hSPTemp + 1]
	;ld l, a
;;;; 18 cycles
	ld [hVBlankCopySource], sp
	ld sp, hVBlankCopyDest + 2
	push hl
	ld sp, hSPTemp
	pop hl
;;;;;;;;
	ld sp, hl
	ret


UpdateMovingBgTiles::
; Animate water and flower
; tiles in the overworld.
	jpfar AnimateTiles
	
