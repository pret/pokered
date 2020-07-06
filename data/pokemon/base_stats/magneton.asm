	db DEX_MAGNETON ; pokedex id

	db  50,  60,  95,  70, 120
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 60 ; catch rate
	db 161 ; base exp

	INCBIN "gfx/pokemon/front/magneton.pic", 0, 1 ; sprite dimensions
	dw MagnetonPicFront, MagnetonPicBack

	db TACKLE, SONICBOOM, THUNDERSHOCK, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 9, 10, 15, 20, 24, 25, 30, 31, 32, 33, 34, 39, 44, 45, 50, 55
	; end

	db 0 ; padding
