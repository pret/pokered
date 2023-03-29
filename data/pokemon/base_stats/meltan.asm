	db DEX_MELTAN ; pokedex id

	db  46,  65,  55,  34, 35
	;   hp  atk  def  spd  spc

	db STEEL, STEEL ; type
	db 3 ; catch rate
	db 131 ; base exp

	INCBIN "gfx/pokemon/front/meltan.pic", 0, 1 ; sprite dimensions
	dw MeltanPicFront, MeltanPicBack

	db THUNDERSHOCK, HARDEN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC, 	   RAGE, 	     MIMIC, 	   DOUBLE_TEAM,  BIDE,		   \
		 REST,         THUNDER_WAVE, SUBSTITUTE 
	; end

	db BANK(MeltanPicFront)
	assert BANK(MeltanPicFront) == BANK(MeltanPicBack)