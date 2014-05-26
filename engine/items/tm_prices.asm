GetMachinePrice: ; 7bf86 (1e:7f86)
	ld a, [wcf91]
	sub TM_01
	ret c
	ld d, a
	ld hl, TechnicalMachinePrices ; $7fa7
	srl a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	srl d
	jr nc, .asm_7bf9d
	swap a
.asm_7bf9d
	and $f0
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	xor a
	ld [H_DOWNARROWBLINKCNT1], a ; $ff8b
	ld [$ff8d], a
	ret

INCLUDE "data/tm_prices.asm"
