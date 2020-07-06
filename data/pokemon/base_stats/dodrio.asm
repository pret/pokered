	db DEX_DODRIO ; pokedex id

	db  60, 110,  70, 100,  60
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 158 ; base exp

	INCBIN "gfx/pokemon/front/dodrio.pic", 0, 1 ; sprite dimensions
	dw DodrioPicFront, DodrioPicBack

	db PECK, GROWL, FURY_ATTACK, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 4, 6, 8, 9, 10, 15, 20, 31, 32, 33, 34, 40, 43, 44, 49, 50, 52
	; end

	db 0 ; padding
