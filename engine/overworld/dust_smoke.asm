AnimateBoulderDust:
	ld a, $1
	ld [wWhichAnimationOffsets], a ; select the boulder dust offsets
	ld a, [wUpdateSpritesEnabled]
	push af
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ld a, %11100100
	ldh [rOBP1], a
	call LoadSmokeTileFourTimes
	farcall WriteCutOrBoulderDustAnimationOAMBlock
	ld c, 8 ; number of steps in animation
.loop
	push bc
	call GetMoveBoulderDustFunctionPointer
	ld bc, .returnAddress
	push bc
	ld c, 4
	jp hl
.returnAddress
	ldh a, [rOBP1]
	xor %01100100
	ldh [rOBP1], a
	call Delay3
	pop bc
	dec c
	jr nz, .loop
	pop af
	ld [wUpdateSpritesEnabled], a
	jp LoadPlayerSpriteGraphics

GetMoveBoulderDustFunctionPointer:
	ld a, [wSpritePlayerStateData1FacingDirection]
	ld hl, MoveBoulderDustFunctionPointerTable
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld [wCoordAdjustmentAmount], a
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

MoveBoulderDustFunctionPointerTable:
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

LoadSmokeTileFourTimes::
	ld hl, vChars1 tile $7c
	ld c, 4
.loop
	push bc
	push hl
	call LoadSmokeTile
	pop hl
	ld bc, 1 tiles
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	ret

LoadSmokeTile:
	ld de, SSAnneSmokePuffTile
	lb bc, BANK(SSAnneSmokePuffTile), (SSAnneSmokePuffTileEnd - SSAnneSmokePuffTile) / $10
	jp CopyVideoData

SSAnneSmokePuffTile:
	INCBIN "gfx/overworld/smoke.2bpp"
SSAnneSmokePuffTileEnd:
