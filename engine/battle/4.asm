; returns whether the player is one tile outside the map in Z
IsPlayerJustOutsideMap: ; 128d8 (4:68d8)
	ld a, [W_YCOORD]
	ld b, a
	ld a, [W_CURMAPHEIGHT]
	call .compareCoordWithMapDimension
	ret z
	ld a, [W_XCOORD]
	ld b, a
	ld a, [W_CURMAPWIDTH]
.compareCoordWithMapDimension
	add a
	cp b
	ret z
	inc b
	ret

DrawHP: ; 128ef (4:68ef)
	call GetPredefRegisters
	ld a, $1
	jr asm_128fb

Func_128f6: ; 128f6 (4:68f6)
	call GetPredefRegisters
	ld a, $2
asm_128fb: ; 128fb (4:68fb)
	ld [wListMenuID], a
	push hl
	ld a, [wLoadedMonHP]
	ld b, a
	ld a, [wLoadedMonHP + 1]
	ld c, a
	or b
	jr nz, .asm_12913
	xor a
	ld c, a
	ld e, a
	ld a, $6
	ld d, a
	jp DrawHPBarAndFraction
.asm_12913
	ld a, [wLoadedMonMaxHP]
	ld d, a
	ld a, [wLoadedMonMaxHP + 1]
	ld e, a
	predef HPBarLength
	ld a, $6
	ld d, a
	ld c, a

DrawHPBarAndFraction: ; 12924 (4:6924)
	pop hl
	push de
	push hl
	push hl
	call DrawHPBar
	pop hl
	ld a, [hFlags_0xFFF6]
	bit 0, a
	jr z, .printFractionBelowBar
	ld bc, $9 ; right of bar
	jr .printHPFraction
.printFractionBelowBar
	ld bc, SCREEN_WIDTH + 1 ; below bar
.printHPFraction
	add hl, bc
	ld de, wLoadedMonHP
	ld bc, $203
	call PrintNumber
	ld a, "/"
	ld [hli], a
	ld de, wLoadedMonMaxHP
	ld bc, $203
	call PrintNumber
	pop hl
	pop de
	ret
