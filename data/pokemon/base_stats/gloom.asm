	db DEX_GLOOM ; pokedex id

	db  60,  65,  70,  40,  85
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 120 ; catch rate
	db 132 ; base exp

	INCBIN "gfx/pokemon/front/gloom.pic", 0, 1 ; sprite dimensions
	dw GloomPicFront, GloomPicBackSW

	db ABSORB, POISONPOWDER, STUN_SPORE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEECH_SEED,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AMNESIA,\
	BARRIER,\
	RAZOR_LEAF,\
	SOLARBEAM,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end

	dw BANK(GloomPicFront), BANK(GloomPicBack)

	dw 0000, GloomPicBack
