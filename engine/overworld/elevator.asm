ShakeElevator: ; 7bf15 (1e:7f15)
	ld de, $ffe0
	call Func_7bf64
	ld de, $240
	call Func_7bf64
	call Delay3
	ld a, $ff
	call PlaySound
	ld a, [$ffaf]
	ld d, a
	ld e, $1
	; number of times to play collision sfx
	ld b, $64
.asm_7bf30
	ld a, e
	xor $fe
	ld e, a
	add d
	ld [$ffaf], a
	push bc
	ld c, BANK(SFX_02_5b)
	ld a, (SFX_02_5b - SFX_Headers_02) / 3
	call PlayMusic
	pop bc
	ld c, $2
	call DelayFrames
	dec b
	jr nz, .asm_7bf30
	ld a, d
	ld [$ffaf], a
	ld a, $ff
	call PlaySound
	ld c, BANK(SFX_02_5f)
	ld a, (SFX_02_5f - SFX_Headers_02) / 3
	call PlayMusic
.asm_7bf57
	ld a, [wc02a]
	cp $b9
	jr z, .asm_7bf57
	call UpdateSprites
	jp PlayDefaultMusic

Func_7bf64: ; 7bf64 (1e:7f64)
	ld hl, wMapViewVRAMPointer + 1
	ld a, [hld]
	push af
	ld a, [hl]
	push af
	push hl
	push hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, h
	and $3
	or $98
	ld d, a
	ld a, l
	pop hl
	ld [hli], a
	ld [hl], d
	call ScheduleNorthRowRedraw
	pop hl
	pop af
	ld [hli], a
	pop af
	ld [hl], a
	jp Delay3
