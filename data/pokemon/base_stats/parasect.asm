	db DEX_PARASECT ; pokedex id

	db  60,  95,  80,  30,  80
	;   hp  atk  def  spd  spc

	db BUG, GRASS ; type
	db 75 ; catch rate
	db 128 ; base exp

	INCBIN "gfx/pokemon/front/parasect.pic", 0, 1 ; sprite dimensions
	dw ParasectPicFront, ParasectPicBack

	db SCRATCH, STUN_SPORE, LEECH_LIFE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 8, 9, 10, 15, 20, 21, 22, 28, 31, 32, 33, 34, 40, 44, 50, 51
	; end

	db 0 ; padding
