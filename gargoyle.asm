	db DEX_GARGOYLE ; pokedex id

	db 111, 111,  99,  66,  99
	;   hp  atk  def  spd  spc

	db DRAGON, FIGHTING ; type
	db 45 ; catch rate (Same as Machamp.)
	db 193 ; base exp (Same as Machamp.)

	INCBIN "gfx/pokemon/front/gargoyle.pic", 0, 1 ; sprite dimensions
	dw GargoylePicFront, GargoylePicBack

	db RAGE, LOW_KICK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   WHIRLWIND,    MEGA_KICK,    TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  SUBMISSION,   RAGE,         DRAGON_RAGE,  \
	     EARTHQUAKE,   MIMIC,        DOUBLE_TEAM,  BIDE,         METRONOME,    \
	     FIRE_BLAST,   SKY_ATTACK,   REST,         SUBSTITUTE,   FLY,          \
	     STRENGTH
	; end

	db 0 ; padding
