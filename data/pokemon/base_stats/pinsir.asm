	db DEX_PINSIR ; pokedex id

	db  65, 125, 100,  85,  55
	;   hp  atk  def  spd  spc

	db BUG, BUG ; type
	db 45 ; catch rate
	db 200 ; base exp

	INCBIN "gfx/pokemon/front/pinsir.pic", 0, 1 ; sprite dimensions
	dw PinsirPicFront, PinsirPicBack

	db VICEGRIP, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 8, 9, 10, 15, 17, 19, 20, 31, 32, 34, 44, 50, 51, 54
	; end

	db 0 ; padding
