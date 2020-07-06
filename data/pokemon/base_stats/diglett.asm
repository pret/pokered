	db DEX_DIGLETT ; pokedex id

	db  10,  55,  25,  95,  45
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 255 ; catch rate
	db 81 ; base exp

	INCBIN "gfx/pokemon/front/diglett.pic", 0, 1 ; sprite dimensions
	dw DiglettPicFront, DiglettPicBack

	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 8, 9, 10, 20, 26, 27, 28, 31, 32, 34, 44, 48, 50
	; end

	db 0 ; padding
