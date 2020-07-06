	db DEX_GYARADOS ; pokedex id

	db  95, 125,  79,  81, 100
	;   hp  atk  def  spd  spc

	db WATER, FLYING ; type
	db 45 ; catch rate
	db 214 ; base exp

	INCBIN "gfx/pokemon/front/gyarados.pic", 0, 1 ; sprite dimensions
	dw GyaradosPicFront, GyaradosPicBack

	db BITE, DRAGON_RAGE, LEER, HYDRO_PUMP ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 6, 8, 9, 10, 11, 12, 13, 14, 15, 20, 23, 24, 25, 31, 32, 33, 34, 38, 40, 44, 50, 53, 54
	; end

	db 0 ; padding
