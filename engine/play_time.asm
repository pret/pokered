Func_18dee: ; 18dee (6:4dee)
	call Func_18e36
	ld a, [wd732]
	bit 0, a
	ret z
	ld a, [W_PLAYTIMEMINUTES] ; wda42
	and a
	ret nz
	ld a, [W_PLAYTIMEFRAMES] ; wda45
	inc a
	ld [W_PLAYTIMEFRAMES], a ; wda45
	cp 60
	ret nz
	xor a
	ld [W_PLAYTIMEFRAMES], a ; wda45
	ld a, [W_PLAYTIMESECONDS] ; wda44
	inc a
	ld [W_PLAYTIMESECONDS], a ; wda44
	cp 60
	ret nz
	xor a
	ld [W_PLAYTIMESECONDS], a ; wda44
	ld a, [W_PLAYTIMEMINUTES + 1]
	inc a
	ld [W_PLAYTIMEMINUTES + 1], a
	cp 60
	ret nz
	xor a
	ld [W_PLAYTIMEMINUTES + 1], a
	ld a, [W_PLAYTIMEHOURS + 1]
	inc a
	ld [W_PLAYTIMEHOURS + 1], a
	cp $ff
	ret nz
	ld a, $ff
	ld [W_PLAYTIMEMINUTES], a ; wda42
	ret

Func_18e36: ; 18e36 (6:4e36)
	ld a, [wd13a]
	and a
	jr nz, .asm_18e40
	ld a, $ff
	jr .asm_18e41
.asm_18e40
	dec a
.asm_18e41
	ld [wd13a], a
	and a
	ret nz
	ld a, [wd730]
	res 1, a
	res 2, a
	bit 5, a
	res 5, a
	ld [wd730], a
	ret z
	xor a
	ld [hJoyPressed], a
	ld [hJoyHeld], a
	ret
