	db DEX_VICTREEBEL ; pokedex id

	db  80, 105,  65,  70, 100
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 191 ; base exp

	INCBIN "gfx/pokemon/front/victreebel.pic", 0, 1 ; sprite dimensions
	dw VictreebelPicFront, VictreebelPicBackSW

	db SLEEP_POWDER, STUN_SPORE, ACID, RAZOR_LEAF ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm \
	LEECH_SEED,\
	PIN_MISSILE,\
	TOXIC,\
	SLASH,\
	BODY_SLAM,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	AMNESIA,\
	BARRIER,\
	RAZOR_LEAF,\
	DRAGON_RAGE,\
	SOLARBEAM,\
	MEGA_DRAIN,\
	SWORDS_DANCE,\
	REFLECT,\
	BIDE,\
	BARRAGE,\
	SLAM,\
	LIGHT_SCREEN,\
	SLUDGE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	FLASH
	; end

	dw BANK(VictreebelPicFront), BANK(VictreebelPicBack)

	dw 0000, VictreebelPicBack
