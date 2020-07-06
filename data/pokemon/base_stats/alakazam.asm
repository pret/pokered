	db DEX_ALAKAZAM ; pokedex id

	db  55,  50,  45, 120, 135
	;   hp  atk  def  spd  spc

	db PSYCHIC, PSYCHIC ; type
	db 50 ; catch rate
	db 186 ; base exp

	INCBIN "gfx/pokemon/front/alakazam.pic", 0, 1 ; sprite dimensions
	dw AlakazamPicFront, AlakazamPicBack

	db TELEPORT, CONFUSION, DISABLE, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 1, 5, 6, 8, 9, 10, 15, 17, 18, 19, 20, 28, 29, 30, 31, 32, 33, 34, 35, 40, 44, 45, 46, 49, 50, 55
	; end

	db 0 ; padding
