	db DEX_PENDRAKEN ; pokedex id

	db  80,  60,  85,  90,  95
	;   hp  atk  def  spd  spc

	db WATER, FAIRY ; type
	db 45 ; catch rate
	db 180 ; base exp

	INCBIN "gfx/pokemon/front/pendraken.pic", 0, 1 ; sprite dimensions
	dw PendrakenPicFront, PendrakenPicBack

	db CONSTRICT, SMOKESCREEN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    \
	     ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         DRAGON_RAGE,  \
	     PSYCHIC_M,    TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         REST,         PSYWAVE,      SUBSTITUTE,   SURF,         \
	     FLASH
	; end

	db BANK(PendrakenPicFront)
	assert BANK(PendrakenPicFront) == BANK(PendrakenPicBack)
