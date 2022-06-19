	db DEX_PSYDUCK ; pokedex id

	db  50,  52,  48,  55,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 190 ; catch rate
	db 80 ; base exp

	INCBIN "gfx/pokemon/front/psyduck.pic", 0, 1 ; sprite dimensions
	dw PsyduckPicFront, PsyduckPicBackSW

	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
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
	ICE_BEAM,\
	BLIZZARD,\
	AMNESIA,\
	HI_JUMP_KICK,\
	ROLLING_KICK,\
	BARRIER,\
	CRABHAMMER,\
	DIG,\
	PSYCHIC_M,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	MEDITATE,\
	LOVELY_KISS,\
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


	dw BANK(PsyduckPicFront), BANK(PsyduckPicBack)

	dw 0000, PsyduckPicBack
