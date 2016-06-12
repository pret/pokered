GetMachinePrice:
; Input:  [wcf91] = Item Id of a TM
; Output: Stores the TM price at hItemPrice
	ld a, [wcf91] ; a contains TM item id
	sub TM_01
	ret c
	ld d, a
	ld hl, TechnicalMachinePrices
	srl a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl] ; a contains byte whose high or low nybble is the TM price (in thousands)
	srl d
	jr nc, .highNybbleIsPrice ; is TM id odd?
	swap a
.highNybbleIsPrice
	and $f0
	ld [hItemPrice + 1], a
	xor a
	ld [hItemPrice], a
	ld [hItemPrice + 2], a
	ret

INCLUDE "data/tm_prices.asm"
