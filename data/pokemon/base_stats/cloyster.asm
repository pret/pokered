	db DEX_CLOYSTER ; pokedex id

	db  50,  95, 180,  70,  85
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db 60 ; catch rate
	db 203 ; base exp

	INCBIN "gfx/pokemon/front/cloyster.pic", 0, 1 ; sprite dimensions
	dw CloysterPicFront, CloysterPicBack

	db WITHDRAW, SUPERSONIC, CLAMP, AURORA_BEAM ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 6, 9, 10, 11, 12, 13, 14, 15, 20, 30, 31, 32, 33, 34, 36, 39, 44, 47, 49, 50, 53
	; end

	db 0 ; padding
