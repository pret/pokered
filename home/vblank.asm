VBlank::

	push af
	push bc
	push de
	push hl

	ld a, [hLoadedROMBank]
	ld [wVBlankSavedROMBank], a

	ld a, [hSCX]
	ld [rSCX], a
	ld a, [hSCY]
	ld [rSCY], a

	ld a, [wDisableVBlankWYUpdate]
	and a
	jr nz, .ok
	ld a, [hWY]
	ld [rWY], a
.ok

	call AutoBgMapTransfer
	call VBlankCopyBgMap
	call RedrawRowOrColumn
	call VBlankCopy
	call VBlankCopyDouble
	call UpdateMovingBgTiles
	call hDMARoutine
	ld a, BANK(PrepareOAMData)
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call PrepareOAMData

	; VBlank-sensitive operations end.

	call Random

	ld a, [hVBlankOccurred]
	and a
	jr z, .skipZeroing
	xor a
	ld [hVBlankOccurred], a

.skipZeroing
	ld a, [hFrameCounter]
	and a
	jr z, .skipDec
	dec a
	ld [hFrameCounter], a

.skipDec
	call FadeOutAudio

	ld a, [wAudioROMBank] ; music ROM bank
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a

	cp BANK(Audio1_UpdateMusic)
	jr nz, .checkForAudio2
.audio1
	call Audio1_UpdateMusic
	jr .afterMusic
.checkForAudio2
	cp BANK(Audio2_UpdateMusic)
	jr nz, .audio3
.audio2
	call Music_DoLowHealthAlarm
	call Audio2_UpdateMusic
	jr .afterMusic
.audio3
	call Audio3_UpdateMusic
.afterMusic

	callba TrackPlayTime ; keep track of time played

	ld a, [hDisableJoypadPolling]
	and a
	call z, ReadJoypad

	ld a, [wVBlankSavedROMBank]
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a

	pop hl
	pop de
	pop bc
	pop af
	reti


DelayFrame::
; Wait for the next vblank interrupt.
; As a bonus, this saves battery.

NOT_VBLANKED EQU 1

	ld a, NOT_VBLANKED
	ld [hVBlankOccurred], a
.halt
	halt
	ld a, [hVBlankOccurred]
	and a
	jr nz, .halt
	ret
