	db DEX_RAICHU_A ; pokedex id

	db  60,  85,  50, 100,  95
	;   hp  atk  def  spd  spc

	db ELECTRIC, PSYCHIC_TYPE ; type
	db 75 ; catch rate
	db 122 ; base exp

	INCBIN "gfx/pokemon/front/raichua.pic", 0, 1 ; sprite dimensions
	dw RaichuAPicFront, RaichuAPicBack

	db THUNDERSHOCK, GROWL, THUNDER_WAVE, CONFUSION ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   PAY_DAY,      SUBMISSION,   COUNTER,      \
	     SEISMIC_TOSS, RAGE,         THUNDERBOLT,  THUNDER,      PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     SWIFT,        SKULL_BASH,   REST,         THUNDER_WAVE, PSYWAVE,	   \
		 SUBSTITUTE,   FLY,          SURF,         FLASH 	   
	; end

	db BANK(RaichuAPicFront)
	assert BANK(RaichuAPicFront) == BANK(RaichuAPicBack)