FarCopyData2::
; Identical to FarCopyData, but uses hROMBankTemp
; as temp space instead of wBuffer.
	ld [hROMBankTemp], a
	ld a, [hLoadedROMBank]
	push af
	ld a, [hROMBankTemp]
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call CopyData
	pop af
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

FarCopyData3::
; Copy bc bytes from a:de to hl.
	ld [hROMBankTemp], a
	ld a, [hLoadedROMBank]
	push af
	ld a, [hROMBankTemp]
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	push hl
	push de
	push de
	ld d, h
	ld e, l
	pop hl
	call CopyData
	pop de
	pop hl
	pop af
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

FarCopyDataDouble::
; Expand bc bytes of 1bpp image data
; from a:hl to 2bpp data at de.
	ld [hROMBankTemp], a
	ld a, [hLoadedROMBank]
	push af
	ld a, [hROMBankTemp]
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
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
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

CopyVideoData::
; Wait for the next VBlank, then copy c 2bpp
; tiles from b:de to hl, 8 tiles at a time.
; This takes c/8 frames.

	ld a, [hAutoBGTransferEnabled]
	push af
	xor a ; disable auto-transfer while copying
	ld [hAutoBGTransferEnabled], a

	ld a, [hLoadedROMBank]
	ld [hROMBankTemp], a

	ld a, b
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a

	ld a, e
	ld [hVBlankCopySource], a
	ld a, d
	ld [hVBlankCopySource + 1], a

	ld a, l
	ld [hVBlankCopyDest], a
	ld a, h
	ld [hVBlankCopyDest + 1], a

.loop
	ld a, c
	cp 8
	jr nc, .keepgoing

.done
	ld [hVBlankCopySize], a
	call DelayFrame
	ld a, [hROMBankTemp]
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	pop af
	ld [hAutoBGTransferEnabled], a
	ret

.keepgoing
	ld a, 8
	ld [hVBlankCopySize], a
	call DelayFrame
	ld a, c
	sub 8
	ld c, a
	jr .loop

CopyVideoDataDouble::
; Wait for the next VBlank, then copy c 1bpp
; tiles from b:de to hl, 8 tiles at a time.
; This takes c/8 frames.
	ld a, [hAutoBGTransferEnabled]
	push af
	xor a ; disable auto-transfer while copying
	ld [hAutoBGTransferEnabled], a
	ld a, [hLoadedROMBank]
	ld [hROMBankTemp], a

	ld a, b
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a

	ld a, e
	ld [hVBlankCopyDoubleSource], a
	ld a, d
	ld [hVBlankCopyDoubleSource + 1], a

	ld a, l
	ld [hVBlankCopyDoubleDest], a
	ld a, h
	ld [hVBlankCopyDoubleDest + 1], a

.loop
	ld a, c
	cp 8
	jr nc, .keepgoing

.done
	ld [hVBlankCopyDoubleSize], a
	call DelayFrame
	ld a, [hROMBankTemp]
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	pop af
	ld [hAutoBGTransferEnabled], a
	ret

.keepgoing
	ld a, 8
	ld [hVBlankCopyDoubleSize], a
	call DelayFrame
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
	coord de, 0, 6 * 0
	call .setup
	call DelayFrame

	ld hl, $600 * 1
	coord de, 0, 6 * 1
	call .setup
	call DelayFrame

	ld hl, $600 * 2
	coord de, 0, 6 * 2
	call .setup
	jp DelayFrame

.setup
	ld a, d
	ld [hVBlankCopyBGSource+1], a
	call GetRowColAddressBgMap
	ld a, l
	ld [hVBlankCopyBGDest], a
	ld a, h
	ld [hVBlankCopyBGDest+1], a
	ld a, c
	ld [hVBlankCopyBGNumRows], a
	ld a, e
	ld [hVBlankCopyBGSource], a
	ret

ClearScreen::
; Clear wTileMap, then wait
; for the bg map to update.
	ld bc, 20 * 18
	inc b
	coord hl, 0, 0
	ld a, " "
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	jp Delay3
