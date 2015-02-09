MarowakAnim: ; 708ca (1c:48ca)
; animate the ghost being unveiled as a Marowak
	ld a, $e4
	ld [rOBP1], a
	call CopyMonPicFromBGToSpriteVRAM ; cover the BG ghost pic with a sprite ghost pic that looks the same
; now that the ghost pic is being displayed using sprites, clear the ghost pic from the BG tilemap
	hlCoord 12, 0
	ld bc, $707
	call ClearScreenArea
	call Delay3
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; disable BG transfer so we don't see the Marowak too soon
; replace ghost pic with Marowak in BG
	ld a, MAROWAK
	ld [wHPBarMaxHP], a
	ld a, $1
	ld [H_WHOSETURN], a
	callab Func_79793
 ; alternate between black and light grey 8 times.
 ; this makes the ghost's body appear to flash
	ld d, $80
	call FlashSprite8Times
.fadeOutGhostLoop
	ld c, 10
	call DelayFrames
	ld a, [rOBP1]
	sla a
	sla a
	ld [rOBP1], a
	jr nz, .fadeOutGhostLoop
	call ClearSprites
	call CopyMonPicFromBGToSpriteVRAM ; copy Marowak pic from BG to sprite VRAM
	ld b, $e4
.fadeInMarowakLoop
	ld c, 10
	call DelayFrames
	ld a, [rOBP1]
	srl b
	rra
	srl b
	rra
	ld [rOBP1], a
	ld a, b
	and a
	jr nz, .fadeInMarowakLoop
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; enable BG transfer so the BG Marowak pic will be visible after the sprite one is cleared
	call Delay3
	jp ClearSprites

; copies a mon pic's  from background VRAM to sprite VRAM and sets up OAM
CopyMonPicFromBGToSpriteVRAM: ; 7092a (1c:492a)
	ld de, vFrontPic
	ld hl, vSprites
	ld bc, 7 * 7
	call CopyVideoData
	ld a, $10
	ld [W_BASECOORDY], a
	ld a, $70
	ld [W_BASECOORDX], a
	ld hl, wOAMBuffer
	ld bc, $606
	ld d, $8
.oamLoop
	push bc
	ld a, [W_BASECOORDY]
	ld e, a
.oamInnerLoop
	ld a, e
	add $8
	ld e, a
	ld [hli], a
	ld a, [W_BASECOORDX]
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $10 ; use OBP1
	ld [hli], a
	inc d
	dec c
	jr nz, .oamInnerLoop
	inc d
	ld a, [W_BASECOORDX]
	add $8
	ld [W_BASECOORDX], a
	pop bc
	dec b
	jr nz, .oamLoop
	ret

BattleTransition: ; 7096d (1c:496d)
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	call Delay3
	xor a
	ld [hWY], a
	dec a
	ld [wUpdateSpritesEnabled], a
	call DelayFrame
	ld hl, wSpriteStateData1 + 2
	ld a, [H_DOWNARROWBLINKCNT2]
	ld c, a
	ld b, $0
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
	ld hl, wOAMBuffer + $10
	ld c, $9
.loop2
	ld a, b
	swap a
	cp l
	jr z, .skip2
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
	ld bc, $0
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
	jp [hl]

; the three GetBattleTransitionID functions set the first
; three bits of c, which determines what transition animation
; to play at the beginning of a battle
; bit 0: set if trainer battle
; bit 1: set if enemy is at least 3 levels higher than player
; bit 2: set if dungeon map
BattleTransitions: ; 709d2 (1c:49d2)
	dw BattleTransition_DoubleCircle      ; %000
	dw BattleTransition_Spiral            ; %001
	dw BattleTransition_Circle            ; %010
	dw BattleTransition_Spiral            ; %011
	dw BattleTransition_HorizontalStripes ; %100
	dw BattleTransition_Shrink            ; %101
	dw BattleTransition_VerticalStripes   ; %110
	dw BattleTransition_Split             ; %111

GetBattleTransitionID_WildOrTrainer: ; 709e2 (1c:49e2)
	ld a, [W_CUROPPONENT]
	cp $c8
	jr nc, .trainer
	res 0, c
	ret
.trainer
	set 0, c
	ret

GetBattleTransitionID_CompareLevels: ; 709ef (1c:49ef)
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
	ld a, [W_CURENEMYLVL]
	sub e
	jr nc, .highLevelEnemy
	res 1, c
	ld a, $1
	ld [wcd47], a
	ret
.highLevelEnemy
	set 1, c
	xor a
	ld [wcd47], a
	ret

; fails to recognize VICTORY_ROAD_2, VICTORY_ROAD_3, all ROCKET_HIDEOUT maps,
; MANSION_1, SEAFOAM_ISLANDS_[2-5], POWER_PLANT, DIGLETTS_CAVE
; and SILPH_CO_[9-11]F as dungeon maps
GetBattleTransitionID_IsDungeonMap: ; 70a19 (1c:4a19)
	ld a, [W_CURMAP]
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

; GetBattleTransitionID_IsDungeonMap checks if W_CURMAP
; is equal to one of these maps
DungeonMaps1: ; 70a3f (1c:4a3f)
	db VIRIDIAN_FOREST
	db ROCK_TUNNEL_1
	db SEAFOAM_ISLANDS_1
	db ROCK_TUNNEL_2
	db $FF

; GetBattleTransitionID_IsDungeonMap checks if W_CURMAP
; is in between or equal to each pair of maps
DungeonMaps2: ; 70a44 (1c:4a44)
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

LoadBattleTransitionTile: ; 70a4d (1c:4a4d)
	ld hl, vChars1 + $7f0
	ld de, BattleTransitionTile
	ld bc, (BANK(BattleTransitionTile) << 8) + $01
	jp CopyVideoData

BattleTransitionTile: ; 70a59 (1c:4a59)
	INCBIN "gfx/battle_transition.2bpp"

BattleTransition_BlackScreen: ; 70a69 (1c:4a69)
	ld a, $ff
	ld [rBGP], a
	ld [rOBP0], a
	ld [rOBP1], a
	ret

; for non-dungeon trainer battles
; called regardless of mon levels, but does an
; outward spiral if enemy is at least 3 levels
; higher than player and does an inward spiral otherwise
BattleTransition_Spiral: ; 70a72 (1c:4a72)
	ld a, [wcd47]
	and a
	jr z, .outwardSpiral
	call BattleTransition_InwardSpiral
	jr .done
.outwardSpiral
	hlCoord 10, 10
	ld a, $3
	ld [wd09f], a
	ld a, l
	ld [wd09b], a
	ld a, h
	ld [wd09a], a
	ld b, $78
.loop1
	ld c, $3
.loop2
	push bc
	call BattleTransition_OutwardSpiral_
	pop bc
	dec c
	jr nz, .loop2
	call DelayFrame
	dec b
	jr nz, .loop1
.done
	call BattleTransition_BlackScreen
	xor a
	ld [wd09b], a
	ld [wd09a], a
	ret

BattleTransition_InwardSpiral: ; 70aaa (1c:4aaa)
	ld a, $7
	ld [wWhichTrade], a
	ld hl, wTileMap
	ld c, $11
	ld de, $14
	call BattleTransition_InwardSpiral_
	inc c
	jr .skip
.loop
	ld de, $14
	call BattleTransition_InwardSpiral_
.skip
	inc c
	ld de, $1
	call BattleTransition_InwardSpiral_
	dec c
	dec c
	ld de, $ffec
	call BattleTransition_InwardSpiral_
	inc c
	ld de, rIE
	call BattleTransition_InwardSpiral_
	dec c
	dec c
	ld a, c
	and a
	jr nz, .loop
	ret

BattleTransition_InwardSpiral_: ; 70ae0 (1c:4ae0)
	push bc
.loop
	ld [hl], $ff
	add hl, de
	push bc
	ld a, [wWhichTrade]
	dec a
	jr nz, .skip
	call BattleTransition_TransferDelay3
	ld a, $7
.skip
	ld [wWhichTrade], a
	pop bc
	dec c
	jr nz, .loop
	pop bc
	ret

BattleTransition_OutwardSpiral_: ; 70af9 (1c:4af9)
	ld bc, $ffec
	ld de, $14
	ld a, [wd09b]
	ld l, a
	ld a, [wd09a]
	ld h, a
	ld a, [wd09f]
	cp $0
	jr z, .zero
	cp $1
	jr z, .one
	cp $2
	jr z, .two
	cp $3
	jr z, .three
.done1
	ld [hl], $ff
.done2_
	ld a, l
	ld [wd09b], a
	ld a, h
	ld [wd09a], a
	ret
.zero
	dec hl
	ld a, [hl]
	cp $ff
	jr nz, .done2
	inc hl
	add hl, bc
	jr .done1
.one
	add hl, de
	ld a, [hl]
	cp $ff
	jr nz, .done2
	add hl, bc
	dec hl
	jr .done1
.two
	inc hl
	ld a, [hl]
	cp $ff
	jr nz, .done2
	dec hl
	add hl, de
	jr .done1
.three
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .done2
	add hl, de
	inc hl
	jr .done1
.done2
	ld [hl], $ff
	ld a, [wd09f]
	inc a
	cp $4
	jr nz, .skip
	xor a
.skip
	ld [wd09f], a
	jr .done2_

FlashScreen:
BattleTransition_FlashScreen_: ; 70b5d (1c:4b5d)
	ld hl, BattleTransition_FlashScreenPalettes
.loop
	ld a, [hli]
	cp $1
	jr z, .done
	ld [rBGP], a
	ld c, $2
	call DelayFrames
	jr .loop
.done
	dec b
	jr nz, BattleTransition_FlashScreen_
	ret

BattleTransition_FlashScreenPalettes: ; 70b72 (1c:4b72)
	db $F9,$FE,$FF,$FE,$F9,$E4,$90,$40,$00,$40,$90,$E4
	db $01 ; terminator

; used for low level trainer dungeon battles
BattleTransition_Shrink: ; 70b7f (1c:4b7f)
	ld c, $9
.loop
	push bc
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	hlCoord 0, 7
	deCoord 0, 8
	ld bc, $ffd8
	call BattleTransition_CopyTiles1
	hlCoord 0, 10
	deCoord 0, 9
	ld bc, $28
	call BattleTransition_CopyTiles1
	hlCoord 8, 0
	deCoord 9, 0
	ld bc, $fffe
	call BattleTransition_CopyTiles2
	hlCoord 11, 0
	deCoord 10, 0
	ld bc, $2
	call BattleTransition_CopyTiles2
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	ld c, $6
	call DelayFrames
	pop bc
	dec c
	jr nz, .loop
	call BattleTransition_BlackScreen
	ld c, $a
	jp DelayFrames

; used for high level trainer dungeon battles
BattleTransition_Split: ; 70bca (1c:4bca)
	ld c, $9
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
.loop
	push bc
	hlCoord 0, 16
	deCoord 0, 17
	ld bc, $ffd8
	call BattleTransition_CopyTiles1
	hlCoord 0, 1
	ld de, wTileMap
	ld bc, $28
	call BattleTransition_CopyTiles1
	hlCoord 18, 0
	deCoord 19, 0
	ld bc, $fffe
	call BattleTransition_CopyTiles2
	hlCoord 1, 0
	ld de, wTileMap
	ld bc, $2
	call BattleTransition_CopyTiles2
	call BattleTransition_TransferDelay3
	call Delay3
	pop bc
	dec c
	jr nz, .loop
	call BattleTransition_BlackScreen
	ld c, $a
	jp DelayFrames

BattleTransition_CopyTiles1: ; 70c12 (1c:4c12)
	ld a, c
	ld [wWhichTrade], a
	ld a, b
	ld [wTrainerEngageDistance], a
	ld c, $8
.loop1
	push bc
	push hl
	push de
	ld bc, $14
	call CopyData
	pop hl
	pop de
	ld a, [wWhichTrade]
	ld c, a
	ld a, [wTrainerEngageDistance]
	ld b, a
	add hl, bc
	pop bc
	dec c
	jr nz, .loop1
	ld l, e
	ld h, d
	ld a, $ff
	ld c, $14
.loop2
	ld [hli], a
	dec c
	jr nz, .loop2
	ret

BattleTransition_CopyTiles2: ; 70c3f (1c:4c3f)
	ld a, c
	ld [wWhichTrade], a
	ld a, b
	ld [wTrainerEngageDistance], a
	ld c, $9
.loop1
	push bc
	push hl
	push de
	ld c, $12
.loop2
	ld a, [hl]
	ld [de], a
	ld a, e
	add $14
	jr nc, .noCarry1
	inc d
.noCarry1
	ld e, a
	ld a, l
	add $14
	jr nc, .noCarry2
	inc h
.noCarry2
	ld l, a
	dec c
	jr nz, .loop2
	pop hl
	pop de
	ld a, [wWhichTrade]
	ld c, a
	ld a, [wTrainerEngageDistance]
	ld b, a
	add hl, bc
	pop bc
	dec c
	jr nz, .loop1
	ld l, e
	ld h, d
	ld de, $14
	ld c, $12
.loop3
	ld [hl], $ff
	add hl, de
	dec c
	jr nz, .loop3
	ret

; used for high level wild dungeon battles
BattleTransition_VerticalStripes: ; 70c7e (1c:4c7e)
	ld c, $12
	ld hl, wTileMap
	deCoord 1, 17
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
	ld bc, $ffec
	add hl, bc
	ld e, l
	ld d, h
	pop hl
	ld bc, $14
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	jp BattleTransition_BlackScreen

BattleTransition_VerticalStripes_: ; 70caa (1c:4caa)
	ld c, $a
.loop
	ld [hl], $ff
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret

; used for low level wild dungeon battles
BattleTransition_HorizontalStripes: ; 70cb4 (1c:4cb4)
	ld c, $14
	ld hl, wTileMap
	deCoord 19, 1
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

BattleTransition_HorizontalStripes_: ; 70cd8 (1c:4cd8)
	ld c, $9
	ld de, $28
.loop
	ld [hl], $ff
	add hl, de
	dec c
	jr nz, .loop
	ret

; used for high level wild non-dungeon battles
; makes one full circle around the screen
; by animating each half circle one at a time
BattleTransition_Circle: ; 70ce4 (1c:4ce4)
	call BattleTransition_FlashScreen
	ld bc, $000a
	ld hl, BattleTransition_HalfCircle1
	call BattleTransition_Circle_Sub1
	ld c, $a
	ld b, $1
	ld hl, BattleTransition_HalfCircle2
	call BattleTransition_Circle_Sub1
	jp BattleTransition_BlackScreen

BattleTransition_FlashScreen: ; 70cfd (1c:4cfd)
	ld b, $3
	call BattleTransition_FlashScreen_
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ret

BattleTransition_Circle_Sub1: ; 70d06 (1c:4d06)
	push bc
	push hl
	ld a, b
	call BattleTransition_Circle_Sub2
	pop hl
	ld bc, $0005
	add hl, bc
	call BattleTransition_TransferDelay3
	pop bc
	dec c
	jr nz, BattleTransition_Circle_Sub1
	ret

BattleTransition_TransferDelay3: ; 70d19 (1c:4d19)
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	call Delay3
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ret

; used for low level wild non-dungeon battles
; makes two half circles around the screen
; by animating both half circles at the same time
BattleTransition_DoubleCircle: ; 70d24 (1c:4d24)
	call BattleTransition_FlashScreen
	ld c, $a
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
	ld bc, $5
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

BattleTransition_Circle_Sub2: ; 70d50 (1c:4d50)
	ld [wWhichTrade], a
	ld a, [hli]
	ld [wTrainerEngageDistance], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp BattleTransition_Circle_Sub3

BattleTransition_HalfCircle1: ; 70d61 (1c:4d61)
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

BattleTransition_HalfCircle2: ; 70d93 (1c:4d93)
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

BattleTransition_Circle_Sub3: ; 70dc5 (1c:4dc5)
	push hl
	ld a, [de]
	ld c, a
	inc de
.loop1
	ld [hl], $ff
	ld a, [wTrainerEngageDistance]
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
	ld a, [wWhichTrade]
	and a
	ld bc, $14
	jr z, .skip3
	ld bc, $ffec
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
	ld a, [wTrainerEngageDistance]
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

BattleTransition_CircleData1: ; 70dfe (1c:4dfe)
	db $02,$03,$05,$04,$09,$FF

BattleTransition_CircleData2: ; 70e04 (1c:4e04)
	db $01,$01,$02,$02,$04,$02,$04,$02,$03,$FF

BattleTransition_CircleData3: ; 70e0e (1c:4e0e)
	db $02,$01,$03,$01,$04,$01,$04,$01,$04,$01,$03,$01,$02,$01,$01,$01,$01,$FF

BattleTransition_CircleData4: ; 70e20 (1c:4e20)
	db $04,$01,$04,$00,$03,$01,$03,$00,$02,$01,$02,$00,$01,$FF

BattleTransition_CircleData5: ; 70e2e (1c:4e2e)
	db $04,$00,$03,$00,$03,$00,$02,$00,$02,$00,$01,$00,$01,$00,$01,$FF
