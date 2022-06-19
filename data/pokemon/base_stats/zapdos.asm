	db DEX_ZAPDOS ; pokedex id

	db  90,  90,  85, 100, 125
	;   hp  atk  def  spd  spc

	db ELECTRIC, FLYING ; type
	db 25 ; catch rate
	db 216 ; base exp

	INCBIN "gfx/pokemon/front/zapdos.pic", 0, 1 ; sprite dimensions
	dw ZapdosPicFront, ZapdosPicBackSW

	db THUNDERSHOCK, DRILL_PECK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	RAZOR_WIND,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	KINESIS,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYBEAM,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end


	dw BANK(ZapdosPicFront), BANK(ZapdosPicBack)

	dw 0000, ZapdosPicBack
