	db DEX_AERODACTYL ; pokedex id

	db  80, 105,  65, 130,  60
	;   hp  atk  def  spd  spc

	db ROCK, FLYING ; type
	db 45 ; catch rate
	db 202 ; base exp

	INCBIN "gfx/pokemon/front/aerodactyl.pic", 0, 1 ; sprite dimensions
	dw AerodactylPicFront, AerodactylPicBack

	db WING_ATTACK, AGILITY, NO_MOVE, NO_MOVE ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 2, 4, 6, 9, 10, 15, 20, 23, 31, 32, 33, 34, 38, 39, 43, 44, 50, 52
	; end

	db 0 ; padding
