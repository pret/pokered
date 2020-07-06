	db DEX_HAUNTER ; pokedex id

	db  45,  50,  45,  95, 115
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db 90 ; catch rate
	db 126 ; base exp

	INCBIN "gfx/pokemon/front/haunter.pic", 0, 1 ; sprite dimensions
	dw HaunterPicFront, HaunterPicBack

	db LICK, CONFUSE_RAY, NIGHT_SHADE, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 6, 20, 21, 24, 25, 29, 31, 32, 34, 36, 42, 44, 46, 47, 50
	; end

	db 0 ; padding
