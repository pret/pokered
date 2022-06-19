	db DEX_GRIMER ; pokedex id

	db  80,  80,  50,  25,  40
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 190 ; catch rate
	db 90 ; base exp

	INCBIN "gfx/pokemon/front/grimer.pic", 0, 1 ; sprite dimensions
	dw GrimerPicFront, GrimerPicBackSW

	db POUND, DISABLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	AMNESIA,\
	THUNDERPUNCH,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	BARRIER,\
	MEGA_DRAIN,\
	KINESIS,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	SLUDGE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	dw BANK(GrimerPicFront), BANK(GrimerPicBack)

	dw 0000, GrimerPicBack
