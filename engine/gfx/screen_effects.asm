; b = new colour for BG colour 0 (usually white) for 4 frames
ChangeBGPalColor0_4Frames:
	call GetPredefRegisters
	ld a, [rBGP]
	or b
	ld [rBGP], a
	ld c, 4
	call DelayFrames
	ld a, [rBGP]
	and %11111100
	ld [rBGP], a
	ret

PredefShakeScreenVertically:
; Moves the window down and then back in a sequence of progressively smaller
; numbers of pixels, starting at b.
	call GetPredefRegisters
	ld a, 1
	ld [wDisableVBlankWYUpdate], a
	xor a
.loop
	ld [hMutateWY], a
	call .MutateWY
	call .MutateWY
	dec b
	ld a, b
	jr nz, .loop
	xor a
	ld [wDisableVBlankWYUpdate], a
	ret

.MutateWY
	ld a, [hMutateWY]
	xor b
	ld [hMutateWY], a
	ld [rWY], a
	ld c, 3
	jp DelayFrames

PredefShakeScreenHorizontally:
; Moves the window right and then back in a sequence of progressively smaller
; numbers of pixels, starting at b.
	call GetPredefRegisters
	xor a
.loop
	ld [hMutateWX], a
	call .MutateWX
	ld c, 1
	call DelayFrames
	call .MutateWX
	dec b
	ld a, b
	jr nz, .loop

; restore normal WX
	ld a, 7
	ld [rWX], a
	ret

.MutateWX
	ld a, [hMutateWX]
	xor b
	ld [hMutateWX], a
	bit 7, a
	jr z, .skipZeroing
	xor a ; zero a if it's negative
.skipZeroing
	add 7
	ld [rWX], a
	ld c, 4
	jp DelayFrames
