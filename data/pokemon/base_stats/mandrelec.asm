	db DEX_MANDRELEC ; pokedex id

	db 110, 130,  90,  35,  50
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 75 ; catch rate 
	db 150 ; base exp 

	INCBIN "gfx/pokemon/front/mandrelec.pic", 0, 1 ; sprite dimensions
	dw MandrelecPicFront, MandrelecPicBack

	db THUNDERSHOCK, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, THUNDERBOLT,  \
	     THUNDER,      EARTHQUAKE,   DIG,          MIMIC,        DOUBLE_TEAM,  \
	     BIDE,         SKULL_BASH,   REST,         THUNDER_WAVE, ROCK_SLIDE,   \
	     SUBSTITUTE,   FLASH
	; end

	db 0 ; padding
