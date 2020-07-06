	db DEX_ELECTRODE ; pokedex id

	db  60,  50,  70, 140,  80
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 60 ; catch rate
	db 150 ; base exp

	INCBIN "gfx/pokemon/front/electrode.pic", 0, 1 ; sprite dimensions
	dw ElectrodePicFront, ElectrodePicBack

	db TACKLE, SCREECH, SONICBOOM, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 9, 15, 20, 24, 25, 30, 31, 32, 33, 34, 36, 39, 40, 44, 45, 47, 50, 55
	; end

	db 0 ; padding
