Func_70510: ; 70510 (1c:4510)
	call Func_706ef
	ld a, $ec
	ld [$c104], a
	call Delay3
	push hl
	call GBFadeIn2
	ld hl, W_FLAGS_D733
	bit 7, [hl]
	res 7, [hl]
	jr nz, .asm_70568
	ld a, (SFX_02_4c - SFX_Headers_02) / 3
	call PlaySound
	ld hl, $d732
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
	ld hl, wWhichTrade ; $cd3d
	xor a
	ld [hli], a
	inc a
	ld [hli], a
	ld a, $8
	ld [hli], a
	ld [hl], $ff
	ld hl, $cd48
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
	ld hl, $8000
	ld bc, (BANK(BirdSprite) << 8) + $0c
	call CopyVideoData
	call Func_706d7
	ld a, (SFX_02_50 - SFX_Headers_02) / 3
	call PlaySound
	ld hl, wWhichTrade ; $cd3d
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
	ld hl, wWhichTrade ; $cd3d
	ld a, $10
	ld [hli], a
	ld a, $3c
	ld [hli], a
	call Func_7077f
	ld [hl], a
	jp Func_70755

_DoFlyOrTeleportAwayGraphics: ; 705ba (1c:45ba)
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
	ld hl, wWhichTrade ; $cd3d
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
	ld a, [$d732]
	bit 6, a
	jr z, .asm_70610
	ld hl, wWhichTrade ; $cd3d
	ld a, $10
	ld [hli], a
	ld a, $ff
	ld [hli], a
	xor a
	ld [hli], a
	ld [hl], $a1
	ld hl, $cd48
	call Func_70730
	jr .asm_705c8
.asm_70610
	call Func_706d7
	ld hl, wWhichTrade ; $cd3d
	ld a, $ff
	ld [hli], a
	ld a, $8
	ld [hli], a
	ld [hl], $c
	call Func_706ae
	ld a, (SFX_02_50 - SFX_Headers_02) / 3
	call PlaySound
	ld hl, wWhichTrade ; $cd3d
	xor a
	ld [hli], a
	ld a, $c
	ld [hli], a
	ld [hl], $c
	ld de, FlyAnimationScreenCoords1 ; $464f
	call Func_706ae
	ld c, $28
	call DelayFrames
	ld hl, $cd3e
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
	ld [$cfcb], a
	ld a, [$c302]
	ld [$c30a], a
	ld a, [$c306]
	ld [$c30e], a
	ld a, $a0
	ld [wOAMBuffer], a
	ld [$c304], a
	ld c, $2
	call DelayFrames
	ld a, $a0
	ld [$c308], a
	ld [$c30c], a
	call GBFadeOut2
	ld a, $1
	ld [$cfcb], a
	jp Func_70772

Func_706ae: ; 706ae (1c:46ae)
	ld a, [$cd3f]
	xor $1
	ld [$cd3f], a
	ld [$c102], a
	call Delay3
	ld a, [wWhichTrade] ; $cd3d
	cp $ff
	jr z, .asm_706cd
	ld hl, $c104
	ld a, [de]
	inc de
	ld [hli], a
	inc hl
	ld a, [de]
	inc de
	ld [hl], a
.asm_706cd
	ld a, [$cd3e]
	dec a
	ld [$cd3e], a
	jr nz, Func_706ae
	ret

Func_706d7: ; 706d7 (1c:46d7)
	ld de, BirdSprite ; $4d80
	ld hl, $8000
	ld bc, (BANK(BirdSprite) << 8) + $0c
	call CopyVideoData
	ld de, BirdSprite + $c0 ; $4e40 ; moving amination sprite
	ld hl, $8800
	ld bc, (BANK(BirdSprite) << 8) + $0c
	jp CopyVideoData

Func_706ef: ; 706ef (1c:46ef)
	ld a, [$c102]
	ld [$cd50], a
	ld a, [$c104]
	ld [$cd4f], a
	ld hl, PlayerSpinningFacingOrder ; $4713
	ld de, $cd48
	ld bc, $4
	call CopyData
	ld a, [$c102]
	ld hl, $cd48
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
	ld [$c102], a
	push hl
	ld hl, $cd48
	ld de, $cd47
	ld bc, $4
	call CopyData
	ld a, [$cd47]
	ld [$cd4b], a
	pop hl
	ret

Func_70730: ; 70730 (1c:4730)
	call Func_70717
	ld a, [wWhichTrade] ; $cd3d
	ld c, a
	and $3
	jr nz, .asm_70743
	ld a, [$cd40]
	cp $ff
	call nz, PlaySound
.asm_70743
	ld a, [$cd3e]
	add c
	ld [wWhichTrade], a ; $cd3d
	ld c, a
	ld a, [$cd3f]
	cp c
	ret z
	call DelayFrames
	jr Func_70730

Func_70755: ; 70755 (1c:4755)
	call Func_70717
	ld a, [wWhichTrade] ; $cd3d
	ld c, a
	ld a, [$c104]
	add c
	ld [$c104], a
	ld c, a
	ld a, [$cd3e]
	cp c
	ret z
	ld a, [$cd3f]
	ld c, a
	call DelayFrames
	jr Func_70755

Func_70772: ; 70772 (1c:4772)
	ld a, [$cd4f]
	ld [$c104], a
	ld a, [$cd50]
	ld [$c102], a
	ret

Func_7077f: ; 7077f (1c:477f)
	ld a, [$cf1b]
	xor $1
	inc a
	inc a
	ret

Func_70787: ; 70787 (1c:4787)
	ld b, 0
	ld hl, DataTable_707a9 ; $47a9
	ld a, [W_CURMAPTILESET] ; $d367
	ld c, a
.asm_70790
	ld a, [hli]
	cp $ff
	jr z, .asm_707a4
	cp c
	jr nz, .asm_7079e
	FuncCoord 8, 9 ; $c45c
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
	ld [$cd5b], a
	ret

; format: db tileset id, tile id, value to be put in $cd5b
DataTable_707a9: ; 707a9 (1c:47a9)
	db FACILITY, $20, 1 ; warp pad
	db FACILITY, $11, 2 ; hole
	db CAVERN,   $22, 2 ; hole
	db INTERIOR, $55, 1 ; warp pad
	db $FF

Func_707b6: ; 707b6 (1c:47b6)
	ld c, $a
	call DelayFrames
	ld hl, $d736
	set 6, [hl]
	ld de, RedSprite ; $4180
	ld hl, $8000
	ld bc, (BANK(RedSprite) << 8) + $0c
	call CopyVideoData
	ld a, $4
	ld hl, RedFishingTiles ; $4866
	call Func_71771
	ld a, [$c102]
	ld c, a
	ld b, $0
	ld hl, FishingRodGfxProperties ; $4856
	add hl, bc
	ld de, $c39c
	ld bc, $4
	call CopyData
	ld c, $64
	call DelayFrames
	ld a, [wWhichTrade] ; $cd3d
	and a
	ld hl, NoNibbleText
	jr z, .asm_70836
	cp $2
	ld hl, NothingHereText
	jr z, .asm_70836
	ld b, $a
.asm_707fe
	ld hl, $c104
	call Func_70842
	ld hl, $c39c
	call Func_70842
	call Delay3
	dec b
	jr nz, .asm_707fe
	ld a, [$c102]
	cp $4
	jr nz, .asm_7081c
	ld a, $a0
	ld [$c39c], a
.asm_7081c
	ld hl, $cd4f
	xor a
	ld [hli], a
	ld [hl], a
	ld a, $4c
	call Predef ; indirect jump to PrintEmotionBubble (17c47 (5:7c47))
	ld a, [$c102]
	cp $4
	jr nz, .asm_70833
	ld a, $44
	ld [$c39c], a
.asm_70833
	ld hl, ItsABiteText
.asm_70836
	call PrintText
	ld hl, $d736
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
	db $02, $1E
	dw $8020

	dw RedFishingTilesBack
	db $02, $1E
	dw $8060

	dw RedFishingTilesSide
	db $02, $1E
	dw $80A0

	dw RedFishingRodTiles
	db $03, $1E
	dw $8FD0

_HandleMidJump: ; 7087e (1c:487e)
	ld a, [$d714]
	ld c, a
	inc a
	cp $10
	jr nc, .asm_70895
	ld [$d714], a
	ld b, $0
	ld hl, PlayerJumpingYScreenCoords ; $48ba
	add hl, bc
	ld a, [hl]
	ld [$c104], a ; player's sprite y coordinate
	ret
.asm_70895
	ld a, [wWalkCounter] ; $cfc5
	cp $0
	ret nz
	call UpdateSprites
	call Delay3
	xor a
	ld [hJoyHeld], a
	ld [hJoyPressed], a
	ld [hJoyReleased], a
	ld [$d714], a
	ld hl, $d736
	res 6, [hl]
	ld hl, $d730
	res 7, [hl]
	xor a
	ld [wJoyIgnore], a
	ret

PlayerJumpingYScreenCoords: ; 708ba (1c:48ba)
; Sequence of y screen coordinates for player's sprite when jumping over a ledge.
	db $38, $36, $34, $32, $31, $30, $30, $30, $31, $32, $33, $34, $36, $38, $3C, $3C
