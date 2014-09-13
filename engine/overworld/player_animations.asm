EnterMapAnim: ; 70510 (1c:4510)
	call InitFacingDirectionBuffer
	ld a, $ec
	ld [wSpriteStateData1 + 4], a ; player's sprite Y screen position
	call Delay3
	push hl
	call GBFadeInFromWhite
	ld hl, W_FLAGS_D733
	bit 7, [hl] ; used fly out of battle?
	res 7, [hl]
	jr nz, .flyAnimation
	ld a, (SFX_02_4c - SFX_Headers_02) / 3
	call PlaySound
	ld hl, wd732
	bit 4, [hl] ; used dungeon warp?
	res 4, [hl]
	pop hl
	jr nz, .dungeonWarpAnimation
	call PlayerSpinWhileMovingDown
	ld a, (SFX_02_4f - SFX_Headers_02) / 3
	call PlaySound
	call IsPlayerStandingOnWarpPadOrHole
	ld a, b
	and a
	jr nz, .done
; if the player is not standing on a warp pad or hole
	ld hl, wPlayerSpinInPlaceAnimFrameDelay
	xor a
	ld [hli], a ; wPlayerSpinInPlaceAnimFrameDelay
	inc a
	ld [hli], a ; wPlayerSpinInPlaceAnimFrameDelayDelta
	ld a, $8
	ld [hli], a ; wPlayerSpinInPlaceAnimFrameDelayEndValue
	ld [hl], $ff ; wPlayerSpinInPlaceAnimSoundID
	ld hl, wcd48
	call PlayerSpinInPlace
.restoreDefaultMusic
	call PlayDefaultMusic
.done
	jp RestoreFacingDirectionAndYScreenPos
.dungeonWarpAnimation
	ld c, 50
	call DelayFrames
	call PlayerSpinWhileMovingDown
	jr .done
.flyAnimation
	pop hl
	ld de, BirdSprite
	ld hl, vNPCSprites
	ld bc, (BANK(BirdSprite) << 8) + $0c
	call CopyVideoData
	call LoadBirdSpriteGraphics
	ld a, (SFX_02_50 - SFX_Headers_02) / 3
	call PlaySound
	ld hl, wFlyAnimUsingCoordList
	xor a ; is using coord list
	ld [hli], a ; wFlyAnimUsingCoordList
	ld a, 12
	ld [hli], a ; wFlyAnimCounter
	ld [hl], $8 ; wFlyAnimBirdSpriteImageIndex (facing right)
	ld de, FlyAnimationEnterScreenCoords ; $4592
	call DoFlyAnimation
	call LoadPlayerSpriteGraphics
	jr .restoreDefaultMusic

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

PlayerSpinWhileMovingDown: ; 705aa (1c:45aa)
	ld hl, wPlayerSpinWhileMovingUpOrDownAnimDeltaY
	ld a, $10
	ld [hli], a ; wPlayerSpinWhileMovingUpOrDownAnimDeltaY
	ld a, $3c
	ld [hli], a ; wPlayerSpinWhileMovingUpOrDownAnimMaxY
	call GetPlayerTeleportAnimFrameDelay
	ld [hl], a ; wPlayerSpinWhileMovingUpOrDownAnimFrameDelay
	jp PlayerSpinWhileMovingUpOrDown

_LeaveMapAnim: ; 705ba (1c:45ba)
	call InitFacingDirectionBuffer
	call IsPlayerStandingOnWarpPadOrHole
	ld a, b
	and a
	jr z, .playerNotStandingOnWarpPadOrHole
	dec a
	jp nz, LeaveMapThroughHoleAnim
.spinWhileMovingUp
	ld a, (SFX_02_4b - SFX_Headers_02) / 3
	call PlaySound
	ld hl, wPlayerSpinWhileMovingUpOrDownAnimDeltaY
	ld a, -$10
	ld [hli], a ; wPlayerSpinWhileMovingUpOrDownAnimDeltaY
	ld a, $ec
	ld [hli], a ; wPlayerSpinWhileMovingUpOrDownAnimMaxY
	call GetPlayerTeleportAnimFrameDelay
	ld [hl], a ; wPlayerSpinWhileMovingUpOrDownAnimFrameDelay
	call PlayerSpinWhileMovingUpOrDown
	call IsPlayerStandingOnWarpPadOrHole
	ld a, b
	dec a
	jr z, .playerStandingOnWarpPad
; if not standing on a warp pad, there is an extra delay
	ld c, 10
	call DelayFrames
.playerStandingOnWarpPad
	call GBFadeOutToWhite
	jp RestoreFacingDirectionAndYScreenPos
.playerNotStandingOnWarpPadOrHole
	ld a, $4
	call StopMusic
	ld a, [wd732]
	bit 6, a ; is the last used pokemon center the destination?
	jr z, .flyAnimation
; if going to the last used pokemon center
	ld hl, wPlayerSpinInPlaceAnimFrameDelay
	ld a, 16
	ld [hli], a ; wPlayerSpinInPlaceAnimFrameDelay
	ld a, -1
	ld [hli], a ; wPlayerSpinInPlaceAnimFrameDelayDelta
	xor a
	ld [hli], a ; wPlayerSpinInPlaceAnimFrameDelayEndValue
	ld [hl], $a1 ; wPlayerSpinInPlaceAnimSoundID
	ld hl, wcd48
	call PlayerSpinInPlace
	jr .spinWhileMovingUp
.flyAnimation
	call LoadBirdSpriteGraphics
	ld hl, wFlyAnimUsingCoordList
	ld a, $ff ; is not using coord list (flap in place)
	ld [hli], a ; wFlyAnimUsingCoordList
	ld a, 8
	ld [hli], a ; wFlyAnimCounter
	ld [hl], $c ; wFlyAnimBirdSpriteImageIndex
	call DoFlyAnimation
	ld a, (SFX_02_50 - SFX_Headers_02) / 3
	call PlaySound
	ld hl, wFlyAnimUsingCoordList
	xor a ; is using coord list
	ld [hli], a ; wFlyAnimUsingCoordList
	ld a, $c
	ld [hli], a ; wFlyAnimCounter
	ld [hl], $c ; wFlyAnimBirdSpriteImageIndex (facing right)
	ld de, FlyAnimationScreenCoords1 ; $464f
	call DoFlyAnimation
	ld c, 40
	call DelayFrames
	ld hl, wFlyAnimCounter
	ld a, 11
	ld [hli], a ; wFlyAnimCounter
	ld [hl], $8 ; wFlyAnimBirdSpriteImageIndex (facing left)
	ld de, FlyAnimationScreenCoords2 ; $4667
	call DoFlyAnimation
	call GBFadeOutToWhite
	jp RestoreFacingDirectionAndYScreenPos

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

LeaveMapThroughHoleAnim: ; 7067d (1c:467d)
	ld a, $ff
	ld [wUpdateSpritesEnabled], a ; disable UpdateSprites
	; shift upper half of player's sprite down 8 pixels and hide lower half
	ld a, [wOAMBuffer + 0 * 4 + 2]
	ld [wOAMBuffer + 2 * 4 + 2], a
	ld a, [wOAMBuffer + 1 * 4 + 2]
	ld [wOAMBuffer + 3 * 4 + 2], a
	ld a, $a0
	ld [wOAMBuffer + 0 * 4], a
	ld [wOAMBuffer + 1 * 4], a
	ld c, 2
	call DelayFrames
	; hide lower half of player's sprite
	ld a, $a0
	ld [wOAMBuffer + 2 * 4], a
	ld [wOAMBuffer + 3 * 4], a
	call GBFadeOutToWhite
	ld a, $1
	ld [wUpdateSpritesEnabled], a ; enable UpdateSprites
	jp RestoreFacingDirectionAndYScreenPos

DoFlyAnimation: ; 706ae (1c:46ae)
	ld a, [wFlyAnimBirdSpriteImageIndex]
	xor $1 ; make the bird flap its wings
	ld [wFlyAnimBirdSpriteImageIndex], a
	ld [wSpriteStateData1 + 2], a
	call Delay3
	ld a, [wFlyAnimUsingCoordList]
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
	ld a, [wFlyAnimCounter]
	dec a
	ld [wFlyAnimCounter], a
	jr nz, DoFlyAnimation
	ret

LoadBirdSpriteGraphics: ; 706d7 (1c:46d7)
	ld de, BirdSprite ; $4d80
	ld hl, vNPCSprites
	ld bc, (BANK(BirdSprite) << 8) + $0c
	call CopyVideoData
	ld de, BirdSprite + $c0 ; $4e40 ; moving amination sprite
	ld hl, vNPCSprites2
	ld bc, (BANK(BirdSprite) << 8) + $0c
	jp CopyVideoData

InitFacingDirectionBuffer: ; 706ef (1c:46ef)
	ld a, [wSpriteStateData1 + 2] ; player's sprite facing direction (image index is locked to standing images)
	ld [wcd50], a
	ld a, [wSpriteStateData1 + 4] ; player's sprite Y screen position
	ld [wcd4f], a
	ld hl, PlayerSpinningFacingOrder
	ld de, wcd48
	ld bc, $4
	call CopyData
	ld a, [wSpriteStateData1 + 2] ; player's sprite facing direction (image index is locked to standing images)
	ld hl, wcd48
.loop
	cp [hl]
	inc hl
	jr nz, .loop
	dec hl
	ret

PlayerSpinningFacingOrder: ; 70713 (1c:4713)
; The order of the direction the player's sprite is facing when teleporting
; away. Creates a spinning effect.
	db SPRITE_FACING_DOWN, SPRITE_FACING_LEFT, SPRITE_FACING_UP, SPRITE_FACING_RIGHT

SpinPlayerSprite: ; 70717 (1c:4717)
	ld a, [hl]
	ld [wSpriteStateData1 + 2], a ; player's sprite facing direction (image index is locked to standing images)
	push hl
	ld hl, wcd48
	ld de, wcd47
	ld bc, $4
	call CopyData
	ld a, [wcd47]
	ld [wcd4b], a
	pop hl
	ret

PlayerSpinInPlace: ; 70730 (1c:4730)
	call SpinPlayerSprite
	ld a, [wPlayerSpinInPlaceAnimFrameDelay]
	ld c, a
	and $3
	jr nz, .asm_70743
	ld a, [wPlayerSpinInPlaceAnimSoundID]
	cp $ff
	call nz, PlaySound
.asm_70743
	ld a, [wPlayerSpinInPlaceAnimFrameDelayDelta]
	add c
	ld [wPlayerSpinInPlaceAnimFrameDelay], a
	ld c, a
	ld a, [wPlayerSpinInPlaceAnimFrameDelayEndValue]
	cp c
	ret z
	call DelayFrames
	jr PlayerSpinInPlace

PlayerSpinWhileMovingUpOrDown: ; 70755 (1c:4755)
	call SpinPlayerSprite
	ld a, [wPlayerSpinWhileMovingUpOrDownAnimDeltaY]
	ld c, a
	ld a, [wSpriteStateData1 + 4] ; player's sprite Y screen position
	add c
	ld [wSpriteStateData1 + 4], a
	ld c, a
	ld a, [wPlayerSpinWhileMovingUpOrDownAnimMaxY]
	cp c
	ret z
	ld a, [wPlayerSpinWhileMovingUpOrDownAnimFrameDelay]
	ld c, a
	call DelayFrames
	jr PlayerSpinWhileMovingUpOrDown

RestoreFacingDirectionAndYScreenPos: ; 70772 (1c:4772)
	ld a, [wcd4f]
	ld [wSpriteStateData1 + 4], a
	ld a, [wcd50]
	ld [wSpriteStateData1 + 2], a
	ret

; if SGB, 2 frames, else 3 frames
GetPlayerTeleportAnimFrameDelay: ; 7077f (1c:477f)
	ld a, [wOnSGB]
	xor $1
	inc a
	inc a
	ret

IsPlayerStandingOnWarpPadOrHole: ; 70787 (1c:4787)
	ld b, 0
	ld hl, .warpPadAndHoleData
	ld a, [W_CURMAPTILESET]
	ld c, a
.loop
	ld a, [hli]
	cp $ff
	jr z, .done
	cp c
	jr nz, .nextEntry
	aCoord 8, 9
	cp [hl]
	jr z, .foundMatch
.nextEntry
	inc hl
	inc hl
	jr .loop
.foundMatch
	inc hl
	ld b, [hl]
.done
	ld a, b
	ld [wcd5b], a
	ret

; format: db tileset id, tile id, value to be put in wcd5b
.warpPadAndHoleData: ; 707a9 (1c:47a9)
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
; specifies how the fishing rod should be drawn on the screen
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
	ld a, [wPlayerJumpingYScreenCoordsIndex]
	ld c, a
	inc a
	cp $10
	jr nc, .finishedJump
	ld [wPlayerJumpingYScreenCoordsIndex], a
	ld b, 0
	ld hl, PlayerJumpingYScreenCoords
	add hl, bc
	ld a, [hl]
	ld [wSpriteStateData1 + 4], a ; player's sprite y coordinate
	ret
.finishedJump
	ld a, [wWalkCounter]
	cp 0
	ret nz
	call UpdateSprites
	call Delay3
	xor a
	ld [hJoyHeld], a
	ld [hJoyPressed], a
	ld [hJoyReleased], a
	ld [wPlayerJumpingYScreenCoordsIndex], a
	ld hl, wd736
	res 6, [hl] ; not jumping down a ledge any more
	ld hl, wd730
	res 7, [hl] ; not simulating joypad states any more
	xor a
	ld [wJoyIgnore], a
	ret

PlayerJumpingYScreenCoords: ; 708ba (1c:48ba)
; Sequence of y screen coordinates for player's sprite when jumping over a ledge.
	db $38, $36, $34, $32, $31, $30, $30, $30, $31, $32, $33, $34, $36, $38, $3C, $3C
