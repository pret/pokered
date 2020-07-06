	db DEX_VOLTORB ; pokedex id

	db  40,  30,  50, 100,  55
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 103 ; base exp

	INCBIN "gfx/pokemon/front/voltorb.pic", 0, 1 ; sprite dimensions
	dw VoltorbPicFront, VoltorbPicBack

	db TACKLE, SCREECH, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 9, 20, 24, 25, 30, 31, 32, 33, 34, 36, 39, 44, 45, 47, 50, 55
	; end

	db 0 ; padding
