; Yellow entry format:
;	db trainerclass, trainerid
;	repeat { db partymon location, partymon move, move id }
;	db 0

SpecialTrainerMoves:
	db BUG_CATCHER, 15
	db 0

	db YOUNGSTER, 14
	db 0

	db BROCK, 1
	db 2, 3, BIDE
	db 0

	db MISTY, 1
	db 2, 3, BUBBLEBEAM
	db 0

	db LT_SURGE, 1
	db 3, 3, THUNDERBOLT
	db 0

	db ERIKA, 1
	db 3, 3, MEGA_DRAIN
	db 0

	db KOGA, 1
	db 4, 3, TOXIC
	db 0

	db BLAINE, 1
	db 4, 3, FIRE_BLAST
	db 0

	db SABRINA, 1
	db 4, 3, PSYWAVE
	db 0

	db GIOVANNI, 3
	db 5, 3, EARTHQUAKE
	db 0

	db LORELEI, 1
	db 1, 1, BUBBLEBEAM
	db 2, 3, ICE_BEAM
	db 3, 1, PSYCHIC_M
	db 3, 2, SURF
	db 4, 3, LOVELY_KISS
	db 5, 3, BLIZZARD
	db 0

	db BRUNO, 1
	db 1, 1, ROCK_SLIDE
	db 1, 2, SCREECH
	db 1, 4, DIG
	db 2, 3, FIRE_PUNCH
	db 2, 4, DOUBLE_TEAM
	db 3, 1, DOUBLE_KICK
	db 3, 2, MEGA_KICK
	db 3, 4, DOUBLE_TEAM
	db 4, 1, ROCK_SLIDE
	db 4, 2, SCREECH
	db 4, 4, EARTHQUAKE
	db 5, 2, KARATE_CHOP
	db 5, 3, STRENGTH
	db 0

	db AGATHA, 1
	db 1, 2, SUBSTITUTE
	db 1, 3, LICK
	db 1, 4, MEGA_DRAIN
	db 2, 2, TOXIC
	db 2, 4, LEECH_LIFE
	db 3, 2, LICK
	db 4, 1, WRAP
	db 5, 2, PSYCHIC_M
	db 0

	db LANCE, 1
	db 1, 1, DRAGON_RAGE
	db 2, 1, THUNDER_WAVE
	db 2, 3, THUNDERBOLT
	db 3, 1, BUBBLEBEAM
	db 3, 2, WRAP
	db 3, 3, ICE_BEAM
	db 4, 1, WING_ATTACK
	db 4, 2, SWIFT
	db 4, 3, FLY
	db 5, 1, BLIZZARD
	db 5, 2, FIRE_BLAST
	db 5, 3, THUNDER
	db 0

	db RIVAL3, 1
	db 1, 3, SKY_ATTACK
	db 6, 3, BLIZZARD
	db 0

	db RIVAL3, 2
	db 1, 3, SKY_ATTACK
	db 6, 3, MEGA_DRAIN
	db 0

	db RIVAL3, 3
	db 1, 3, SKY_ATTACK
	db 6, 3, FIRE_BLAST
	db 0

	db -1 ; end