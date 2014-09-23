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
	ld [rSB], a
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
	ld [MBC1RomBank], a
	call WriteDMACodeToHRAM

	xor a
	ld [hTilesetType], a
	ld [$ff41], a
	ld [$ffae], a
	ld [$ffaf], a
	ld [$ff0f], a
	ld a, 1 << VBLANK + 1 << TIMER + 1 << SERIAL
	ld [rIE], a

	ld a, 144 ; move the window off-screen
	ld [hWY], a
	ld [rWY], a
	ld a, 7
	ld [rWX], a

	ld a, $ff
	ld [$ffaa], a

	ld h, vBGMap0 / $100
	call ClearBgMap
	ld h, vBGMap1 / $100
	call ClearBgMap

	ld a, rLCDC_DEFAULT
	ld [rLCDC], a
	ld a, 16
	ld [hSoftReset], a
	call StopAllSounds

	ei

	predef LoadSGB

	ld a, BANK(SFX_1f_67)
	ld [wc0ef], a
	ld [wc0f0], a
	ld a, $9c
	ld [$ffbd], a
	xor a
	ld [$ffbc], a
	dec a
	ld [wUpdateSpritesEnabled], a

	predef PlayIntro

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
	ld a, BANK(Music2_UpdateMusic)
	ld [wc0ef], a
	ld [wc0f0], a
	xor a
	ld [wMusicHeaderPointer], a
	ld [wc0ee], a
	ld [wcfca], a
	dec a
	jp PlaySound
