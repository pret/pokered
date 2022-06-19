	db DEX_BEEDRILL ; pokedex id

	db  65,  80,  40,  75,  45
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 45 ; catch rate
	db 159 ; base exp

	INCBIN "gfx/pokemon/front/beedrill.pic", 0, 1 ; sprite dimensions
	dw BeedrillPicFront, BeedrillPicBackSW

	db FURY_ATTACK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	tmhm \
	RAZOR_WIND,\
	LEECH_SEED,\
	PIN_MISSILE,\
	TOXIC,\
	HORN_DRILL,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\
	BARRIER,\
	SOLARBEAM,\
	CRABHAMMER,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	SKY_ATTACK,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	FLASH
	; end


	dw BANK(BeedrillPicFront), BANK(BeedrillPicBack)

	dw 0000, BeedrillPicBack
