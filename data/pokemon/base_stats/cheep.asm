	db DEX_CHEEP ; pokedex id

	db  45,  65,  40,  60,  40
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 190 ; catch rate
	db 84 ; base exp

	INCBIN "gfx/pokemon/front/cheep.pic", 0, 1 ; sprite dimensions
	dw CheepPicFront, CheepPicBack

	db BUBBLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     COUNTER,      SEISMIC_TOSS, RAGE,         MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         SKY_ATTACK,   REST,         SUBSTITUTE,   SURF
	; end

	db BANK(CheepPicFront)
	assert BANK(CheepPicFront) == BANK(CheepPicBack)
