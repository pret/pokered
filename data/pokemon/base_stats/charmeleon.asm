	db DEX_CHARMELEON ; pokedex id

	db  58,  64,  58,  80,  65
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 142 ; base exp

	INCBIN "gfx/pokemon/front/charmeleon.pic", 0, 1 ; sprite dimensions
	dw CharmeleonPicFront, CharmeleonPicBack

	db SCRATCH, GROWL, EMBER, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 1, 3, 5, 6, 8, 9, 10, 17, 18, 19, 20, 23, 28, 31, 32, 33, 34, 38, 39, 40, 44, 50, 51, 54
	; end

	db 0 ; padding
