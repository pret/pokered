	db DEX_PHANTOM ; pokedex id

	db  56,  56,  56,  97, 133
	;   hp  atk  def  spd  spc

	db FIRE, GHOST ; type
	db 90 ; catch rate (Same as Haunter.)
	db 126 ; base exp (Same as Haunter.)

	INCBIN "gfx/pokemon/front/phantom.pic", 0, 1 ; sprite dimensions
	dw PhantomPicFront, PhantomPicBack

	db NIGHT_SHADE, GROWL, LEER, QUICK_ATTACK ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     PAY_DAY,      RAGE,         DIG,          TELEPORT,     MIMIC,        \
	     DOUBLE_TEAM,  BIDE,         FIRE_BLAST,   REST,         SUBSTITUTE
	; end

	db 0 ; padding
