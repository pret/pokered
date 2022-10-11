; PureRGBnote: ADDED: code that will remap overworld NPC icons according to options selection (enhanced or original) 
; if not using enhanced sprites we remap the sprite to its original sprite.
; output: de = mapped sprite id
RemapSpritePictureIDs::
	push bc
	ld a, d
	ld bc, AltSpriteMappingTable
.loop ; find the alt sprite mapping in the array
	ld a, [bc]
	inc bc
	inc bc
	cp $ff
	jr z, .noMapSpriteNecessary ; d still has the original sprite's id stored if we jump here
	cp d
	jr nz, .loop
	dec bc ; de = replacement sprite's address
	ld a, [bc]
	ld d, a ; d = replacement sprite's id
.noMapSpriteNecessary 
	pop bc
	ret

INCLUDE "data/sprites/alt_sprite_mappings.asm"