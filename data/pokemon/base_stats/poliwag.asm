	db DEX_POLIWAG ; pokedex id

	db  40,  50,  40,  90,  40
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 255 ; catch rate
	db 77 ; base exp

	INCBIN "gfx/pokemon/front/poliwag.pic", 0, 1 ; sprite dimensions
	dw PoliwagPicFront, PoliwagPicBack

	db BUBBLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 6, 8, 9, 10, 11, 12, 13, 14, 20, 29, 31, 32, 34, 40, 44, 46, 50, 53
	; end

	db 0 ; padding
