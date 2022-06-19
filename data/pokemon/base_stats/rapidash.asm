	db DEX_RAPIDASH ; pokedex id

	db  65, 100,  70, 105,  80
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 60 ; catch rate
	db 192 ; base exp

	INCBIN "gfx/pokemon/front/rapidash.pic", 0, 1 ; sprite dimensions
	dw RapidashPicFront, RapidashPicBackSW

	db EMBER, TAIL_WHIP, STOMP, GROWL ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	HORN_DRILL,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	BARRIER,\
	SOLARBEAM,\
	DRAGON_RAGE,\
	EARTHQUAKE,\
	KINESIS,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\
	LIGHT_SCREEN,\
	GLARE,\
	SUBSTITUTE,\
	STRENGTH,\
	FLASH
	; end

	dw BANK(RapidashPicFront), BANK(RapidashPicBack)

	dw 0000, RapidashPicBack
