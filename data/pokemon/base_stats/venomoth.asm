	db DEX_VENOMOTH ; pokedex id

	db  70,  65,  60,  90,  90
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 75 ; catch rate
	db 138 ; base exp

	INCBIN "gfx/pokemon/front/venomoth.pic", 0, 1 ; sprite dimensions
	dw VenomothPicFront, VenomothPicBack

	db TACKLE, DISABLE, POISONPOWDER, LEECH_LIFE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 2, 4, 6, 9, 10, 15, 20, 21, 22, 29, 30, 31, 32, 33, 34, 39, 44, 46, 50
	; end

	db 0 ; padding
