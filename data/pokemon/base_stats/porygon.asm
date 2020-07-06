	db DEX_PORYGON ; pokedex id

	db  65,  60,  70,  40,  75
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 130 ; base exp

	INCBIN "gfx/pokemon/front/porygon.pic", 0, 1 ; sprite dimensions
	dw PorygonPicFront, PorygonPicBack

	db TACKLE, SHARPEN, CONVERSION, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 9, 10, 13, 14, 15, 20, 24, 25, 29, 30, 31, 32, 33, 34, 39, 40, 44, 45, 46, 49, 50, 55
	; end

	db 0 ; padding
