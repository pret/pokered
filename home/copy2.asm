FarCopyData2::
; Identical to FarCopyData, but uses hROMBankTemp
; as temp space instead of wBuffer.
	ldh [hROMBankTemp], a
	ldh a, [hLoadedROMBank]
	push af
	ldh a, [hROMBankTemp]
	call SetCurBank
	rst _CopyData
	pop af
	jp SetCurBank

FarCopyData3::
; Copy bc bytes from a:de to hl.
	ldh [hROMBankTemp], a
	ldh a, [hLoadedROMBank]
	push af
	ldh a, [hROMBankTemp]
	call SetCurBank
	push hl
	push de
	push de
	ld d, h
	ld e, l
	pop hl
	rst _CopyData
	pop de
	pop hl
	pop af
	jp SetCurBank

;;;;;;;;;; PureRGBnote: ADDED: these functions are used when loading maps to get everything loaded without having to disable LCD
FarCopyData4::
	ldh [hROMBankTemp], a
	ldh a, [hLoadedROMBank]
	push af
	ldh a, [hROMBankTemp]
	call SetCurBank
	call CheckSpecialCopyData
	pop af
	jp SetCurBank

CheckSpecialCopyData:
	push af
	ldh a, [hFlagsFFFA]
	bit 3, a
	jr nz, .specialCopy
	pop af
	rst _CopyData
	ret
.specialCopy
	pop af
	; fall through

SpecialCopyData:
	di	;prevent vblank functions from running
.waitVRAM
	ldh a, [rSTAT]		;2 cycles - read from stat register to get the mode
	and %10				;4 cycles
	jr nz, .waitVRAM	;6 cycles to pass or 10 to loop
; Copy bc bytes from hl to de.
	ld a, [hli]			;4 cycles
	ld [de], a			;2 cycles
;this should result in 9 cycles of wiggle-room in the worst case
	inc de
	dec bc
	ei	;re-enable vblank functions
	ld a, c
	or b
	jr nz, SpecialCopyData
	ret
;;;;;;;;;;

FarCopyDataDouble::
; Expand bc bytes of 1bpp image data
; from a:hl to 2bpp data at de.
	ldh [hROMBankTemp], a
	ldh a, [hLoadedROMBank]
	push af
	ldh a, [hROMBankTemp]
	call SetCurBank
.loop
	ld a, [hli]
	ld [de], a
	inc de
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	pop af
	jp SetCurBank

CopyVideoData::
; Wait for the next VBlank, then copy c 2bpp
; tiles from b:de to hl, 8 tiles at a time.
; This takes c/8 frames.

	ldh a, [hAutoBGTransferEnabled]
	push af
	xor a ; disable auto-transfer while copying
	ldh [hAutoBGTransferEnabled], a

	ldh a, [hLoadedROMBank]
	ldh [hROMBankTemp], a

	ld a, b
	call SetCurBank

	ld a, e
	ldh [hVBlankCopySource], a
	ld a, d
	ldh [hVBlankCopySource + 1], a

	ld a, l
	ldh [hVBlankCopyDest], a
	ld a, h
	ldh [hVBlankCopyDest + 1], a

.loop
	ld a, c
	cp 8
	jr nc, .keepgoing

.done
	ldh [hVBlankCopySize], a
	rst _DelayFrame
	ldh a, [hROMBankTemp]
	call SetCurBank
	pop af
	ldh [hAutoBGTransferEnabled], a
	ret

.keepgoing
	ld a, 8
	ldh [hVBlankCopySize], a
	rst _DelayFrame
	ld a, c
	sub 8
	ld c, a
	jr .loop

CopyVideoDataDouble::
; Wait for the next VBlank, then copy c 1bpp
; tiles from b:de to hl, 8 tiles at a time.
; This takes c/8 frames.
	ldh a, [hAutoBGTransferEnabled]
	push af
	xor a ; disable auto-transfer while copying
	ldh [hAutoBGTransferEnabled], a
	ldh a, [hLoadedROMBank]
	ldh [hROMBankTemp], a

	ld a, b
	call SetCurBank

	ld a, e
	ldh [hVBlankCopyDoubleSource], a
	ld a, d
	ldh [hVBlankCopyDoubleSource + 1], a

	ld a, l
	ldh [hVBlankCopyDoubleDest], a
	ld a, h
	ldh [hVBlankCopyDoubleDest + 1], a

.loop
	ld a, c
	cp 8
	jr nc, .keepgoing

.done
	ldh [hVBlankCopyDoubleSize], a
	rst _DelayFrame
	ldh a, [hROMBankTemp]
	call SetCurBank
	pop af
	ldh [hAutoBGTransferEnabled], a
	ret

.keepgoing
	ld a, 8
	ldh [hVBlankCopyDoubleSize], a
	rst _DelayFrame
	ld a, c
	sub 8
	ld c, a
	jr .loop

ClearScreenArea::
; Clear tilemap area cxb at hl.
	ld a, " " ; blank tile
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
	decoord 0, 6 * 0
	call .setup
	rst _DelayFrame

	ld hl, $600 * 1
	decoord 0, 6 * 1
	call .setup
	rst _DelayFrame

	ld hl, $600 * 2
	decoord 0, 6 * 2
	call .setup
	rst _DelayFrame
	ret

.setup
	ld a, d
	ldh [hVBlankCopyBGSource+1], a
	call GetRowColAddressBgMap
	ld a, l
	ldh [hVBlankCopyBGDest], a
	ld a, h
	ldh [hVBlankCopyBGDest+1], a
	ld a, c
	ldh [hVBlankCopyBGNumRows], a
	ld a, e
	ldh [hVBlankCopyBGSource], a
	ret

ClearScreen::
; Clear wTileMap, then wait
; for the bg map to update.
	ld bc, 20 * 18
	inc b
	hlcoord 0, 0
	ld a, " "
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	jp Delay3
