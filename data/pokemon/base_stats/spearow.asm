	db DEX_SPEAROW ; pokedex id

	db  40,  60,  30,  70,  31
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 255 ; catch rate
	db 58 ; base exp

	INCBIN "gfx/pokemon/front/spearow.pic", 0, 1 ; sprite dimensions
	dw SpearowPicFront, SpearowPicBack

	db PECK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 2, 4, 6, 9, 10, 20, 31, 32, 34, 39, 43, 44, 50, 52
	; end

	db 0 ; padding
