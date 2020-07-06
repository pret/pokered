	db DEX_PIKACHU ; pokedex id

	db  35,  55,  30,  90,  50
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 82 ; base exp

	INCBIN "gfx/pokemon/front/pikachu.pic", 0, 1 ; sprite dimensions
	dw PikachuPicFront, PikachuPicBack

	db THUNDERSHOCK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 1, 5, 6, 8, 9, 10, 16, 17, 19, 20, 24, 25, 31, 32, 33, 34, 39, 40, 44, 45, 50, 55
	; end

	db 0 ; padding
