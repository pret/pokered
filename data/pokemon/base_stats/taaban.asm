	db DEX_TAABAN ; pokedex id

	db  70, 125, 145,  50,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 60 ; catch rate
	db 203 ; base exp

	INCBIN "gfx/pokemon/front/taaban.pic", 0, 1 ; sprite dimensions
	dw TaabanPicFront, TaabanPicBack

	db TACKLE, WITHDRAW, BITE, WATER_GUN ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    \
	     ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         EARTHQUAKE,   \
	     FISSURE,      DIG,          TELEPORT,     MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         SELFDESTRUCT, SWIFT,        REST,         \
	     EXPLOSION,    TRI_ATTACK,   SUBSTITUTE,   SURF, 	     STRENGTH
	; end

	db BANK(TaabanPicFront)
	assert BANK(TaabanPicFront) == BANK(TaabanPicBack)
