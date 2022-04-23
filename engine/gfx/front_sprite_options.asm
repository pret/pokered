CheckSpriteOptions::
	ld a,[wcf91]
	cp BULBASAUR
	jr z,.bulbasaurOptionCheck
	cp SQUIRTLE
	jr z,.squirtleOptionCheck
	cp BLASTOISE
	jr z,.blastoiseOptionCheck
	cp PIDGEOT
	jr z,.pidgeotOptionCheck
	cp NIDORINO
	jr z,.nidorinoOptionCheck
	cp GOLBAT
	jr z,.golbatOptionCheck
	cp MANKEY
	jr z,.mankeyOptionCheck
	cp ARCANINE
	jr z,.arcanineOptionCheck
	cp EXEGGUTOR
	jr z,.exeggutorOptionCheck
	cp MEWTWO
	jr z,.mewtwoOptionCheck
	jr .defaultSprite
.bulbasaurOptionCheck
	ld a, [wSpriteOptions2]
	bit BIT_BULBASAUR_SPRITE, a
	jr nz,.optionSprite
	jr .defaultSprite
.squirtleOptionCheck
	ld a, [wSpriteOptions]
	bit BIT_SQUIRTLE_SPRITE, a
	jr nz,.optionSprite
	jr .defaultSprite
.blastoiseOptionCheck
	ld a, [wSpriteOptions]
	bit BIT_BLASTOISE_SPRITE, a
	jr nz,.optionSprite
	jr .defaultSprite
.pidgeotOptionCheck
	ld a, [wSpriteOptions]
	bit BIT_PIDGEOT_SPRITE, a
	jr nz,.optionSprite
	jr .defaultSprite
.nidorinoOptionCheck
	ld a, [wSpriteOptions]
	bit BIT_NIDORINO_SPRITE, a
	jr nz,.optionSprite
	jr .defaultSprite
.golbatOptionCheck
	ld a, [wSpriteOptions]
	bit BIT_GOLBAT_SPRITE, a
	jr nz,.optionSprite
	jr .defaultSprite
.mankeyOptionCheck
	ld a, [wSpriteOptions]
	bit BIT_MANKEY_SPRITE, a
	jr nz,.optionSprite
	jr .defaultSprite
.arcanineOptionCheck
	ld a, [wSpriteOptions]
	bit BIT_ARCANINE_SPRITE, a
	jr nz,.optionSprite
	jr .defaultSprite
.exeggutorOptionCheck
	ld a, [wSpriteOptions2]
	bit BIT_EXEGGUTOR_SPRITE, a
	jr nz,.optionSprite
	jr .defaultSprite
.mewtwoOptionCheck
	ld a, [wSpriteOptions]
	bit BIT_MEWTWO_SPRITE, a
	jr nz,.optionSprite
.defaultSprite
	ld hl, wMonHFrontSprite - wMonHeader
	ret
.optionSprite
	ld hl, wMonHAltFrontSprite - wMonHeader
	ret