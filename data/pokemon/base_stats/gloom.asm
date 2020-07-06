	db DEX_GLOOM ; pokedex id

	db  60,  65,  70,  40,  85
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 120 ; catch rate
	db 132 ; base exp

	INCBIN "gfx/pokemon/front/gloom.pic", 0, 1 ; sprite dimensions
	dw GloomPicFront, GloomPicBack

	db ABSORB, POISONPOWDER, STUN_SPORE, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 9, 10, 20, 21, 22, 31, 32, 33, 34, 44, 50, 51
	; end

	db 0 ; padding
