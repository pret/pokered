	db DEX_ELECTRODE ; pokedex id

	db  60,  50,  70, 140,  80
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 60 ; catch rate
	db 150 ; base exp

	INCBIN "gfx/pokemon/front/electrode.pic", 0, 1 ; sprite dimensions
	dw ElectrodePicFront, ElectrodePicBackSW

	db TACKLE, SCREECH, SONICBOOM, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
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

	dw BANK(ElectrodePicFront), BANK(ElectrodePicBack)

	dw 0000, ElectrodePicBack
