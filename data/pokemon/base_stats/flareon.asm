	db DEX_FLAREON ; pokedex id

	db  65, 130,  60,  65, 110
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 198 ; base exp

	INCBIN "gfx/pokemon/front/flareon.pic", 0, 1 ; sprite dimensions
	dw FlareonPicFront, FlareonPicBack

	db TACKLE, SAND_ATTACK, QUICK_ATTACK, EMBER ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 8, 9, 10, 15, 20, 31, 32, 33, 34, 38, 39, 40, 44, 50
	; end

	db 0 ; padding
