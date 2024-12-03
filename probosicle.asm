	db DEX_PROBOSICLE ; pokedex id

	db  48, 120, 100, 105,  63
	;   hp  atk  def  spd  spc

	db BUG, ICE ; type
	db 45 ; catch rate 
	db 187 ; base exp 

	INCBIN "gfx/pokemon/front/probosicle.pic", 0, 1 ; sprite dimensions
	dw ProbosiclePicFront, ProbosiclePicBack

	db TACKLE, HARDEN, STRING_SHOT, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        HORN_DRILL,   TAKE_DOWN,    DOUBLE_EDGE,  ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   SEISMIC_TOSS, RAGE,         MEGA_DRAIN,   \
	     MIMIC,        DOUBLE_TEAM,  BIDE,         SKULL_BASH,   REST,         \
	     SUBSTITUTE,   CUT
	; end

	db 0 ; padding
