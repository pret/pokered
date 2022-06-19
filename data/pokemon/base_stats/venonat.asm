	db DEX_VENONAT ; pokedex id

	db  60,  55,  50,  45,  40
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 190 ; catch rate
	db 75 ; base exp

	INCBIN "gfx/pokemon/front/venonat.pic", 0, 1 ; sprite dimensions
	dw VenonatPicFront, VenonatPicBackSW

	db TACKLE, DISABLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEECH_SEED,\
	PIN_MISSILE,\
	TOXIC,\
	DOUBLE_EDGE,\
	AMNESIA,\
	BARRIER,\
	SOLARBEAM,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	KINESIS,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	SLUDGE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end


	dw BANK(VenonatPicFront), BANK(VenonatPicBack)

	dw 0000, VenonatPicBack
