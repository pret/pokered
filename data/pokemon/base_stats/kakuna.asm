	db DEX_KAKUNA ; pokedex id

	db  45,  25,  50,  35,  25
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db 120 ; catch rate
	db 71 ; base exp

	INCBIN "gfx/pokemon/front/kakuna.pic", 0, 1 ; sprite dimensions
	dw KakunaPicFront, KakunaPicBackSW

	db HARDEN, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	PIN_MISSILE,\
	TOXIC,\
	DOUBLE_EDGE,\
	BARRIER,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end

	dw BANK(KakunaPicFront), BANK(KakunaPicBack)

	dw 0000, KakunaPicBack
