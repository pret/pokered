
; PureRGBnote: CHANGED: Lonemoves was modified to specify which move index will be replaced.
; unique moves for gym leaders
; this is not automatic! you have to write the index you want to [wLoneAttackNo]
; first. e.g., erika's script writes 4 to [wLoneAttackNo] to get mega drain,
; the fourth entry in the list.
LoneMoves:
	; pokemon index, move index, move to give nth pokemon
	db 1, 3, BIDE
	db 1, 3, BUBBLEBEAM
	db 2, 3, THUNDERBOLT
	db 2, 1, RAZOR_LEAF
	db 3, 0, TOXIC
	db 4, 2, PSYCHIC_M
	db 4, 1, FIRE_BLAST
	db 5, 3, EARTHQUAKE

; unique moves for elite 4
; all trainers in this class are given this move automatically on their 6th pokemon's 2nd move slot
; (unrelated to LoneMoves)
TeamMoves:
	; trainer, move
	db AGATHA,  THUNDERBOLT
	db -1 ; end
