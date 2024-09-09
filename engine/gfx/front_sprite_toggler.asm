; PureRGBnote: ADDED: in the options we can configure what specific front sprites will be used for specific pokemon.
;                     this code will check which to display when about to render a front sprite.

CheckSpriteOptions::
	ld a, [wMonHAltPicBank]
	and a
	jr z, .defaultSprite ; the alt pic will never be in bank 0 (home bank) so this will indicate no alt sprite for the mon
	ld a,[wcf91]
	ld de, 3
	ld hl, SpriteOptionMapping
	call IsInArray
	jr nc, .defaultSprite
	inc hl ; now points to the bit to check
	ld a, [hli] ; which bit to check
	ld c, a
	ld a, [hl]
	dec a
	add a ; a = index within SpriteOptionsPointers
	ld d, 0
	ld e, a
	ld hl, SpriteOptionsPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl = options wram variable
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a ; was the bit set?
	ld hl, wMonHAltFrontSprite - wMonHeader
	ld a, [wMonHAltPicBank]
	jr nz, .done
.defaultSprite
	ld hl, wMonHFrontSprite - wMonHeader
	ld a, [wMonHPicBank]
.done
	ld d, a
	ret

SpriteOptionsPointers:
	dw wSpriteOptions
	dw wSpriteOptions2
	dw wSpriteOptions3
	dw wSpriteOptions4
	dw wEventFlags + (SPRITE_OPTIONS_FLAGS_FIFTH_BATCH_START / 8)

SpriteOptionMapping:
	db BULBASAUR, BIT_BULBASAUR_SPRITE, 1
	db SQUIRTLE, BIT_SQUIRTLE_SPRITE, 1
	db BLASTOISE, BIT_BLASTOISE_SPRITE, 1
	db BUTTERFREE, BIT_BUTTERFREE_SPRITE, 3
	db RATICATE, BIT_RATICATE_SPRITE, 2
	db PIDGEOTTO, BIT_PIDGEOTTO_SPRITE, 3
	db PIDGEOT, BIT_PIDGEOT_SPRITE, 1
	db NIDORINO, BIT_NIDORINO_SPRITE, 2
	db GOLBAT, BIT_GOLBAT_SPRITE, 1
	db MANKEY, BIT_MANKEY_SPRITE, 1
	db ARCANINE, BIT_ARCANINE_SPRITE, 1
	db ABRA, BIT_ABRA_SPRITE, 3
	db KADABRA, BIT_KADABRA_SPRITE, 4
	db MACHOP, BIT_MACHOP_SPRITE, 4
	db TENTACRUEL, BIT_TENTACRUEL_SPRITE, 4
	db GRAVELER, BIT_GRAVELER_SPRITE, 4
	db CLOYSTER, BIT_CLOYSTER_SPRITE, 4
	db GENGAR, BIT_GENGAR_SPRITE, 3
	db ONIX, BIT_ONIX_SPRITE, 3
	db HARDENED_ONIX, BIT_ONIX_SPRITE, 3
	db VOLTORB, BIT_VOLTORB_SPRITE, 3
	db EXEGGCUTE, BIT_EXEGGCUTE_SPRITE, 3
	db EXEGGUTOR, BIT_EXEGGUTOR_SPRITE, 2
	db KOFFING, BIT_KOFFING_SPRITE, 3
	db STARMIE, BIT_STARMIE_SPRITE, 4
	db PINSIR, BIT_PINSIR_SPRITE, 4
	db ELECTABUZZ, BIT_ELECTABUZZ_SPRITE, 2
	db ZAPDOS, BIT_ZAPDOS_SPRITE, 4
	db MEWTWO, BIT_MEWTWO_SPRITE, 1
	db ARMORED_MEWTWO, BIT_MEWTWO_SPRITE, 1
	db ARTICUNO, FLAG_ARTICUNO_SPRITE % 8, 5
	db SPEAROW, FLAG_SPEAROW_SPRITE % 8, 5
	db JYNX, FLAG_JYNX_SPRITE % 8, 5
	db FARFETCHD, FLAG_FARFETCHD_SPRITE % 8, 5
	db OMANYTE, FLAG_OMANYTE_SPRITE % 8, 5
	db SCYTHER, FLAG_SCYTHER_SPRITE % 8, 5
	db GOLDUCK, FLAG_GOLDUCK_SPRITE % 8, 5
	db -1 ; end
