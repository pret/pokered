PriorityMoves:
	db QUICK_ATTACK
	db COMET_PUNCH
	db WING_ATTACK
	db FLASH
	db SWIFT
	db TRANSFORM
	db -1 ; end

; returns with c set if move in c is a priority move

CheckPriority:
	push hl
	ld hl, PriorityMoves         ; table of high priority moves
.priorityLoop
	ld a, [hli]                  ; read move from move table
	cp c                         ; does it match the move about to be used?
	jr z, .foundPriority         ; if so, the move about to be used is a priority move
	inc a                        ; move on to the next move, FF terminates loop
	jr nz, .priorityLoop         ; check the next move in PriorityMoves
	jr .noPriority               ; continue as a normal move
.foundPriority
	scf
.noPriority
	pop hl
	ret