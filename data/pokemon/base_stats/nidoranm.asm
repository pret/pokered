	db DEX_NIDORAN_M ; pokedex id

	db  46,  57,  40,  50,  40
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 235 ; catch rate
	db 60 ; base exp

	INCBIN "gfx/pokemon/front/nidoranm.pic", 0, 1 ; sprite dimensions
	dw NidoranMPicFront, NidoranMPicBackSW

	db LEER, TACKLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	PIN_MISSILE,\
	TOXIC,\
	HORN_DRILL,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	ICE_BEAM,\
	BLIZZARD,\
	ROLLING_KICK,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end


	dw BANK(NidoranMPicFront), BANK(NidoranMPicBack)

	dw 0000, NidoranMPicBack
