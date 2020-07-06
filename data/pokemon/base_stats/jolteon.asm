	db DEX_JOLTEON ; pokedex id

	db  65,  65,  60, 130, 110
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 197 ; base exp

	INCBIN "gfx/pokemon/front/jolteon.pic", 0, 1 ; sprite dimensions
	dw JolteonPicFront, JolteonPicBack

	db TACKLE, SAND_ATTACK, QUICK_ATTACK, THUNDERSHOCK ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 8, 9, 10, 15, 20, 24, 25, 31, 32, 33, 34, 39, 40, 44, 45, 50, 55
	; end

	db 0 ; padding
