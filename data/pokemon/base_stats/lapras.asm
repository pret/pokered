	db DEX_LAPRAS ; pokedex id

	db 130,  85,  80,  60,  95
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db 45 ; catch rate
	db 219 ; base exp

	INCBIN "gfx/pokemon/front/lapras.pic", 0, 1 ; sprite dimensions
	dw LaprasPicFront, LaprasPicBack

	db WATER_GUN, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 20, 22, 23, 24, 25, 29, 31, 32, 33, 34, 40, 44, 46, 50, 53, 54
	; end

	db 0 ; padding
