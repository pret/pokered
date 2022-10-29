	db DEX_PUDI ; pokedex id

	db  40,  55,  30,  45,  35	; added 5 to all stats to make BST closer to Mikon's
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 255 ; catch rate
	db 61 ; base exp

	INCBIN "gfx/pokemon/front/pudi.pic", 0, 1 ; sprite dimensions
	dw PudiPicFront, PudiPicBack

	db BITE, ROAR, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         \
	     DRAGON_RAGE,  DIG,          MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         \
	     SUBSTITUTE
	; end

	db BANK(PudiPicFront)
	assert BANK(PudiPicFront) == BANK(PudiPicBack)
