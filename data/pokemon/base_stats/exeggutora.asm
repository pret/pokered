	db DEX_EXEGGUTOR_A ; pokedex id

	db  95,  105,  85,  45, 125
	;   hp  atk  def  spd  spc

	db GRASS, DRAGON ; type
	db 45 ; catch rate
	db 212 ; base exp

	INCBIN "gfx/pokemon/front/exeggutora.pic", 0, 1 ; sprite dimensions
	dw ExeggutorAPicFront, ExeggutorAPicBack

	db HYPNOSIS, BARRAGE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   RAGE,         \
	     MEGA_DRAIN,   SOLARBEAM,    PSYCHIC_M,    TELEPORT,     MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      BIDE,         SELFDESTRUCT, EGG_BOMB,     \
	     REST,         PSYWAVE,      EXPLOSION,    SUBSTITUTE,   STRENGTH,	   \
		 DRAGON_RAGE, EARTHQUAKE, FISSURE, SWORDS_DANCE
	; end

	db BANK(ExeggutorAPicFront)
	assert BANK(ExeggutorAPicFront) == BANK(ExeggutorAPicBack)