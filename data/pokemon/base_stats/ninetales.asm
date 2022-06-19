	db DEX_NINETALES ; pokedex id

	db  73,  76,  75, 100, 100
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 75 ; catch rate
	db 178 ; base exp

	INCBIN "gfx/pokemon/front/ninetales.pic", 0, 1 ; sprite dimensions
	dw NinetalesPicFront, NinetalesPicBackSW

	db EMBER, TAIL_WHIP, QUICK_ATTACK, ROAR ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	AMNESIA,\
	ROLLING_KICK,\
	BARRIER,\
	SOLARBEAM,\
	DRAGON_RAGE,\
	DIG,\
	PSYCHIC_M,\
	KINESIS,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYBEAM,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end

	dw BANK(NinetalesPicFront), BANK(NinetalesPicBack)

	dw 0000, NinetalesPicBack
