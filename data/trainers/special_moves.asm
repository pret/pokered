; Special move sets instead of LoneMoves/TeamMoves, similar to Yellow
; New compact entry format:
; db trainerclass, trainerid
; 1 or more of
;  { db partymon number, move id 1, move id 2, move id 3, move id 4 }
; read_trainer_party WILL DIE if you list a trainer with no special mon here

SpecialTrainerMoves:
	db BROCK, 1
	; onix
	db 2, TACKLE, SCREECH, BIDE, NO_MOVE
	db 0

	db LASS, 3
	; jigglypuff
	db 1, SING, WATER_GUN, MEGA_PUNCH, NO_MOVE
	db 0

	db LASS, 6
	; clefairy
	db 1, MEGA_PUNCH, GROWL, NO_MOVE, NO_MOVE
	db 0

	db ROCKET, 4
	; rattata
	db 1, BODY_SLAM, BUBBLEBEAM, THUNDERBOLT, DIG
	db 0

	db JR_TRAINER_F, 1
	; goldeen
	db 1, PECK, BUBBLEBEAM, NO_MOVE, NO_MOVE
	db 0

	db MISTY, 1
	; staryu
	db 1, BUBBLEBEAM, THUNDER_WAVE, NO_MOVE, NO_MOVE
	; staryu
	db 2, BUBBLEBEAM, PSYCHIC_M, ICE_BEAM, THUNDERBOLT
	db 0

	db RIVAL1, 7
	; abra
	db 2, THUNDER_WAVE, SEISMIC_TOSS, NO_MOVE, NO_MOVE
	; rattata
	db 3, TACKLE, WATER_GUN, NO_MOVE, NO_MOVE
	; squirtle
	db 4, BUBBLEBEAM, MEGA_PUNCH, NO_MOVE, NO_MOVE
	db 0

	db RIVAL1, 8
	; abra
	db 2, THUNDER_WAVE, SEISMIC_TOSS, NO_MOVE, NO_MOVE
	; rattata
	db 3, TACKLE, BUBBLEBEAM, NO_MOVE, NO_MOVE
	db 0

	db RIVAL1, 9
	; abra
	db 2, THUNDER_WAVE, SEISMIC_TOSS, NO_MOVE, NO_MOVE
	; rattata
	db 3, TACKLE, BUBBLEBEAM, NO_MOVE, NO_MOVE
	; charmander
	db 4, SCRATCH, MEGA_PUNCH, NO_MOVE, NO_MOVE
	db 0

	db BUG_CATCHER, 11
	; venonat
	db 1, TOXIC, FLASH, PSYCHIC_M, NO_MOVE
	db 0

	db YOUNGSTER, 8
	db 1, BODY_SLAM, NO_MOVE, NO_MOVE, NO_MOVE
	db 0

	db Rival2, 1 ; squirtle
	; rattata
	db 2, TACKLE, WATER_GUN, NO_MOVE, NO_MOVE
	; abra
	db 3, THUNDER_WAVE, SEISMIC_TOSS, NO_MOVE, NO_MOVE
	; ekans
	db 4, WRAP, NO_MOVE, NO_MOVE, NO_MOVE
	; squirtle
	db 6, BUBBLEBEAM, BODY_SLAM, DIG, NO_MOVE
	db 0

	db Rival2, 2 ; bulbasaur
	; rattata
	db 2, TACKLE, BUBBLEBEAM, NO_MOVE, NO_MOVE
	; abra
	db 3, THUNDER_WAVE, SEISMIC_TOSS, NO_MOVE, NO_MOVE
	; ekans
	db 4, WRAP, NO_MOVE, NO_MOVE, NO_MOVE
	; sandshrew
	db 5, DIG, NO_MOVE, NO_MOVE, NO_MOVE
	; bulbasaur
	db 6, BODY_SLAM, NO_MOVE, NO_MOVE, NO_MOVE
	db 0

	db Rival2, 3 ; charmander
	; rattata
	db 2, TACKLE, BUBBLEBEAM, NO_MOVE, NO_MOVE
	; abra
	db 3, THUNDER_WAVE, SEISMIC_TOSS, NO_MOVE, NO_MOVE
	; ekans
	db 4, WRAP, NO_MOVE, NO_MOVE, NO_MOVE
	; charmander
	db 6, BODY_SLAM, DIG, NO_MOVE, NO_MOVE
	db 0

	db LT_SURGE, 1
	; voltorb
	db 1, THUNDER_WAVE, THUNDERBOLT, FLASH, SWIFT
	; voltorb
	db 2, THUNDER_WAVE, THUNDERBOLT, SCREECH, SELFDESTRUCT
	; voltorb
	db 3, SCREECH, EXPLOSION, NO_MOVE, NO_MOVE
	; pikachu
	db 4, THUNDER_WAVE, THUNDERBOLT, FLY, FLASH
	; pikachu
	db 5, THUNDERBOLT, SURF, BODY_SLAM, DOUBLE_TEAM
	; pikachu
	db 6, THUNDERBOLT, SURF, MEGA_KICK, DOUBLE_TEAM
	db -1 ; end
