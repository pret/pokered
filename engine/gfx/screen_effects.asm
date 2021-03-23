; b = new color for BG color 0 (usually white) for 4 frames
ChangeBGPalColor0_4Frames:
	call GetPredefRegisters
	ldh a, [rBGP]
	or b
	ldh [rBGP], a
	ld c, 4
	call DelayFrames
	ldh a, [rBGP]
	and %11111100
	ldh [rBGP], a
	ret

PredefShakeScreenVertically:
; Moves the window down and then back in a sequence of progressively smaller
; numbers of pixels, starting at b.
	call GetPredefRegisters
	ld a, 1
	ld [wDisableVBlankWYUpdate], a
	xor a
.loop
	ldh [hMutateWY], a
	call .MutateWY
	call .MutateWY
	dec b
	ld a, b
	jr nz, .loop
	xor a
	ld [wDisableVBlankWYUpdate], a
	ret

.MutateWY
	ldh a, [hMutateWY]
	xor b
	ldh [hMutateWY], a
	ldh [rWY], a
	ld c, 3
	jp DelayFrames

PredefShakeScreenHorizontally:
; Moves the window right and then back in a sequence of progressively smaller
; numbers of pixels, starting at b.
	call GetPredefRegisters
	xor a
.loop
	ldh [hMutateWX], a
	call .MutateWX
	ld c, 1
	call DelayFrames
	call .MutateWX
	dec b
	ld a, b
	jr nz, .loop

; restore normal WX
	ld a, 7
	ldh [rWX], a
	ret

.MutateWX
	ldh a, [hMutateWX]
	xor b
	ldh [hMutateWX], a
	bit 7, a
	jr z, .skipZeroing
	xor a ; zero a if it's negative
.skipZeroing
	add 7
	ldh [rWX], a
	ld c, 4
	jp DelayFrames
