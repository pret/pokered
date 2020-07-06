	db DEX_MACHOP ; pokedex id

	db  70,  80,  50,  35,  35
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 180 ; catch rate
	db 88 ; base exp

	INCBIN "gfx/pokemon/front/machop.pic", 0, 1 ; sprite dimensions
	dw MachopPicFront, MachopPicBack

	db KARATE_CHOP, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 1, 5, 6, 8, 9, 10, 17, 18, 19, 20, 26, 27, 28, 31, 32, 34, 35, 38, 40, 44, 48, 50, 54
	; end

	db 0 ; padding
