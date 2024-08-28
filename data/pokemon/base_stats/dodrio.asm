	db DEX_DODRIO ; pokedex id

	db  70, 115,  70, 105,  60
	;   hp  atk  def  spd  spc

	db GROUND, FLYING ; type
	db 45 ; catch rate
	db 158 ; base exp

	INCBIN "gfx/pokemon/front/dodrio.pic", 0, 1 ; sprite dimensions
	dw DodrioPicFront, DodrioPicBackSW

	db PECK, DOUBLE_KICK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	RAZOR_WIND,\ ; ROOST
	PIN_MISSILE,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
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
	SLAM,\ ; FILTHY SLAM
	SKY_ATTACK,\
	THUNDER_WAVE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	STRENGTH
	; end

	db BANK(DodrioPicFront)
	db 0
	db BANK(DodrioPicBack)
	db BANK(DodrioPicBackSW)

	dw 0, DodrioPicBack

