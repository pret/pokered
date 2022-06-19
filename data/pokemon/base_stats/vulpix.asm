	db DEX_VULPIX ; pokedex id

	db  38,  41,  40,  65,  65
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 190 ; catch rate
	db 63 ; base exp

	INCBIN "gfx/pokemon/front/vulpix.pic", 0, 1 ; sprite dimensions
	dw VulpixPicFront, VulpixPicBackSW

	db EMBER, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	AMNESIA,\
	ROLLING_KICK,\
	BARRIER,\
	SOLARBEAM,\
	DIG,\
	KINESIS,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end


	dw BANK(VulpixPicFront), BANK(VulpixPicBack)

	dw 0000, VulpixPicBack
