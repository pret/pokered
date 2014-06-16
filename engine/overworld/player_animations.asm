Func_70510: ; 70510 (1c:4510)
	call Func_706ef
	ld a, $ec
	ld [wSpriteStateData1 + 4], a
	call Delay3
	push hl
	call GBFadeIn2
	ld hl, W_FLAGS_D733
	bit 7, [hl]
	res 7, [hl]
	jr nz, .asm_70568
	ld a, (SFX_02_4c - SFX_Headers_02) / 3
	call PlaySound
	ld hl, wd732
	bit 4, [hl]
	res 4, [hl]
	pop hl
	jr nz, .asm_7055e
	call Func_705aa
	ld a, (SFX_02_4f - SFX_Headers_02) / 3
	call PlaySound
	call Func_70787
	ld a, b
	and a
	jr nz, .asm_7055b
	ld hl, wWhichTrade ; wWhichTrade
	xor a
	ld [hli], a
	inc a
	ld [hli], a
	ld a, $8
	ld [hli], a
	ld [hl], $ff
	ld hl, wcd48
	call Func_70730
.asm_70558
	call Func_2307
.asm_7055b
	jp Func_70772
.asm_7055e
	ld c, $32
	call DelayFrames
	call Func_705aa
	jr .asm_7055b
.asm_70568
	pop hl
	ld de, BirdSprite ; $4d80
	ld hl, vNPCSprites
	ld bc, (BANK(BirdSprite) << 8) + $0c
	call CopyVideoData
	call Func_706d7
	ld a, (SFX_02_50 - SFX_Headers_02) / 3
	call PlaySound
	ld hl, wWhichTrade ; wWhichTrade
	xor a
	ld [hli], a
	ld a, $c
	ld [hli], a
	ld [hl], $8
	ld de, FlyAnimationEnterScreenCoords ; $4592
	call Func_706ae
	call LoadPlayerSpriteGraphics
	jr .asm_70558

FlyAnimationEnterScreenCoords: ; 70592 (1c:4592)
; y, x pairs
; This is the sequence of screen coordinates used by the overworld
; Fly animation when the player is entering a map.
	db $05, $98
	db $0F, $90
	db $18, $88
	db $20, $80
	db $27, $78
	db $2D, $70
	db $32, $68
	db $36, $60
	db $39, $58
	db $3B, $50
	db $3C, $48
	db $3C, $40

Func_705aa: ; 705aa (1c:45aa)
	ld hl, wWhichTrade ; wWhichTrade
	ld a, $10
	ld [hli], a
	ld a, $3c
	ld [hli], a
	call Func_7077f
	ld [hl], a
	jp Func_70755

_LeaveMapAnim: ; 705ba (1c:45ba)
	call Func_706ef
	call Func_70787
	ld a, b
	and a
	jr z, .asm_705ef
	dec a
	jp nz, Func_7067d
.asm_705c8
	ld a, (SFX_02_4b - SFX_Headers_02) / 3
	call PlaySound
	ld hl, wWhichTrade ; wWhichTrade
	ld a, $f0
	ld [hli], a
	ld a, $ec
	ld [hli], a
	call Func_7077f
	ld [hl], a
	call Func_70755
	call Func_70787
	ld a, b
	dec a
	jr z, .asm_705e9
	ld c, $a
	call DelayFrames
.asm_705e9
	call GBFadeOut2
	jp Func_70772
.asm_705ef
	ld a, $4
	call StopMusic
	ld a, [wd732]
	bit 6, a
	jr z, .asm_70610
	ld hl, wWhichTrade ; wWhichTrade
	ld a, $10
	ld [hli], a
	ld a, $ff
	ld [hli], a
	xor a
	ld [hli], a
	ld [hl], $a1
	ld hl, wcd48
	call Func_70730
	jr .asm_705c8
.asm_70610
	call Func_706d7
	ld hl, wWhichTrade ; wWhichTrade
	ld a, $ff
	ld [hli], a
	ld a, $8
	ld [hli], a
	ld [hl], $c
	call Func_706ae
	ld a, (SFX_02_50 - SFX_Headers_02) / 3
	call PlaySound
	ld hl, wWhichTrade ; wWhichTrade
	xor a
	ld [hli], a
	ld a, $c
	ld [hli], a
	ld [hl], $c
	ld de, FlyAnimationScreenCoords1 ; $464f
	call Func_706ae
	ld c, $28
	call DelayFrames
	ld hl, wTrainerEngageDistance
	ld a, $b
	ld [hli], a
	ld [hl], $8
	ld de, FlyAnimationScreenCoords2 ; $4667
	call Func_706ae
	call GBFadeOut2
	jp Func_70772

FlyAnimationScreenCoords1: ; 7064f (1c:464f)
; y, x pairs
; This is the sequence of screen coordinates used by the first part
; of the Fly overworld animation.
	db $3C, $48
	db $3C, $50
	db $3B, $58
	db $3A, $60
	db $39, $68
	db $37, $70
	db $37, $78
	db $33, $80
	db $30, $88
	db $2D, $90
	db $2A, $98
	db $27, $A0

FlyAnimationScreenCoords2: ; 70667 (1c:4667)
; y, x pairs
; This is the sequence of screen coordinates used by the second part
; of the Fly overworld animation.
	db $1A, $90
	db $19, $80
	db $17, $70
	db $15, $60
	db $12, $50
	db $0F, $40
	db $0C, $30
	db $09, $20
	db $05, $10
	db $00, $00

	db $F0, $00

Func_7067d: ; 7067d (1c:467d)
	ld a, $ff
	ld [wcfcb], a
	ld a, [wOAMBuffer + $02]
	ld [wOAMBuffer + $0a], a
	ld a, [wOAMBuffer + $06]
	ld [wOAMBuffer + $0e], a
	ld a, $a0
	ld [wOAMBuffer], a
	ld [wOAMBuffer + $04], a
	ld c, $2
	call DelayFrames
	ld a, $a0
	ld [wOAMBuffer + $08], a
	ld [wOAMBuffer + $0c], a
	call GBFadeOut2
	ld a, $1
	ld [wcfcb], a
	jp Func_70772

Func_706ae: ; 706ae (1c:46ae)
	ld a, [wTrainerFacingDirection]
	xor $1
	ld [wTrainerFacingDirection], a
	ld [wSpriteStateData1 + 2], a
	call Delay3
	ld a, [wWhichTrade] ; wWhichTrade
	cp $ff
	jr z, .asm_706cd
	ld hl, wSpriteStateData1 + 4
	ld a, [de]
	inc de
	ld [hli], a
	inc hl
	ld a, [de]
	inc de
	ld [hl], a
.asm_706cd
	ld a, [wTrainerEngageDistance]
	dec a
	ld [wTrainerEngageDistance], a
	jr nz, Func_706ae
	ret

Func_706d7: ; 706d7 (1c:46d7)
	ld de, BirdSprite ; $4d80
	ld hl, vNPCSprites
	ld bc, (BANK(BirdSprite) << 8) + $0c
	call CopyVideoData
	ld de, BirdSprite + $c0 ; $4e40 ; moving amination sprite
	ld hl, vNPCSprites2
	ld bc, (BANK(BirdSprite) << 8) + $0c
	jp CopyVideoData

Func_706ef: ; 706ef (1c:46ef)
	ld a, [wSpriteStateData1 + 2]
	ld [wcd50], a
	ld a, [wSpriteStateData1 + 4]
	ld [wcd4f], a
	ld hl, PlayerSpinningFacingOrder ; $4713
	ld de, wcd48
	ld bc, $4
	call CopyData
	ld a, [wSpriteStateData1 + 2]
	ld hl, wcd48
.asm_7070d
	cp [hl]
	inc hl
	jr nz, .asm_7070d
	dec hl
	ret

PlayerSpinningFacingOrder: ; 70713 (1c:4713)
; The order of the direction the player's sprite is facing when teleporting
; away. Creates a spinning effect.
	db $00, $08, $04, $0C ; down, left, up, right

Func_70717: ; 70717 (1c:4717)
	ld a, [hl]
	ld [wSpriteStateData1 + 2], a
	push hl
	ld hl, wcd48
	ld de, wcd47
	ld bc, $4
	call CopyData
	ld a, [wcd47]
	ld [wcd4b], a
	pop hl
	ret

Func_70730: ; 70730 (1c:4730)
	call Func_70717
	ld a, [wWhichTrade] ; wWhichTrade
	ld c, a
	and $3
	jr nz, .asm_70743
	ld a, [wTrainerScreenY]
	cp $ff
	call nz, PlaySound
.asm_70743
	ld a, [wTrainerEngageDistance]
	add c
	ld [wWhichTrade], a ; wWhichTrade
	ld c, a
	ld a, [wTrainerFacingDirection]
	cp c
	ret z
	call DelayFrames
	jr Func_70730

Func_70755: ; 70755 (1c:4755)
	call Func_70717
	ld a, [wWhichTrade] ; wWhichTrade
	ld c, a
	ld a, [wSpriteStateData1 + 4]
	add c
	ld [wSpriteStateData1 + 4], a
	ld c, a
	ld a, [wTrainerEngageDistance]
	cp c
	ret z
	ld a, [wTrainerFacingDirection]
	ld c, a
	call DelayFrames
	jr Func_70755

Func_70772: ; 70772 (1c:4772)
	ld a, [wcd4f]
	ld [wSpriteStateData1 + 4], a
	ld a, [wcd50]
	ld [wSpriteStateData1 + 2], a
	ret

Func_7077f: ; 7077f (1c:477f)
	ld a, [wcf1b]
	xor $1
	inc a
	inc a
	ret

Func_70787: ; 70787 (1c:4787)
	ld b, 0
	ld hl, DataTable_707a9 ; $47a9
	ld a, [W_CURMAPTILESET] ; W_CURMAPTILESET
	ld c, a
.asm_70790
	ld a, [hli]
	cp $ff
	jr z, .asm_707a4
	cp c
	jr nz, .asm_7079e
	FuncCoord 8, 9
	ld a, [Coord]
	cp [hl]
	jr z, .asm_707a2
.asm_7079e
	inc hl
	inc hl
	jr .asm_70790
.asm_707a2
	inc hl
	ld b, [hl]
.asm_707a4
	ld a, b
	ld [wcd5b], a
	ret

; format: db tileset id, tile id, value to be put in wcd5b
DataTable_707a9: ; 707a9 (1c:47a9)
	db FACILITY, $20, 1 ; warp pad
	db FACILITY, $11, 2 ; hole
	db CAVERN,   $22, 2 ; hole
	db INTERIOR, $55, 1 ; warp pad
	db $FF

Func_707b6: ; 707b6 (1c:47b6)
	ld c, $a
	call DelayFrames
	ld hl, wd736
	set 6, [hl]
	ld de, RedSprite ; $4180
	ld hl, vNPCSprites
	ld bc, (BANK(RedSprite) << 8) + $0c
	call CopyVideoData
	ld a, $4
	ld hl, RedFishingTiles ; $4866
	call Func_71771
	ld a, [wSpriteStateData1 + 2]
	ld c, a
	ld b, $0
	ld hl, FishingRodGfxProperties ; $4856
	add hl, bc
	ld de, wOAMBuffer + $9c
	ld bc, $4
	call CopyData
	ld c, $64
	call DelayFrames
	ld a, [wWhichTrade] ; wWhichTrade
	and a
	ld hl, NoNibbleText
	jr z, .asm_70836
	cp $2
	ld hl, NothingHereText
	jr z, .asm_70836
	ld b, $a
.asm_707fe
	ld hl, wSpriteStateData1 + 4
	call Func_70842
	ld hl, wOAMBuffer + $9c
	call Func_70842
	call Delay3
	dec b
	jr nz, .asm_707fe
	ld a, [wSpriteStateData1 + 2]
	cp $4
	jr nz, .asm_7081c
	ld a, $a0
	ld [wOAMBuffer + $9c], a
.asm_7081c
	ld hl, wcd4f
	xor a
	ld [hli], a
	ld [hl], a
	predef EmotionBubble
	ld a, [wSpriteStateData1 + 2]
	cp $4
	jr nz, .asm_70833
	ld a, $44
	ld [wOAMBuffer + $9c], a
.asm_70833
	ld hl, ItsABiteText
.asm_70836
	call PrintText
	ld hl, wd736
	res 6, [hl]
	call LoadFontTilePatterns
	ret

Func_70842: ; 70842 (1c:4842)
	ld a, [hl]
	xor $1
	ld [hl], a
	ret

NoNibbleText: ; 70847 (1c:4847)
	TX_FAR _NoNibbleText
	db "@"

NothingHereText: ; 7084c (1c:484c)
	TX_FAR _NothingHereText
	db "@"

ItsABiteText: ; 70851 (1c:4851)
	TX_FAR _ItsABiteText
	db "@"

FishingRodGfxProperties: ; 70856 (1c:4856)
; specicies how the fishing rod should be drawn on the screen
; first byte = screen y coordinate
; second byte = screen x coordinate
; third byte = tile number
; fourth byte = sprite properties
	db $5B, $4C, $FD, $00 ; player facing down
	db $44, $4C, $FD, $00 ; player facing up
	db $50, $40, $FE, $00 ; player facing left
	db $50, $58, $FE, $20 ; player facing right ($20 means "horizontally flip the tile")

RedFishingTiles: ; 70866 (1c:4866)
	dw RedFishingTilesFront
	db 2, BANK(RedFishingTilesFront)
	dw vNPCSprites + $20

	dw RedFishingTilesBack
	db 2, BANK(RedFishingTilesBack)
	dw vNPCSprites + $60

	dw RedFishingTilesSide
	db 2, BANK(RedFishingTilesSide)
	dw vNPCSprites + $a0

	dw RedFishingRodTiles
	db 3, BANK(RedFishingRodTiles)
	dw vNPCSprites2 + $7d0

_HandleMidJump: ; 7087e (1c:487e)
	ld a, [wd714]
	ld c, a
	inc a
	cp $10
	jr nc, .asm_70895
	ld [wd714], a
	ld b, $0
	ld hl, PlayerJumpingYScreenCoords ; $48ba
	add hl, bc
	ld a, [hl]
	ld [wSpriteStateData1 + 4], a ; player's sprite y coordinate
	ret
.asm_70895
	ld a, [wWalkCounter] ; wcfc5
	cp $0
	ret nz
	call UpdateSprites
	call Delay3
	xor a
	ld [hJoyHeld], a
	ld [hJoyPressed], a
	ld [hJoyReleased], a
	ld [wd714], a
	ld hl, wd736
	res 6, [hl]
	ld hl, wd730
	res 7, [hl]
	xor a
	ld [wJoyIgnore], a
	ret

PlayerJumpingYScreenCoords: ; 708ba (1c:48ba)
; Sequence of y screen coordinates for player's sprite when jumping over a ledge.
	db $38, $36, $34, $32, $31, $30, $30, $30, $31, $32, $33, $34, $36, $38, $3C, $3C
