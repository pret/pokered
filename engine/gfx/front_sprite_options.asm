; PureRGBnote: ADDED: in the options we can configure what specific front sprites will be used for specific pokemon.
;                     this code will check which to display when about to render a front sprite.

CheckSpriteOptions::
	ld a, [wMonHAltFrontSprite]
	cp 1
	ld hl, wMonHFrontSprite - wMonHeader
	ret z ; we set wMonHAltFrontSprite to 1 if they don't have one so we can avoid doing all these checks below.
	push de
	ld a,[wcf91]
	ld de, 3
	ld hl, SpriteOptionMapping
	push bc
	call IsInArray
	jr nc, .defaultSprite
	ld a, b
	add b
	add b ; triple the count to get the index in hl
	inc a ; start at the bit identifier for the given pokemon
	ld e, a
	ld d, 0
	ld hl, SpriteOptionMapping
	add hl, de
	ld a, [hli] ; which bit to check
	ld d, a
	ld a, [hl] ; which options byte to check (1 = wSpriteOptions1, 2 = wSpriteOptions2, 3 = wSpriteOptions3)
	cp 1
	jr z, .wSpriteOptions1
	cp 3
	jr z, .wSpriteOptions3
	cp 4
	jr z, .wSpriteOptions4
	ld a, [wSpriteOptions2]
	jr .checkBit
.wSpriteOptions1
	ld a, [wSpriteOptions]
	jr .checkBit
.wSpriteOptions4
	ld a, [wSpriteOptions4]
	jr .checkBit
.wSpriteOptions3
	ld a, [wSpriteOptions3]
.checkBit
	ld b, a
	ld a, d
	and a
	ld a, b
	jr z, .doneBitShift
.bitShiftLoop
	srl a
	dec d
	jr nz, .bitShiftLoop
.doneBitShift
	and 1
	bit 0, a
	jr z, .defaultSprite
.altSprite
	ld hl, wMonHAltFrontSprite - wMonHeader
	jr .done
.defaultSprite
	ld hl, wMonHFrontSprite - wMonHeader
.done
	pop bc
	pop de
	ret

SpriteOptionMapping:
	db BULBASAUR, BIT_BULBASAUR_SPRITE, 1
	db SQUIRTLE, BIT_SQUIRTLE_SPRITE, 1
	db BLASTOISE, BIT_BLASTOISE_SPRITE, 1
	db PIDGEOT, BIT_PIDGEOT_SPRITE, 1
	db NIDORINO, BIT_NIDORINO_SPRITE, 2
	db GOLBAT, BIT_GOLBAT_SPRITE, 1
	db MANKEY, BIT_MANKEY_SPRITE, 1
	db ARCANINE, BIT_ARCANINE_SPRITE, 1
	db EXEGGUTOR, BIT_EXEGGUTOR_SPRITE, 2
	db MEWTWO, BIT_MEWTWO_SPRITE, 1
	db PIDGEOTTO, BIT_PIDGEOTTO_SPRITE, 3
	db BUTTERFREE, BIT_BUTTERFREE_SPRITE, 3
	db GENGAR, BIT_GENGAR_SPRITE, 3
	db ONIX, BIT_ONIX_SPRITE, 3
	db VOLTORB, BIT_VOLTORB_SPRITE, 3
	db STARMIE, BIT_STARMIE_SPRITE, 3
	db KADABRA, BIT_KADABRA_SPRITE, 4
	db TENTACRUEL, BIT_TENTACRUEL_SPRITE, 4
	db GRAVELER, BIT_GRAVELER_SPRITE, 4
	db MACHOP, BIT_MACHOP_SPRITE, 4
	db PINSIR, BIT_PINSIR_SPRITE, 4
	db ZAPDOS, BIT_ZAPDOS_SPRITE, 4
	db -1 ; end
