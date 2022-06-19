	db DEX_MEWTWO ; pokedex id

	db 106, 110,  90, 130, 154
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 25 ; catch rate
	db 220 ; base exp

	INCBIN "gfx/pokemon/front/mewtwo.pic", 0, 1 ; sprite dimensions
	dw MewtwoPicFront, MewtwoPicBackSW

	db CONFUSION, DISABLE, SWIFT, PSYCHIC_M ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
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
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	EARTHQUAKE,\
	CRABHAMMER,\
	PSYCHIC_M,\
	KINESIS,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	KARATE_CHOP,\
	MEDITATE,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYBEAM,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end


	dw BANK(MewtwoPicFront), BANK(MewtwoPicBack)

	dw MewtwoPicFrontRG, MewtwoPicBack
