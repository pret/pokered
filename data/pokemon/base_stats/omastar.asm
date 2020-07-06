	db DEX_OMASTAR ; pokedex id

	db  70,  60, 125,  55, 115
	;   hp  atk  def  spd  spc

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 199 ; base exp

	INCBIN "gfx/pokemon/front/omastar.pic", 0, 1 ; sprite dimensions
	dw OmastarPicFront, OmastarPicBack

	db WATER_GUN, WITHDRAW, HORN_ATTACK, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 17, 19, 20, 31, 32, 33, 34, 40, 44, 50, 53
	; end

	db 0 ; padding
