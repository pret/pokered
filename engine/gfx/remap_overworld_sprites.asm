CheckRemapSprite::
	ld hl, wMapSpriteOriginalPictureIDs
	ld a, [wNumSprites]
	sub e
	ld b, 0
	ld c, a
	add hl, bc
	ld [hl], d ; store the original sprite ID at the correct byte index of wMapSpriteOriginalPictureIDs
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a ; if this option is turned on, we don't need to remap any sprites
	ret nz 
	; fall through

; PureRGBnote: ADDED: code that will remap overworld NPC icons according to options selection (enhanced or original) 
; if not using enhanced sprites we remap the sprite to its original sprite.
; output: de = mapped sprite id
RemapSpritePictureIDs::
	ld a, d
	ld bc, AltSpriteMappingTable
.loop ; find the alt sprite mapping in the array
	ld a, [bc]
	inc bc
	inc bc
	cp $ff
	ret z ; d still has the original sprite's id stored if we ret here
	cp d
	jr nz, .loop
	dec bc ; de = replacement sprite's address
	ld a, [bc]
	ld d, a ; d = replacement sprite's id
	ret

INCLUDE "data/sprites/alt_sprite_mappings.asm"

LoopCheckSpriteReloadNeeded::
	ld a, [wNumSprites]
	ld bc, wMapSpriteOriginalPictureIDs
	ld hl, AltSpriteMappingTable
	ld de, 2
.loop
	push bc
	push af
	ld a, [bc]
	push hl
	push de
	call IsInArray
	pop de
	pop hl
	jr c, .remapNeeded
	pop af
	pop bc
	inc bc
	dec a
	and a ; clear carry
	ret z
	jr .loop
.remapNeeded
	pop bc ; gets rid of the stored af but without potentially affecting the carry flag
	pop bc ; gets rid of the stored bc
	ret

LoopRemapSpritePictureIDs::
	ld hl, wSprite01StateData1PictureID
	ld bc, wMapSpriteOriginalPictureIDs
	ld a, [wNumSprites]
.loop
	push af
	ld a, [bc]
	push hl
	push bc
	ld d, a
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	call z, RemapSpritePictureIDs
	ld a, d
	pop bc
	pop hl
	ld [hl], a ; PictureID (could be remapped)
	ld de, SPRITESTATEDATA1_LENGTH
	add hl, de ; go to next pictureID
	inc bc ; go to next OriginalPictureID
	pop af
	dec a
	ret z
	jr .loop

; After battle we need to reload the "original sprite picture IDs" since battle data overwrites them.
StoreOriginalPictureIDs::
	ld a, [wNumSprites]
	and a
	ret z ; don't do anything if no sprites in map
	ld h, d
	ld l, e
	inc hl
	ld b, a ; num of sprites in map
	; hl pointing to first sprite's ID
.loop
	call ReadHLIntoCFromMapRomBank
	ld d, c
	push hl
	push bc
	ld hl, wMapSpriteOriginalPictureIDs
	ld a, [wNumSprites]
	sub b
	ld b, 0
	ld c, a
	add hl, bc
	ld [hl], d
	pop bc
	pop hl
	ld d, 0
	ld e, 5
	add hl, de
	call ReadHLIntoCFromMapRomBank
	ld a, c
	; points to 6th byte in sprite struct which will tell us how many more bytes are in this sprite's data
	bit 6, a
	ld e, 3
	jr nz, .add1
	bit 7, a
	ld e, 2
	jr nz, .add1
	ld e, 1
.add1
	add hl, de
	dec b
	jr nz, .loop
	ret
