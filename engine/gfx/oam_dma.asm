WriteDMACodeToHRAM::
; Since no other memory is available during OAM DMA,
; DMARoutine is copied to HRAM and executed there.
	lb bc, DMARoutine.End - DMARoutine, LOW(hDMARoutine)
	ld hl, DMARoutine
.copy
	ld a, [hli]
	ldh [c], a
	inc c
	dec b
	jr nz, .copy
	ret

DMARoutine:
LOAD "OAM DMA", HRAM
hDMARoutine::
	; initiate DMA
	ld a, HIGH(wShadowOAM)
	ldh [rDMA], a
	; wait for DMA to finish
	ld a, $28
.wait
	dec a
	jr nz, .wait
	ret
ENDL
.End:
