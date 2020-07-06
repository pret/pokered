	db DEX_NIDORINO ; pokedex id

	db  61,  72,  57,  65,  55
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db 120 ; catch rate
	db 118 ; base exp

	INCBIN "gfx/pokemon/front/nidorino.pic", 0, 1 ; sprite dimensions
	dw NidorinoPicFront, NidorinoPicBack

	db LEER, TACKLE, HORN_ATTACK, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 6, 7, 8, 9, 10, 11, 12, 13, 14, 20, 24, 25, 31, 32, 33, 34, 40, 44, 50
	; end

	db 0 ; padding
