	db DEX_DRAGONITE ; pokedex id

	db  91, 134,  95,  80, 100
	;   hp  atk  def  spd  spc

	db DRAGON, FLYING ; type
	db 45 ; catch rate
	db 218 ; base exp

	INCBIN "gfx/pokemon/front/dragonite.pic", 0, 1 ; sprite dimensions
	dw DragonitePicFront, DragonitePicBack

	db WRAP, LEER, THUNDER_WAVE, AGILITY ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 2, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 20, 23, 24, 25, 31, 32, 33, 34, 38, 39, 40, 44, 45, 50, 53, 54
	; end

	db 0 ; padding
