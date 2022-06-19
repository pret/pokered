	db DEX_GOLBAT ; pokedex id

	db  75,  80,  70,  90,  75
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db 90 ; catch rate
	db 171 ; base exp

	INCBIN "gfx/pokemon/front/golbat.pic", 0, 1 ; sprite dimensions
	dw GolbatPicFrontY, GolbatPicBackSW

	db LEECH_LIFE, SCREECH, BITE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	RAZOR_WIND,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	BARRIER,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\
	LOVELY_KISS,\
	SKY_ATTACK,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end

	dw BANK(GolbatPicFront), BANK(GolbatPicBack)

	dw GolbatPicFront, GolbatPicBack
