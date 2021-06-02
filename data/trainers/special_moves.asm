; Special move sets instead of LoneMoves/TeamMoves, similar to Yellow
; New compact entry format:
; db trainerclass, trainerid
; 1 or more of
;  { db partymon number, move id 1, move id 2, move id 3, move id 4 }
; read_trainer_party WILL DIE if you list a trainer with no special mon here

SpecialTrainerMoves:
	db GIOVANNI, 3
	db 1, POUND, TOXIC, CONFUSE_RAY, NO_MOVE
	db 0

	db -1 ; end
