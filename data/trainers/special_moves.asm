; Special move sets instead of LoneMoves/TeamMoves, similar to Yellow
; New compact entry format:
; db trainerclass, trainerid
; 1 or more of
;  { db partymon number, move id 1, move id 2, move id 3, move id 4 }
; read_trainer_party WILL DIE if you list a trainer with no special mon here

SpecialTrainerMoves:
	db BROCK, 1
	db 2, TACKLE, SCREECH, BIDE, NO_MOVE
	db 0

	db LASS, 3
	db 1, SING, WATER_GUN, MEGA_PUNCH, NO_MOVE
	db 0

	db LASS, 6
	db 1, MEGA_PUNCH, GROWL, NO_MOVE, NO_MOVE
	db 0

	db ROCKET, 4
	db 1, BODY_SLAM, BUBBLEBEAM, THUNDERBOLT, DIG
	db 0

	db JR_TRAINER_F
	db 1, PECK, WATER_GUN, NO_MOVE, NO_MOVE
	db 0

	db MISTY, 1
	db 1, TACKLE, WATER_GUN, THUNDER_WAVE, NO_MOVE
	db 2, BUBBLEBEAM, PSYCHIC_M, REFLECT, REST
	db 0

	db RIVAL1, 7
	db 2, THUNDER_WAVE, SEISMIC_TOSS, NO_MOVE, NO_MOVE
	db 3, TACKLE, WATER_GUN, NO_MOVE, NO_MOVE
	db 4, BUBBLEBEAM, MEGA_PUNCH, NO_MOVE, NO_MOVE

	db RIVAL1, 8
	db 2, THUNDER_WAVE, SEISMIC_TOSS, NO_MOVE, NO_MOVE
	db 3, TACKLE, BUBBLEBEAM, NO_MOVE, NO_MOVE

	db RIVAL1, 9
	db 2, THUNDER_WAVE, SEISMIC_TOSS, NO_MOVE, NO_MOVE
	db 3, TACKLE, BUBBLEBEAM, NO_MOVE, NO_MOVE
	db 4, SCRATCH, MEGA_PUNCH, NO_MOVE, NO_MOVE
	db -1 ; end
