; Yellow entry format:
;	db trainerclass, trainerid
;	repeat { db partymon location, partymon move, move id }
;	db 0

SpecialTrainerMoves:
	db BROCK, 1
	db 2, 4, ROCK_THROW
	db 0
	
	db MISTY, 1
	db 2, 2, LIGHT_SCREEN
	db 2, 4, PSYBEAM
	db 0
