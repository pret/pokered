; tests if mon [$cf91] can learn move [$d0e0]
TestMonMoveCompatibility: ; 1373e (4:773e)
	ld a, [$cf91]
	ld [$d0b5], a
	call GetMonHeader
	ld hl, W_MONHLEARNSET
	push hl
	ld a, [$d0e0]
	ld b, a
	ld c, $0
	ld hl, TechnicalMachines
.findTMloop
	ld a, [hli]
	cp b
	jr z, .TMfoundLoop
	inc c
	jr .findTMloop
.TMfoundLoop
	pop hl
	ld b, $2  ; read corresponding bit from TM compatibility array
	ld a, $10
	jp Predef ; indirect jump to HandleBitArray (f666 (3:7666))

; converts TM/HM number in $d11e into move number
; HMs start at 51
TMToMove: ; 13763 (4:7763)
	ld a, [$d11e]
	dec a
	ld hl, TechnicalMachines
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [$d11e], a
	ret

INCLUDE "data/tms.asm"
