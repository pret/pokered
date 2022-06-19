	db DEX_PARAS ; pokedex id

	db  35,  70,  55,  25,  55
	;   hp  atk  def  spd  spc

	db BUG, GRASS ; type
	db 190 ; catch rate
	db 70 ; base exp

	INCBIN "gfx/pokemon/front/paras.pic", 0, 1 ; sprite dimensions
	dw ParasPicFront, ParasPicBackSW

	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	LEECH_SEED,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	AMNESIA,\
	BARRIER,\
	RAZOR_LEAF,\
	SOLARBEAM,\
	EARTHQUAKE,\
	CRABHAMMER,\
	DIG,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	LIGHT_SCREEN,\
	SLUDGE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end


	dw BANK(ParasPicFront), BANK(ParasPicBack)

	dw 0000, ParasPicBack
