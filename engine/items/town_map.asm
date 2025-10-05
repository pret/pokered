DEF NOT_VISITED EQU $fe

DEF BIRD_BASE_TILE EQU $04

DisplayTownMap:
	call LoadTownMap
	ld hl, wUpdateSpritesEnabled
	ld a, [hl]
	push af
	ld [hl], $ff
	push hl
	ld a, $1
	ldh [hJoy7], a
	ld a, [wCurMap]
	push af
	ld b, $0
	call DrawPlayerOrBirdSprite
	hlcoord 1, 0
	ld de, wNameBuffer
	call PlaceString
	ld hl, wShadowOAMSprite00
	ld de, wShadowOAMBackupSprite00
	ld bc, 4 * 4
	call CopyData
	ld hl, vSprites tile BIRD_BASE_TILE
	ld de, TownMapCursor
	lb bc, BANK(TownMapCursor), (TownMapCursorEnd - TownMapCursor) / TILE_1BPP_SIZE
	call CopyVideoDataDouble
	xor a
	ld [wWhichTownMapLocation], a
	pop af
	jr .enterLoop

.townMapLoop
	hlcoord 0, 0
	lb bc, 1, 20
	call ClearScreenArea
	ld hl, TownMapOrder
	ld a, [wWhichTownMapLocation]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
.enterLoop
	ld de, wTownMapCoords
	call LoadTownMapEntry
	ld a, [de]
	push hl
	call TownMapCoordsToOAMCoords
	ld a, $4
	ld [wOAMBaseTile], a
	ld hl, wShadowOAMSprite04
	call WriteTownMapSpriteOAM ; town map cursor sprite
	pop hl
	ld de, wNameBuffer
.copyMapName
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .copyMapName
	hlcoord 1, 0
	ld de, wNameBuffer
	call PlaceString
	ld hl, wShadowOAMSprite04
	ld de, wShadowOAMBackupSprite04
	ld bc, 4 * 4
	call CopyData
.inputLoop
	call TownMapSpriteBlinkingAnimation
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	ld b, a
	and PAD_A | PAD_B | PAD_UP | PAD_DOWN
	jr z, .inputLoop
	ld a, SFX_TINK
	call PlaySound
	bit B_PAD_UP, b
	jr nz, .pressedUp
	bit B_PAD_DOWN, b
	jr nz, .pressedDown
	xor a
	ld [wTownMapSpriteBlinkingEnabled], a
	ldh [hJoy7], a
	ld [wAnimCounter], a
	call ExitTownMap
	pop hl
	pop af
	ld [hl], a
	ret
.pressedUp
	ld a, [wWhichTownMapLocation]
	inc a
	cp TownMapOrderEnd - TownMapOrder ; number of list items + 1
	jr nz, .noOverflow
	xor a
.noOverflow
	ld [wWhichTownMapLocation], a
	jp .townMapLoop
.pressedDown
	ld a, [wWhichTownMapLocation]
	dec a
	cp -1
	jr nz, .noUnderflow
	ld a, TownMapOrderEnd - TownMapOrder - 1 ; number of list items
.noUnderflow
	ld [wWhichTownMapLocation], a
	jp .townMapLoop

INCLUDE "data/maps/town_map_order.asm"

TownMapCursor:
	INCBIN "gfx/town_map/town_map_cursor.1bpp"
TownMapCursorEnd:

LoadTownMap_Nest:
	call LoadTownMap
	ld hl, wUpdateSpritesEnabled
	ld a, [hl]
	push af
	ld [hl], $ff
	push hl
	call DisplayWildLocations
	call GetMonName
	hlcoord 1, 0
	call PlaceString
	ld h, b
	ld l, c
	ld de, MonsNestText
	call PlaceString
	call WaitForTextScrollButtonPress
	call ExitTownMap
	pop hl
	pop af
	ld [hl], a
	ret

MonsNestText:
	db "'s NEST@"

LoadTownMap_Fly::
	call ClearSprites
	call LoadTownMap
	call LoadPlayerSpriteGraphics
	call LoadFontTilePatterns
	ld de, BirdSprite
	ld hl, vSprites tile BIRD_BASE_TILE
	lb bc, BANK(BirdSprite), 12
	call CopyVideoData
	ld de, TownMapUpArrow
	ld hl, vChars1 tile $6d
	lb bc, BANK(TownMapUpArrow), (TownMapUpArrowEnd - TownMapUpArrow) / TILE_1BPP_SIZE
	call CopyVideoDataDouble
	call BuildFlyLocationsList
	ld hl, wUpdateSpritesEnabled
	ld a, [hl]
	push af
	ld [hl], $ff
	push hl
	hlcoord 0, 0
	ld de, ToText
	call PlaceString
	ld a, [wCurMap]
	ld b, $0
	call DrawPlayerOrBirdSprite
	ld hl, wFlyLocationsList
	decoord 18, 0
.townMapFlyLoop
	ld a, " "
	ld [de], a
	push hl
	push hl
	hlcoord 3, 0
	lb bc, 1, 15
	call ClearScreenArea
	pop hl
	ld a, [hl]
	ld b, BIRD_BASE_TILE
	call DrawPlayerOrBirdSprite
	hlcoord 3, 0
	ld de, wNameBuffer
	call PlaceString
	ld c, 15
	call DelayFrames
	hlcoord 18, 0
	ld [hl], "▲"
	hlcoord 19, 0
	ld [hl], "▼"
	pop hl
.inputLoop
	push hl
	call DelayFrame
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	ld b, a
	pop hl
	and PAD_A | PAD_B | PAD_UP | PAD_DOWN
	jr z, .inputLoop
	bit B_PAD_A, b
	jr nz, .pressedA
	ld a, SFX_TINK
	call PlaySound
	bit B_PAD_UP, b
	jr nz, .pressedUp
	bit B_PAD_DOWN, b
	jr nz, .pressedDown
	jr .pressedB
.pressedA
	ld a, SFX_HEAL_AILMENT
	call PlaySound
	ld a, [hl]
	ld [wDestinationMap], a
	ld hl, wStatusFlags6
	set BIT_FLY_WARP, [hl]
	ASSERT wStatusFlags6 + 1 == wStatusFlags7
	inc hl
	set BIT_USED_FLY, [hl]
.pressedB
	xor a
	ld [wTownMapSpriteBlinkingEnabled], a
	call GBPalWhiteOutWithDelay3
	pop hl
	pop af
	ld [hl], a
	ret
.pressedUp
	decoord 18, 0
	inc hl
	ld a, [hl]
	cp $ff
	jr z, .wrapToStartOfList
	cp NOT_VISITED
	jr z, .pressedUp ; skip past unvisited towns
	jp .townMapFlyLoop
.wrapToStartOfList
	ld hl, wFlyLocationsList
	jp .townMapFlyLoop
.pressedDown
	decoord 19, 0
	dec hl
	ld a, [hl]
	cp $ff
	jr z, .wrapToEndOfList
	cp NOT_VISITED
	jr z, .pressedDown ; skip past unvisited towns
	jp .townMapFlyLoop
.wrapToEndOfList
	ld hl, wFlyLocationsList + NUM_CITY_MAPS
	jr .pressedDown

ToText:
	db "To@"

BuildFlyLocationsList:
	ld hl, wFlyAnimUsingCoordList
	ld [hl], $ff
	inc hl
	ld a, [wTownVisitedFlag]
	ld e, a
	ld a, [wTownVisitedFlag + 1]
	ld d, a
	lb bc, 0, NUM_CITY_MAPS
.loop
	srl d
	rr e
	ld a, NOT_VISITED
	jr nc, .notVisited
	ld a, b ; store the map number of the town if it has been visited
.notVisited
	ld [hl], a
	inc hl
	inc b
	dec c
	jr nz, .loop
	ld [hl], $ff
	ret

TownMapUpArrow:
	INCBIN "gfx/town_map/up_arrow.1bpp"
TownMapUpArrowEnd:

LoadTownMap:
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call UpdateSprites
	hlcoord 0, 0
	ld b, $12
	ld c, $12
	call TextBoxBorder
	call DisableLCD
	ld hl, WorldMapTileGraphics
	ld de, vChars2 tile $60
	ld bc, WorldMapTileGraphicsEnd - WorldMapTileGraphics
	ld a, BANK(WorldMapTileGraphics)
	call FarCopyData2
	ld hl, MonNestIcon
	ld de, vSprites tile $04
	ld bc, MonNestIconEnd - MonNestIcon
	ld a, BANK(MonNestIcon)
	call FarCopyDataDouble
	hlcoord 0, 0
	ld de, CompressedMap
.nextTile
	ld a, [de]
	and a
	jr z, .done
	ld b, a
	and $f
	ld c, a
	ld a, b
	swap a
	and $f
	add $60
.writeRunLoop
	ld [hli], a
	dec c
	jr nz, .writeRunLoop
	inc de
	jr .nextTile
.done
	call EnableLCD
	ld b, SET_PAL_TOWN_MAP
	call RunPaletteCommand
	call Delay3
	call GBPalNormal
	xor a
	ld [wAnimCounter], a
	inc a
	ld [wTownMapSpriteBlinkingEnabled], a
	ret

CompressedMap:
	INCBIN "gfx/town_map/town_map.rle"

ExitTownMap:
; clear town map graphics data and load usual graphics data
	xor a
	ld [wTownMapSpriteBlinkingEnabled], a
	call GBPalWhiteOut
	call ClearScreen
	call ClearSprites
	call LoadPlayerSpriteGraphics
	call LoadFontTilePatterns
	call UpdateSprites
	jp RunDefaultPaletteCommand

DrawPlayerOrBirdSprite:
; a = map number
; b = OAM base tile
	push af
	ld a, b
	ld [wOAMBaseTile], a
	pop af
	ld de, wTownMapCoords
	call LoadTownMapEntry
	ld a, [de]
	push hl
	call TownMapCoordsToOAMCoords
	call WritePlayerOrBirdSpriteOAM
	pop hl
	ld de, wNameBuffer
.loop
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .loop
	ld hl, wShadowOAM
	ld de, wShadowOAMBackup
	ld bc, OAM_COUNT * 4
	jp CopyData

DisplayWildLocations:
	farcall FindWildLocationsOfMon
	call ZeroOutDuplicatesInList
	ld hl, wShadowOAM
	ld de, wTownMapCoords
.loop
	ld a, [de]
	cp $ff
	jr z, .exitLoop
	and a
	jr z, .nextEntry
	push hl
	call LoadTownMapEntry
	pop hl
	ld a, [de]
	cp $19 ; Cerulean Cave's coordinates
	jr z, .nextEntry ; skip Cerulean Cave
	call TownMapCoordsToOAMCoords
	ld a, $4 ; nest icon tile no.
	ld [hli], a
	xor a
	ld [hli], a
.nextEntry
	inc de
	jr .loop
.exitLoop
	ld a, l
	and a ; were any OAM entries written?
	jr nz, .drawPlayerSprite
; if no OAM entries were written, print area unknown text
	hlcoord 1, 7
	ld b, 2
	ld c, 15
	call TextBoxBorder
	hlcoord 2, 9
	ld de, AreaUnknownText
	call PlaceString
	jr .done
.drawPlayerSprite
	ld a, [wCurMap]
	ld b, $0
	call DrawPlayerOrBirdSprite
.done
	ld hl, wShadowOAM
	ld de, wShadowOAMBackup
	ld bc, OAM_COUNT * 4
	jp CopyData

AreaUnknownText:
	db " AREA UNKNOWN@"

TownMapCoordsToOAMCoords:
; in: lower nybble of a = x, upper nybble of a = y
; out: b and [hl] = (y * 8) + 24, c and [hl+1] = (x * 8) + 24
	push af
	and $f0
	srl a
	add 24
	ld b, a
	ld [hli], a
	pop af
	and $f
	swap a
	srl a
	add 24
	ld c, a
	ld [hli], a
	ret

WritePlayerOrBirdSpriteOAM:
	ld a, [wOAMBaseTile]
	and a
	ld hl, wShadowOAMSprite36 ; for player sprite
	jr z, WriteTownMapSpriteOAM
	ld hl, wShadowOAMSprite32 ; for bird sprite

WriteTownMapSpriteOAM:
	push hl

; Subtract 4 from c (X coord) and 4 from b (Y coord). However, the carry from c
; is added to b, so the net result is that only 3 is subtracted from b.
	lb hl, -4, -4
	add hl, bc

	ld b, h
	ld c, l
	pop hl

WriteAsymmetricMonPartySpriteOAM:
; Writes 4 OAM blocks for a helix mon party sprite, since it does not have
; a vertical line of symmetry.
	lb de, 2, 2
.loop
	push de
	push bc
.innerLoop
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wOAMBaseTile]
	ld [hli], a
	inc a
	ld [wOAMBaseTile], a
	xor a
	ld [hli], a
	inc d
	ld a, 8
	add c
	ld c, a
	dec e
	jr nz, .innerLoop
	pop bc
	pop de
	ld a, 8
	add b
	ld b, a
	dec d
	jr nz, .loop
	ret

WriteSymmetricMonPartySpriteOAM:
; Writes 4 OAM blocks for a mon party sprite other than a helix. All the
; sprites other than the helix one have a vertical line of symmetry which allows
; the X-flip OAM bit to be used so that only 2 rather than 4 tile patterns are
; needed.
	xor a
	ld [wSymmetricSpriteOAMAttributes], a
	lb de, 2, 2
.loop
	push de
	push bc
.innerLoop
	ld a, b
	ld [hli], a ; Y
	ld a, c
	ld [hli], a ; X
	ld a, [wOAMBaseTile]
	ld [hli], a ; tile
	ld a, [wSymmetricSpriteOAMAttributes]
	ld [hli], a ; attributes
	xor OAM_XFLIP
	ld [wSymmetricSpriteOAMAttributes], a
	inc d
	ld a, 8
	add c
	ld c, a
	dec e
	jr nz, .innerLoop
	pop bc
	pop de
	push hl
	ld hl, wOAMBaseTile
	inc [hl]
	inc [hl]
	pop hl
	ld a, 8
	add b
	ld b, a
	dec d
	jr nz, .loop
	ret

ZeroOutDuplicatesInList:
; replace duplicate bytes in the list of wild pokemon locations with 0
	ld de, wBuffer
.loop
	ld a, [de]
	inc de
	cp $ff
	ret z
	ld c, a
	ld l, e
	ld h, d
.zeroDuplicatesLoop
	ld a, [hl]
	cp $ff
	jr z, .loop
	cp c
	jr nz, .skipZeroing
	xor a
	ld [hl], a
.skipZeroing
	inc hl
	jr .zeroDuplicatesLoop

LoadTownMapEntry:
; in: a = map number
; out: lower nybble of [de] = x, upper nybble of [de] = y, hl = address of name
	cp FIRST_INDOOR_MAP
	jr c, .external
	ld bc, 4
	ld hl, InternalMapEntries
.loop
	cp [hl]
	jr c, .foundEntry
	add hl, bc
	jr .loop
.foundEntry
	inc hl
	jr .readEntry
.external
	ld hl, ExternalMapEntries
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
.readEntry
	ld a, [hli]
	ld [de], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

INCLUDE "data/maps/town_map_entries.asm"

INCLUDE "data/maps/names.asm"

MonNestIcon:
	INCBIN "gfx/town_map/mon_nest_icon.1bpp"
MonNestIconEnd:

TownMapSpriteBlinkingAnimation::
	ld a, [wAnimCounter]
	inc a
	cp 25
	jr z, .hideSprites
	cp 50
	jr nz, .done
; show sprites when the counter reaches 50
	ld hl, wShadowOAMBackup
	ld de, wShadowOAM
	ld bc, (OAM_COUNT - 4) * 4
	call CopyData
	xor a
	jr .done
.hideSprites
	ld hl, wShadowOAM
	ld b, OAM_COUNT - 4
	ld de, OBJ_SIZE
.hideSpritesLoop
	ld [hl], $a0
	add hl, de
	dec b
	jr nz, .hideSpritesLoop
	ld a, 25
.done
	ld [wAnimCounter], a
	jp DelayFrame
