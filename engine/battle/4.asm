Func_128d8: ; 128d8 (4:68d8)
	ld a, [W_YCOORD] ; $d361
	ld b, a
	ld a, [W_CURMAPHEIGHT] ; $d368
	call Func_128ea
	ret z
	ld a, [W_XCOORD] ; $d362
	ld b, a
	ld a, [W_CURMAPWIDTH] ; $d369

Func_128ea: ; 128ea (4:68ea)
	add a
	cp b
	ret z
	inc b
	ret

Func_128ef: ; 128ef (4:68ef)
	call GetPredefRegisters
	ld a, $1
	jr asm_128fb

Func_128f6: ; 128f6 (4:68f6)
	call GetPredefRegisters
	ld a, $2
asm_128fb: ; 128fb (4:68fb)
	ld [wListMenuID], a ; $cf94
	push hl
	ld a, [$cf99]
	ld b, a
	ld a, [$cf9a]
	ld c, a
	or b
	jr nz, .asm_12913
	xor a
	ld c, a
	ld e, a
	ld a, $6
	ld d, a
	jp Func_12924
.asm_12913
	ld a, [$cfba]
	ld d, a
	ld a, [$cfbb]
	ld e, a
	ld a, $26
	call Predef ; indirect jump to UpdateHPBar_LoadRegisters (f9dc (3:79dc))
	ld a, $6
	ld d, a
	ld c, a

Func_12924: ; 12924 (4:6924)
	pop hl
	push de
	push hl
	push hl
	call DrawHPBar
	pop hl
	ld a, [$fff6]
	bit 0, a
	jr z, .asm_12937
	ld bc, $9
	jr .asm_1293a
.asm_12937
	ld bc, $15
.asm_1293a
	add hl, bc
	ld de, $cf99
	ld bc, $203
	call PrintNumber
	ld a, "/"
	ld [hli], a
	ld de, $cfba
	ld bc, $203
	call PrintNumber
	pop hl
	pop de
	ret
