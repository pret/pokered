	db DEX_ZAPDOS ; pokedex id

	db  90,  90,  85, 100, 125
	;   hp  atk  def  spd  spc

	db ELECTRIC, FLYING ; type
	db 3 ; catch rate
	db 216 ; base exp

	INCBIN "gfx/pokemon/front/zapdos.pic", 0, 1 ; sprite dimensions
	dw ZapdosPicFront, ZapdosPicBack

	db THUNDERSHOCK, DRILL_PECK, NO_MOVE, NO_MOVE ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 2, 4, 6, 9, 10, 15, 20, 24, 25, 31, 32, 33, 34, 39, 43, 44, 45, 50, 52, 55
	; end

	db 0 ; padding
