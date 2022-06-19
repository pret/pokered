	db DEX_PORYGON ; pokedex id

	db  65,  60,  70,  40,  75
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 130 ; base exp

	INCBIN "gfx/pokemon/front/porygon.pic", 0, 1 ; sprite dimensions
	dw PorygonPicFront, PorygonPicBackSW

	db TACKLE, SHARPEN, CONVERSION, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEECH_SEED,\
	PIN_MISSILE,\
	TOXIC,\
	SLASH,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	BARRIER,\
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	KINESIS,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	MEDITATE,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYBEAM,\
	SUBSTITUTE,\
	FLASH
	; end


	dw BANK(PorygonPicFront), BANK(PorygonPicBack)

	dw 0000, PorygonPicBack
