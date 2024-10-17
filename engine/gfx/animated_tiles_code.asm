; PureRGBnote: ADDED: A bunch of new areas have new animated tiles that are coded here.

;TownMapWaterTiles:
;	ld a, [wAnimCounter] ; this is used as the counter for the town map so we don't mess up the normal counter
;	cp 49
;	ret nz
;	push hl
;	ld hl, vTileset tile $64
;	call AnimateArbitraryWaterTile2
;	pop hl
;	ret

; PureRGBnote: CHANGED: the code for animating these tiles was moved to another bank for space.
AnimateTiles::
;	ld a, [wViewingTownMap] ; bit 7 set when viewing town map
;	bit VIEWING_TOWN_MAP, a
;	jr nz, TownMapWaterTiles
	ldh a, [hTileAnimations]
	and a
	ret z

;;;;;;;;;; shinpokerednote: gbcnote: fixes a strange incident where $FF is written to this one byte of a water tile
	ldh a, [rLY]
	cp $90 ; check if not in vblank period??? (maybe if vblank is too long)
	ret c
;;;;;;;;;;
	ld a, [wCurMapConnections]
	bit BIT_SPECIAL_ANIMATION_MAP, a
	jr z, .normal
	ld a, [wCurMap]
	cp DIGLETTS_CAVE
	jp z, ProximityDigletts
	cp SEAFOAM_ISLANDS_1F
	jp z, Seafoam1FAnimatedTiles
	ld a, [wCurMapTileset]
	cp CAVERN
	jr z, .seafoamCurrents
	cp REACTOR
	jp z, ReactorAnimatedTiles
	cp VOLCANO
	jr nz, .normal
	CheckEvent EVENT_LAVA_FLOOD_ACTIVE
	ldh a, [hMovingBGTilesCounter1]
	jr z, .normalLava
	inc a
	ldh [hMovingBGTilesCounter1], a
	cp 5
	ret c
	cp 6
	jp z, AnimateLavaBubbles1
	; in the lava flood room there's only down and right flow tiles so don't update the other ones
	cp 8
	jp z, AnimateLavaFlowDown
	cp 9
	jp z, AnimateLavaFlowRight
	cp 10
	jp z, AnimateLavaWaterTiles
	cp 11
	ret c
	xor a
	ldh [hMovingBGTilesCounter1], a
	ret
.normalLava
	inc a
	ldh [hMovingBGTilesCounter1], a
	cp 20
	ret c
	cp 21
	jp z, AnimateLavaBubbles1
	cp 40
	jr c, AnimateLavaFlowTiles
	cp 40
	jp z, AnimateLavaWaterTiles
	cp 41
	ret c
	jp AnimateLavaBubbles2
.normal
	ldh a, [hMovingBGTilesCounter1]
	inc a
	ldh [hMovingBGTilesCounter1], a
	cp 20
	ret c
	cp 21
	jr nz, AnimateWaterTile
	jp AnimateFlowerTile
.seafoamCurrents
	ldh a, [hMovingBGTilesCounter1]
	inc a
	ldh [hMovingBGTilesCounter1], a
	; for whatever reason if we have fast currents on map load it gets visually glitched out
	; so we'll set it once the map loads in the script file
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	jr nz, .skipQuickCurrent
	call CheckAnimateSeafoamCurrents
	ldh a, [hMovingBGTilesCounter1]
.skipQuickCurrent
	cp 20
	ret c
	; fall through		
; moves water tile sometimes left and and sometimes right to look like waves
AnimateWaterTile::
	ld hl, vTileset tile $14
AnimateArbitraryWaterTile2:
	ld a, [wMovingBGTilesCounter2]
	inc a
	and 7
	ld [wMovingBGTilesCounter2], a
AnimateArbitraryWaterTile:
	and 4
	jr nz, .left
	call ScrollTileRight
	jr .done
.left
	call ScrollTileLeft
.done
	; if nc, we also need to animate flowers, and the counter needs to keep counting up
	; so return and don't reset counter
	ldh a, [hTileAnimations]
	rrca
	ret nc

	; reset the counter if we only need to animate water
	xor a
	ldh [hMovingBGTilesCounter1], a
	ret

AnimateFlowerTile::
	; reset the counter to loop back to the start of tile animation timer
	xor a
	ldh [hMovingBGTilesCounter1], a

	ld de, vTileset tile $03

	ld a, [wMovingBGTilesCounter2]
	and 3
	cp 2
	ld hl, FlowerTile1
	jr c, AnimateCopyTile
	ld hl, FlowerTile2
	jr z, AnimateCopyTile
	ld hl, FlowerTile3
AnimateCopyTile:
	ld c, 16
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

AnimateLavaFlowTiles:
	cp 36
	ret c
	jr z, AnimateLavaFlowDown
	cp 37
	jr z, AnimateLavaFlowUp
	cp 38
	jr z, AnimateLavaFlowLeft
	; fall through for 39
AnimateLavaFlowRight:
	ld hl, vTileset tile $23 ; right flowing lava
	jp ScrollTileRight

AnimateLavaFlowUp:
	ld hl, vTileset tile $26 ; up flowing lava
	jp ScrollTileUp

AnimateLavaFlowLeft:
	ld hl, vTileset tile $25 ; left flowing lava
	jp ScrollTileLeft

AnimateLavaFlowDown:
	ld hl, vTileset tile $24 ; down flowing lava
	jp ScrollTileDown

AnimateLavaWaterTiles::
	call AnimateWaterTile ; stationary lava uses default water tile
	CheckEvent EVENT_LAVA_FLOOD_ACTIVE
	ret z
	ld hl, vTileset tile $2A ; flood lava tile
	ld a, [wMovingBGTilesCounter2]
	jp AnimateArbitraryWaterTile

AnimateLavaBubbles1::
	CheckEvent EVENT_LAVA_FLOOD_ACTIVE
	ld de, vTileset tile $21 ; bubble tile 1
	jr z, .copyTile
	; in the case of the lava flood make all tiles bubble
	call .copyTile
	ld de, vTileset tile $27 ; flood bubble tile
	call .copyTile
	ld de, vTileset tile $06 ; bubble tile 2
.copyTile
	push de
	ld hl, LavaBubbleJumpTable
	ld a, [wMovingBGTilesCounter2]
	and 3
	call GetAddressFromPointerArray
	pop de
	jp AnimateCopyTile

AnimateLavaBubbles2::
	xor a
	ldh [hMovingBGTilesCounter1], a
	ld hl, LavaBubbleJumpTable
	ld a, [wMovingBGTilesCounter2]
	and 3
	inc a
	cp 4
	jr nz, .noReset
	xor a
.noReset
	call GetAddressFromPointerArray
	ld de, vTileset tile $06 ; bubble tile 2
	jp AnimateCopyTile

LavaBubbleJumpTable:
	dw LavaBubble1
	dw LavaBubble2
	dw LavaBubble3
	dw LavaBubble4

CheckAnimateSeafoamCurrents:
	ldh a, [hGBC]
	and a
	ldh a, [hMovingBGTilesCounter1]
	jr z, .slowerCurrents
	rrca ; every other frame update all the currents on GBC
	ret c
	jr AnimateSeafoamCurrents
.slowerCurrents
	; when not on GBC we have to animate the currents slower on different frames or vblank goes too long and the tiles get corrupted
	and %11
	cp 1
	jr z, AnimateSeafoamCurrentsDown
	cp 2
	jr z, AnimateSeafoamCurrentsRight
	cp 3
	jr z, AnimateSeafoamCurrentsUp
	ret

AnimateSeafoamCurrents:
	ld hl, vTileset tile $3B ; right flowing water
	call ScrollTileRight
	ld hl, vTileset tile $42 ; down flowing water
	call ScrollTileDown
	ld hl, vTileset tile $30 ; up flowing water
	jr ScrollTileUp

AnimateSeafoamCurrentsRight:
	ld hl, vTileset tile $3B ; right flowing water
	jr ScrollTileRight

AnimateSeafoamCurrentsDown:
	ld hl, vTileset tile $42 ; down flowing water
	jr ScrollTileDown

AnimateSeafoamCurrentsUp:
	ld hl, vTileset tile $30 ; up flowing water
	jr ScrollTileUp


ScrollTileRight:
	ld c, 16
.right
	ld a, [hl]
	rrca
	ld [hli], a
	dec c
	jr nz, .right
	ret

ScrollTileLeft:
	ld c, 16
.left
	ld a, [hl]
	rlca
	ld [hli], a
	dec c
	jr nz, .left
	ret

; PureRGBnote: ADDED: scrolls the tile in hl down, copied from pokecrystal
ScrollTileDown:
	ld de, 16 - 2 ; 16 bytes per tile, first two bytes are read right away
	push hl
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	pop hl
	ld a, 16 / 4 ; 16 bytes per tile, loop does 4 bytes per go
.loop
	ld b, [hl]
	ld [hl], d
	inc hl
	ld c, [hl]
	ld [hl], e
	inc hl
	ld d, [hl]
	ld [hl], b
	inc hl
	ld e, [hl]
	ld [hl], c
	inc hl
	dec a
	jr nz, .loop
	ret

; PureRGBnote: ADDED: scrolls the tile in hl down, copied from pokecrystal
ScrollTileUp:
	ld d, [hl]
	inc hl
	ld e, [hl]
	ld bc, 16 - 2
	add hl, bc
	ld a, 16 / 4
.loop
	ld c, [hl]
	ld [hl], e
	dec hl
	ld b, [hl]
	ld [hl], d
	dec hl
	ld e, [hl]
	ld [hl], c
	dec hl
	ld d, [hl]
	ld [hl], b
	dec hl
	dec a
	jr nz, .loop
	ret

ReactorAnimatedTiles:
	CheckEvent EVENT_BEAT_ZAPDOS
	ret nz
	callfar PowerPlantOverworldSFX
	ldh a, [hMovingBGTilesCounter1]
	inc a
	ldh [hMovingBGTilesCounter1], a
	rrca
	ret c
	rrca
	ret c
	rrca
	jr nc, .secondSet
.firstSet
	; on frames divisible by 4 but not 8 switch to these tiles
	ld hl, ElectricityTiles
	ld de, vTileset tile $0F
	call AnimateCopyTile
	ld hl, ElectricityTiles tile 1
	ld de, vTileset tile $1F
	jp AnimateCopyTile
.secondSet
	; on frames divisible by 8 switch to these tiles
	ld hl, ElectricityTiles tile 2
	ld de, vTileset tile $0F
	call AnimateCopyTile
	ld hl, ElectricityTiles tile 3
	ld de, vTileset tile $1F
	jp AnimateCopyTile

ProximityDigletts:
	jpfar ProximityDigletts2

Seafoam1FAnimatedTiles:
	callfar Seafoam1FAnimatedTiles2
	jp nc, AnimateWaterTile
	ret

;	ld hl, LavaBubble1
;	jr z, .copy
;	; add 16 bytes up to 3 times to navigate to the next tile according to the counter
;	ld de, 16
;.loop1
;	add hl, de
;	dec a
;	jr nz ,.loop1

FlowerTile1: INCBIN "gfx/tilesets/flower/flower1.2bpp"
FlowerTile2: INCBIN "gfx/tilesets/flower/flower2.2bpp"
FlowerTile3: INCBIN "gfx/tilesets/flower/flower3.2bpp"

LavaBubble1: INCBIN "gfx/tilesets/lava/lava1.2bpp"
LavaBubble2: INCBIN "gfx/tilesets/lava/lava2.2bpp"
LavaBubble3: INCBIN "gfx/tilesets/lava/lava3.2bpp"
LavaBubble4: INCBIN "gfx/tilesets/lava/lava4.2bpp"

ElectricityTiles: INCBIN "gfx/tilesets/electricity/electricity.2bpp"
