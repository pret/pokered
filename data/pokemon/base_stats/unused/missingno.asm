	db DEX_MISSINGNO ; pokedex id

	db 211, 157,  53,  29,  73
	;   hp  atk  def  spd  spc

	db BIRD, NORMAL ; type
	db 29 ; catch rate
	db 255 ; base exp

	INCBIN "gfx/pokemon/front/missingno.pic", 0, 1 ; sprite dimensions
	dw MissingNoPicFront, MissingNoPicBack

	db WATER_GUN, WATER_GUN, SKY_ATTACK, PAY_DAY ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   RAZOR_WIND,   SWORDS_DANCE, MEGA_KICK,    TOXIC,		   \
	     TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,	 ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   PAY_DAY,      SUBMISSION,   SEISMIC_TOSS, \
	     RAGE,         THUNDERBOLT,  THUNDER,      EARTHQUAKE,   FISSURE,      \
	     PSYCHIC_M,    TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         SWIFT,        SKY_ATTACK,   REST,         THUNDER_WAVE, \
	     TRI_ATTACK,   SUBSTITUTE,   CUT,          FLY,          SURF
	; end

	db BANK(MissingNoPicFront)
	assert BANK(MissingNoPicFront) == BANK(MissingNoPicBack)
