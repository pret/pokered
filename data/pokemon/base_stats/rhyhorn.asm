	db DEX_RHYHORN ; pokedex id

	db  80,  85,  95,  25,  30
	;   hp  atk  def  spd  spc

	db GROUND, ROCK ; type
	db 120 ; catch rate
	db 135 ; base exp

	INCBIN "gfx/pokemon/front/rhyhorn.pic", 0, 1 ; sprite dimensions
	dw RhyhornPicFront, RhyhornPicBack

	db HORN_ATTACK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 6, 7, 8, 9, 10, 20, 24, 25, 26, 27, 28, 31, 32, 34, 38, 40, 44, 48, 50, 54
	; end

	db 0 ; padding
