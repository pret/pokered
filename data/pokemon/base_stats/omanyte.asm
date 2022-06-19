	db DEX_OMANYTE ; pokedex id

	db  35,  40, 100,  35,  90
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 120 ; base exp

	INCBIN "gfx/pokemon/front/omanyte.pic", 0, 1 ; sprite dimensions
	dw OmanytePicFront, OmanytePicBackSW

	db WATER_GUN, WITHDRAW, NO_MOVE, NO_MOVE ; level 1 learnset
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
	AMNESIA,\
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

	dw BANK(OmanytePicFront), BANK(OmanytePicBack)

	dw 0000, OmanytePicBack
