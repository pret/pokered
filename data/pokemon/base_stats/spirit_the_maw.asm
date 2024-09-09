	db DEX_GOLBAT ; pokedex id

	db  75, 250,  75, 250,  75
	;   hp  atk  def  spd  spc

	db GHOST, FLYING ; type
	db 90 ; catch rate
	db 171 ; base exp

	INCBIN "gfx/battle/spirit_the_maw.pic", 0, 1 ; sprite dimensions
	dw TheMawPicFront, GolbatPicBackSW

	db LEECH_LIFE, HYPER_BEAM, MEGA_DRAIN, POISON_GAS ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	RAZOR_WIND,\ ; ROOST
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
	SLAM,\ ; FILTHY SLAM
	LOVELY_KISS,\
	SKY_ATTACK,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end

	db BANK(TheMawPicFront)
	db BANK(GolbatPicFrontAlt)
	db BANK(GolbatPicBack)
	db BANK(GolbatPicBackSW)

	dw GolbatPicFrontAlt, GolbatPicBack

