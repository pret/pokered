	db DEX_MELMETAL ; pokedex id

	db 135, 143, 143,  34,  65
	;   hp  atk  def  spd  spc

	db STEEL, STEEL ; type
	db 3 ; catch rate
	db 243 ; base exp

	INCBIN "gfx/pokemon/front/melmetal.pic", 0, 1 ; sprite dimensions
	dw MelmetalPicFront, MelmetalPicBack

	db THUNDERSHOCK, HARDEN, THUNDER_WAVE, TAIL_WHIP ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK, 	 TOXIC, 	   BODY_SLAM, 	 ICE_BEAM,     \
		 HYPER_BEAM,   SUBMISSION,   RAGE,  	   SOLARBEAM,    THUNDERBOLT,  \
		 THUNDER,      EARTHQUAKE,   FISSURE, 	   MIMIC,        DOUBLE_TEAM,  \
		 BIDE,		   REST,         THUNDER_WAVE, ROCK_SLIDE,   SUBSTITUTE
	; end

	db BANK(MelmetalPicFront)
	assert BANK(MelmetalPicFront) == BANK(MelmetalPicBack)