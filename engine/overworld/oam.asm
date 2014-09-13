PrepareOAMData:
; Determine OAM data for currently visible
; sprites and write it to wOAMBuffer.

	ld a, [wUpdateSpritesEnabled]
	dec a
	jr z, .asm_4b1e

	cp 0 - 1
	ret nz
	ld [wUpdateSpritesEnabled], a
	jp HideSprites

.asm_4b1e
	xor a
	ld [$ff90], a
.asm_4b21
	ld [$ff8f], a

	ld d, wSpriteStateData1 / $100
	ld a, [$ff8f]
	ld e, a
	ld a, [de] ; c1x0
	and a
	jp z, .asm_4bad

	inc e
	inc e
	ld a, [de] ; c1x2 (facing/anim)
	ld [wd5cd], a
	cp $ff ; off-screen (don't draw)
	jr nz, .visible

	call Func_4bd1
	jr .asm_4bad

.visible
	cp $a0
	jr c, .usefacing
	and $f
	add $10
	jr .asm_4b48

.usefacing
	and $f
.asm_4b48
	ld l, a

	push de
	inc d
	ld a, e
	add $5
	ld e, a
	ld a, [de] ; c2x7
	and $80
	ld [$ff94], a ; temp store sprite priority
	pop de

	ld h, 0
	ld bc, SpriteFacingAndAnimationTable
	add hl, hl
	add hl, hl
	add hl, bc

	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a

	call Func_4bd1

	ld a, [$ff90]
	ld e, a
	ld d, wOAMBuffer / $100
.tile
	ld a, [$ff92]            ; temp for sprite Y position
	add $10                  ; Y=16 is top of screen (Y=0 is invisible)
	add [hl]                 ; add Y offset from table
	ld [de], a               ; write new sprite OAM Y position
	inc hl
	ld a, [$ff91]            ; temp for sprite X position
	add $8                   ; X=8 is left of screen (X=0 is invisible)
	add [hl]                 ; add X offset from table
	inc e
	ld [de], a               ; write new sprite OAM X position
	inc e
	ld a, [bc]               ; read pattern number offset (accomodates orientation (offset 0,4 or 8) and animation (offset 0 or $80))
	inc bc
	push bc
	ld b, a

	ld a, [wd5cd]            ; temp copy of c1x2
	swap a                   ; high nybble determines sprite used (0 is always player sprite, next are some npcs)
	and $f

	; Sprites $a and $b have one face (and therefore 4 tiles instead of 12).
	; As a result, sprite $b's tile offset is less than normal.
	cp $b
	jr nz, .offset
	ld a, $a * 12 + 4
	jr .gotoffset

.offset
	; a *= 12
	sla a
	sla a
	ld c, a
	sla a
	add c
.gotoffset
	add b ; which frame
	pop bc
	ld [de], a ; tile id
	inc hl
	inc e
	ld a, [hl]
	bit 1, a ; sprite priority
	jr z, .fg
	ld a, [$ff94] ; facing priority
	or [hl]
.fg
	inc hl
	ld [de], a
	inc e
	bit 0, a ; OAMFLAG_ENDOFDATA
	jr z, .tile

	ld a, e
	ld [$ff90], a

.asm_4bad
	ld a, [$ff8f]
	add $10
	cp $100 % $100
	jp nz, .asm_4b21

	; Clear unused OAM.
	ld a, [$ff90]
	ld l, a
	ld h, wOAMBuffer / $100
	ld de, $4
	ld b, $a0
	ld a, [wd736]
	bit 6, a
	ld a, $a0
	jr z, .clear
	ld a, $90
.clear
	cp l
	ret z
	ld [hl], b
	add hl, de
	jr .clear

Func_4bd1: ; 4bd1 (1:4bd1)
	inc e
	inc e
	ld a, [de] ; c1x4
	ld [$ff92], a
	inc e
	inc e
	ld a, [de] ; c1x6
	ld [$ff91], a
	ld a, $4
	add e
	ld e, a
	ld a, [$ff92]
	add $4
	and $f0
	ld [de], a ; c1xa (y)
	inc e
	ld a, [$ff91]
	and $f0
	ld [de], a  ; c1xb (x)
	ret
