	db DEX_MEOWTH ; pokedex id

	db  40,  45,  35,  90,  40
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 69 ; base exp

	INCBIN "gfx/pokemon/front/meowth.pic", 0, 1 ; sprite dimensions
	dw MeowthPicFront, MeowthPicBack

	db SCRATCH, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 8, 9, 10, 11, 12, 16, 20, 24, 25, 31, 32, 34, 39, 40, 44, 50
	; end

	db 0 ; padding
