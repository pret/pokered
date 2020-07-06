	db DEX_SEEL ; pokedex id

	db  65,  45,  55,  45,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 190 ; catch rate
	db 100 ; base exp

	INCBIN "gfx/pokemon/front/seel.pic", 0, 1 ; sprite dimensions
	dw SeelPicFront, SeelPicBack

	db HEADBUTT, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 20, 31, 32, 34, 40, 44, 50, 53, 54
	; end

	db 0 ; padding
