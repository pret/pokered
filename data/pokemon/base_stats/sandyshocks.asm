	db DEX_SANDY_SHOCKS ; pokedex id

	db  85,  81,  97, 101, 121
	;   hp  atk  def  spd  spc

	db ELECTRIC, GROUND ; type
	db 30 ; catch rate
	db 210 ; base exp

	INCBIN "gfx/pokemon/front/sandyshocks.pic", 0, 1 ; sprite dimensions
	dw SandyShocksPicFront, SandyShocksPicBack

	db TACKLE, SONICBOOM, THUNDERSHOCK, MAGNET_BOMB ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         THUNDERBOLT,  THUNDER,      EARTHQUAKE,   \
	     FISSURE,      DIG,          TELEPORT,     MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      BIDE,         SWIFT,        REST,         THUNDER_WAVE, \
	     SUBSTITUTE,   FLASH
	; end

	db BANK(SandyShocksPicFront)
	assert BANK(SandyShocksPicFront) == BANK(SandyShocksPicBack)
