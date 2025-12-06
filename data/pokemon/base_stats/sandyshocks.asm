	db DEX_SANDYSHOCKS ; pokedex id

	db  85,  81,  97, 101, 121
	;   hp  atk  def  spd  spc

	db ELECTRIC, GROUND ; type
	db 60 ; catch rate
	db 161 ; base exp

	INCBIN "gfx/pokemon/front/sandyshocks.pic", 0, 1 ; sprite dimensions
	dw SandyShocksPicFront, SandyShocksPicBack

    db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; note: starting learnsets are part of regular learnsets
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  HYPER_BEAM,   RAGE,         \
	     THUNDERBOLT,  THUNDER,      TELEPORT,     MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         SWIFT,        REST,         THUNDER_WAVE, \
	     SUBSTITUTE,   FLASH
	; end

	db BANK(SandyShocksPicFront)
	assert BANK(SandyShocksPicFront) == BANK(SandyShocksPicBack)
