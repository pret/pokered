Func_79f54: ; 79f54 (1e:5f54)
	ld a, $1
	ld [wcd50], a
	ld a, [wcfcb]
	push af
	ld a, $ff
	ld [wcfcb], a
	ld a, $e4
	ld [rOBP1], a ; $ff49
	call LoadSmokeTileFourTimes
	callba asm_f055
	ld c, $8
.asm_79f73
	push bc
	call Func_79f92
	ld bc, .asm_79f7e
	push bc
	ld c, $4
	jp [hl]
.asm_79f7e
	ld a, [rOBP1] ; $ff49
	xor $64
	ld [rOBP1], a ; $ff49
	call Delay3
	pop bc
	dec c
	jr nz, .asm_79f73
	pop af
	ld [wcfcb], a
	jp LoadPlayerSpriteGraphics

Func_79f92: ; 79f92 (1e:5f92)
	ld a, [wSpriteStateData1 + 9]
	ld hl, PointerTable_79fb0 ; $5fb0
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld [wd08a], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld hl, wOAMBuffer + $90
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ret

PointerTable_79fb0: ; 79fb0 (1e:5fb0)
	db $FF,$00
	dw Func_79350

	db $01,$00
	dw Func_79350

	db $01,$01
	dw Func_79337

	db $FF,$01
	dw Func_79337

LoadSmokeTileFourTimes: ; 79fc0 (1e:5fc0)
	ld hl, vChars1 + $7c0
	ld c, $4
.loop
	push bc
	push hl
	call LoadSmokeTile
	pop hl
	ld bc, $10
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	ret

LoadSmokeTile: ; 79fd4 (1e:5fd4)
	ld de, SSAnneSmokePuffTile ; $5fdd
	ld bc, (BANK(SSAnneSmokePuffTile) << 8) + $01
	jp CopyVideoData

SSAnneSmokePuffTile: ; 79fdd (1e:5fdd)
	INCBIN "gfx/ss_anne_smoke_puff.2bpp"
