	db DEX_VENOMOTH ; pokedex id

	db  70,  65,  60,  90,  90
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 75 ; catch rate
	db 138 ; base exp

	INCBIN "gfx/pokemon/front/venomoth.pic", 0, 1 ; sprite dimensions
	dw VenomothPicFront, VenomothPicBackSW

	db TACKLE, DISABLE, POISONPOWDER, LEECH_LIFE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	RAZOR_WIND,\
	LEECH_SEED,\
	PIN_MISSILE,\
	TOXIC,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	AMNESIA,\
	BARRIER,\
	SOLARBEAM,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	KINESIS,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	SLUDGE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end

	dw BANK(VenomothPicFront), BANK(VenomothPicBack)

	dw 0000, VenomothPicBack
