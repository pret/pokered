	db DEX_ARCANINE ; pokedex id

	db  90, 110,  80,  95,  80
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 75 ; catch rate
	db 213 ; base exp

	INCBIN "gfx/pokemon/front/arcanine.pic", 0, 1 ; sprite dimensions
	dw ArcaninePicFront, ArcaninePicBack

	db ROAR, EMBER, LEER, TAKE_DOWN ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 6, 8, 9, 10, 15, 20, 23, 28, 30, 31, 32, 33, 34, 38, 39, 40, 44, 50
	; end

	db 0 ; padding
