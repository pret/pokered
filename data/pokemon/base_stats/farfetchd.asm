	db DEX_FARFETCHD ; pokedex id

	db  52,  65,  55,  60,  58
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 94 ; base exp

	INCBIN "gfx/pokemon/front/farfetchd.pic", 0, 1 ; sprite dimensions
	dw FarfetchdPicFront, FarfetchdPicBack

	db PECK, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 2, 3, 4, 6, 8, 9, 10, 20, 31, 32, 33, 34, 39, 40, 44, 50, 51, 52
	; end

	db 0 ; padding
