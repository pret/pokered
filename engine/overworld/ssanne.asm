AnimateBoulderDust: ; 79f54 (1e:5f54)
	ld a, $1
	ld [wcd50], a ; select the boulder dust offsets
	ld a, [wUpdateSpritesEnabled]
	push af
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ld a, %11100100
	ld [rOBP1], a
	call LoadSmokeTileFourTimes
	callba WriteCutTreeBoulderDustAnimationOAMBlock
	ld c, 8 ; number of steps in animation
.loop
	push bc
	call GetMoveBoulderDustFunctionPointer
	ld bc, .returnAddress
	push bc
	ld c, $4
	jp [hl]
.returnAddress
	ld a, [rOBP1]
	xor %01100100
	ld [rOBP1], a
	call Delay3
	pop bc
	dec c
	jr nz, .loop
	pop af
	ld [wUpdateSpritesEnabled], a
	jp LoadPlayerSpriteGraphics

GetMoveBoulderDustFunctionPointer: ; 79f92 (1e:5f92)
	ld a, [wSpriteStateData1 + 9] ; player's sprite facing direction
	ld hl, MoveBoulderDustFunctionPointerTable
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

MoveBoulderDustFunctionPointerTable: ; 79fb0 (1e:5fb0)
; facing down
	db $FF,$00
	dw AdjustOAMBlockYPos

; facing up
	db $01,$00
	dw AdjustOAMBlockYPos

; facing left
	db $01,$01
	dw AdjustOAMBlockXPos

; facing right
	db $FF,$01
	dw AdjustOAMBlockXPos

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
	ld de, SSAnneSmokePuffTile
	ld bc, (BANK(SSAnneSmokePuffTile) << 8) + $01
	jp CopyVideoData

SSAnneSmokePuffTile: ; 79fdd (1e:5fdd)
	INCBIN "gfx/ss_anne_smoke_puff.2bpp"
