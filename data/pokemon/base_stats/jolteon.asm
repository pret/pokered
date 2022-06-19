	db DEX_JOLTEON ; pokedex id

	db  65,  65,  60, 130, 110
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 197 ; base exp

	INCBIN "gfx/pokemon/front/jolteon.pic", 0, 1 ; sprite dimensions
	dw JolteonPicFront, JolteonPicBackSW

	db TACKLE, SAND_ATTACK, QUICK_ATTACK, THUNDERSHOCK ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\
	BARRIER,\
	ROLLING_KICK,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	dw BANK(JolteonPicFront), BANK(JolteonPicBack)

	dw 0000, JolteonPicBack
