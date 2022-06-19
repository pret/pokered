	db DEX_NIDORAN_F ; pokedex id

	db  55,  47,  52,  41,  40
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 235 ; catch rate
	db 59 ; base exp

	INCBIN "gfx/pokemon/front/nidoranf.pic", 0, 1 ; sprite dimensions
	dw NidoranFPicFront, NidoranFPicBackSW

	db GROWL, TACKLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	tmhm \
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	ICE_BEAM,\
	BLIZZARD,\
	ROLLING_KICK,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end


	dw BANK(NidoranFPicFront), BANK(NidoranFPicBack)

	dw 0000, NidoranFPicBack
