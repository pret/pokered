	db DEX_VILEPLUME ; pokedex id

	db  75,  80,  85,  50, 100
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 184 ; base exp

	INCBIN "gfx/pokemon/front/vileplume.pic", 0, 1 ; sprite dimensions
	dw VileplumePicFront, VileplumePicBackSW

	db STUN_SPORE, SLEEP_POWDER, ACID, PETAL_DANCE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEECH_SEED,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
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

	dw BANK(VileplumePicFront), BANK(VileplumePicBack)

	dw 0000, VileplumePicBack
