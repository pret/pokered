	db DEX_KINGLER ; pokedex id

	db  55, 130, 115,  75,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 60 ; catch rate
	db 206 ; base exp

	INCBIN "gfx/pokemon/front/kingler.pic", 0, 1 ; sprite dimensions
	dw KinglerPicFront, KinglerPicBack

	db BUBBLE, LEER, VICEGRIP, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 8, 9, 10, 11, 12, 13, 14, 15, 20, 31, 32, 34, 44, 50, 51, 53, 54
	; end

	db 0 ; padding
