Func_708ca: ; 708ca (1c:48ca)
	ld a, $e4
	ld [rOBP1], a ; $ff49
	call Func_7092a
	FuncCoord 12, 0 ; $c3ac
	ld hl, Coord
	ld bc, $707
	call ClearScreenArea
	call Delay3
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld a, $91
	ld [$cee9], a
	ld a, $1
	ld [H_WHOSETURN], a ; $fff3
	callab Func_79793
	ld d, $80
	call Func_704f3
.asm_708f6
	ld c, $a
	call DelayFrames
	ld a, [rOBP1] ; $ff49
	sla a
	sla a
	ld [rOBP1], a ; $ff49
	jr nz, .asm_708f6
	call ClearSprites
	call Func_7092a
	ld b, $e4
.asm_7090d
	ld c, $a
	call DelayFrames
	ld a, [rOBP1] ; $ff49
	srl b
	rra
	srl b
	rra
	ld [rOBP1], a ; $ff49
	ld a, b
	and a
	jr nz, .asm_7090d
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	call Delay3
	jp ClearSprites

Func_7092a: ; 7092a (1c:492a)
	ld de, $9000
	ld hl, $8000
	ld bc, $31
	call CopyVideoData
	ld a, $10
	ld [W_BASECOORDY], a ; $d082
	ld a, $70
	ld [W_BASECOORDX], a ; $d081
	ld hl, wOAMBuffer
	ld bc, $606
	ld d, $8
.asm_70948
	push bc
	ld a, [W_BASECOORDY] ; $d082
	ld e, a
.asm_7094d
	ld a, e
	add $8
	ld e, a
	ld [hli], a
	ld a, [W_BASECOORDX] ; $d081
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $10
	ld [hli], a
	inc d
	dec c
	jr nz, .asm_7094d
	inc d
	ld a, [W_BASECOORDX] ; $d081
	add $8
	ld [W_BASECOORDX], a ; $d081
	pop bc
	dec b
	jr nz, .asm_70948
	ret

Func_7096d: ; 7096d (1c:496d)
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	call Delay3
	xor a
	ld [$ffb0], a
	dec a
	ld [$cfcb], a
	call DelayFrame
	ld hl, $c102
	ld a, [H_DOWNARROWBLINKCNT2] ; $ff8c
	ld c, a
	ld b, $0
	ld de, $10
.asm_70989
	ld a, [hl]
	cp $ff
	jr z, .asm_7098f
	inc b
.asm_7098f
	add hl, de
	dec c
	jr nz, .asm_70989
	ld hl, $c310
	ld c, $9
.asm_70998
	ld a, b
	swap a
	cp l
	jr z, .asm_709a9
	push hl
	push bc
	ld bc, $10
	xor a
	call FillMemory
	pop bc
	pop hl
.asm_709a9
	ld de, $10
	add hl, de
	dec c
	jr nz, .asm_70998
	call Delay3
	call LoadBattleTransitionTile
	ld bc, $0
	ld a, [W_ISLINKBATTLE] ; $d12b
	cp $4
	jr z, .asm_709c9
	call Func_709e2
	call Func_709ef
	call Func_70a19
.asm_709c9
	ld hl, PointerTable_709d2 ; $49d2
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

PointerTable_709d2: ; 709d2 (1c:49d2)
	dw Func_70d24
	dw Func_70a72
	dw Func_70ce4
	dw Func_70a72
	dw Func_70cb4
	dw Func_70b7f
	dw Func_70c7e
	dw Func_70bca

Func_709e2: ; 709e2 (1c:49e2)
	ld a, [W_CUROPPONENT] ; $d059
	cp $c8
	jr nc, .asm_709ec
	res 0, c
	ret
.asm_709ec
	set 0, c
	ret

Func_709ef: ; 709ef (1c:49ef)
	ld hl, W_PARTYMON1_HP ; $d16c
.asm_709f2
	ld a, [hli]
	or [hl]
	jr nz, .asm_709fc
	ld de, $2b
	add hl, de
	jr .asm_709f2
.asm_709fc
	ld de, $1f
	add hl, de
	ld a, [hl]
	add $3
	ld e, a
	ld a, [W_CURENEMYLVL] ; $d127
	sub e
	jr nc, .asm_70a12
	res 1, c
	ld a, $1
	ld [$cd47], a
	ret
.asm_70a12
	set 1, c
	xor a
	ld [$cd47], a
	ret

Func_70a19: ; 70a19 (1c:4a19)
	ld a, [W_CURMAP] ; $d35e
	ld e, a
	ld hl, MapIDList_70a3f ; $4a3f
.asm_70a20
	ld a, [hli]
	cp $ff
	jr z, .asm_70a2b
	cp e
	jr nz, .asm_70a20
.asm_70a28
	set 2, c
	ret
.asm_70a2b
	ld hl, MapIDList_70a44 ; $4a44
.asm_70a2e
	ld a, [hli]
	cp $ff
	jr z, .asm_70a3c
	ld d, a
	ld a, [hli]
	cp e
	jr c, .asm_70a2e
	ld a, e
	cp d
	jr nc, .asm_70a28
.asm_70a3c
	res 2, c
	ret

; Func_70a19 checks if W_CURMAP is equal to one of these maps
MapIDList_70a3f: ; 70a3f (1c:4a3f)
	db VIRIDIAN_FOREST
	db ROCK_TUNNEL_1
	db SEAFOAM_ISLANDS_1
	db ROCK_TUNNEL_2
	db $FF

; Func_70a19 checks if W_CURMAP is in between or equal to each pair of maps
MapIDList_70a44: ; 70a44 (1c:4a44)
	; all MT_MOON maps
	db MT_MOON_1
	db MT_MOON_3

	; all SS_ANNE maps, VICTORY_ROAD_1, LANCES_ROOM, and HALL_OF_FAME
	db SS_ANNE_1
	db HALL_OF_FAME

	; all POKEMONTOWER maps and Lavender Town buildings
	db LAVENDER_POKECENTER
	db LAVENDER_HOUSE_2

	; all SILPH_CO, MANSION, SAFARI_ZONE, and UNKNOWN_DUNGEON maps,
	; except for SILPH_CO_1F
	db SILPH_CO_2F
	db UNKNOWN_DUNGEON_1
	db $FF

LoadBattleTransitionTile: ; 70a4d (1c:4a4d)
	ld hl, $8ff0
	ld de, BattleTransitionTile ; $4a59
	ld bc, (BANK(BattleTransitionTile) << 8) + $01
	jp CopyVideoData

BattleTransitionTile: ; 70a59 (1c:4a59)
	INCBIN "gfx/battle_transition.2bpp"

Func_70a69: ; 70a69 (1c:4a69)
	ld a, $ff
	ld [rBGP], a ; $ff47
	ld [rOBP0], a ; $ff48
	ld [rOBP1], a ; $ff49
	ret

Func_70a72: ; 70a72 (1c:4a72)
	ld a, [$cd47]
	and a
	jr z, .asm_70a7d
	call Func_70aaa
	jr .asm_70a9f
.asm_70a7d
	FuncCoord 10, 10 ; $c472
	ld hl, Coord
	ld a, $3
	ld [$d09f], a
	ld a, l
	ld [$d09b], a
	ld a, h
	ld [$d09a], a
	ld b, $78
.asm_70a8f
	ld c, $3
.asm_70a91
	push bc
	call Func_70af9
	pop bc
	dec c
	jr nz, .asm_70a91
	call DelayFrame
	dec b
	jr nz, .asm_70a8f
.asm_70a9f
	call Func_70a69
	xor a
	ld [$d09b], a
	ld [$d09a], a
	ret

Func_70aaa: ; 70aaa (1c:4aaa)
	ld a, $7
	ld [wWhichTrade], a ; $cd3d
	ld hl, wTileMap
	ld c, $11
	ld de, $14
	call Func_70ae0
	inc c
	jr .asm_70ac3
.asm_70abd
	ld de, $14
	call Func_70ae0
.asm_70ac3
	inc c
	ld de, $1
	call Func_70ae0
	dec c
	dec c
	ld de, $ffec
	call Func_70ae0
	inc c
	ld de, rIE ; $ffff
	call Func_70ae0
	dec c
	dec c
	ld a, c
	and a
	jr nz, .asm_70abd
	ret

Func_70ae0: ; 70ae0 (1c:4ae0)
	push bc
.asm_70ae1
	ld [hl], $ff
	add hl, de
	push bc
	ld a, [wWhichTrade] ; $cd3d
	dec a
	jr nz, .asm_70af0
	call Func_70d19
	ld a, $7
.asm_70af0
	ld [wWhichTrade], a ; $cd3d
	pop bc
	dec c
	jr nz, .asm_70ae1
	pop bc
	ret

Func_70af9: ; 70af9 (1c:4af9)
	ld bc, $ffec
	ld de, $14
	ld a, [$d09b]
	ld l, a
	ld a, [$d09a]
	ld h, a
	ld a, [$d09f]
	cp $0
	jr z, .asm_70b25
	cp $1
	jr z, .asm_70b2f
	cp $2
	jr z, .asm_70b39
	cp $3
	jr z, .asm_70b43
.asm_70b1a
	ld [hl], $ff
.asm_70b1c
	ld a, l
	ld [$d09b], a
	ld a, h
	ld [$d09a], a
	ret
.asm_70b25
	dec hl
	ld a, [hl]
	cp $ff
	jr nz, .asm_70b4d
	inc hl
	add hl, bc
	jr .asm_70b1a
.asm_70b2f
	add hl, de
	ld a, [hl]
	cp $ff
	jr nz, .asm_70b4d
	add hl, bc
	dec hl
	jr .asm_70b1a
.asm_70b39
	inc hl
	ld a, [hl]
	cp $ff
	jr nz, .asm_70b4d
	dec hl
	add hl, de
	jr .asm_70b1a
.asm_70b43
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .asm_70b4d
	add hl, de
	inc hl
	jr .asm_70b1a
.asm_70b4d
	ld [hl], $ff
	ld a, [$d09f]
	inc a
	cp $4
	jr nz, .asm_70b58
	xor a
.asm_70b58
	ld [$d09f], a
	jr .asm_70b1c

Func_70b5d: ; 70b5d (1c:4b5d)
	ld hl, DataTable_70b72 ; $4b72
.asm_70b60
	ld a, [hli]
	cp $1
	jr z, .asm_70b6e
	ld [rBGP], a ; $ff47
	ld c, $2
	call DelayFrames
	jr .asm_70b60
.asm_70b6e
	dec b
	jr nz, Func_70b5d
	ret

DataTable_70b72: ; 70b72 (1c:4b72)
	db $F9,$FE,$FF,$FE,$F9,$E4,$90,$40,$00,$40,$90,$E4
	db $01 ; terminator

Func_70b7f: ; 70b7f (1c:4b7f)
	ld c, $9
.asm_70b81
	push bc
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	FuncCoord 0, 7 ; $c42c
	ld hl, Coord
	FuncCoord 0, 8 ; $c440
	ld de, Coord
	ld bc, $ffd8
	call Func_70c12
	FuncCoord 0, 10 ; $c468
	ld hl, Coord
	FuncCoord 0, 9 ; $c454
	ld de, Coord
	ld bc, $28
	call Func_70c12
	FuncCoord 8, 0 ; $c3a8
	ld hl, Coord
	FuncCoord 9, 0 ; $c3a9
	ld de, Coord
	ld bc, $fffe
	call Func_70c3f
	FuncCoord 11, 0 ; $c3ab
	ld hl, Coord
	FuncCoord 10, 0 ; $c3aa
	ld de, Coord
	ld bc, $2
	call Func_70c3f
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld c, $6
	call DelayFrames
	pop bc
	dec c
	jr nz, .asm_70b81
	call Func_70a69
	ld c, $a
	jp DelayFrames

Func_70bca: ; 70bca (1c:4bca)
	ld c, $9
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
.asm_70bcf
	push bc
	FuncCoord 0, 16 ; $c4e0
	ld hl, Coord
	FuncCoord 0, 17 ; $c4f4
	ld de, Coord
	ld bc, $ffd8
	call Func_70c12
	FuncCoord 0, 1 ; $c3b4
	ld hl, Coord
	ld de, wTileMap
	ld bc, $28
	call Func_70c12
	FuncCoord 18, 0 ; $c3b2
	ld hl, Coord
	FuncCoord 19, 0 ; $c3b3
	ld de, Coord
	ld bc, $fffe
	call Func_70c3f
	FuncCoord 1, 0 ; $c3a1
	ld hl, Coord
	ld de, wTileMap
	ld bc, $2
	call Func_70c3f
	call Func_70d19
	call Delay3
	pop bc
	dec c
	jr nz, .asm_70bcf
	call Func_70a69
	ld c, $a
	jp DelayFrames

Func_70c12: ; 70c12 (1c:4c12)
	ld a, c
	ld [wWhichTrade], a ; $cd3d
	ld a, b
	ld [$cd3e], a
	ld c, $8
.asm_70c1c
	push bc
	push hl
	push de
	ld bc, $14
	call CopyData
	pop hl
	pop de
	ld a, [wWhichTrade] ; $cd3d
	ld c, a
	ld a, [$cd3e]
	ld b, a
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_70c1c
	ld l, e
	ld h, d
	ld a, $ff
	ld c, $14
.asm_70c3a
	ld [hli], a
	dec c
	jr nz, .asm_70c3a
	ret

Func_70c3f: ; 70c3f (1c:4c3f)
	ld a, c
	ld [wWhichTrade], a ; $cd3d
	ld a, b
	ld [$cd3e], a
	ld c, $9
.asm_70c49
	push bc
	push hl
	push de
	ld c, $12
.asm_70c4e
	ld a, [hl]
	ld [de], a
	ld a, e
	add $14
	jr nc, .asm_70c56
	inc d
.asm_70c56
	ld e, a
	ld a, l
	add $14
	jr nc, .asm_70c5d
	inc h
.asm_70c5d
	ld l, a
	dec c
	jr nz, .asm_70c4e
	pop hl
	pop de
	ld a, [wWhichTrade] ; $cd3d
	ld c, a
	ld a, [$cd3e]
	ld b, a
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_70c49
	ld l, e
	ld h, d
	ld de, $14
	ld c, $12
.asm_70c77
	ld [hl], $ff
	add hl, de
	dec c
	jr nz, .asm_70c77
	ret

Func_70c7e: ; 70c7e (1c:4c7e)
	ld c, $12
	ld hl, wTileMap
	FuncCoord 1, 17 ; $c4f5
	ld de, Coord
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
.asm_70c89
	push bc
	push hl
	push de
	push de
	call Func_70caa
	pop hl
	call Func_70caa
	call Func_70d19
	pop hl
	ld bc, $ffec
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ld bc, $14
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_70c89
	jp Func_70a69

Func_70caa: ; 70caa (1c:4caa)
	ld c, $a
.asm_70cac
	ld [hl], $ff
	inc hl
	inc hl
	dec c
	jr nz, .asm_70cac
	ret

Func_70cb4: ; 70cb4 (1c:4cb4)
	ld c, $14
	ld hl, wTileMap
	FuncCoord 19, 1 ; $c3c7
	ld de, Coord
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
.asm_70cbf
	push bc
	push hl
	push de
	push de
	call Func_70cd8
	pop hl
	call Func_70cd8
	call Func_70d19
	pop de
	pop hl
	pop bc
	inc hl
	dec de
	dec c
	jr nz, .asm_70cbf
	jp Func_70a69

Func_70cd8: ; 70cd8 (1c:4cd8)
	ld c, $9
	ld de, $28
.asm_70cdd
	ld [hl], $ff
	add hl, de
	dec c
	jr nz, .asm_70cdd
	ret

Func_70ce4: ; 70ce4 (1c:4ce4)
	call Func_70cfd
	ld bc, $000a
	ld hl, Unknown_70d61
	call Func_70d06
	ld c, $a
	ld b, $1
	ld hl, Unknown_70d93
	call Func_70d06
	jp Func_70a69

Func_70cfd: ; 70cfd (1c:4cfd)
	ld b, $3
	call Func_70b5d
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ret

Func_70d06: ; 70d06 (1c:4d06)
	push bc
	push hl
	ld a, b
	call Func_70d50
	pop hl
	ld bc, $0005
	add hl, bc
	call Func_70d19
	pop bc
	dec c
	jr nz, Func_70d06
	ret

Func_70d19: ; 70d19 (1c:4d19)
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	call Delay3
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ret

Func_70d24: ; 70d24 (1c:4d24)
	call Func_70cfd
	ld c, $a
	ld hl, Unknown_70d61 ; $4d61
	ld de, Unknown_70d93 ; $4d93
.asm_70d2f
	push bc
	push hl
	push de
	push de
	xor a
	call Func_70d50
	pop hl
	ld a, $1
	call Func_70d50
	pop hl
	ld bc, $5
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	add hl, bc
	call Func_70d19
	pop bc
	dec c
	jr nz, .asm_70d2f
	jp Func_70a69

Func_70d50: ; 70d50 (1c:4d50)
	ld [wWhichTrade], a ; $cd3d
	ld a, [hli]
	ld [$cd3e], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp Func_70dc5

Unknown_70d61: ; 70d61 (1c:4d61)
	db $01
	dw Unknown_70dfe
	FuncCoord 18, 6
	dw Coord

	db $01
	dw Unknown_70e04
	FuncCoord 19, 3
	dw Coord

	db $01
	dw Unknown_70e0e
	FuncCoord 18, 0
	dw Coord

	db $01
	dw Unknown_70e20
	FuncCoord 14, 0
	dw Coord

	db $01
	dw Unknown_70e2e
	FuncCoord 10, 0
	dw Coord

	db $00
	dw Unknown_70e2e
	FuncCoord 9, 0
	dw Coord

	db $00
	dw Unknown_70e20
	FuncCoord 5, 0
	dw Coord

	db $00
	dw Unknown_70e0e
	FuncCoord 1, 0
	dw Coord

	db $00
	dw Unknown_70e04
	FuncCoord 0, 3
	dw Coord

	db $00
	dw Unknown_70dfe
	FuncCoord 1, 6
	dw Coord

Unknown_70d93: ; 70d93 (1c:4d93)
	db $00
	dw Unknown_70dfe
	FuncCoord 1, 11
	dw Coord

	db $00
	dw Unknown_70e04
	FuncCoord 0, 14
	dw Coord

	db $00
	dw Unknown_70e0e
	FuncCoord 1, 17
	dw Coord

	db $00
	dw Unknown_70e20
	FuncCoord 5, 17
	dw Coord

	db $00
	dw Unknown_70e2e
	FuncCoord 9, 17
	dw Coord

	db $01
	dw Unknown_70e2e
	FuncCoord 10, 17
	dw Coord

	db $01
	dw Unknown_70e20
	FuncCoord 14, 17
	dw Coord

	db $01
	dw Unknown_70e0e
	FuncCoord 18, 17
	dw Coord

	db $01
	dw Unknown_70e04
	FuncCoord 19, 14
	dw Coord

	db $01
	dw Unknown_70dfe
	FuncCoord 18, 11
	dw Coord

Func_70dc5: ; 70dc5 (1c:4dc5)
	push hl
	ld a, [de]
	ld c, a
	inc de
.asm_70dc9
	ld [hl], $ff
	ld a, [$cd3e]
	and a
	jr z, .asm_70dd4
	inc hl
	jr .asm_70dd5
.asm_70dd4
	dec hl
.asm_70dd5
	dec c
	jr nz, .asm_70dc9
	pop hl
	ld a, [wWhichTrade] ; $cd3d
	and a
	ld bc, $14
	jr z, .asm_70de5
	ld bc, $ffec
.asm_70de5
	add hl, bc
	ld a, [de]
	inc de
	cp $ff
	ret z
	and a
	jr z, Func_70dc5
	ld c, a
.asm_70def
	ld a, [$cd3e]
	and a
	jr z, .asm_70df8
	dec hl
	jr .asm_70df9
.asm_70df8
	inc hl
.asm_70df9
	dec c
	jr nz, .asm_70def
	jr Func_70dc5

Unknown_70dfe: ; 70dfe (1c:4dfe)
	db $02,$03,$05,$04,$09,$FF

Unknown_70e04: ; 70e04 (1c:4e04)
	db $01,$01,$02,$02,$04,$02,$04,$02,$03,$FF

Unknown_70e0e: ; 70e0e (1c:4e0e)
	db $02,$01,$03,$01,$04,$01,$04,$01,$04,$01,$03,$01,$02,$01,$01,$01,$01,$FF

Unknown_70e20: ; 70e20 (1c:4e20)
	db $04,$01,$04,$00,$03,$01,$03,$00,$02,$01,$02,$00,$01,$FF

Unknown_70e2e: ; 70e2e (1c:4e2e)
	db $04,$00,$03,$00,$03,$00,$02,$00,$02,$00,$01,$00,$01,$00,$01,$FF
