	db DEX_VAPOREON ; pokedex id

	db 130,  65,  60,  65, 110
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 196 ; base exp

	INCBIN "gfx/pokemon/front/vaporeon.pic", 0, 1 ; sprite dimensions
	dw VaporeonPicFront, VaporeonPicBack

	db TACKLE, SAND_ATTACK, QUICK_ATTACK, WATER_GUN ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 8, 9, 10, 11, 12, 13, 14, 15, 20, 31, 32, 33, 34, 39, 40, 44, 50, 53
	; end

	db 0 ; padding
