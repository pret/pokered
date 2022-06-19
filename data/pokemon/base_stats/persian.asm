	db DEX_PERSIAN ; pokedex id

	db  65,  70,  60, 115,  65
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 148 ; base exp

	INCBIN "gfx/pokemon/front/persian.pic", 0, 1 ; sprite dimensions
	dw PersianPicFront, PersianPicBackSW

	db SCRATCH, GROWL, BITE, SCREECH ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	ROLLING_KICK,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	SWORDS_DANCE,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	MEDITATE,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end


	dw BANK(PersianPicFront), BANK(PersianPicBack)

	dw 0000, PersianPicBack
