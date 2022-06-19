	db DEX_ZUBAT ; pokedex id

	db  40,  45,  35,  55,  40
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db 255 ; catch rate
	db 54 ; base exp

	INCBIN "gfx/pokemon/front/zubat.pic", 0, 1 ; sprite dimensions
	dw ZubatPicFront, ZubatPicBackSW

	db LEECH_LIFE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	RAZOR_WIND,\
	TOXIC,\
	SLASH,\
	DOUBLE_EDGE,\
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
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end


	dw BANK(ZubatPicFront), BANK(ZubatPicBack)

	dw 0000, ZubatPicBack
