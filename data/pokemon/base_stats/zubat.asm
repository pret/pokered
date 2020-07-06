	db DEX_ZUBAT ; pokedex id

	db  40,  45,  35,  55,  40
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db 255 ; catch rate
	db 54 ; base exp

	INCBIN "gfx/pokemon/front/zubat.pic", 0, 1 ; sprite dimensions
	dw ZubatPicFront, ZubatPicBack

	db LEECH_LIFE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 2, 4, 6, 9, 10, 20, 21, 31, 32, 34, 39, 44, 50
	; end

	db 0 ; padding
