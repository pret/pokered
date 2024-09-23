	db DEX_MAGMAR ; pokedex id

	db  75,  95,  57,  93,  95
	;   hp  atk  def  spd  spc

	db FIRE, MAGMA ; type
	db 85 ; catch rate
	db 167 ; base exp

	INCBIN "gfx/pokemon/front_alt/volcanic_magmar.pic", 0, 1 ; sprite dimensions
	dw VolcanicMagmarPicFront, VolcanicMagmarPicBackSW

	db EMBER, FIRE_SPIN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\
	HI_JUMP_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	BARRIER,\
	SOLARBEAM,\
	DRAGON_RAGE,\
	EARTHQUAKE,\
	DIG,\
	PSYCHIC_M,\
	KINESIS,\ ; FIREWALL
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	FIRE_BLAST,\
	FLAMETHROWER,\
	SLAM,\ ; FILTHY SLAM
	KARATE_CHOP,\
	MEDITATE,\
	LOVELY_KISS,\
	LIGHT_SCREEN,\
	PSYBEAM,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end


	db BANK(VolcanicMagmarPicFront)
	db 0
	db BANK(MagmarPicBack)
	db BANK(VolcanicMagmarPicBackSW)

	dw 0, MagmarPicBack

