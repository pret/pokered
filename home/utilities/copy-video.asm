CopyVideoData::
; Wait for the next VBlank, then copy c 2bpp
; tiles from b:de to hl, 8 tiles at a time.
; This takes c/8 frames.

	ld a, [H_AUTOBGTRANSFERENABLED]
	push af
	xor a ; disable auto-transfer while copying
	ld [H_AUTOBGTRANSFERENABLED], a

	ld a, [H_LOADEDROMBANK]
	ld [$ff8b], a

	ld a, b
	ld [H_LOADEDROMBANK], a
	ld [MBC3RomBank], a

	ld a, e
	ld [H_VBCOPYSRC], a
	ld a, d
	ld [H_VBCOPYSRC + 1], a

	ld a, l
	ld [H_VBCOPYDEST], a
	ld a, h
	ld [H_VBCOPYDEST + 1], a

.loop
	ld a, c
	cp 8
	jr nc, .keepgoing

.done
	ld [H_VBCOPYSIZE], a
	call DelayFrame
	ld a, [$ff8b]
	ld [H_LOADEDROMBANK], a
	ld [MBC3RomBank], a
	pop af
	ld [H_AUTOBGTRANSFERENABLED], a
	ret

.keepgoing
	ld a, 8
	ld [H_VBCOPYSIZE], a
	call DelayFrame
	ld a, c
	sub 8
	ld c, a
	jr .loop

CopyVideoDataDouble::
; Wait for the next VBlank, then copy c 1bpp
; tiles from b:de to hl, 8 tiles at a time.
; This takes c/8 frames.
	ld a, [H_AUTOBGTRANSFERENABLED]
	push af
	xor a ; disable auto-transfer while copying
	ld [H_AUTOBGTRANSFERENABLED], a
	ld a, [H_LOADEDROMBANK]
	ld [$ff8b], a

	ld a, b
	ld [H_LOADEDROMBANK], a
	ld [MBC3RomBank], a

	ld a, e
	ld [H_VBCOPYDOUBLESRC], a
	ld a, d
	ld [H_VBCOPYDOUBLESRC + 1], a

	ld a, l
	ld [H_VBCOPYDOUBLEDEST], a
	ld a, h
	ld [H_VBCOPYDOUBLEDEST + 1], a

.loop
	ld a, c
	cp 8
	jr nc, .keepgoing

.done
	ld [H_VBCOPYDOUBLESIZE], a
	call DelayFrame
	ld a, [$ff8b]
	ld [H_LOADEDROMBANK], a
	ld [MBC3RomBank], a
	pop af
	ld [H_AUTOBGTRANSFERENABLED], a
	ret

.keepgoing
	ld a, 8
	ld [H_VBCOPYDOUBLESIZE], a
	call DelayFrame
	ld a, c
	sub 8
	ld c, a
	jr .loop