	db DEX_FEAROW ; pokedex id

	db  65,  90,  65, 100,  61
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 90 ; catch rate
	db 162 ; base exp

	INCBIN "gfx/pokemon/front/fearow.pic", 0, 1 ; sprite dimensions
	dw FearowPicFront, FearowPicBack

	db PECK, GROWL, LEER, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 2, 4, 6, 9, 10, 15, 20, 31, 32, 34, 39, 43, 44, 50, 52
	; end

	db 0 ; padding
