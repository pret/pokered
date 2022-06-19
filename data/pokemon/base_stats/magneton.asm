	db DEX_MAGNETON ; pokedex id

	db  50,  60,  95,  70, 120
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 60 ; catch rate
	db 161 ; base exp

	INCBIN "gfx/pokemon/front/magneton.pic", 0, 1 ; sprite dimensions
	dw MagnetonPicFront, MagnetonPicBackSW

	db TACKLE, SONICBOOM, THUNDERSHOCK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	TOXIC,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	BARRIER,\
	THUNDERBOLT,\
	THUNDER,\
	CRABHAMMER,\
	KINESIS,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	MEDITATE,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYBEAM,\
	SUBSTITUTE,\
	FLASH
	; end

	dw BANK(MagnetonPicFront), BANK(MagnetonPicBack)

	dw 0000, MagnetonPicBack
