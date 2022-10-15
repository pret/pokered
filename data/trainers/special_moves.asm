; Yellow entry format:
;	db trainerclass, trainerid
;	repeat { db partymon location, partymon move, move id }
;	db 0

SpecialTrainerMoves:
	; db BUG_CATCHER, 15
	; db 2, 2, TACKLE
	; db 2, 3, STRING_SHOT
	; db 0

; commenting the Bug Catcher and Youngster out as they don't exist in R/B

	; db YOUNGSTER, 14
	; db 1, 4, FISSURE
	; db 0


; NOTE: update this to match their new teams

	db BROCK, 1
	db 5, 3, BIND
	db 5, 4, BIDE
	db 0

	db MISTY, 1
	db 5, 4, BUBBLEBEAM
	db 0

	db LT_SURGE, 1
	db 5, 1, THUNDERBOLT
	db 5, 2, MEGA_PUNCH
	db 5, 3, MEGA_KICK
	db 5, 4, GROWL
	db 0

	db ERIKA, 1
	db 4, 3, MEGA_DRAIN
	db 1, 1, RAZOR_LEAF
	db 2, 1, PETAL_DANCE
	db 0

	db KOGA, 1
	db 1, 1, TOXIC
	db 2, 1, TOXIC
	db 3, 1, TOXIC
	db 3, 2, DOUBLE_EDGE
	db 1, 1, LEECH_LIFE
	db 1, 2, DOUBLE_TEAM
	db 1, 3, PSYCHIC_M
	db 1, 4, TOXIC
	db 0

	db BLAINE, 1
	db 2, 2, FLAMETHROWER
	db 2, 4, CONFUSE_RAY
	db 3, 2, FLAMETHROWER
	db 5, 2, FIRE_BLAST
	db 3, 1, REFLECT
	db 0

	db SABRINA, 1
	db 2, 4, PSYWAVE
	db 3, 1, PSYWAVE
	db 0

	db GIOVANNI, 3
	db 2, 3, FISSURE
	db 2, 2, DOUBLE_TEAM
	db 3, 1, EARTHQUAKE
	db 3, 3, THUNDER
	db 4, 1, SLASH
	db 4, 2, THUNDER 
	db 5, 1, EARTHQUAKE
	db 5, 2, LEER
	db 5, 3, THUNDER
	db 6, 1, ROCK_SLIDE
	db 6, 4, EARTHQUAKE
	db 0

	db LORELEI, 1
	db 1, 2, SURF 
	db 2, 1, ICE_BEAM
	db 2, 3, EXPLOSION 
	db 2, 4, SURF
	db 3, 1, BLIZZARD 
	db 4, 1, BLIZZARD 
	db 4, 2, PSYCHIC_M
	db 4, 3, LOVELY_KISS 
	db 5, 2, SUBMISSION
	db 6, 1, THUNDERBOLT
	db 6, 3, BLIZZARD
	db 0

	db BRUNO, 1
	db 1, 1, LOW_KICK
	db 1, 2, ROCK_SLIDE
	db 2, 1, ROCK_SLIDE
	db 2, 3, EARTHQUAKE
	db 3, 1, AMNESIA
	db 3, 3, SURF
	db 3, 4, ICE_BEAM
	db 4, 1, JUMP_KICK
	db 5, 1, BIND
	db 5, 2, EARTHQUAKE
	db 5, 3, SWORDS_DANCE
	db 6, 2, KARATE_CHOP
	db 6, 1, EARTHQUAKE
	db 6, 4, ROCK_SLIDE
	db 0

	db AGATHA, 1
	db 1, 2, HYDRO_PUMP
	db 1, 3, NIGHT_SLASH
	db 1, 1, SUBMISSION
	db 3, 1, WRAP 
	db 3, 4, SLEEP_POWDER
	db 4, 1, TOXIC 
	db 4, 3, DOUBLE_TEAM
	db 5, 1, EARTHQUAKE
	db 5, 3, SWORDS_DANCE
	db 0

	db LANCE, 1
	db 1, 2, EARTHQUAKE
	db 2, 3, BLIZZARD
	db 4, 1, THUNDERBOLT 
	db 5, 1, EARTHQUAKE
	db 6, 1, BLIZZARD
	db 0

	db RIVAL3, 1
	db 3, 1, EARTHQUAKE
	db 3, 2, ROCK_SLIDE
	db 4, 1, FIRE_BLAST
	db 5, 1, SLEEP_POWDER
	db 5, 2, EXPLOSION 
	db 5, 3, PSYCHIC_M
	db 6, 1, BLIZZARD 
	db 0

	db RIVAL3, 2
	db 3, 1, EARTHQUAKE
	db 3, 2, ROCK_SLIDE
	db 4, 1, THUNDERBOLT
	db 4, 2, BLIZZARD 
	db 5, 1, FIRE_BLAST
	db 6, 4, HYPER_BEAM
	db 0

	db RIVAL3, 3
	db 3, 1, EARTHQUAKE
	db 3, 2, ROCK_SLIDE
	db 4, 1, SLEEP_POWDER
	db 4, 2, EXPLOSION 
	db 4, 3, PSYCHIC_M
	db 5, 1, THUNDERBOLT
	db 5, 2, BLIZZARD 
	db 6, 1, EARTHQUAKE
	db 0

	db -1 ; end
