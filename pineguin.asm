	db DEX_PINEGUIN ; pokedex id

	db 120,  70,  40,  80,  95
	;   hp  atk  def  spd  spc

	db GRASS, ICE ; type
	db 45 ; catch rate 
	db 204 ; base exp 

	INCBIN "gfx/pokemon/front/pineguin.pic", 0, 1 ; sprite dimensions
	dw PineguinPicFront, PineguinPicBack

	db ABSORB, PECK, LEECH_SEED, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   WHIRLWIND,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   MEGA_DRAIN,   SOLAR_BEAM,   MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      SUBSTITUTE
	; end

	db 0 ; padding
