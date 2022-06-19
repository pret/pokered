	db DEX_CLEFABLE ; pokedex id

	db  95,  70,  73,  60,  85
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 129 ; base exp

	INCBIN "gfx/pokemon/front/clefable.pic", 0, 1 ; sprite dimensions
	dw ClefablePicFront, ClefablePicBackSW

	db SING, DOUBLESLAP, MINIMIZE, METRONOME ; level 1 learnset
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
	THUNDERPUNCH,\
	ROLLING_KICK,\
	BARRIER,\
	SOLARBEAM,\
	DRAGON_RAGE,\
	THUNDERBOLT,\
	THUNDER,\
	DIG,\
	PSYCHIC_M,\
	KINESIS,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	KARATE_CHOP,\
	MEDITATE,\
	LOVELY_KISS,\
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYBEAM,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end

	dw BANK(ClefablePicFront), BANK(ClefablePicBack)

	dw 0000, ClefablePicBack
