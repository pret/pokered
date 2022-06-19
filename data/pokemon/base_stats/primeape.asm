	db DEX_PRIMEAPE ; pokedex id

	db  65, 105,  60,  95,  60
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 75 ; catch rate
	db 149 ; base exp

	INCBIN "gfx/pokemon/front/primeape.pic", 0, 1 ; sprite dimensions
	dw PrimeapePicFront, PrimeapePicBackSW

	db SCRATCH, LEER, KARATE_CHOP, FURY_SWIPES ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	HI_JUMP_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	DRAGON_RAGE,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	SWORDS_DANCE,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	MEDITATE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH
	; end

	dw BANK(PrimeapePicFront), BANK(PrimeapePicBack)

	dw 0000, PrimeapePicBack
