	db DEX_MUK_A ; pokedex id

	db 105, 105,  75,  50,  65
	;   hp  atk  def  spd  spc

	db POISON, DARK ; type
	db 75 ; catch rate
	db 157 ; base exp

	INCBIN "gfx/pokemon/front/muka.pic", 0, 1 ; sprite dimensions
	dw MukAPicFront, MukAPicBack

	db POUND, DISABLE, POISON_GAS, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    HYPER_BEAM,   RAGE,         MEGA_DRAIN,   \
	     THUNDERBOLT,  THUNDER,      MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     SELFDESTRUCT, FIRE_BLAST,   REST,         EXPLOSION,    SUBSTITUTE
	; end

	db BANK(MukAPicFront)
	assert BANK(MukAPicFront) == BANK(MukAPicBack)