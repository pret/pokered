	db DEX_PURAKKUSU ; pokedex id

	db  65, 125, 140,  85,  55
	;   hp  atk  def  spd  spc

	db BUG, STEEL ; type
	db 25 ; catch rate
	db 209 ; base exp

	INCBIN "gfx/pokemon/front/purakkusu.pic", 0, 1 ; sprite dimensions
	dw PurakkusuPicFront, PurakkusuPicBack

	db VICEGRIP, HARDEN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   SUBMISSION,   SEISMIC_TOSS, RAGE,         EARTHQUAKE,   \
	     FISSURE,      MIMIC,        DOUBLE_TEAM,  BIDE,         SWIFT,        \
	     REST,         SUBSTITUTE,   CUT,          STRENGTH
	; end

	ddb BANK(PurakkusuPicFront)
	assert BANK(PurakkusuPicFront) == BANK(PurakkusuPicBack)
