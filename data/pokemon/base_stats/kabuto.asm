	db DEX_KABUTO ; pokedex id

	db  30,  80,  90,  55,  45
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 119 ; base exp

	INCBIN "gfx/pokemon/front/kabuto.pic", 0, 1 ; sprite dimensions
	dw KabutoPicFront, KabutoPicBackSW

	db SCRATCH, HARDEN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEECH_SEED,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	ICE_BEAM,\
	BLIZZARD,\
	BARRIER,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	MEGA_DRAIN,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\
	SLUDGE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	FLASH
	; end


	dw BANK(KabutoPicFront), BANK(KabutoPicBack)

	dw 0000, KabutoPicBack
