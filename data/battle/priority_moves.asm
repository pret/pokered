; PureRGBnote: CHANGED: Priority moves are now stored in a list instead of hardcoded Quick Attack only.

PriorityMoves:
	db QUICK_ATTACK
	db COMET_PUNCH
	db WING_ATTACK
	db FLASH
	db SWIFT
	db TRANSFORM
	db MIRROR_MOVE
	db -1 ; end

FarCheckPriority:
	ld c, d
; returns with c set if move in c is a priority move
CheckPriority:
	push hl
	ld hl, PriorityMoves         ; table of high priority moves
.priorityLoop
	ld a, [hli]                  ; read move from move table
	cp -1                        ; did we reach the end of the list
	jr z, .noPriority            ; if so, not a priority move
	cp c                         ; does it match the move about to be used?
	jr nz, .priorityLoop         ; continue as a normal move if not
	; if so, the move about to be used is a priority move
.foundPriority 
	scf
.noPriority
	pop hl
	ret
