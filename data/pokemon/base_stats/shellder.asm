	db DEX_SHELLDER ; pokedex id

	db  30,  65, 100,  40,  45
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 190 ; catch rate
	db 97 ; base exp

	INCBIN "gfx/pokemon/front/shellder.pic", 0, 1 ; sprite dimensions
	dw ShellderPicFront, ShellderPicBack

	db TACKLE, WITHDRAW, NO_MOVE, NO_MOVE ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 6, 9, 10, 11, 12, 13, 14, 20, 30, 31, 32, 33, 34, 36, 39, 44, 47, 49, 50, 53
	; end

	db 0 ; padding
