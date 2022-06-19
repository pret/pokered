	db DEX_MR_MIME ; pokedex id

	db  40,  45,  65,  90, 100
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 136 ; base exp

	INCBIN "gfx/pokemon/front/mr.mime.pic", 0, 1 ; sprite dimensions
	dw MrMimePicFront, MrMimePicBackSW

	db CONFUSION, BARRIER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	BUBBLEBEAM,\
	AURORA_BEAM,\
	HYPER_BEAM,\
	AMNESIA,\
	HI_JUMP_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	BARRIER,\
	SOLARBEAM,\
	THUNDERBOLT,\
	THUNDER,\
	CRABHAMMER,\
	PSYCHIC_M,\
	KINESIS,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	MEDITATE,\
	LIGHT_SCREEN,\
	THUNDER_WAVE,\
	PSYBEAM,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	SURF,\
	STRENGTH,\
	FLASH
	; end


	dw BANK(MrMimePicFront), BANK(MrMimePicBack)

	dw 0000, MrMimePicBack
