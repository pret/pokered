	db DEX_ELECTABUZZ ; pokedex id

	db  65,  83,  57, 105,  85
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 156 ; base exp

	INCBIN "gfx/pokemon/front/electabuzz.pic", 0, 1 ; sprite dimensions
	dw ElectabuzzPicFront, ElectabuzzPicBackSW

	db QUICK_ATTACK, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	PIN_MISSILE,\
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
	THUNDERBOLT,\
	THUNDER,\
	CRABHAMMER,\
	DIG,\
	KINESIS,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	MEDITATE,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH,\
	FLASH
	; end


	dw BANK(ElectabuzzPicFront), BANK(ElectabuzzPicBack)

	dw 0000, ElectabuzzPicBack
