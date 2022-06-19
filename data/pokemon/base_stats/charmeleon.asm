	db DEX_CHARMELEON ; pokedex id

	db  58,  64,  58,  80,  65
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 142 ; base exp

	INCBIN "gfx/pokemon/front/charmeleon.pic", 0, 1 ; sprite dimensions
	dw CharmeleonPicFront, CharmeleonPicBackSW

	db SCRATCH, GROWL, EMBER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	tmhm \
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	AMNESIA,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	BARRIER,\
	SOLARBEAM,\
	DRAGON_RAGE,\
	DIG,\
	KINESIS,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	dw BANK(CharmeleonPicFront), BANK(CharmeleonPicBack)

	dw 0000, CharmeleonPicBack
