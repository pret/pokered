	db DEX_MAGNETITE ; pokedex id

	db  30,  40,  75,  50, 100
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 90 ; catch rate
	db 118 ; base exp

	INCBIN "gfx/pokemon/front/magnetite.pic", 0, 1 ; sprite dimensions
	dw MagnetitePicFront, MagnetitePicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  RAGE,         THUNDERBOLT,  \
	     THUNDER,      TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         SWIFT,        REST,         THUNDER_WAVE, SUBSTITUTE,   \
	     FLASH
	; end

	db BANK(MagnetitePicFront)
	assert BANK(MagnetitePicFront) == BANK(MagnetitePicBack)
