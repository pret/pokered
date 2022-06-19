	db DEX_STARMIE ; pokedex id

	db  60,  75,  85, 115, 100
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db 60 ; catch rate
	db 207 ; base exp

	INCBIN "gfx/pokemon/front/starmie.pic", 0, 1 ; sprite dimensions
	dw StarmiePicFront, StarmiePicBackSW

	db TACKLE, WATER_GUN, HARDEN, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	MEDITATE,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYBEAM,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	FLASH
	; end

	dw BANK(StarmiePicFront), BANK(StarmiePicBack)

	dw 0000, StarmiePicBack
