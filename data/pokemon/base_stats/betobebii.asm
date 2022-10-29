	db DEX_BETOBEBII ; pokedex id

	db  65,  65,  35,  10,  25	; +5 to all stats
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 255 ; catch rate
	db 61 ; base exp

	INCBIN "gfx/pokemon/front/betobebii.pic", 0, 1 ; sprite dimensions
	dw BetobebiiPicFront, BetobebiiPicBack

	db POUND, DISABLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    RAGE,         MEGA_DRAIN,   THUNDERBOLT,  \
	     THUNDER,      MIMIC,        DOUBLE_TEAM,  BIDE,         SELFDESTRUCT, \
	     FIRE_BLAST,   REST,         EXPLOSION,    SUBSTITUTE
	; end

	db BANK(BetobebiiPicFront)
	assert BANK(BetobebiiPicFront) == BANK(BetobebiiPicBack)
