	db DEX_ARCANINE_H ; pokedex id

	db  95,  115,  80,  90, 80
	;   hp  atk  def  spd  spc

	db FIRE, ROCK ; type
	db 75 ; catch rate
	db 213 ; base exp

	INCBIN "gfx/pokemon/front/arcanineh.pic", 0, 1 ; sprite dimensions
	dw ArcanineHPicFront, ArcanineHPicBack

	db FIRE_BLAST, ROCK_SLIDE, EARTHQUAKE, AGILITY ; level 1 learnset, trainer consistency with arc
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,   		BODY_SLAM,      DOUBLE_EDGE,       RAGE,    	DRAGON_RAGE,    \
	     DIG, 	  		MIMIC,   		DOUBLE_TEAM,       REFLECT, 	BIDE,         \
	     FIRE_BLAST,    SWIFT,  		SKULL_BASH,        REST, 		SUBSTITUTE
	; end

	db BANK(ArcanineHPicFront)
	assert BANK(ArcanineHPicFront) == BANK(ArcanineHPicBack)