	db DEX_VILEPLUME ; pokedex id

	db  75,  80,  85,  50, 100
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 184 ; base exp

	INCBIN "gfx/pokemon/front/vileplume.pic", 0, 1 ; sprite dimensions
	dw VileplumePicFront, VileplumePicBack

	db STUN_SPORE, SLEEP_POWDER, ACID, PETAL_DANCE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 8, 9, 10, 15, 20, 21, 22, 31, 32, 33, 34, 44, 50, 51
	; end

	db 0 ; padding
