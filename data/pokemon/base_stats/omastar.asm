	db DEX_OMASTAR ; pokedex id

	db  70,  60, 125,  55, 115
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 199 ; base exp

	INCBIN "gfx/pokemon/front/omastar.pic", 0, 1 ; sprite dimensions
	dw OmastarPicFront, OmastarPicBackSW

	db WATER_GUN, WITHDRAW, HORN_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEECH_SEED,\
	PIN_MISSILE,\
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

	dw BANK(OmastarPicFront), BANK(OmastarPicBack)

	dw 0000, OmastarPicBack
