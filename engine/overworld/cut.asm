UsedCut: ; ef54 (3:6f54)
	xor a
	ld [wActionResultOrTookBattleTurn], a ; initialise to failure value
	ld a, [W_CURMAPTILESET]
	and a ; OVERWORLD
	jr z, .asm_ef6b
	cp GYM
	jr nz, .asm_ef77
	ld a, [wTileInFrontOfPlayer]
	cp $50 ; gym cut tree
	jr nz, .asm_ef77
	jr .asm_ef82
.asm_ef6b
	dec a
	ld a, [wTileInFrontOfPlayer]
	cp $3d ; cut tree
	jr z, .asm_ef82
	cp $52 ; grass
	jr z, .asm_ef82
.asm_ef77
	ld hl, .NothingToCutText
	jp PrintText

.NothingToCutText
	TX_FAR _NothingToCutText
	db "@"

.asm_ef82
	ld [wCutTile], a
	ld a, $1
	ld [wActionResultOrTookBattleTurn], a ; used cut
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, wd730
	set 6, [hl]
	call GBPalWhiteOutWithDelay3
	call ClearSprites
	call RestoreScreenTilesAndReloadTilePatterns
	ld a, $90
	ld [hWY], a
	call Delay3
	call LoadGBPal
	call LoadCurrentMapView
	call SaveScreenTilesToBuffer2
	call Delay3
	xor a
	ld [hWY], a
	ld hl, UsedCutText
	call PrintText
	call LoadScreenTilesFromBuffer2
	ld hl, wd730
	res 6, [hl]
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	call AnimateCutTree
	ld de, CutTreeBlockSwaps
	call Func_f09f
	call RedrawMapView
	callba Func_79e96
	ld a, $1
	ld [wUpdateSpritesEnabled], a
	ld a, SFX_CUT
	call PlaySound
	ld a, $90
	ld [hWY], a
	call UpdateSprites
	jp RedrawMapView

UsedCutText: ; eff2 (3:6ff2)
	TX_FAR _UsedCutText
	db "@"

AnimateCutTree: ; eff7 (3:6ff7)
	xor a
	ld [wWhichAnimationOffsets], a
	ld a, $e4
	ld [rOBP1], a
	ld a, [wCutTile]
	cp $52
	jr z, .asm_f020
	ld de, Overworld_GFX + $2d0 ; cuttable tree sprite top row
	ld hl, vChars1 + $7c0
	ld bc, (BANK(Overworld_GFX) << 8) + $02
	call CopyVideoData
	ld de, Overworld_GFX + $3d0 ; cuttable tree sprite bottom row
	ld hl, vChars1 + $7e0
	ld bc, (BANK(Overworld_GFX) << 8) + $02
	call CopyVideoData
	jr WriteCutTreeBoulderDustAnimationOAMBlock
.asm_f020
	ld hl, vChars1 + $7c0
	call LoadCutTreeAnimationTilePattern
	ld hl, vChars1 + $7d0
	call LoadCutTreeAnimationTilePattern
	ld hl, vChars1 + $7e0
	call LoadCutTreeAnimationTilePattern
	ld hl, vChars1 + $7f0
	call LoadCutTreeAnimationTilePattern
	call WriteCutTreeBoulderDustAnimationOAMBlock
	ld hl, wOAMBuffer + $93
	ld de, $4
	ld a, $30
	ld c, e
.asm_f044
	ld [hl], a
	add hl, de
	xor $60
	dec c
	jr nz, .asm_f044
	ret

LoadCutTreeAnimationTilePattern: ; f04c (3:704c)
	ld de, AnimationTileset2 + $60 ; tile depicting a leaf
	ld bc, (BANK(AnimationTileset2) << 8) + $01
	jp CopyVideoData

WriteCutTreeBoulderDustAnimationOAMBlock: ; f055 (3:7055)
	call GetCutTreeBoulderDustAnimationOffsets
	ld a, $9
	ld de, CutTreeBoulderDustAnimationTilesAndAttributes
	jp WriteOAMBlock

CutTreeBoulderDustAnimationTilesAndAttributes: ; f060 (3:7060)
	db $FC,$10,$FD,$10
	db $FE,$10,$FF,$10

GetCutTreeBoulderDustAnimationOffsets: ; f068 (3:7068)
	ld hl, wSpriteStateData1 + 4
	ld a, [hli] ; player's sprite screen Y position
	ld b, a
	inc hl
	ld a, [hli] ; player's sprite screen X position
	ld c, a ; bc holds ypos/xpos of player's sprite
	inc hl
	inc hl
	ld a, [hl] ; a holds direction of player (00: down, 04: up, 08: left, 0C: right)
	srl a
	ld e, a
	ld d, $0 ; de holds direction (00: down, 02: up, 04: left, 06: right)
	ld a, [wWhichAnimationOffsets]
	and a
	ld hl, CutTreeAnimationOffsets
	jr z, .asm_f084
	ld hl, BoulderDustAnimationOffsets
.asm_f084
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, b
	add d
	ld b, a
	ld a, c
	add e
	ld c, a
	ret

CutTreeAnimationOffsets: ; f08f (3:708f)
; Each pair represents the x and y pixels offsets from the player of where the cut tree animation should be drawn
	db  8, 36 ; player is facing down
	db  8,  4 ; player is facing up
	db -8, 20 ; player is facing left
	db 24, 20 ; player is facing right

BoulderDustAnimationOffsets: ; f097 (3:7097)
; Each pair represents the x and y pixels offsets from the player of where the cut tree animation should be drawn
; These offsets represent 2 blocks away from the player
	db  8,  52 ; player is facing down
	db  8, -12 ; player is facing up
	db -24, 20 ; player is facing left
	db 40,  20 ; player is facing right

Func_f09f: ; f09f (3:709f)
	push de
	ld a, [W_CURMAPWIDTH]
	add $6
	ld c, a
	ld b, $0
	ld d, $0
	ld hl, wCurrentTileBlockMapViewPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, [wSpriteStateData1 + 9]
	and a
	jr z, .down
	cp SPRITE_FACING_UP
	jr z, .up
	cp SPRITE_FACING_LEFT
	jr z, .left
	ld a, [W_XBLOCKCOORD]
	and a
	jr z, .asm_f0e0
	jr .asm_f0ec
.down
	ld a, [W_YBLOCKCOORD]
	and a
	jr z, .asm_f0e0
	jr .asm_f0df
.up
	ld a, [W_YBLOCKCOORD]
	and a
	jr z, .asm_f0e1
	jr .asm_f0e0
.left
	ld a, [W_XBLOCKCOORD]
	and a
	jr z, .asm_f0e6
	jr .asm_f0e0
.asm_f0df
	add hl, bc
.asm_f0e0
	add hl, bc
.asm_f0e1
	ld e, $2
	add hl, de
	jr .asm_f0f0
.asm_f0e6
	ld e, $1
	add hl, bc
	add hl, de
	jr .asm_f0f0
.asm_f0ec
	ld e, $3
	add hl, bc
	add hl, de
.asm_f0f0
	pop de
	ld a, [hl]
	ld c, a
.asm_f0f3
	ld a, [de]
	inc de
	inc de
	cp $ff
	ret z
	cp c
	jr nz, .asm_f0f3
	dec de
	ld a, [de]
	ld [hl], a
	ret

CutTreeBlockSwaps: ; f100 (3:7100)
; first byte = tileset block containing the cut tree
; second byte = corresponding tileset block after the cut animation happens
	db $32, $6D
	db $33, $6C
	db $34, $6F
	db $35, $4C
	db $60, $6E
	db $0B, $0A
	db $3C, $35
	db $3F, $35
	db $3D, $36
	db $FF ; list terminator
