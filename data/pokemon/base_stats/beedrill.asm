	db DEX_BEEDRILL ; pokedex id

	db  65,  80,  40,  75,  45
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 45 ; catch rate
	db 159 ; base exp

	INCBIN "gfx/pokemon/front/beedrill.pic", 0, 1 ; sprite dimensions
	dw BeedrillPicFront, BeedrillPicBack

	db FURY_ATTACK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 9, 10, 15, 20, 21, 31, 32, 33, 34, 39, 40, 44, 50, 51
	; end

	db 0 ; padding
