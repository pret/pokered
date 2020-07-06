	db DEX_DRAGONAIR ; pokedex id

	db  61,  84,  65,  70,  70
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 144 ; base exp

	INCBIN "gfx/pokemon/front/dragonair.pic", 0, 1 ; sprite dimensions
	dw DragonairPicFront, DragonairPicBack

	db WRAP, LEER, THUNDER_WAVE, NO_MOVE ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 6, 7, 8, 9, 10, 11, 12, 13, 14, 20, 23, 24, 25, 31, 32, 33, 34, 38, 39, 40, 44, 45, 50, 53
	; end

	db 0 ; padding
