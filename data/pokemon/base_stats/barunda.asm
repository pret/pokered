	db DEX_BARUNDA ; pokedex id

	db  90,  50,  30, 125, 100
	;   hp  atk  def  spd  spc

	db FAIRY, FLYING ; type
	db 45 ; catch rate
	db 137 ; base exp

	INCBIN "gfx/pokemon/front/barunda.pic", 0, 1 ; sprite dimensions
	dw BarundaPicFront, BarundaPicBack

	db FAIRY_WIND, GROWL, DRAININGKISS, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   WHIRLWIND,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         THUNDERBOLT,  THUNDER,      PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         \
	     SELFDESTRUCT, SWIFT,        SKULL_BASH,   DREAM_EATER,  REST,         \
	     PSYWAVE,      EXPLOSION,    TRI_ATTACK,   SUBSTITUTE,   FLY,          \
	     FLASH
	; end

	db BANK(BarundaPicFront)
	assert BANK(BarundaPicFront) == BANK(BarundaPicBack)
