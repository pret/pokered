; Loads tile patterns for map's sprites.
; For outside maps, it loads one of several fixed sets of sprites.
; For inside maps, it loads each sprite picture ID used in the map header.
; This is also called after displaying text because loading
; text tile patterns overwrites half of the sprite tile pattern data.
; Note on notation:
; $C1X* and $C2X* are used to denote wSpriteStateData1-wSpriteStateData1 + $ff and wSpriteStateData2 + $00-wSpriteStateData2 + $ff sprite slot
; fields, respectively, within loops. The X is the loop index.
; If there is an inner loop, Y is the inner loop index, i.e. $C1Y* and $C2Y*
; denote fields of the sprite slots iterated over in the inner loop.
InitMapSprites:
	call InitOutsideMapSprites
	ret c ; return if the map is an outside map (already handled by above call)
; if the map is an inside map (i.e. mapID >= $25)
	ld hl, wSpriteStateData1
	ld de, wSpriteStateData2 + $0d
; Loop to copy picture ID's from $C1X0 to $C2XD for LoadMapSpriteTilePatterns.
.copyPictureIDLoop
	ld a, [hl] ; $C1X0 (picture ID)
	ld [de], a ; $C2XD
	ld a, $10
	add e
	ld e, a
	ld a, $10
	add l
	ld l, a
	jr nz, .copyPictureIDLoop

; This is used for both inside and outside maps, since it is called by
; InitOutsideMapSprites.
; Loads tile pattern data for sprites into VRAM.
LoadMapSpriteTilePatterns:
	ld a, [wNumSprites]
	and a ; are there any sprites?
	jr nz, .spritesExist
	ret
.spritesExist
	ld c, a ; c = [wNumSprites]
	ld b, $10 ; number of sprite slots
	ld hl, wSpriteStateData2 + $0d
	xor a
	ld [hFourTileSpriteCount], a
.copyPictureIDLoop ; loop to copy picture ID from $C2XD to $C2XE
	ld a, [hli] ; $C2XD (sprite picture ID)
	ld [hld], a ; $C2XE
	ld a, l
	add $10
	ld l, a
	dec b
	jr nz, .copyPictureIDLoop
	ld hl, wSpriteStateData2 + $1e
.loadTilePatternLoop
	ld de, wSpriteStateData2 + $1d
; Check if the current picture ID has already had its tile patterns loaded.
; This done by looping through the previous sprite slots and seeing if any of
; their picture ID's match that of the current sprite slot.
.checkIfAlreadyLoadedLoop
	ld a, e
	and $f0
	ld b, a ; b = offset of the wSpriteStateData2 sprite slot being checked against
	ld a, l
	and $f0 ; a = offset of current wSpriteStateData2 sprite slot
	cp b ; done checking all previous sprite slots?
	jr z, .notAlreadyLoaded
	ld a, [de] ; picture ID of the wSpriteStateData2 sprite slot being checked against
	cp [hl] ; do the picture ID's match?
	jp z, .alreadyLoaded
	ld a, e
	add $10
	ld e, a
	jr .checkIfAlreadyLoadedLoop
.notAlreadyLoaded
	ld de, wSpriteStateData2 + $0e
	ld b, $01
; loop to find the highest tile pattern VRAM slot (among the first 10 slots) used by a previous sprite slot
; this is done in order to find the first free VRAM slot available
.findNextVRAMSlotLoop
	ld a, e
	add $10
	ld e, a
	ld a, l
	cp e ; reached current slot?
	jr z, .foundNextVRAMSlot
	ld a, [de] ; $C2YE (VRAM slot)
	cp 11 ; is it one of the first 10 slots?
	jr nc, .findNextVRAMSlotLoop
	cp b ; compare the slot being checked to the current max
	jr c, .findNextVRAMSlotLoop ; if the slot being checked is less than the current max
; if the slot being checked is greater than or equal to the current max
	ld b, a ; store new max VRAM slot
	jr .findNextVRAMSlotLoop
.foundNextVRAMSlot
	inc b ; increment previous max value to get next VRAM tile pattern slot
	ld a, b ; a = next VRAM tile pattern slot
	push af
	ld a, [hl] ; $C2XE (sprite picture ID)
	ld b, a ; b = current sprite picture ID
	cp SPRITE_BALL ; is it a 4-tile sprite?
	jr c, .notFourTileSprite
	pop af
	ld a, [hFourTileSpriteCount]
	add 11
	jr .storeVRAMSlot
.notFourTileSprite
	pop af
.storeVRAMSlot
	ld [hl], a ; store VRAM slot at $C2XE
	ld [hVRAMSlot], a ; used to determine if it's 4-tile sprite later
	ld a, b ; a = current sprite picture ID
	dec a
	add a
	add a
	push bc
	push hl
	ld hl, SpriteSheetPointerTable
	jr nc, .noCarry
	inc h
.noCarry
	add l
	ld l, a
	jr nc, .noCarry2
	inc h
.noCarry2
	push hl
	call ReadSpriteSheetData
	push af
	push de
	push bc
	ld hl, vNPCSprites ; VRAM base address
	ld bc, $c0 ; number of bytes per VRAM slot
	ld a, [hVRAMSlot]
	cp 11 ; is it a 4-tile sprite?
	jr nc, .fourTileSpriteVRAMAddr
	ld d, a
	dec d
; Equivalent to multiplying $C0 (number of bytes in 12 tiles) times the VRAM
; slot and adding the result to $8000 (the VRAM base address).
.calculateVRAMAddrLoop
	add hl, bc
	dec d
	jr nz, .calculateVRAMAddrLoop
	jr .loadStillTilePattern
.fourTileSpriteVRAMAddr
	ld hl, vSprites + $7c0 ; address for second 4-tile sprite
	ld a, [hFourTileSpriteCount]
	and a
	jr nz, .loadStillTilePattern
; if it's the first 4-tile sprite
	ld hl, vSprites + $780 ; address for first 4-tile sprite
	inc a
	ld [hFourTileSpriteCount], a
.loadStillTilePattern
	pop bc
	pop de
	pop af
	push hl
	push hl
	ld h, d
	ld l, e
	pop de
	ld b, a
	ld a, [wFontLoaded]
	bit 0, a ; reloading upper half of tile patterns after displaying text?
	jr nz, .skipFirstLoad ; if so, skip loading data into the lower half
	ld a, b
	ld b, 0
	call FarCopyData2 ; load tile pattern data for sprite when standing still
.skipFirstLoad
	pop de
	pop hl
	ld a, [hVRAMSlot]
	cp 11 ; is it a 4-tile sprite?
	jr nc, .skipSecondLoad ; if so, there is no second block
	push de
	call ReadSpriteSheetData
	push af
	ld a, $c0
	add e
	ld e, a
	jr nc, .noCarry3
	inc d
.noCarry3
	ld a, [wFontLoaded]
	bit 0, a ; reloading upper half of tile patterns after displaying text?
	jr nz, .loadWhileLCDOn
	pop af
	pop hl
	set 3, h ; add $800 to hl
	push hl
	ld h, d
	ld l, e
	pop de
	call FarCopyData2 ; load tile pattern data for sprite when walking
	jr .skipSecondLoad
; When reloading the upper half of tile patterns after displaying text, the LCD
; will be on, so CopyVideoData (which writes to VRAM only during V-blank) must
; be used instead of FarCopyData2.
.loadWhileLCDOn
	pop af
	pop hl
	set 3, h ; add $800 to hl
	ld b, a
	swap c
	call CopyVideoData ; load tile pattern data for sprite when walking
.skipSecondLoad
	pop hl
	pop bc
	jr .nextSpriteSlot
.alreadyLoaded ; if the current picture ID has already had its tile patterns loaded
	inc de
	ld a, [de] ; a = VRAM slot for the current picture ID (from $C2YE)
	ld [hl], a ; store VRAM slot in current wSpriteStateData2 sprite slot (at $C2XE)
.nextSpriteSlot
	ld a, l
	add $10
	ld l, a
	dec c
	jp nz, .loadTilePatternLoop
	ld hl, wSpriteStateData2 + $0d
	ld b, $10
; the pictures ID's stored at $C2XD are no longer needed, so zero them
.zeroStoredPictureIDLoop
	xor a
	ld [hl], a ; $C2XD
	ld a, $10
	add l
	ld l, a
	dec b
	jr nz, .zeroStoredPictureIDLoop
	ret

; reads data from SpriteSheetPointerTable
; INPUT:
; hl = address of sprite sheet entry
; OUTPUT:
; de = pointer to sprite sheet
; bc = length in bytes
; a = ROM bank
ReadSpriteSheetData:
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	xor a
	ld b, a
	ld a, [hli]
	ret

; Loads sprite set for outside maps (cities and routes) and sets VRAM slots.
; sets carry if the map is a city or route, unsets carry if not
InitOutsideMapSprites:
	ld a, [wCurMap]
	cp REDS_HOUSE_1F ; is the map a city or a route (map ID less than $25)?
	ret nc ; if not, return
	ld hl, MapSpriteSets
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, [hl] ; a = spriteSetID
	cp $f0 ; does the map have 2 sprite sets?
	call nc, GetSplitMapSpriteSetID ; if so, choose the appropriate one
	ld b, a ; b = spriteSetID
	ld a, [wFontLoaded]
	bit 0, a ; reloading upper half of tile patterns after displaying text?
	jr nz, .loadSpriteSet ; if so, forcibly reload the sprite set
	ld a, [wSpriteSetID]
	cp b ; has the sprite set ID changed?
	jr z, .skipLoadingSpriteSet ; if not, don't load it again
.loadSpriteSet
	ld a, b
	ld [wSpriteSetID], a
	dec a
	ld b, a
	sla a
	ld c, a
	sla a
	sla a
	add c
	add b ; a = (spriteSetID - 1) * 11
	ld de, SpriteSets
; add a to de to get offset of sprite set
	add e
	ld e, a
	jr nc, .noCarry2
	inc d
.noCarry2
	ld hl, wSpriteStateData2 + $0d
	ld a, SPRITE_RED
	ld [hl], a
	ld bc, wSpriteSet
; Load the sprite set into RAM.
; This loop also fills $C2XD (sprite picture ID) where X is from $0 to $A
; with picture ID's. This is done so that LoadMapSpriteTilePatterns will
; load tile patterns for all sprite pictures in the sprite set.
.loadSpriteSetLoop
	ld a, $10
	add l
	ld l, a
	ld a, [de] ; sprite picture ID from sprite set
	ld [hl], a ; $C2XD (sprite picture ID)
	ld [bc], a
	inc de
	inc bc
	ld a, l
	cp $bd ; reached 11th sprite slot?
	jr nz, .loadSpriteSetLoop
	ld b, 4 ; 4 remaining sprite slots
.zeroRemainingSlotsLoop ; loop to zero the picture ID's of the remaining sprite slots
	ld a, $10
	add l
	ld l, a
	xor a
	ld [hl], a ; $C2XD (sprite picture ID)
	dec b
	jr nz, .zeroRemainingSlotsLoop
	ld a, [wNumSprites]
	push af ; save number of sprites
	ld a, 11 ; 11 sprites in sprite set
	ld [wNumSprites], a
	call LoadMapSpriteTilePatterns
	pop af
	ld [wNumSprites], a ; restore number of sprites
	ld hl, wSpriteStateData2 + $1e
	ld b, $0f
; The VRAM tile pattern slots that LoadMapSpriteTilePatterns set are in the
; order of the map's sprite set, not the order of the actual sprites loaded
; for the current map. So, they are not needed and are zeroed by this loop.
.zeroVRAMSlotsLoop
	xor a
	ld [hl], a ; $C2XE (VRAM slot)
	ld a, $10
	add l
	ld l, a
	dec b
	jr nz, .zeroVRAMSlotsLoop
.skipLoadingSpriteSet
	ld hl, wSpriteStateData1 + $10
; This loop stores the correct VRAM tile pattern slots according the sprite
; data from the map's header. Since the VRAM tile pattern slots are filled in
; the order of the sprite set, in order to find the VRAM tile pattern slot
; for a sprite slot, the picture ID for the sprite is looked up within the
; sprite set. The index of the picture ID within the sprite set plus one
; (since the Red sprite always has the first VRAM tile pattern slot) is the
; VRAM tile pattern slot.
.storeVRAMSlotsLoop
	ld c, 0
	ld a, [hl] ; $C1X0 (picture ID) (zero if sprite slot is not used)
	and a ; is the sprite slot used?
	jr z, .skipGettingPictureIndex ; if the sprite slot is not used
	ld b, a ; b = picture ID
	ld de, wSpriteSet
; Loop to find the index of the sprite's picture ID within the sprite set.
.getPictureIndexLoop
	inc c
	ld a, [de]
	inc de
	cp b ; does the picture ID match?
	jr nz, .getPictureIndexLoop
	inc c
.skipGettingPictureIndex
	push hl
	inc h
	ld a, $0e
	add l
	ld l, a
	ld a, c ; a = VRAM slot (zero if sprite slot is not used)
	ld [hl], a ; $C2XE (VRAM slot)
	pop hl
	ld a, $10
	add l
	ld l, a
	and a
	jr nz, .storeVRAMSlotsLoop
	scf
	ret

; Chooses the correct sprite set ID depending on the player's position within
; the map for maps with two sprite sets.
GetSplitMapSpriteSetID:
	cp $f8
	jr z, .route20
	ld hl, SplitMapSpriteSets
	and $0f
	dec a
	sla a
	sla a
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, [hli] ; determines whether the map is split East/West or North/South
	cp $01
	ld a, [hli] ; position of dividing line
	ld b, a
	jr z, .eastWestDivide
.northSouthDivide
	ld a, [wYCoord]
	jr .compareCoord
.eastWestDivide
	ld a, [wXCoord]
.compareCoord
	cp b
	jr c, .loadSpriteSetID
; if in the East side or South side
	inc hl
.loadSpriteSetID
	ld a, [hl]
	ret
; Uses sprite set $01 for West side and $0A for East side.
; Route 20 is a special case because the two map sections have a more complex
; shape instead of the map simply being split horizontally or vertically.
.route20
	ld hl, wXCoord
	ld a, [hl]
	cp $2b
	ld a, $01
	ret c
	ld a, [hl]
	cp $3e
	ld a, $0a
	ret nc
	ld a, [hl]
	cp $37
	ld b, $08
	jr nc, .next
	ld b, $0d
.next
	ld a, [wYCoord]
	cp b
	ld a, $0a
	ret c
	ld a, $01
	ret

INCLUDE "data/sprite_sets.asm"
