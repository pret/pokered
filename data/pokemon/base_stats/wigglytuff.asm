	db DEX_WIGGLYTUFF ; pokedex id

	db 140,  70,  45,  45,  50
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 50 ; catch rate
	db 109 ; base exp

	INCBIN "gfx/pokemon/front/wigglytuff.pic", 0, 1 ; sprite dimensions
	dw WigglytuffPicFront, WigglytuffPicBackSW

	db SING, DISABLE, DEFENSE_CURL, DOUBLESLAP ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	LEECH_SEED,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	HYPER_BEAM,\
	AMNESIA,\
	HI_JUMP_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	BARRIER,\
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	PSYCHIC_M,\
	KINESIS,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	KARATE_CHOP,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYBEAM,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	dw BANK(WigglytuffPicFront), BANK(WigglytuffPicBack)

	dw 0000, WigglytuffPicBack
