	db DEX_SPAROPHIM ; pokedex id

	db  97,  98,  77,  88,  98
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, FLYING ; type
	db 30 ; catch rate 
	db 142 ; base exp 

	INCBIN "gfx/pokemon/front/sparophim.pic", 0, 1 ; sprite dimensions
	dw SparophimPicFront, SparophimPicBack

	db CONFUSION, TELEPORT, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   SWORDS_DANCE, WHIRLWIND,    TOXIC,        TAKE_DOWN,    \
	     DOUBLE_EDGE,  HYPER_BEAM,   RAGE,         PSYCHIC_M,    TELEPORT,     \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         SWIFT,        \
	     DREAM_EATER,  SKY_ATTACK,   REST,         THUNDER_WAVE, PSYWAVE,      \
		 SUBSTITUTE,   FLY,          FLASH
	; end

	db 0 ; padding
