WriteDMACodeToHRAM:
; Since no other memory is available during OAM DMA,
; DMARoutine is copied to HRAM and executed there.
	ld c, $ff80 % $100
	ld b, DMARoutineEnd - DMARoutine
	ld hl, DMARoutine
.copy
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .copy
	ret

DMARoutine:
	; initiate DMA
	ld a, wOAMBuffer / $100
	ld [rDMA], a

	; wait for DMA to finish
	ld a, $28
.wait
	dec a
	jr nz, .wait
	ret
DMARoutineEnd:
