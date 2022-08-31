	db DEX_DEER ; pokedex id

	db  85, 110,  85,  60,  90
	;   hp  atk  def  spd  spc

	db NORMAL, GRASS ; type
	db 45 ; catch rate
	db 165 ; base exp

	INCBIN "gfx/pokemon/front/deer.pic", 0, 1 ; sprite dimensions
	dw DeerPicFront, DeerPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   \
	     RAGE,         MEGA_DRAIN,   SOLARBEAM,    THUNDERBOLT,  THUNDER,      \
	     PSYCHIC_M,    TELEPORT,     MIMIC,        DOUBLE_TEAM,  BIDE,         \
	     REST,         THUNDER_WAVE, PSYWAVE,      SUBSTITUTE,   STRENGTH,     \
	     FLASH
	; end

	db BANK(DeerPicFront)
	assert BANK(DeerPicFront) == BANK(DeerPicBack)
