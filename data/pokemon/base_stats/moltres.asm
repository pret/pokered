	db DEX_MOLTRES ; pokedex id

	db  90, 100,  90,  90, 125
	;   hp  atk  def  spd  spc

	db FIRE, FLYING ; type
	db 25 ; catch rate
	db 217 ; base exp

	INCBIN "gfx/pokemon/front/moltres.pic", 0, 1 ; sprite dimensions
	dw MoltresPicFront, MoltresPicBackSW

	db PECK, FIRE_SPIN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	RAZOR_WIND,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\
	BARRIER,\
	SOLARBEAM,\
	KINESIS,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end


	dw BANK(MoltresPicFront), BANK(MoltresPicBack)

	dw 0000, MoltresPicBack
