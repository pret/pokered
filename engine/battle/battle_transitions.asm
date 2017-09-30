BattleTransition:
	ld a, 1
	ld [H_AUTOBGTRANSFERENABLED], a
	call Delay3
	xor a
	ld [hWY], a
	dec a
	ld [wUpdateSpritesEnabled], a
	call DelayFrame

; Determine which OAM block is being used by the enemy trainer sprite (if there
; is one).
	ld hl, wSpriteStateData1 + 2
	ld a, [hSpriteIndexOrTextID] ; enemy trainer sprite index (0 if wild battle)
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
	ld hl, wOAMBuffer + $10
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
	cp 200
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

; fails to recognize VICTORY_ROAD_2, VICTORY_ROAD_3, all ROCKET_HIDEOUT maps,
; MANSION_1, SEAFOAM_ISLANDS_[2-5], POWER_PLANT, DIGLETTS_CAVE
; and SILPH_CO_[9-11]F as dungeon maps
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

; GetBattleTransitionID_IsDungeonMap checks if wCurMap
; is equal to one of these maps
DungeonMaps1:
	db VIRIDIAN_FOREST
	db ROCK_TUNNEL_1
	db SEAFOAM_ISLANDS_1
	db ROCK_TUNNEL_2
	db $FF

; GetBattleTransitionID_IsDungeonMap checks if wCurMap
; is in between or equal to each pair of maps
DungeonMaps2:
	; all MT_MOON maps
	db MT_MOON_1
	db MT_MOON_3

	; all SS_ANNE maps, VICTORY_ROAD_1, LANCES_ROOM, and HALL_OF_FAME
	db SS_ANNE_1
	db HALL_OF_FAME

	; all POKEMONTOWER maps and Lavender Town buildings
	db LAVENDER_POKECENTER
	db LAVENDER_HOUSE_2

	; SILPH_CO_[2-8]F, MANSION[2-4], SAFARI_ZONE, and UNKNOWN_DUNGEON maps,
	; except for SILPH_CO_1F
	db SILPH_CO_2F
	db UNKNOWN_DUNGEON_1
	db $FF

LoadBattleTransitionTile:
	ld hl, vChars1 + $7f0
	ld de, BattleTransitionTile
	lb bc, BANK(BattleTransitionTile), (BattleTransitionTileEnd - BattleTransitionTile) / $10
	jp CopyVideoData

BattleTransitionTile:
	INCBIN "gfx/battle_transition.2bpp"
BattleTransitionTileEnd:

BattleTransition_BlackScreen:
	ld a, $ff
	ld [rBGP], a
	ld [rOBP0], a
	ld [rOBP1], a
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
	coord hl, 10, 10
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
	coord hl, 0, 0
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
	cp $1
	jr z, .done
	ld [rBGP], a
	ld c, 2
	call DelayFrames
	jr .loop
.done
	dec b
	jr nz, BattleTransition_FlashScreen_
	ret

BattleTransition_FlashScreenPalettes:
	db $F9,$FE,$FF,$FE,$F9,$E4,$90,$40,$00,$40,$90,$E4
	db $01 ; terminator

; used for low level trainer dungeon battles
BattleTransition_Shrink:
	ld c, SCREEN_HEIGHT / 2
.loop
	push bc
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	coord hl, 0, 7
	coord de, 0, 8
	ld bc, -SCREEN_WIDTH * 2
	call BattleTransition_CopyTiles1
	coord hl, 0, 10
	coord de, 0, 9
	ld bc, SCREEN_WIDTH * 2
	call BattleTransition_CopyTiles1
	coord hl, 8, 0
	coord de, 9, 0
	ld bc, -2
	call BattleTransition_CopyTiles2
	coord hl, 11, 0
	coord de, 10, 0
	ld bc, 2
	call BattleTransition_CopyTiles2
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
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
	ld [H_AUTOBGTRANSFERENABLED], a
.loop
	push bc
	coord hl, 0, 16
	coord de, 0, 17
	ld bc, -SCREEN_WIDTH * 2
	call BattleTransition_CopyTiles1
	coord hl, 0, 1
	coord de, 0, 0
	ld bc, SCREEN_WIDTH * 2
	call BattleTransition_CopyTiles1
	coord hl, 18, 0
	coord de, 19, 0
	ld bc, -2
	call BattleTransition_CopyTiles2
	coord hl, 1, 0
	coord de, 0, 0
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
	coord hl, 0, 0
	coord de, 1, 17
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
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
	coord hl, 0, 0
	coord de, 19, 1
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
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
	ld [H_AUTOBGTRANSFERENABLED], a
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
	ld [H_AUTOBGTRANSFERENABLED], a
	call Delay3
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
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

BattleTransition_HalfCircle1:
	db $01
	dw BattleTransition_CircleData1
	dwCoord 18, 6

	db $01
	dw BattleTransition_CircleData2
	dwCoord 19, 3

	db $01
	dw BattleTransition_CircleData3
	dwCoord 18, 0

	db $01
	dw BattleTransition_CircleData4
	dwCoord 14, 0

	db $01
	dw BattleTransition_CircleData5
	dwCoord 10, 0

	db $00
	dw BattleTransition_CircleData5
	dwCoord 9, 0

	db $00
	dw BattleTransition_CircleData4
	dwCoord 5, 0

	db $00
	dw BattleTransition_CircleData3
	dwCoord 1, 0

	db $00
	dw BattleTransition_CircleData2
	dwCoord 0, 3

	db $00
	dw BattleTransition_CircleData1
	dwCoord 1, 6

BattleTransition_HalfCircle2:
	db $00
	dw BattleTransition_CircleData1
	dwCoord 1, 11

	db $00
	dw BattleTransition_CircleData2
	dwCoord 0, 14

	db $00
	dw BattleTransition_CircleData3
	dwCoord 1, 17

	db $00
	dw BattleTransition_CircleData4
	dwCoord 5, 17

	db $00
	dw BattleTransition_CircleData5
	dwCoord 9, 17

	db $01
	dw BattleTransition_CircleData5
	dwCoord 10, 17

	db $01
	dw BattleTransition_CircleData4
	dwCoord 14, 17

	db $01
	dw BattleTransition_CircleData3
	dwCoord 18, 17

	db $01
	dw BattleTransition_CircleData2
	dwCoord 19, 14

	db $01
	dw BattleTransition_CircleData1
	dwCoord 18, 11

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
	cp $ff
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

BattleTransition_CircleData1:
	db $02,$03,$05,$04,$09,$FF

BattleTransition_CircleData2:
	db $01,$01,$02,$02,$04,$02,$04,$02,$03,$FF

BattleTransition_CircleData3:
	db $02,$01,$03,$01,$04,$01,$04,$01,$04,$01,$03,$01,$02,$01,$01,$01,$01,$FF

BattleTransition_CircleData4:
	db $04,$01,$04,$00,$03,$01,$03,$00,$02,$01,$02,$00,$01,$FF

BattleTransition_CircleData5:
	db $04,$00,$03,$00,$03,$00,$02,$00,$02,$00,$01,$00,$01,$00,$01,$FF
