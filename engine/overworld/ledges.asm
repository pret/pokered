HandleLedges::
	ld a, [wMovementFlags]
	bit BIT_LEDGE_OR_FISHING, a
	ret nz
	ld a, [wCurMapTileset]
	and a ; OVERWORLD
	jr z, .overworld
	cp VOLCANO
	jr z, .volcano
	ret
.overworld
	predef GetTileAndCoordsInFrontOfPlayer
	ld hl, LedgeTiles
	ld a, [wSpritePlayerStateData1FacingDirection]
	ld b, a
	lda_coord 8, 9
	ld c, a
	ld a, [wTileInFrontOfPlayer]
	ld d, a
.loop
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr nz, .nextLedgeTile1
	ld a, [hli]
	cp c
	jr nz, .nextLedgeTile2
	ld a, [hli]
	cp d
	jr nz, .nextLedgeTile3
	ld a, [hl]
	ld e, a
	jr .foundMatch
.nextLedgeTile1
	inc hl
.nextLedgeTile2
	inc hl
.nextLedgeTile3
	inc hl
	jr .loop
.foundMatch
;;;;;;;;;; PureRGBnote: ADDED: if the player is jumping down a ledge and there's a cut tile in front of it, block the player.
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_DOWN
	jr z, .checkCutTileInFrontOfLedge
.noCutTile
;;;;;;;;;;
	ldh a, [hJoyHeld]
	and e
	ret z
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld hl, wMovementFlags
	set BIT_LEDGE_OR_FISHING, [hl]
	call StartSimulatingJoypadStates
	ld a, e
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesEnd + 1], a
	ld a, $2
	ld [wSimulatedJoypadStatesIndex], a
	call LoadHoppingShadowOAM
	ld a, SFX_LEDGE
	rst _PlaySound
	ret
;;;;;;;;;; PureRGBnote: ADDED: if the player is jumping down a ledge and there's a cut tree in front of it, block the player.
.checkCutTileInFrontOfLedge
	lda_coord 8, 13
	cp $3D ; cut tile
	ret z
	jr .noCutTile
;;;;;;;;;;
;;;;;;;;;; PureRGBnote: ADDED: in the volcano area, we need custom code for new ledges
.volcano
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_DOWN
	jr z, .down
	cp SPRITE_FACING_LEFT
	jr z, .left
	cp SPRITE_FACING_RIGHT
	jr z, .right
	ret
.down
	lda_coord 8, 10
	cp $41 ; down ledge
	ret nz
	ld e, D_DOWN
	jr .noCutTile
.left
	lda_coord 7, 9
	cp $30 ; left ledge
	ret nz
	ld e, D_LEFT
	jr .noCutTile
.right
	lda_coord 10, 9
	cp $40 ; right ledge
	ret nz
	ld e, D_RIGHT
	jr .noCutTile
;;;;;;;;



INCLUDE "data/tilesets/ledge_tiles.asm"

LoadHoppingShadowOAM:
	ld hl, vChars1 tile $7f
	ld de, LedgeHoppingShadow
	lb bc, BANK(LedgeHoppingShadow), (LedgeHoppingShadowEnd - LedgeHoppingShadow) / $8
	call CopyVideoDataDouble
	ld a, $9
	lb bc, $54, $48 ; b, c = y, x coordinates of shadow
	ld de, LedgeHoppingShadowOAMBlock
	jp WriteOAMBlock

LedgeHoppingShadow:
	INCBIN "gfx/overworld/shadow.1bpp"
LedgeHoppingShadowEnd:

LedgeHoppingShadowOAMBlock:
; tile ID, attributes
	db $ff, OAM_OBP1
	db $ff, OAM_HFLIP
	db $ff, OAM_VFLIP
	db $ff, OAM_HFLIP | OAM_VFLIP
