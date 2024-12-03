	db DEX_CORUPCAKE ; pokedex id

	db  97, 105,  87,  95,  81
	;   hp  atk  def  spd  spc

	db FIRE, POISON ; type
	db 45 ; catch rate
	db 219 ; base exp

	INCBIN "gfx/pokemon/front/corupcake.pic", 0, 1 ; sprite dimensions
	dw CorupcakePicFront, CorupcakePicBack

	db EMBER, POISON_GAS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    DOUBLE_EDGE,  HYPER_BEAM,   RAGE,         \
	     MEGA_DRAIN,   THUNDERBOLT,  DRAGON_RAGE,  THUNDER,      MIMIC,        \
	     REFLECT,      BIDE,         METRONOME,    SELFDESTRUCT, FIRE_BLAST,   \
	     SWIFT,        REST,         DREAM_EATER,  EXPLOSION,    TRI_ATTACK,   \
	     SUBSTITUTE
	; end

	db 0 ; padding
