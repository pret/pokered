	db DEX_RAPIDASH ; pokedex id

	db  65, 100,  70, 105,  80
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db 60 ; catch rate
	db 192 ; base exp

	INCBIN "gfx/pokemon/front/rapidash.pic", 0, 1 ; sprite dimensions
	dw RapidashPicFront, RapidashPicBack

	db EMBER, TAIL_WHIP, STOMP, GROWL ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 7, 8, 9, 10, 15, 20, 31, 32, 33, 34, 38, 39, 40, 44, 50
	; end

	db 0 ; padding
