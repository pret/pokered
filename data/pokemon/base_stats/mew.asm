	db DEX_MEW ; pokedex id

	db 100, 100, 100, 100, 100
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 25 ; catch rate
	db 64 ; base exp

	INCBIN "gfx/pokemon/front/mew.pic", 0, 1 ; sprite dimensions
	dw MewPicFront, MewPicBackSW

	db POUND, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	RAZOR_WIND,\
	LEECH_SEED,\ 
	PIN_MISSILE,\ 
	FIRE_PUNCH,\
	TOXIC,\
	HORN_DRILL,\
	BODY_SLAM,\
	SLASH,\
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
	RAZOR_LEAF,\
	SOLARBEAM,\
	DRAGON_RAGE,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	KINESIS,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\   
	BARRAGE,\ 
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\
	KARATE_CHOP,\
	MEDITATE,\
	LOVELY_KISS,\
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYBEAM,\
	SLUDGE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	SURF,\
	STRENGTH,\
	FLASH
	; end

	dw BANK(MewPicFront), BANK(MewPicBack)

	dw 0000, MewPicBack
