	db DEX_POLIWRATH ; pokedex id

	db  90,  85,  95,  70,  70
	;   hp  atk  def  spd  spc

	db WATER, FIGHTING ; type
	db 45 ; catch rate
	db 185 ; base exp

	INCBIN "gfx/pokemon/front/poliwrath.pic", 0, 1 ; sprite dimensions
	dw PoliwrathPicFront, PoliwrathPicBack

	db HYPNOSIS, WATER_GUN, DOUBLESLAP, BODY_SLAM ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 1, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 26, 27, 29, 31, 32, 34, 35, 40, 44, 46, 50, 53, 54
	; end

	db 0 ; padding
