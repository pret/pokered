	db DEX_HITMONLEE ; pokedex id

	db  50, 120,  53,  87,  35
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 139 ; base exp

	INCBIN "gfx/pokemon/front/hitmonlee.pic", 0, 1 ; sprite dimensions
	dw HitmonleePicFront, HitmonleePicBackSW

	db DOUBLE_KICK, MEDITATE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm \
	ICE_PUNCH,\
	FIRE_PUNCH,\
	TOXIC,\
	BODY_SLAM,\
	SLASH,\
	DOUBLE_EDGE,\
	HYPER_BEAM,\
	HI_JUMP_KICK,\
	THUNDERPUNCH,\
	ROLLING_KICK,\
	BARRIER,\
	EARTHQUAKE,\
	SWORDS_DANCE,\
	BIDE,\
	AGILITY,\
	BARRAGE,\
	SLAM,\
	KARATE_CHOP,\
	MEDITATE,\
	ROCK_SLIDE,\
	GLARE,\
	SUBSTITUTE,\
	CUT,\
	STRENGTH
	; end


	dw BANK(HitmonleePicFront), BANK(HitmonleePicBack)

	dw 0000, HitmonleePicBack
