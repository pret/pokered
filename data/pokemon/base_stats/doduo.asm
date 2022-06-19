	db DEX_DODUO ; pokedex id

	db  35,  85,  45,  75,  35
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 190 ; catch rate
	db 96 ; base exp

	INCBIN "gfx/pokemon/front/doduo.pic", 0, 1 ; sprite dimensions
	dw DoduoPicFront, DoduoPicBackSW

	db PECK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	RAZOR_WIND,\
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HI_JUMP_KICK,\
	ROLLING_KICK,\
	BARRIER,\
	EARTHQUAKE,\
	DIG,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\
	SKY_ATTACK,\
	THUNDER_WAVE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	STRENGTH
	; end


	dw BANK(DoduoPicFront), BANK(DoduoPicBack)

	dw 0000, DoduoPicBack
