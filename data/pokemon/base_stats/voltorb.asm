	db DEX_VOLTORB ; pokedex id

	db  40,  30,  50, 100,  55
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 103 ; base exp

	INCBIN "gfx/pokemon/front/voltorb.pic", 0, 1 ; sprite dimensions
	dw VoltorbPicFront, VoltorbPicBackSW

	db TACKLE, SCREECH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	AMNESIA,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	CRABHAMMER,\
	MEGA_DRAIN,\
	KINESIS,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	GLARE,\
	SUBSTITUTE,\
	FLASH
	; end


	dw BANK(VoltorbPicFront), BANK(VoltorbPicBack)

	dw 0000, VoltorbPicBack
