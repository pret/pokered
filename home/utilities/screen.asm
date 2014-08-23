ClearScreenArea::
; Clear tilemap area cxb at hl.
	ld a, $7f ; blank tile
	ld de, 20 ; screen width
.y
	push hl
	push bc
.x
	ld [hli], a
	dec c
	jr nz, .x
	pop bc
	pop hl
	add hl, de
	dec b
	jr nz, .y
	ret

CopyScreenTileBufferToVRAM::
; Copy wTileMap to the BG Map starting at b * $100.
; This is done in thirds of 6 rows, so it takes 3 frames.

	ld c, 6

	ld hl, $600 * 0
	ld de, wTileMap + 20 * 6 * 0
	call .setup
	call DelayFrame

	ld hl, $600 * 1
	ld de, wTileMap + 20 * 6 * 1
	call .setup
	call DelayFrame

	ld hl, $600 * 2
	ld de, wTileMap + 20 * 6 * 2
	call .setup
	jp DelayFrame

.setup
	ld a, d
	ld [H_VBCOPYBGSRC+1], a
	call GetRowColAddressBgMap
	ld a, l
	ld [H_VBCOPYBGDEST], a
	ld a, h
	ld [H_VBCOPYBGDEST+1], a
	ld a, c
	ld [H_VBCOPYBGNUMROWS], a
	ld a, e
	ld [H_VBCOPYBGSRC], a
	ret

ClearScreen::
; Clear wTileMap, then wait
; for the bg map to update.
	ld bc, 20 * 18
	inc b
	ld hl, wTileMap
	ld a, $7f
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	jp Delay3