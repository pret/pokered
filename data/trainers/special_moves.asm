; unique moves for gym leaders
; this is not automatic! you have to write the index you want to [wLoneAttackNo]
; first. e.g., erika's script writes 4 to [wLoneAttackNo] to get mega drain,
; the fourth entry in the list.
LoneMoves:
	; pokemon index, move to give nth pokemon
	db 1, BIDE
	db 1, BUBBLEBEAM
	db 2, THUNDERBOLT
	db 2, MEGA_DRAIN
	db 3, TOXIC
	db 3, PSYWAVE
	db 3, FIRE_BLAST
	db 4, FISSURE

; unique moves for elite 4
; all trainers in this class are given this move automatically
; (unrelated to LoneMoves)
TeamMoves:
	; trainer, move
	db LORELEI, BLIZZARD
	db BRUNO,   FISSURE
	db AGATHA,  TOXIC
	db LANCE,   BARRIER
	db -1 ; end
