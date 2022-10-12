	db DEX_ZAPDOS_G ; pokedex id

	db  90, 125,  90, 100,  75
	;   hp  atk  def  spd  spc

	db FIGHTING, FLYING ; type
	db 3 ; catch rate
	db 216 ; base exp

	INCBIN "gfx/pokemon/front/zapdosg.pic", 0, 1 ; sprite dimensions
	dw ZapdosGPicFront, ZapdosGPicBack

	db PECK, FOCUS_ENERGY, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm WHIRLWIND,    MEGA_KICK,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   COUNTER,      RAGE,         MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         SWIFT,        SKY_ATTACK,   REST,         SUBSTITUTE,   \
		 FLY
	; end

	db BANK(ZapdosGPicFront)
	assert BANK(ZapdosGPicFront) == BANK(ZapdosGPicBack)
