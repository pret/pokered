LoadShootingStarGraphics: ; 70000 (1c:4000)
	ld a, $f9
	ld [rOBP0], a
	ld a, $a4
	ld [rOBP1], a
	ld de, AnimationTileset2 + $30 ; star tile (top left quadrant)
	ld hl, vChars1 + $200
	ld bc, (BANK(AnimationTileset2) << 8) + $01
	call CopyVideoData
	ld de, AnimationTileset2 + $130 ; star tile (bottom left quadrant)
	ld hl, vChars1 + $210
	ld bc, (BANK(AnimationTileset2) << 8) + $01
	call CopyVideoData
	ld de, FallingStar
	ld hl, vChars1 + $220
	ld bc, (BANK(FallingStar) << 8) + $01
	call CopyVideoData
	ld hl, GameFreakLogoOAMData
	ld de, wOAMBuffer + $60
	ld bc, $40
	call CopyData
	ld hl, GameFreakShootingStarOAMData
	ld de, wOAMBuffer
	ld bc, $10
	jp CopyData

AnimateShootingStar: ; 70044 (1c:4044)
	call LoadShootingStarGraphics
	ld a, (SFX_1f_67 - SFX_Headers_1f) / 3
	call PlaySound
	ld hl, wOAMBuffer
	ld bc, $a004
.asm_70052
	push hl
	push bc
.asm_70054
	ld a, [hl]
	add $4
	ld [hli], a
	ld a, [hl]
	add $fc
	ld [hli], a
	inc hl
	inc hl
	dec c
	jr nz, .asm_70054
	ld c, $1
	call CheckForUserInterruption
	pop bc
	pop hl
	ret c
	ld a, [hl]
	cp $50
	jr nz, .asm_70070
	jr .asm_70052
.asm_70070
	cp b
	jr nz, .asm_70052
	ld hl, wOAMBuffer
	ld c, $4
	ld de, $4
.asm_7007b
	ld [hl], $a0
	add hl, de
	dec c
	jr nz, .asm_7007b
	ld b, $3
.asm_70083
	ld hl, rOBP0
	rrc [hl]
	rrc [hl]
	ld c, $a
	call CheckForUserInterruption
	ret c
	dec b
	jr nz, .asm_70083
	ld de, wOAMBuffer
	ld a, $18
.asm_70098
	push af
	ld hl, OAMData_700ee
	ld bc, $4
	call CopyData
	pop af
	dec a
	jr nz, .asm_70098
	xor a
	ld [wWhichTrade], a
	ld hl, PointerTable_700f2
	ld c, $6
.asm_700af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push bc
	push hl
	ld hl, wOAMBuffer + $50
	ld c, $4
.asm_700ba
	ld a, [de]
	cp $ff
	jr z, .asm_700d5
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	inc hl
	inc hl
	dec c
	jr nz, .asm_700ba
	ld a, [wWhichTrade]
	cp $18
	jr z, .asm_700d5
	add $6
	ld [wWhichTrade], a
.asm_700d5
	call Func_7011f
	push af
	ld hl, wOAMBuffer + $10
	ld de, wOAMBuffer
	ld bc, $50
	call CopyData
	pop af
	pop hl
	pop bc
	ret c
	dec c
	jr nz, .asm_700af
	and a
	ret

OAMData_700ee: ; 700ee (1c:40ee)
	db $00,$00,$A2,$90

PointerTable_700f2: ; 700f2 (1c:40f2)
	dw OAMData_700fe
	dw OAMData_70106
	dw OAMData_7010e
	dw OAMData_70116
	dw OAMData_7011e
	dw OAMData_7011e

; each entry is only half of an OAM tile
OAMData_700fe: ; 700fe (1c:40fe)
	db $68,$30
	db $68,$40
	db $68,$58
	db $68,$78

OAMData_70106: ; 70106 (1c:4106)
	db $68,$38
	db $68,$48
	db $68,$60
	db $68,$70

OAMData_7010e: ; 7010e (1c:410e)
	db $68,$34
	db $68,$4C
	db $68,$54
	db $68,$64

OAMData_70116: ; 70116 (1c:4116)
	db $68,$3C
	db $68,$5C
	db $68,$6C
	db $68,$74

OAMData_7011e: ; 7011e (1c:411e)
	db $FF

Func_7011f: ; 7011f (1c:411f)
	ld b, $8
.asm_70121
	ld hl, wOAMBuffer + $5c
	ld a, [wWhichTrade]
	ld de, $fffc
	ld c, a
.asm_7012b
	inc [hl]
	add hl, de
	dec c
	jr nz, .asm_7012b
	ld a, [rOBP1]
	xor $a0
	ld [rOBP1], a
	ld c, $3
	call CheckForUserInterruption
	ret c
	dec b
	jr nz, .asm_70121
	ret

GameFreakLogoOAMData: ; 70140 (1c:4140)
	db $48,$50,$8D,$00
	db $48,$58,$8E,$00
	db $50,$50,$8F,$00
	db $50,$58,$90,$00
	db $58,$50,$91,$00
	db $58,$58,$92,$00
	db $60,$30,$80,$00
	db $60,$38,$81,$00
	db $60,$40,$82,$00
	db $60,$48,$83,$00
	db $60,$50,$93,$00
	db $60,$58,$84,$00
	db $60,$60,$85,$00
	db $60,$68,$83,$00
	db $60,$70,$81,$00
	db $60,$78,$86,$00

GameFreakShootingStarOAMData: ; 70180 (1c:4180)
	db $00,$A0,$A0,$10
	db $00,$A8,$A0,$30
	db $08,$A0,$A1,$10
	db $08,$A8,$A1,$30

FallingStar: ; 70190 (1c:4190)
	INCBIN "gfx/falling_star.2bpp"
