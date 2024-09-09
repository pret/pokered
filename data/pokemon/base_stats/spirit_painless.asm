	db DEX_WIGGLYTUFF ; pokedex id

	db 140,  80,  45,  55,  80
	;   hp  atk  def  spd  spc

	db NORMAL, GHOST ; type
	db 50 ; catch rate
	db 109 ; base exp

	INCBIN "gfx/battle/spirit_painless.pic", 0, 1 ; sprite dimensions
	dw PainlessPicFront, WigglytuffPicBackSW

	db EXPLOSION, SELFDESTRUCT, HI_JUMP_KICK, DOUBLE_EDGE ; level 1 learnset
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
	KINESIS,\ ; FIREWALL
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

	db BANK(PainlessPicFront)
	db 0
	db BANK(WigglytuffPicBack)
	db BANK(WigglytuffPicBackSW)

	dw 0, WigglytuffPicBack

