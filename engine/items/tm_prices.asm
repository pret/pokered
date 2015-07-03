GetMachinePrice: ; 7bf86 (1e:7f86)
; Input:  [wcf91] = Item Id of a TM
; Output: Stores the 2-byte TM price in [H_DOWNARROWBLINKCNT1] and [H_DOWNARROWBLINKCNT2]
;         as a BCD
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
	ld [H_DOWNARROWBLINKCNT2], a
	xor a
	ld [H_DOWNARROWBLINKCNT1], a
	ld [$ff8d], a
	ret

INCLUDE "data/tm_prices.asm"
