	db DEX_NINETALES ; pokedex id

	db  73,  76,  75, 100, 100
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 75 ; catch rate
	db 178 ; base exp

	INCBIN "gfx/pokemon/front/ninetales.pic", 0, 1 ; sprite dimensions
	dw NinetalesPicFront, NinetalesPicBack

	db EMBER, TAIL_WHIP, QUICK_ATTACK, ROAR ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 8, 9, 10, 15, 20, 28, 31, 32, 33, 34, 38, 39, 40, 44, 50
	; end

	db 0 ; padding
