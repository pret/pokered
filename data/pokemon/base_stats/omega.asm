	db DEX_OMEGA ; pokedex id

	db 101, 100, 120,  25,  95
	;   hp  atk  def  spd  spc

	db STEEL, STEEL ; type
	db 25 ; catch rate
	db 204 ; base exp

	INCBIN "gfx/pokemon/front/omega.pic", 0, 1 ; sprite dimensions
	dw OmegaPicFront, OmegaPicBack

	db SUPERSONIC, METAL_SOUND, TACKLE, MAGNET_BOMB ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   SUBMISSION,   \
	     COUNTER,      SEISMIC_TOSS, RAGE,         THUNDERBOLT,  THUNDER,      \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      BIDE,         SELFDESTRUCT, \
	     FIRE_BLAST,   SWIFT,        REST,         THUNDER_WAVE, EXPLOSION,    \
           TRI_ATTACK,   SUBSTITUTE,   STRENGTH,     FLASH
	; end

	db BANK(OmegaPicFront)
	assert BANK(OmegaPicFront) == BANK(OmegaPicBack)
