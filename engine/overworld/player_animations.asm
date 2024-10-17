; PureRGBnote: CHANGED: this subroutine was updated to deal with DIG's overworld animation for warping between towns,
; as well as some specific map animations in the volcano.
EnterMapAnim::
	call InitFacingDirectionList
	ld a, $ec
	ld [wSpritePlayerStateData1YPixels], a
	call Delay3
	push hl
	callfar EnterMapAnimReplaceTileBlocks
	call GBFadeInFromWhite
	ld hl, wStatusFlags7
	bit BIT_USED_FLY, [hl]
	res BIT_USED_FLY, [hl]
	jr nz, .flyAnimation
	CheckAndResetEvent FLAG_DIG_OVERWORLD_ANIMATION
	jr z, .notDigInDungeon
	pop hl
	jr .dig
.notDigInDungeon
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr nz, .notVolcano ; volcano warp end animation
	ld de, FallDownHole
	call PlayNewSoundChannel5
	pop hl
	call PlayerSpinWhileMovingDown
	jr .done
.notVolcano
	ld a, SFX_TELEPORT_ENTER_1
	rst _PlaySound
	ld hl, wStatusFlags6
	bit BIT_DUNGEON_WARP, [hl] ; used dungeon warp?
	res BIT_DUNGEON_WARP, [hl]
	pop hl
	jr nz, .dungeonWarpAnimation
	call PlayerSpinWhileMovingDown
	ld a, SFX_TELEPORT_ENTER_2
	rst _PlaySound
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
	ld hl, wFacingDirectionList
	call PlayerSpinInPlace
.restoreDefaultMusic
	call PlayDefaultMusic
.done
	jp RestoreFacingDirectionAndYScreenPos
.dungeonWarpAnimation
	ld c, 50
	rst _DelayFrames
	call PlayerSpinWhileMovingDown
	jr .done
.flyAnimation
	call SetCurBlackoutMap ; PureRGBnote: CHANGED: set the map fly we ended up at as the blackout map after flying
	pop hl
	CheckAndResetEvent FLAG_DIG_OVERWORLD_ANIMATION
	jr z, .noDig
.dig ; PureRGBnote: ADDED: new dig overworld animation when entering the map 
	callfar StartDigEnterMapAnimation
	call LoadPlayerSpriteGraphics
	jr .restoreDefaultMusic
.noDig
	ld de, BirdSprite
	ld hl, vNPCSprites
	lb bc, BANK(BirdSprite), $0c
	call CopyVideoData
	call LoadBirdSpriteGraphics
	ld a, SFX_FLY
	rst _PlaySound
	ld hl, wFlyAnimUsingCoordList
	xor a ; is using coord list
	ld [hli], a ; wFlyAnimUsingCoordList
	ld a, 36 ; length of animation in FlyAnimationEnterScreenCoords
	ld [hli], a ; wFlyAnimCounter
	ld [hl], SPRITE_FACING_LEFT ; wFlyAnimBirdSpriteImageIndex (facing left)
	ld de, FlyAnimationEnterScreenCoords
	callfar DoFlyAnimation
	call LoadPlayerSpriteGraphics
	jr .restoreDefaultMusic

PlayerSpinWhileMovingDown:
	ld hl, wPlayerSpinWhileMovingUpOrDownAnimDeltaY
	ld a, $10
	ld [hli], a ; wPlayerSpinWhileMovingUpOrDownAnimDeltaY
	ld a, $3c
	ld [hli], a ; wPlayerSpinWhileMovingUpOrDownAnimMaxY
	call GetPlayerTeleportAnimFrameDelay
	ld [hl], a ; wPlayerSpinWhileMovingUpOrDownAnimFrameDelay
	ld hl, wFacingDirectionList ; PureRGBnote: FIXED: on GBC or GB there was a visual glitch while this animation happened.
	jp PlayerSpinWhileMovingUpOrDown

_LeaveMapAnim::
	call InitFacingDirectionList
	call IsPlayerStandingOnWarpPadOrHole
	ld a, b
	and a
	jr z, .playerNotStandingOnWarpPadOrHole
	dec a
	jp nz, LeaveMapThroughHoleAnim
.spinWhileMovingUp
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr nz, .notVolcano
	ld de, SFX_Drilled_Hole
	call PlayNewSoundChannel8
	jr .doneSound
.notVolcano
	ld a, SFX_TELEPORT_EXIT_1
	rst _PlaySound
.doneSound
	ld hl, wPlayerSpinWhileMovingUpOrDownAnimDeltaY
	ld a, -$10
	ld [hli], a ; wPlayerSpinWhileMovingUpOrDownAnimDeltaY
	ld a, $ec
	ld [hli], a ; wPlayerSpinWhileMovingUpOrDownAnimMaxY
	call GetPlayerTeleportAnimFrameDelay
	ld [hl], a ; wPlayerSpinWhileMovingUpOrDownAnimFrameDelay
	ld hl, wFacingDirectionList ; PureRGBnote: FIXED: on GBC or GB there was a visual glitch while this animation happened.
	call PlayerSpinWhileMovingUpOrDown
	call IsPlayerStandingOnWarpPadOrHole
	ld a, b
	dec a
; if not standing on a warp pad, there is an extra delay
	ld c, 10
	jr nz, .playerNotStandingOnWarpPad
	ld c, 5 ; added slight delay here to make gbc fade mode play both TELEPORT_EXIT_1 and TELEPORT_ENTER_1 sound effects properly
.playerNotStandingOnWarpPad
	rst _DelayFrames
	call GBFadeOutToWhite
	jp RestoreFacingDirectionAndYScreenPos
.playerNotStandingOnWarpPadOrHole
	ld a, $4
	call StopMusic
	ld a, [wStatusFlags6]
	bit BIT_ESCAPE_WARP, a
	jr z, .flyAnimation
; if going to the last used pokemon center
	CheckFlag FLAG_DIG_OVERWORLD_ANIMATION
	jr nz, .dig
	ld hl, wPlayerSpinInPlaceAnimFrameDelay
	ld a, 16
	ld [hli], a ; wPlayerSpinInPlaceAnimFrameDelay
	ld a, -1
	ld [hli], a ; wPlayerSpinInPlaceAnimFrameDelayDelta
	xor a
	ld [hli], a ; wPlayerSpinInPlaceAnimFrameDelayEndValue
	ld [hl], SFX_TELEPORT_EXIT_2 ; wPlayerSpinInPlaceAnimSoundID
	ld hl, wFacingDirectionList
	call PlayerSpinInPlace
	jr .spinWhileMovingUp
.flyAnimation
	CheckFlag FLAG_DIG_OVERWORLD_ANIMATION
	jr z, .notDig
.dig ; PureRGBnote: ADDED: new dig overworld animation when entering the map
	callfar StartDigLeaveMapAnimation
	call GBFadeOutToWhite
	jp RestoreFacingDirectionAndYScreenPos
.notDig
	call LoadBirdSpriteGraphics
	ld hl, wFlyAnimUsingCoordList
	ld a, $ff ; is not using coord list (flap in place)
	ld [hli], a ; wFlyAnimUsingCoordList
	ld a, 24 ; length of the "flapping in place" part
	ld [hli], a ; wFlyAnimCounter
	ld [hl], SPRITE_FACING_RIGHT ; wFlyAnimBirdSpriteImageIndex
	callfar DoFlyAnimation
	ld a, SFX_FLY
	rst _PlaySound
	ld hl, wFlyAnimUsingCoordList
	xor a ; is using coord list
	ld [hli], a ; wFlyAnimUsingCoordList
	ld a, 36 ; length of first part in coordinate pairs
	ld [hli], a ; wFlyAnimCounter
	ld [hl], SPRITE_FACING_RIGHT ; wFlyAnimBirdSpriteImageIndex (facing right)
	ld de, FlyAnimationScreenCoords1
	callfar DoFlyAnimation
	ld c, 40
	rst _DelayFrames
	ld hl, wFlyAnimCounter
	ld a, 33 ; length of second part in coordinate pairs
	ld [hli], a ; wFlyAnimCounter
	ld [hl], SPRITE_FACING_LEFT ; wFlyAnimBirdSpriteImageIndex (facing left)
	ld de, FlyAnimationScreenCoords2
	callfar DoFlyAnimation
	call GBFadeOutToWhite
	jp RestoreFacingDirectionAndYScreenPos

LeaveMapThroughHoleAnim:
	ld a, $ff
	ld [wUpdateSpritesEnabled], a ; disable UpdateSprites
	; shift upper half of player's sprite down 8 pixels and hide lower half
	ld a, [wShadowOAMSprite00TileID]
	ld [wShadowOAMSprite02TileID], a
	ld a, [wShadowOAMSprite01TileID]
	ld [wShadowOAMSprite03TileID], a
	ld a, $a0
	ld [wShadowOAMSprite00YCoord], a
	ld [wShadowOAMSprite01YCoord], a
	ld c, 2
	rst _DelayFrames
;;;;;;;;;; PureRGBnote: ADDED: sound effect when falling into a hole
	; play a sound effect of falling in
	ld de, FallDownHole
	call PlayNewSoundChannel5
;;;;;;;;;;
	; hide upper half of player's sprite
	ld a, $a0
	ld [wShadowOAMSprite02YCoord], a
	ld [wShadowOAMSprite03YCoord], a
	call GBFadeOutToWhite
	ld a, $1
	ld [wUpdateSpritesEnabled], a ; enable UpdateSprites
	jp RestoreFacingDirectionAndYScreenPos

LoadBirdSpriteGraphics:
	ld de, BirdSprite
	ld hl, vNPCSprites
	lb bc, BANK(BirdSprite), 12
	call CopyVideoData
	ld de, BirdSprite tile 12 ; moving animation sprite
	ld hl, vNPCSprites2
	lb bc, BANK(BirdSprite), 12
	jp CopyVideoData

InitFacingDirectionList:
	ld a, [wSpritePlayerStateData1ImageIndex] ; (image index is locked to standing images)
	ld [wSavedPlayerFacingDirection], a
	ld a, [wSpritePlayerStateData1YPixels]
	ld [wSavedPlayerScreenY], a
	ld hl, PlayerSpinningFacingOrder
	ld de, wFacingDirectionList
	ld bc, 4
	rst _CopyData
	ld a, [wSpritePlayerStateData1ImageIndex] ; (image index is locked to standing images)
	ld hl, wFacingDirectionList
; find the place in the list that matches the current facing direction
.loop
	cp [hl]
	inc hl
	jr nz, .loop
	dec hl
	ret

PlayerSpinningFacingOrder:
; The order of the direction the player's sprite is facing when teleporting
; away. Creates a spinning effect.
	db SPRITE_FACING_DOWN, SPRITE_FACING_LEFT, SPRITE_FACING_UP, SPRITE_FACING_RIGHT

SpinPlayerSprite:
; copy the current value from the list into the sprite data and rotate the list
	ld a, [hl]
	ld [wSpritePlayerStateData1ImageIndex], a ; (image index is locked to standing images)
	push hl
	ld hl, wFacingDirectionList
	ld de, wFacingDirectionList - 1
	ld bc, 4
	rst _CopyData
	ld a, [wFacingDirectionList - 1]
	ld [wFacingDirectionList + 3], a
	pop hl
	ret

PlayerSpinInPlace:
	call SpinPlayerSprite
	ld a, [wPlayerSpinInPlaceAnimFrameDelay]
	ld c, a
	and $3
	jr nz, .skipPlayingSound
; when the last delay was a multiple of 4, play a sound if there is one
	ld a, [wPlayerSpinInPlaceAnimSoundID]
	cp $ff
	call nz, PlaySound
.skipPlayingSound
	ld a, [wPlayerSpinInPlaceAnimFrameDelayDelta]
	add c
	ld [wPlayerSpinInPlaceAnimFrameDelay], a
	ld c, a
	ld a, [wPlayerSpinInPlaceAnimFrameDelayEndValue]
	cp c
	ret z
	rst _DelayFrames
	jr PlayerSpinInPlace

PlayerSpinWhileMovingUpOrDown:
	call SpinPlayerSprite
	ld a, [wPlayerSpinWhileMovingUpOrDownAnimDeltaY]
	ld c, a
	ld a, [wSpritePlayerStateData1YPixels]
	add c
	ld [wSpritePlayerStateData1YPixels], a
	ld c, a
	ld a, [wPlayerSpinWhileMovingUpOrDownAnimMaxY]
	cp c
	ret z
	ld a, [wPlayerSpinWhileMovingUpOrDownAnimFrameDelay]
	ld c, a
	rst _DelayFrames
	jr PlayerSpinWhileMovingUpOrDown

RestoreFacingDirectionAndYScreenPos:
	ld a, [wSavedPlayerScreenY]
	ld [wSpritePlayerStateData1YPixels], a
	ld a, [wSavedPlayerFacingDirection]
	ld [wSpritePlayerStateData1ImageIndex], a ; (image index is locked to standing images)
	ret

; if SGB, 2 frames, else 3 frames
GetPlayerTeleportAnimFrameDelay:
	ld a, [wOnSGB]
	xor $1
	inc a
	inc a
	ret

IsPlayerStandingOnWarpPadOrHole::
	ld b, 0
	ld hl, WarpPadAndHoleData
	ld a, [wCurMapTileset]
	ld c, a
.loop
	ld a, [hli]
	cp $ff
	jr z, .done
	cp c
	jr nz, .nextEntry
	lda_coord 8, 9
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
	ld [wStandingOnWarpPadOrHole], a
	ret

INCLUDE "data/tilesets/warp_pad_hole_tile_ids.asm"

FishingAnim:
	ld c, 10
	rst _DelayFrames
	ld hl, wMovementFlags
	set BIT_LEDGE_OR_FISHING, [hl] ; reserve the last 4 OAM entries
	ld de, RedSprite
	ld hl, vNPCSprites tile $00
	lb bc, BANK(RedSprite), 12
	call CopyVideoData
	ld a, $4
	ld hl, RedFishingTiles
	call LoadAnimSpriteGfx
	ld a, [wSpritePlayerStateData1ImageIndex]
	ld c, a
	ld b, $0
	ld hl, FishingRodOAM
	add hl, bc
	ld de, wShadowOAMSprite39
	ld bc, $4
	rst _CopyData
;;;;;;;;;; PureRGBnote: CHANGED: fishing animation wait time is randomized instead of hardcoded 100 frames.
	call Random
	and %1111111 ; a = random number between 0 and 127
	add 20 ; minimum of 20 frames after starting to result, so minimum frames fishing = 20 and max = 147
	ld c, a
;;;;;;;;;;
	rst _DelayFrames
	ld a, [wRodResponse]
	and a
	ld hl, NoNibbleText
	jr z, .done
	cp $2
	ld hl, NothingHereText
	jr z, .done

; there was a bite

; shake the player's sprite vertically
	ld b, 10
.loop
	ld hl, wSpritePlayerStateData1YPixels
	call .ShakePlayerSprite
	ld hl, wShadowOAMSprite39
	call .ShakePlayerSprite
	call Delay3
	dec b
	jr nz, .loop

; If the player is facing up, hide the fishing rod so it doesn't overlap with
; the exclamation bubble that will be shown next.
	ld a, [wSpritePlayerStateData1ImageIndex] ; (image index is locked to standing images)
	cp SPRITE_FACING_UP
	jr nz, .skipHidingFishingRod
	ld a, $a0
	ld [wShadowOAMSprite39YCoord], a

.skipHidingFishingRod
	ld hl, wEmotionBubbleSpriteIndex
	xor a
	ld [hli], a ; player's sprite
	ld [hl], a ; EXCLAMATION_BUBBLE
	callfar FishingEmotionBubble

; If the player is facing up, unhide the fishing rod.
	ld a, [wSpritePlayerStateData1ImageIndex] ; (image index is locked to standing images)
	cp SPRITE_FACING_UP
	jr nz, .skipUnhidingFishingRod
	ld a, $44
	ld [wShadowOAMSprite39YCoord], a

.skipUnhidingFishingRod
	ld hl, ItsABiteText

.done
	rst _PrintText
	ld hl, wMovementFlags
	res BIT_LEDGE_OR_FISHING, [hl] ; unreserve the last 4 OAM entries
	jp LoadFontTilePatterns

.ShakePlayerSprite
	ld a, [hl]
	xor $1
	ld [hl], a
	ret

NoNibbleText:
	text_far _NoNibbleText
	text_end

NothingHereText:
	text_far _NothingHereText
	text_end

ItsABiteText:
	text_far _ItsABiteText
	text_end

FishingRodOAM:
; specifies how the fishing rod should be drawn on the screen
	dbsprite  9, 11,  4,  3, $c0, 0         ; down
	dbsprite  9,  8,  4,  4, $c0, 0         ; up
	dbsprite  8, 10,  0,  0, $c1, 0         ; left
	dbsprite 11, 10,  0,  0, $c1, OAM_HFLIP ; right

MACRO fishing_gfx
	dw \1
	db \2
	db BANK(\1)
	dw vNPCSprites tile \3
ENDM

RedFishingTiles:
	fishing_gfx RedFishingTilesFront, 2, $02
	fishing_gfx RedFishingTilesBack,  2, $06
	fishing_gfx RedFishingTilesSide,  2, $0a
	fishing_gfx RedFishingRodTiles,   3, $c0

HandleMidJump::
	ld a, [wPlayerJumpingYScreenCoordsIndex]
	ld c, a
	inc a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; shinpokerednote: 60fps - only update every other tick
	call Ledge60fps
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	cp $10
	jr nc, .finishedJump
	ld [wPlayerJumpingYScreenCoordsIndex], a
	ld b, 0
	ld hl, PlayerJumpingYScreenCoords
	add hl, bc
	ld a, [hl]
	ld [wSpritePlayerStateData1YPixels], a
	ret
.finishedJump
	ld a, [wWalkCounter]
	and a
	ret nz
	call UpdateSprites
	call Delay3
	xor a
	ldh [hJoyHeld], a
	ldh [hJoyPressed], a
	ldh [hJoyReleased], a
	ld [wPlayerJumpingYScreenCoordsIndex], a
	ld hl, wMovementFlags
	res BIT_LEDGE_OR_FISHING, [hl]
	ld hl, wStatusFlags5
	res BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	xor a
	ld [wJoyIgnore], a
	ret

Ledge60fps:
	push hl
	push af
	lb hl, $c2, $0a
	ld a, [hl]
	xor $01
	pop af
	sub [hl]
	pop hl
	ret

PlayerJumpingYScreenCoords:
; Sequence of y screen coordinates for player's sprite when jumping over a ledge.
	db $38, $36, $34, $32, $31, $30, $30, $30, $31, $32, $33, $34, $36, $38, $3C, $3C
