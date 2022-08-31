	db DEX_JABETTA ; pokedex id

	db  80, 125,  70,  80,  80
	;   hp  atk  def  spd  spc

	db WATER, FIGHTING ; type
	db 75 ; catch rate
	db 184 ; base exp

	INCBIN "gfx/pokemon/front/jabetta.pic", 0, 1 ; sprite dimensions
	dw JabettaPicFront, JabettaPicBack

	db BUBBLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   COUNTER,      SEISMIC_TOSS, RAGE,         MIMIC,        \
	     DOUBLE_TEAM,  BIDE,         SKY_ATTACK,   REST,         SUBSTITUTE,   \
	     SURF,         STRENGTH
	; end

	db BANK(JabettaPicFront)
	assert BANK(JabettaPicFront) == BANK(JabettaPicBack)
