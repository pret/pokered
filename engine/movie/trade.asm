InternalClockTradeAnim:
; Do the trading animation with the player's gameboy on the left.
; In-game trades and internally clocked link cable trades use this.
	ld a, [wTradedPlayerMonSpecies]
	ld [wLeftGBMonSpecies], a
	ld a, [wTradedEnemyMonSpecies]
	ld [wRightGBMonSpecies], a
	ld de, InternalClockTradeFuncSequence
	jr TradeAnimCommon

ExternalClockTradeAnim:
; Do the trading animation with the player's gameboy on the right.
; Externally clocked link cable trades use this.
	ld a, [wTradedEnemyMonSpecies]
	ld [wLeftGBMonSpecies], a
	ld a, [wTradedPlayerMonSpecies]
	ld [wRightGBMonSpecies], a
	ld de, ExternalClockTradeFuncSequence

TradeAnimCommon:
	ld a, [wOptions]
	push af
	ldh a, [hSCY]
	push af
	ldh a, [hSCX]
	push af
	xor a
	ld [wOptions], a
	ldh [hSCY], a
	ldh [hSCX], a
	push de
.loop
	pop de
	ld a, [de]
	cp $ff
	jr z, .done
	inc de
	push de
	ld hl, TradeFuncPointerTable
	add a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .loop
	push de
	jp hl ; call trade func, which will return to the top of the loop
.done
	pop af
	ldh [hSCX], a
	pop af
	ldh [hSCY], a
	pop af
	ld [wOptions], a
	ret

MACRO addtradefunc
\1TradeFunc::
	dw \1
ENDM

MACRO tradefunc
	db (\1TradeFunc - TradeFuncPointerTable) / 2
ENDM

; The functions in the sequences below are executed in order by TradeFuncCommon.
; They are from opposite perspectives. The external clock one makes use of
; Trade_SwapNames to swap the player and enemy names for some functions.

InternalClockTradeFuncSequence:
	tradefunc LoadTradingGFXAndMonNames
	tradefunc Trade_ShowPlayerMon
	tradefunc Trade_DrawOpenEndOfLinkCable
	tradefunc Trade_AnimateBallEnteringLinkCable
	tradefunc Trade_AnimLeftToRight
	tradefunc Trade_Delay100
	tradefunc Trade_ShowClearedWindow
	tradefunc PrintTradeWentToText
	tradefunc PrintTradeForSendsText
	tradefunc PrintTradeFarewellText
	tradefunc Trade_AnimRightToLeft
	tradefunc Trade_ShowClearedWindow
	tradefunc Trade_DrawOpenEndOfLinkCable
	tradefunc Trade_ShowEnemyMon
	tradefunc Trade_Delay100
	tradefunc Trade_Cleanup
	db -1 ; end

ExternalClockTradeFuncSequence:
	tradefunc LoadTradingGFXAndMonNames
	tradefunc Trade_ShowClearedWindow
	tradefunc PrintTradeWillTradeText
	tradefunc PrintTradeFarewellText
	tradefunc Trade_SwapNames
	tradefunc Trade_AnimLeftToRight
	tradefunc Trade_SwapNames
	tradefunc Trade_ShowClearedWindow
	tradefunc Trade_DrawOpenEndOfLinkCable
	tradefunc Trade_ShowEnemyMon
	tradefunc Trade_SlideTextBoxOffScreen
	tradefunc Trade_ShowPlayerMon
	tradefunc Trade_DrawOpenEndOfLinkCable
	tradefunc Trade_AnimateBallEnteringLinkCable
	tradefunc Trade_SwapNames
	tradefunc Trade_AnimRightToLeft
	tradefunc Trade_SwapNames
	tradefunc Trade_Delay100
	tradefunc Trade_ShowClearedWindow
	tradefunc PrintTradeWentToText
	tradefunc Trade_Cleanup
	db -1 ; end

TradeFuncPointerTable:
	addtradefunc LoadTradingGFXAndMonNames
	addtradefunc Trade_ShowPlayerMon
	addtradefunc Trade_DrawOpenEndOfLinkCable
	addtradefunc Trade_AnimateBallEnteringLinkCable
	addtradefunc Trade_ShowEnemyMon
	addtradefunc Trade_AnimLeftToRight
	addtradefunc Trade_AnimRightToLeft
	addtradefunc Trade_Delay100
	addtradefunc Trade_ShowClearedWindow
	addtradefunc PrintTradeWentToText
	addtradefunc PrintTradeForSendsText
	addtradefunc PrintTradeFarewellText
	addtradefunc PrintTradeTakeCareText
	addtradefunc PrintTradeWillTradeText
	addtradefunc Trade_Cleanup
	addtradefunc Trade_SlideTextBoxOffScreen
	addtradefunc Trade_SwapNames

Trade_Delay100:
	ld c, 100
	jp DelayFrames

Trade_CopyTileMapToVRAM:
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	xor a
	ldh [hAutoBGTransferEnabled], a
	ret

Trade_Delay80:
	ld c, 80
	jp DelayFrames

Trade_ClearTileMap:
	hlcoord 0, 0
	ld bc, SCREEN_AREA
	ld a, " "
	jp FillMemory

LoadTradingGFXAndMonNames:
	call Trade_ClearTileMap
	call DisableLCD
	ld hl, TradingAnimationGraphics
	ld de, vChars2 tile $31
	ld bc, TradingAnimationGraphicsEnd - TradingAnimationGraphics
	ld a, BANK(TradingAnimationGraphics)
	call FarCopyData2
	ld hl, TradingAnimationGraphics2
	ld de, vSprites tile $7c
	ld bc, TradingAnimationGraphics2End - TradingAnimationGraphics2
	ld a, BANK(TradingAnimationGraphics2)
	call FarCopyData2
	ld hl, vBGMap0
	ld bc, $800
	ld a, " "
	call FillMemory
	call ClearSprites
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	ld a, [wOnSGB]
	and a
	ld a, $e4 ; non-SGB OBP0
	jr z, .next
	ld a, $f0 ; SGB OBP0
.next
	ldh [rOBP0], a
	call EnableLCD
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld a, [wTradedPlayerMonSpecies]
	ld [wNamedObjectIndex], a
	call GetMonName
	ld hl, wNameBuffer
	ld de, wStringBuffer
	ld bc, NAME_LENGTH
	call CopyData
	ld a, [wTradedEnemyMonSpecies]
	ld [wNamedObjectIndex], a
	jp GetMonName

Trade_LoadMonPartySpriteGfx:
	ld a, %11010000
	ldh [rOBP1], a
	farjp LoadMonPartySpriteGfx

Trade_SwapNames:
	ld hl, wPlayerName
	ld de, wBuffer
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, wLinkEnemyTrainerName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, wBuffer
	ld de, wLinkEnemyTrainerName
	ld bc, NAME_LENGTH
	jp CopyData

Trade_Cleanup:
	xor a
	call LoadGBPal
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ret

Trade_ShowPlayerMon:
	ld a, %10101011
	ldh [rLCDC], a
	ld a, $50
	ldh [hWY], a
	ld a, $86
	ldh [rWX], a
	ldh [hSCX], a
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 4, 0
	ld b, 6
	ld c, 10
	call TextBoxBorder
	call Trade_PrintPlayerMonInfoText
	ld b, HIGH(vBGMap0)
	call CopyScreenTileBufferToVRAM
	call ClearScreen
	ld a, [wTradedPlayerMonSpecies]
	call Trade_LoadMonSprite
	ld a, $7e
.slideScreenLoop
	push af
	call DelayFrame
	pop af
	ldh [rWX], a
	ldh [hSCX], a
	dec a
	dec a
	and a
	jr nz, .slideScreenLoop
	call Trade_Delay80
	ld a, TRADE_BALL_POOF_ANIM
	call Trade_ShowAnimation
	ld a, TRADE_BALL_DROP_ANIM
	call Trade_ShowAnimation ; clears mon pic
	ld a, [wTradedPlayerMonSpecies]
	call PlayCry
	xor a
	ldh [hAutoBGTransferEnabled], a
	ret

Trade_DrawOpenEndOfLinkCable:
	call Trade_ClearTileMap
	ld b, HIGH(vBGMap0)
	call CopyScreenTileBufferToVRAM
	ld b, SET_PAL_GENERIC
	call RunPaletteCommand

; This function call is pointless. It just copies blank tiles to VRAM that was
; already filled with blank tiles.
	ld hl, vBGMap1 + $8c
	call Trade_CopyCableTilesOffScreen

	ld a, $a0
	ldh [hSCX], a
	call DelayFrame
	ld a, %10001011
	ldh [rLCDC], a
	hlcoord 6, 2
	ld b, TILEMAP_LINK_CABLE
	call CopyTileIDsFromList_ZeroBaseTileID
	call Trade_CopyTileMapToVRAM
	ld a, SFX_HEAL_HP
	call PlaySound
	ld c, 20
.loop
	ldh a, [hSCX]
	add 4
	ldh [hSCX], a
	dec c
	jr nz, .loop
	ret

Trade_AnimateBallEnteringLinkCable:
	ld a, TRADE_BALL_SHAKE_ANIM
	call Trade_ShowAnimation
	ld c, 10
	call DelayFrames
	ld a, %11100100
	ldh [rOBP0], a
	xor a
	ld [wLinkCableAnimBulgeToggle], a
	lb bc, $20, $60
.moveBallInsideLinkCableLoop
	push bc
	xor a
	ld de, Trade_BallInsideLinkCableOAMBlock
	call WriteOAMBlock
	ld a, [wLinkCableAnimBulgeToggle]
	xor $1
	ld [wLinkCableAnimBulgeToggle], a
	add $7e
	ld hl, wShadowOAMSprite00TileID
	ld de, 4
	ld c, e
.cycleLinkCableBulgeTile
	ld [hl], a
	add hl, de
	dec c
	jr nz, .cycleLinkCableBulgeTile
	call Delay3
	pop bc
	ld a, c
	add $4
	ld c, a
	cp $a0
	jr nc, .ballSpriteReachedEdgeOfScreen
	ld a, SFX_TINK
	call PlaySound
	jr .moveBallInsideLinkCableLoop
.ballSpriteReachedEdgeOfScreen
	call ClearSprites
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call ClearScreen
	ld b, $98
	call CopyScreenTileBufferToVRAM
	call Delay3
	xor a
	ldh [hAutoBGTransferEnabled], a
	ret

Trade_BallInsideLinkCableOAMBlock:
	db $7e, 0
	db $7e, OAM_XFLIP
	db $7e, OAM_YFLIP
	db $7e, OAM_XFLIP | OAM_YFLIP

Trade_ShowEnemyMon:
	ld a, TRADE_BALL_TILT_ANIM
	call Trade_ShowAnimation
	call Trade_ShowClearedWindow
	hlcoord 4, 10
	ld b, 6
	ld c, 10
	call TextBoxBorder
	call Trade_PrintEnemyMonInfoText
	call Trade_CopyTileMapToVRAM
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	ld a, [wTradedEnemyMonSpecies]
	call Trade_LoadMonSprite
	ld a, TRADE_BALL_POOF_ANIM
	call Trade_ShowAnimation
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	ld a, [wTradedEnemyMonSpecies]
	call PlayCry
	call Trade_Delay100
	hlcoord 4, 10
	lb bc, 8, 12
	call ClearScreenArea
	jp PrintTradeTakeCareText

Trade_AnimLeftToRight:
; Animates the mon moving from the left GB to the right one.
	call Trade_InitGameboyTransferGfx
	ld a, $1
	ld [wTradedMonMovingRight], a
	ld a, %11100100
	ldh [rOBP0], a
	ld a, $54
	ld [wBaseCoordX], a
	ld a, $1c
	ld [wBaseCoordY], a
	ld a, [wLeftGBMonSpecies]
	ld [wMonPartySpriteSpecies], a
	call Trade_WriteCircledMonOAM
	call Trade_DrawLeftGameboy
	call Trade_CopyTileMapToVRAM
	call Trade_DrawCableAcrossScreen
	ld hl, vBGMap1 + $8c
	call Trade_CopyCableTilesOffScreen
	ld b, $6
	call Trade_AnimMonMoveHorizontal
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call Trade_DrawCableAcrossScreen
	ld b, $4
	call Trade_AnimMonMoveHorizontal
	call Trade_DrawRightGameboy
	ld b, $6
	call Trade_AnimMonMoveHorizontal
	xor a
	ldh [hAutoBGTransferEnabled], a
	call Trade_AnimMonMoveVertical
	jp ClearSprites

Trade_AnimRightToLeft:
; Animates the mon moving from the right GB to the left one.
	call Trade_InitGameboyTransferGfx
	xor a
	ld [wTradedMonMovingRight], a
	ld a, $64
	ld [wBaseCoordX], a
	ld a, $44
	ld [wBaseCoordY], a
	ld a, [wRightGBMonSpecies]
	ld [wMonPartySpriteSpecies], a
	call Trade_WriteCircledMonOAM
	call Trade_DrawRightGameboy
	call Trade_CopyTileMapToVRAM
	call Trade_DrawCableAcrossScreen
	ld hl, vBGMap1 + $94
	call Trade_CopyCableTilesOffScreen
	call Trade_AnimMonMoveVertical
	ld b, $6
	call Trade_AnimMonMoveHorizontal
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call Trade_DrawCableAcrossScreen
	ld b, $4
	call Trade_AnimMonMoveHorizontal
	call Trade_DrawLeftGameboy
	ld b, $6
	call Trade_AnimMonMoveHorizontal
	xor a
	ldh [hAutoBGTransferEnabled], a
	jp ClearSprites

Trade_InitGameboyTransferGfx:
; Initialises the graphics for showing a mon moving between gameboys.
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call ClearScreen
	xor a
	ldh [hAutoBGTransferEnabled], a
	call Trade_LoadMonPartySpriteGfx
	call DelayFrame
	ld a, %10101011
	ldh [rLCDC], a
	xor a
	ldh [hSCX], a
	ld a, $90
	ldh [hWY], a
	ret

Trade_DrawLeftGameboy:
	call Trade_ClearTileMap

; draw link cable
	hlcoord 11, 4
	ld a, $5d
	ld [hli], a
	ld a, $5e
	ld c, 8
.loop
	ld [hli], a
	dec c
	jr nz, .loop

; draw gameboy pic
	hlcoord 5, 3
	ld b, TILEMAP_GAME_BOY
	call CopyTileIDsFromList_ZeroBaseTileID

; draw text box with player name below gameboy pic
	hlcoord 4, 12
	ld b, 2
	ld c, 7
	call TextBoxBorder
	hlcoord 5, 14
	ld de, wPlayerName
	call PlaceString

	jp DelayFrame

Trade_DrawRightGameboy:
	call Trade_ClearTileMap

; draw horizontal segment of link cable
	hlcoord 0, 4
	ld a, $5e
	ld c, $e
.loop
	ld [hli], a
	dec c
	jr nz, .loop

; draw vertical segment of link cable
	ld a, $5f
	ld [hl], a
	ld de, SCREEN_WIDTH
	add hl, de
	ld a, $61
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld a, $60
	ld [hld], a
	ld a, $5d
	ld [hl], a

; draw gameboy pic
	hlcoord 7, 8
	ld b, TILEMAP_GAME_BOY
	call CopyTileIDsFromList_ZeroBaseTileID

; draw text box with enemy name above link cable
	hlcoord 6, 0
	ld b, 2
	ld c, 7
	call TextBoxBorder
	hlcoord 7, 2
	ld de, wLinkEnemyTrainerName
	call PlaceString

	jp DelayFrame

Trade_DrawCableAcrossScreen:
; Draws the link cable across the screen.
	call Trade_ClearTileMap
	hlcoord 0, 4
	ld a, $5e
	ld c, SCREEN_WIDTH
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

Trade_CopyCableTilesOffScreen:
; This is used to copy the link cable tiles off screen so that the cable
; continues when the screen is scrolled.
	push hl
	hlcoord 0, 4
	call CopyToRedrawRowOrColumnSrcTiles
	pop hl
	ld a, h
	ldh [hRedrawRowOrColumnDest + 1], a
	ld a, l
	ldh [hRedrawRowOrColumnDest], a
	ld a, REDRAW_ROW
	ldh [hRedrawRowOrColumnMode], a
	ld c, 10
	jp DelayFrames

Trade_AnimMonMoveHorizontal:
; Animates the mon going through the link cable horizontally over a distance of
; b 16-pixel units.
	ld a, [wTradedMonMovingRight]
	ld e, a
	ld d, $8
.scrollLoop
	ld a, e
	dec a
	jr z, .movingRight
; moving left
	ldh a, [hSCX]
	sub $2
	jr .next
.movingRight
	ldh a, [hSCX]
	add $2
.next
	ldh [hSCX], a
	call DelayFrame
	dec d
	jr nz, .scrollLoop
	call Trade_AnimCircledMon
	dec b
	jr nz, Trade_AnimMonMoveHorizontal
	ret

Trade_AnimCircledMon:
; Cycles between the two animation frames of the mon party sprite, cycles
; between a circle and an oval around the mon sprite, and makes the cable flash.
	push de
	push bc
	push hl
	ldh a, [rBGP]
	xor $3c ; make link cable flash
	ldh [rBGP], a
	ld hl, wShadowOAMSprite00TileID
	ld de, $4
	ld c, $14
.loop
	ld a, [hl]
	xor ICONOFFSET
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	pop hl
	pop bc
	pop de
	ret

Trade_WriteCircledMonOAM:
	farcall WriteMonPartySpriteOAMBySpecies
	call Trade_WriteCircleOAMBlock

Trade_AddOffsetsToOAMCoords:
	ld hl, wShadowOAM
	ld c, $14
.loop
	ld a, [wBaseCoordY]
	add [hl]
	ld [hli], a
	ld a, [wBaseCoordX]
	add [hl]
	ld [hli], a
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret

Trade_AnimMonMoveVertical:
; Animates the mon going through the link cable vertically as well as
; horizontally for a bit. The last bit of horizontal movement (when moving
; right) or the first bit of horizontal movement (when moving left) are done
; here instead of Trade_AnimMonMoveHorizontal because this function moves the
; sprite itself rather than scrolling the screen around the sprite. Moving the
; sprite itself is necessary because the vertical segment of the link cable is
; to the right of the screen position that the mon sprite has when
; Trade_AnimMonMoveHorizontal is executing.
	ld a, [wTradedMonMovingRight]
	and a
	jr z, .movingLeft
; moving right
	lb bc, 4, 0 ; move right
	call .doAnim
	lb bc, 0, 10 ; move down
	jr .doAnim
.movingLeft
	lb bc, 0, -10 ; move up
	call .doAnim
	lb bc, -4, 0 ; move left
.doAnim
	ld a, b
	ld [wBaseCoordX], a
	ld a, c
	ld [wBaseCoordY], a
	ld d, $4
.loop
	call Trade_AddOffsetsToOAMCoords
	call Trade_AnimCircledMon
	ld c, 8
	call DelayFrames
	dec d
	jr nz, .loop
	ret

Trade_WriteCircleOAMBlock:
; Writes the OAM blocks for the circle around the traded mon as it passes
; the link cable.
	ld hl, Trade_CircleOAMBlocks
	ld c, 4
	xor a
.loop
	push bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	push hl
	inc a
	push af
	call WriteOAMBlock
	pop af
	pop hl
	pop bc
	dec c
	jr nz, .loop
	ret

MACRO trade_circle_oam_block
	; oam block pointer, upper-left x coord, upper-left y coord
	dw \1
	db \2, \3
ENDM

Trade_CircleOAMBlocks:
	trade_circle_oam_block .OAMBlock0,  8,  8
	trade_circle_oam_block .OAMBlock1, 24,  8
	trade_circle_oam_block .OAMBlock2,  8, 24
	trade_circle_oam_block .OAMBlock3, 24, 24

.OAMBlock0:
	db ICON_TRADEBUBBLE << 2 + 0, OAM_PAL1
	db ICON_TRADEBUBBLE << 2 + 1, OAM_PAL1
	db ICON_TRADEBUBBLE << 2 + 2, OAM_PAL1
	db ICON_TRADEBUBBLE << 2 + 3, OAM_PAL1

.OAMBlock1:
	db ICON_TRADEBUBBLE << 2 + 1, OAM_PAL1 | OAM_XFLIP
	db ICON_TRADEBUBBLE << 2 + 0, OAM_PAL1 | OAM_XFLIP
	db ICON_TRADEBUBBLE << 2 + 3, OAM_PAL1 | OAM_XFLIP
	db ICON_TRADEBUBBLE << 2 + 2, OAM_PAL1 | OAM_XFLIP

.OAMBlock2:
	db ICON_TRADEBUBBLE << 2 + 2, OAM_PAL1 | OAM_YFLIP
	db ICON_TRADEBUBBLE << 2 + 3, OAM_PAL1 | OAM_YFLIP
	db ICON_TRADEBUBBLE << 2 + 0, OAM_PAL1 | OAM_YFLIP
	db ICON_TRADEBUBBLE << 2 + 1, OAM_PAL1 | OAM_YFLIP

.OAMBlock3:
	db ICON_TRADEBUBBLE << 2 + 3, OAM_PAL1 | OAM_XFLIP | OAM_YFLIP
	db ICON_TRADEBUBBLE << 2 + 2, OAM_PAL1 | OAM_XFLIP | OAM_YFLIP
	db ICON_TRADEBUBBLE << 2 + 1, OAM_PAL1 | OAM_XFLIP | OAM_YFLIP
	db ICON_TRADEBUBBLE << 2 + 0, OAM_PAL1 | OAM_XFLIP | OAM_YFLIP

; a = species
Trade_LoadMonSprite:
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	ld [wWholeScreenPaletteMonSpecies], a
	ld b, SET_PAL_POKEMON_WHOLE_SCREEN
	ld c, 0
	call RunPaletteCommand
	ldh a, [hAutoBGTransferEnabled]
	xor $1
	ldh [hAutoBGTransferEnabled], a
	call GetMonHeader
	hlcoord 7, 2
	call LoadFlippedFrontSpriteByMonIndex
	ld c, 10
	jp DelayFrames

Trade_ShowClearedWindow:
; clears the window and covers the BG entirely with the window
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call ClearScreen
	ld a, %11100011
	ldh [rLCDC], a
	ld a, $7
	ldh [rWX], a
	xor a
	ldh [hWY], a
	ld a, $90
	ldh [hSCX], a
	ret

Trade_SlideTextBoxOffScreen:
; Slides the window right until it's off screen. The window usually just has
; a text box at the bottom when this is called. However, when this is called
; after Trade_ShowEnemyMon in the external clock sequence, there is a mon pic
; above the text box and it is also scrolled off the screen.
	ld c, 50
	call DelayFrames
.loop
	call DelayFrame
	ldh a, [rWX]
	inc a
	inc a
	ldh [rWX], a
	cp $a1
	jr nz, .loop
	call Trade_ClearTileMap
	ld c, 10
	call DelayFrames
	ld a, $7
	ldh [rWX], a
	ret

PrintTradeWentToText:
	ld hl, TradeWentToText
	call PrintText
	ld c, 200
	call DelayFrames
	jp Trade_SlideTextBoxOffScreen

TradeWentToText:
	text_far _TradeWentToText
	text_end

PrintTradeForSendsText:
	ld hl, TradeForText
	call PrintText
	call Trade_Delay80
	ld hl, TradeSendsText
	call PrintText
	jp Trade_Delay80

TradeForText:
	text_far _TradeForText
	text_end

TradeSendsText:
	text_far _TradeSendsText
	text_end

PrintTradeFarewellText:
	ld hl, TradeWavesFarewellText
	call PrintText
	call Trade_Delay80
	ld hl, TradeTransferredText
	call PrintText
	call Trade_Delay80
	jp Trade_SlideTextBoxOffScreen

TradeWavesFarewellText:
	text_far _TradeWavesFarewellText
	text_end

TradeTransferredText:
	text_far _TradeTransferredText
	text_end

PrintTradeTakeCareText:
	ld hl, TradeTakeCareText
	call PrintText
	jp Trade_Delay80

TradeTakeCareText:
	text_far _TradeTakeCareText
	text_end

PrintTradeWillTradeText:
	ld hl, TradeWillTradeText
	call PrintText
	call Trade_Delay80
	ld hl, TradeforText
	call PrintText
	jp Trade_Delay80

TradeWillTradeText:
	text_far _TradeWillTradeText
	text_end

TradeforText:
	text_far _TradeforText
	text_end

Trade_ShowAnimation:
	ld [wAnimationID], a
	xor a
	ld [wAnimationType], a
	predef_jump MoveAnimation
