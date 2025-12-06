	db DEX_PTAUROSB ; pokedex id

	db  75, 110, 105, 100,  70
	;   hp  atk  def  spd  spc

	db FIGHTING, FIRE ; type
	db 45 ; catch rate
	db 211 ; base exp

	INCBIN "gfx/pokemon/front/ptaurosb.pic", 0, 1 ; sprite dimensions
	dw PTaurosBPicFront, PTaurosBPicBack

    db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; note: starting learnsets are part of regular learnsets
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         THUNDERBOLT,  \
	     THUNDER,      EARTHQUAKE,   FISSURE,      MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         FIRE_BLAST,   SKULL_BASH,   REST,         SUBSTITUTE,   \
	     STRENGTH
	; end

	db BANK(PTaurosBPicFront)
	assert BANK(PTaurosBPicFront) == BANK(PTaurosBPicBack)
