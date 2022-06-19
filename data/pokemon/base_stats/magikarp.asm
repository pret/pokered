	db DEX_MAGIKARP ; pokedex id

	db  20,  10,  55,  80,  20
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 255 ; catch rate
	db 20 ; base exp

	INCBIN "gfx/pokemon/front/magikarp.pic", 0, 1 ; sprite dimensions
	dw MagikarpPicFront, MagikarpPicBackSW

	db SPLASH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	BUBBLEBEAM,\
	BIDE
	; end


	dw BANK(MagikarpPicFront), BANK(MagikarpPicBack)

	dw 0000, MagikarpPicBack
