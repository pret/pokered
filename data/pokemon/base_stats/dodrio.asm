	db DEX_DODRIO ; pokedex id

	db  60, 110,  70, 100,  60
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 158 ; base exp

	INCBIN "gfx/pokemon/front/dodrio.pic", 0, 1 ; sprite dimensions
	dw DodrioPicFront, DodrioPicBackSW

	db PECK, GROWL, FURY_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	RAZOR_WIND,\
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
	SLAM,\
	SKY_ATTACK,\
	THUNDER_WAVE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLY,\
	STRENGTH
	; end

	dw BANK(DodrioPicFront), BANK(DodrioPicBack)

	dw 0000, DodrioPicBack
