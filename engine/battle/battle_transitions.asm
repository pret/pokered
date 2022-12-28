BattleTransition:
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	xor a
	ldh [hWY], a
	dec a
	ld [wUpdateSpritesEnabled], a
	call DelayFrame

; Determine which OAM block is being used by the enemy trainer sprite (if there
; is one).
	ld hl, wSpritePlayerStateData1ImageIndex
	ldh a, [hSpriteIndexOrTextID] ; enemy trainer sprite index (0 if wild battle)
	ld c, a
	ld b, 0
	ld de, $10
.loop1
	ld a, [hl]
	cp $ff
	jr z, .skip1
	inc b
.skip1
	add hl, de
	dec c
	jr nz, .loop1

; Clear OAM except for the blocks used by the player and enemy trainer sprites.
	ld hl, wShadowOAMSprite04
	ld c, 9
.loop2
	ld a, b
	swap a
	cp l
	jr z, .skip2 ; skip clearing the block if the enemy trainer is using it
	push hl
	push bc
	ld bc, $10
	xor a
	call FillMemory
	pop bc
	pop hl
.skip2
	ld de, $10
	add hl, de
	dec c
	jr nz, .loop2

	call Delay3
	call LoadBattleTransitionTile
	ld bc, 0
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr z, .linkBattle
	call GetBattleTransitionID_WildOrTrainer
	call GetBattleTransitionID_CompareLevels
	call GetBattleTransitionID_IsDungeonMap
.linkBattle
	ld hl, BattleTransitions
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

; the three GetBattleTransitionID functions set the first
; three bits of c, which determines what transition animation
; to play at the beginning of a battle
; bit 0: set if trainer battle
; bit 1: set if enemy is at least 3 levels higher than player
; bit 2: set if dungeon map
BattleTransitions:
	dw BattleTransition_DoubleCircle      ; %000
	dw BattleTransition_Spiral            ; %001
	dw BattleTransition_Circle            ; %010
	dw BattleTransition_Spiral            ; %011
	dw BattleTransition_HorizontalStripes ; %100
	dw BattleTransition_Shrink            ; %101
	dw BattleTransition_VerticalStripes   ; %110
	dw BattleTransition_Split             ; %111

GetBattleTransitionID_WildOrTrainer:
	ld a, [wCurOpponent]
	cp OPP_ID_OFFSET
	jr nc, .trainer
	res 0, c
	ret
.trainer
	set 0, c
	ret

GetBattleTransitionID_CompareLevels:
	ld hl, wPartyMon1HP
.faintedLoop
	ld a, [hli]
	or [hl]
	jr nz, .notFainted
	ld de, wPartyMon2 - (wPartyMon1 + 1)
	add hl, de
	jr .faintedLoop
.notFainted
	ld de, wPartyMon1Level - (wPartyMon1HP + 1)
	add hl, de
	ld a, [hl]
	add $3
	ld e, a
	ld a, [wCurEnemyLVL]
	sub e
	jr nc, .highLevelEnemy
	res 1, c
	ld a, 1
	ld [wBattleTransitionSpiralDirection], a
	ret
.highLevelEnemy
	set 1, c
	xor a
	ld [wBattleTransitionSpiralDirection], a
	ret

GetBattleTransitionID_IsDungeonMap:
	ld a, [wCurMap]
	ld e, a
	ld hl, DungeonMaps1
.loop1
	ld a, [hli]
	cp $ff
	jr z, .noMatch1
	cp e
	jr nz, .loop1
.match
	set 2, c
	ret
.noMatch1
	ld hl, DungeonMaps2
.loop2
	ld a, [hli]
	cp $ff
	jr z, .noMatch2
	ld d, a
	ld a, [hli]
	cp e
	jr c, .loop2
	ld a, e
	cp d
	jr nc, .match
.noMatch2
	res 2, c
	ret

INCLUDE "data/maps/dungeon_maps.asm"

LoadBattleTransitionTile:
	ld hl, vChars1 tile $7f
	ld de, BattleTransitionTile
	lb bc, BANK(BattleTransitionTile), 1
	jp CopyVideoData

BattleTransitionTile: INCBIN "gfx/overworld/battle_transition.2bpp"

BattleTransition_BlackScreen:
	ld a, $ff
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ret

; for non-dungeon trainer battles
; called regardless of mon levels, but does an
; outward spiral if enemy is at least 3 levels
; higher than player and does an inward spiral otherwise
BattleTransition_Spiral:
	ld a, [wBattleTransitionSpiralDirection]
	and a
	jr z, .outwardSpiral
	call BattleTransition_InwardSpiral
	jr .done
.outwardSpiral
	hlcoord 10, 10
	ld a, $3
	ld [wOutwardSpiralCurrentDirection], a
	ld a, l
	ld [wOutwardSpiralTileMapPointer + 1], a
	ld a, h
	ld [wOutwardSpiralTileMapPointer], a
	ld b, 120
.loop
	ld c, 3
.innerLoop
	push bc
	call BattleTransition_OutwardSpiral_
	pop bc
	dec c
	jr nz, .innerLoop
	call DelayFrame
	dec b
	jr nz, .loop
.done
	call BattleTransition_BlackScreen
	xor a
	ld [wOutwardSpiralTileMapPointer + 1], a
	ld [wOutwardSpiralTileMapPointer], a
	ret

BattleTransition_InwardSpiral:
	ld a, 7
	ld [wInwardSpiralUpdateScreenCounter], a
	hlcoord 0, 0
	ld c, SCREEN_HEIGHT - 1
	ld de, SCREEN_WIDTH
	call BattleTransition_InwardSpiral_
	inc c
	jr .skip
.loop
	ld de, SCREEN_WIDTH
	call BattleTransition_InwardSpiral_
.skip
	inc c
	ld de, 1
	call BattleTransition_InwardSpiral_
	dec c
	dec c
	ld de, -SCREEN_WIDTH
	call BattleTransition_InwardSpiral_
	inc c
	ld de, -1
	call BattleTransition_InwardSpiral_
	dec c
	dec c
	ld a, c
	and a
	jr nz, .loop
	ret

BattleTransition_InwardSpiral_:
	push bc
.loop
	ld [hl], $ff
	add hl, de
	push bc
	ld a, [wInwardSpiralUpdateScreenCounter]
	dec a
	jr nz, .skip
	call BattleTransition_TransferDelay3
	ld a, 7
.skip
	ld [wInwardSpiralUpdateScreenCounter], a
	pop bc
	dec c
	jr nz, .loop
	pop bc
	ret

BattleTransition_OutwardSpiral_:
	ld bc, -SCREEN_WIDTH
	ld de, SCREEN_WIDTH
	ld a, [wOutwardSpiralTileMapPointer + 1]
	ld l, a
	ld a, [wOutwardSpiralTileMapPointer]
	ld h, a
	ld a, [wOutwardSpiralCurrentDirection]
	cp $0
	jr z, .up
	cp $1
	jr z, .left
	cp $2
	jr z, .down
	cp $3
	jr z, .right
.keepSameDirection
	ld [hl], $ff
.done
	ld a, l
	ld [wOutwardSpiralTileMapPointer + 1], a
	ld a, h
	ld [wOutwardSpiralTileMapPointer], a
	ret
.up
	dec hl
	ld a, [hl]
	cp $ff
	jr nz, .changeDirection
	inc hl
	add hl, bc
	jr .keepSameDirection
.left
	add hl, de
	ld a, [hl]
	cp $ff
	jr nz, .changeDirection
	add hl, bc
	dec hl
	jr .keepSameDirection
.down
	inc hl
	ld a, [hl]
	cp $ff
	jr nz, .changeDirection
	dec hl
	add hl, de
	jr .keepSameDirection
.right
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .changeDirection
	add hl, de
	inc hl
	jr .keepSameDirection
.changeDirection
	ld [hl], $ff
	ld a, [wOutwardSpiralCurrentDirection]
	inc a
	cp $4
	jr nz, .skip
	xor a
.skip
	ld [wOutwardSpiralCurrentDirection], a
	jr .done

FlashScreen:
BattleTransition_FlashScreen_:
	ld hl, BattleTransition_FlashScreenPalettes
.loop
	ld a, [hli]
	cp 1
	jr z, .done
	ldh [rBGP], a
	ld c, 2
	call DelayFrames
	jr .loop
.done
	dec b
	jr nz, BattleTransition_FlashScreen_
	ret

BattleTransition_FlashScreenPalettes:
	db %11111001
	db %11111110
	db %11111111
	db %11111110
	db %11111001
	db %11100100
	db %10010000
	db %01000000
	db %00000000
	db %01000000
	db %10010000
	db %11100100
	db 1 ; end

; used for low level trainer dungeon battles
BattleTransition_Shrink:
	ld c, SCREEN_HEIGHT / 2
.loop
	push bc
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 0, 7
	decoord 0, 8
	ld bc, -SCREEN_WIDTH * 2
	call BattleTransition_CopyTiles1
	hlcoord 0, 10
	decoord 0, 9
	ld bc, SCREEN_WIDTH * 2
	call BattleTransition_CopyTiles1
	hlcoord 8, 0
	decoord 9, 0
	ld bc, -2
	call BattleTransition_CopyTiles2
	hlcoord 11, 0
	decoord 10, 0
	ld bc, 2
	call BattleTransition_CopyTiles2
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	ld c, 6
	call DelayFrames
	pop bc
	dec c
	jr nz, .loop
	call BattleTransition_BlackScreen
	ld c, 10
	jp DelayFrames

; used for high level trainer dungeon battles
BattleTransition_Split:
	ld c, SCREEN_HEIGHT / 2
	xor a
	ldh [hAutoBGTransferEnabled], a
.loop
	push bc
	hlcoord 0, 16
	decoord 0, 17
	ld bc, -SCREEN_WIDTH * 2
	call BattleTransition_CopyTiles1
	hlcoord 0, 1
	decoord 0, 0
	ld bc, SCREEN_WIDTH * 2
	call BattleTransition_CopyTiles1
	hlcoord 18, 0
	decoord 19, 0
	ld bc, -2
	call BattleTransition_CopyTiles2
	hlcoord 1, 0
	decoord 0, 0
	ld bc, 2
	call BattleTransition_CopyTiles2
	call BattleTransition_TransferDelay3
	call Delay3
	pop bc
	dec c
	jr nz, .loop
	call BattleTransition_BlackScreen
	ld c, 10
	jp DelayFrames

BattleTransition_CopyTiles1:
	ld a, c
	ld [wBattleTransitionCopyTilesOffset], a
	ld a, b
	ld [wBattleTransitionCopyTilesOffset + 1], a
	ld c, 8
.loop1
	push bc
	push hl
	push de
	ld bc, SCREEN_WIDTH
	call CopyData
	pop hl
	pop de
	ld a, [wBattleTransitionCopyTilesOffset]
	ld c, a
	ld a, [wBattleTransitionCopyTilesOffset + 1]
	ld b, a
	add hl, bc
	pop bc
	dec c
	jr nz, .loop1
	ld l, e
	ld h, d
	ld a, $ff
	ld c, SCREEN_WIDTH
.loop2
	ld [hli], a
	dec c
	jr nz, .loop2
	ret

BattleTransition_CopyTiles2:
	ld a, c
	ld [wBattleTransitionCopyTilesOffset], a
	ld a, b
	ld [wBattleTransitionCopyTilesOffset + 1], a
	ld c, SCREEN_HEIGHT / 2
.loop1
	push bc
	push hl
	push de
	ld c, SCREEN_HEIGHT
.loop2
	ld a, [hl]
	ld [de], a
	ld a, e
	add SCREEN_WIDTH
	jr nc, .noCarry1
	inc d
.noCarry1
	ld e, a
	ld a, l
	add SCREEN_WIDTH
	jr nc, .noCarry2
	inc h
.noCarry2
	ld l, a
	dec c
	jr nz, .loop2
	pop hl
	pop de
	ld a, [wBattleTransitionCopyTilesOffset]
	ld c, a
	ld a, [wBattleTransitionCopyTilesOffset + 1]
	ld b, a
	add hl, bc
	pop bc
	dec c
	jr nz, .loop1
	ld l, e
	ld h, d
	ld de, SCREEN_WIDTH
	ld c, SCREEN_HEIGHT
.loop3
	ld [hl], $ff
	add hl, de
	dec c
	jr nz, .loop3
	ret

; used for high level wild dungeon battles
BattleTransition_VerticalStripes:
	ld c, SCREEN_HEIGHT
	hlcoord 0, 0
	decoord 1, 17
	xor a
	ldh [hAutoBGTransferEnabled], a
.loop
	push bc
	push hl
	push de
	push de
	call BattleTransition_VerticalStripes_
	pop hl
	call BattleTransition_VerticalStripes_
	call BattleTransition_TransferDelay3
	pop hl
	ld bc, -SCREEN_WIDTH
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	jp BattleTransition_BlackScreen

BattleTransition_VerticalStripes_:
	ld c, SCREEN_WIDTH / 2
.loop
	ld [hl], $ff
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret

; used for low level wild dungeon battles
BattleTransition_HorizontalStripes:
	ld c, SCREEN_WIDTH
	hlcoord 0, 0
	decoord 19, 1
	xor a
	ldh [hAutoBGTransferEnabled], a
.loop
	push bc
	push hl
	push de
	push de
	call BattleTransition_HorizontalStripes_
	pop hl
	call BattleTransition_HorizontalStripes_
	call BattleTransition_TransferDelay3
	pop de
	pop hl
	pop bc
	inc hl
	dec de
	dec c
	jr nz, .loop
	jp BattleTransition_BlackScreen

BattleTransition_HorizontalStripes_:
	ld c, SCREEN_HEIGHT / 2
	ld de, SCREEN_WIDTH * 2
.loop
	ld [hl], $ff
	add hl, de
	dec c
	jr nz, .loop
	ret

; used for high level wild non-dungeon battles
; makes one full circle around the screen
; by animating each half circle one at a time
BattleTransition_Circle:
	call BattleTransition_FlashScreen
	lb bc, 0, SCREEN_WIDTH / 2
	ld hl, BattleTransition_HalfCircle1
	call BattleTransition_Circle_Sub1
	ld c, SCREEN_WIDTH / 2
	ld b, 1
	ld hl, BattleTransition_HalfCircle2
	call BattleTransition_Circle_Sub1
	jp BattleTransition_BlackScreen

BattleTransition_FlashScreen:
	ld b, $3
	call BattleTransition_FlashScreen_
	xor a
	ldh [hAutoBGTransferEnabled], a
	ret

BattleTransition_Circle_Sub1:
	push bc
	push hl
	ld a, b
	call BattleTransition_Circle_Sub2
	pop hl
	ld bc, 5
	add hl, bc
	call BattleTransition_TransferDelay3
	pop bc
	dec c
	jr nz, BattleTransition_Circle_Sub1
	ret

BattleTransition_TransferDelay3:
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	xor a
	ldh [hAutoBGTransferEnabled], a
	ret

; used for low level wild non-dungeon battles
; makes two half circles around the screen
; by animating both half circles at the same time
BattleTransition_DoubleCircle:
	call BattleTransition_FlashScreen
	ld c, SCREEN_WIDTH / 2
	ld hl, BattleTransition_HalfCircle1
	ld de, BattleTransition_HalfCircle2
.loop
	push bc
	push hl
	push de
	push de
	xor a
	call BattleTransition_Circle_Sub2
	pop hl
	ld a, $1
	call BattleTransition_Circle_Sub2
	pop hl
	ld bc, 5
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	add hl, bc
	call BattleTransition_TransferDelay3
	pop bc
	dec c
	jr nz, .loop
	jp BattleTransition_BlackScreen

BattleTransition_Circle_Sub2:
	ld [wBattleTransitionCircleScreenQuadrantY], a
	ld a, [hli]
	ld [wBattleTransitionCircleScreenQuadrantX], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp BattleTransition_Circle_Sub3

; halves
	const_def
	const CIRCLE_LEFT
	const CIRCLE_RIGHT

MACRO half_circle
	; quadrant x, circle data, target coord
	db \1
	dw \2
	dwcoord \3, \4
ENDM

BattleTransition_HalfCircle1:
	half_circle CIRCLE_RIGHT, BattleTransition_CircleData1, 18,  6
	half_circle CIRCLE_RIGHT, BattleTransition_CircleData2, 19,  3
	half_circle CIRCLE_RIGHT, BattleTransition_CircleData3, 18,  0
	half_circle CIRCLE_RIGHT, BattleTransition_CircleData4, 14,  0
	half_circle CIRCLE_RIGHT, BattleTransition_CircleData5, 10,  0
	half_circle CIRCLE_LEFT,  BattleTransition_CircleData5,  9,  0
	half_circle CIRCLE_LEFT,  BattleTransition_CircleData4,  5,  0
	half_circle CIRCLE_LEFT,  BattleTransition_CircleData3,  1,  0
	half_circle CIRCLE_LEFT,  BattleTransition_CircleData2,  0,  3
	half_circle CIRCLE_LEFT,  BattleTransition_CircleData1,  1,  6

BattleTransition_HalfCircle2:
	half_circle CIRCLE_LEFT,  BattleTransition_CircleData1,  1, 11
	half_circle CIRCLE_LEFT,  BattleTransition_CircleData2,  0, 14
	half_circle CIRCLE_LEFT,  BattleTransition_CircleData3,  1, 17
	half_circle CIRCLE_LEFT,  BattleTransition_CircleData4,  5, 17
	half_circle CIRCLE_LEFT,  BattleTransition_CircleData5,  9, 17
	half_circle CIRCLE_RIGHT, BattleTransition_CircleData5, 10, 17
	half_circle CIRCLE_RIGHT, BattleTransition_CircleData4, 14, 17
	half_circle CIRCLE_RIGHT, BattleTransition_CircleData3, 18, 17
	half_circle CIRCLE_RIGHT, BattleTransition_CircleData2, 19, 14
	half_circle CIRCLE_RIGHT, BattleTransition_CircleData1, 18, 11

BattleTransition_Circle_Sub3:
	push hl
	ld a, [de]
	ld c, a
	inc de
.loop1
	ld [hl], $ff
	ld a, [wBattleTransitionCircleScreenQuadrantX]
	and a
	jr z, .skip1
	inc hl
	jr .skip2
.skip1
	dec hl
.skip2
	dec c
	jr nz, .loop1
	pop hl
	ld a, [wBattleTransitionCircleScreenQuadrantY]
	and a
	ld bc, SCREEN_WIDTH
	jr z, .skip3
	ld bc, -SCREEN_WIDTH
.skip3
	add hl, bc
	ld a, [de]
	inc de
	cp -1
	ret z
	and a
	jr z, BattleTransition_Circle_Sub3
	ld c, a
.loop2
	ld a, [wBattleTransitionCircleScreenQuadrantX]
	and a
	jr z, .skip4
	dec hl
	jr .skip5
.skip4
	inc hl
.skip5
	dec c
	jr nz, .loop2
	jr BattleTransition_Circle_Sub3

BattleTransition_CircleData1: db 2, 3, 5, 4, 9, -1
BattleTransition_CircleData2: db 1, 1, 2, 2, 4, 2, 4, 2, 3, -1
BattleTransition_CircleData3: db 2, 1, 3, 1, 4, 1, 4, 1, 4, 1, 3, 1, 2, 1, 1, 1, 1, -1
BattleTransition_CircleData4: db 4, 1, 4, 0, 3, 1, 3, 0, 2, 1, 2, 0, 1, -1
BattleTransition_CircleData5: db 4, 0, 3, 0, 3, 0, 2, 0, 2, 0, 1, 0, 1, 0, 1, -1
