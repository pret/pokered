	db DEX_MELMETAL ; pokedex id

	db  135,  143,  143,  34, 65
	;   hp  atk  def  spd  spc

	db STEEL, STEEL ; type
	db 75 ; catch rate
	db 213 ; base exp

	INCBIN "gfx/pokemon/front/melmetal.pic", 0, 1 ; sprite dimensions
	dw MelmetalPicFront, MelmetalPicBack

	db THUNDERSHOCK, HARDEN, THUNDER_WAVE, TAIL_WHIP ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC, RAGE, MIMIC, DOUBLE_TEAM, BIDE, REST, SUBSTITUTE, THUNDER_WAVE, \
		 MEGA_PUNCH, SUBMISSION, HYPER_BEAM, MEGA_KICK, BODY_SLAM, ICE_BEAM, \
		 SOLAR_BEAM, THUNDERBOLT, THUNDER, EARTHQUAKE, FISSURE, ROCK_SLIDE, \
		 SUBSTITUTE
	; end

	db BANK(MelmetalPicFront)
	assert BANK(MelmetalPicFront) == BANK(MelmetalPicBack)