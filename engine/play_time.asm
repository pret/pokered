Func_18dee: ; 18dee (6:4dee)
	call Func_18e36
	ld a, [$d732]
	bit 0, a
	ret z
	ld a, [W_PLAYTIMEMINUTES] ; $da42
	and a
	ret nz
	ld a, [W_PLAYTIMEFRAMES] ; $da45
	inc a
	ld [W_PLAYTIMEFRAMES], a ; $da45
	cp 60
	ret nz
	xor a
	ld [W_PLAYTIMEFRAMES], a ; $da45
	ld a, [W_PLAYTIMESECONDS] ; $da44
	inc a
	ld [W_PLAYTIMESECONDS], a ; $da44
	cp 60
	ret nz
	xor a
	ld [W_PLAYTIMESECONDS], a ; $da44
	ld a, [$da43]
	inc a
	ld [$da43], a
	cp 60
	ret nz
	xor a
	ld [$da43], a
	ld a, [$da41]
	inc a
	ld [$da41], a
	cp $ff
	ret nz
	ld a, $ff
	ld [W_PLAYTIMEMINUTES], a ; $da42
	ret

Func_18e36: ; 18e36 (6:4e36)
	ld a, [$d13a]
	and a
	jr nz, .asm_18e40
	ld a, $ff
	jr .asm_18e41
.asm_18e40
	dec a
.asm_18e41
	ld [$d13a], a
	and a
	ret nz
	ld a, [$d730]
	res 1, a
	res 2, a
	bit 5, a
	res 5, a
	ld [$d730], a
	ret z
	xor a
	ld [hJoyPressed], a
	ld [hJoyHeld], a
	ret
