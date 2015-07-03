OaksAideScript: ; 0x59035
	ld hl, OaksAideHiText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_59086
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wd11e]
	ld [$ffdd], a
	ld b, a
	ld a, [$ffdb]
	cp b
	jr z, .asm_59059
	jr nc, .asm_5907c
.asm_59059
	ld hl, OaksAideHereYouGoText
	call PrintText
	ld a, [$ffdc]
	ld b, a
	ld c, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, OaksAideGotItemText
	call PrintText
	ld a, $1
	jr .asm_5908e
.BagFull
	ld hl, OaksAideNoRoomText
	call PrintText
	xor a
	jr .asm_5908e
.asm_5907c
	ld hl, OaksAideUhOhText
	call PrintText
	ld a, $80
	jr .asm_5908e
.asm_59086
	ld hl, OaksAideComeBackText
	call PrintText
	ld a, $ff
.asm_5908e
	ld [$ffdb], a
	ret

OaksAideHiText: ; 59091 (16:5091)
	TX_FAR _OaksAideHiText
	db "@"

OaksAideUhOhText: ; 59096 (16:5096)
	TX_FAR _OaksAideUhOhText
	db "@"

OaksAideComeBackText: ; 5909b (16:509b)
	TX_FAR _OaksAideComeBackText
	db "@"

OaksAideHereYouGoText: ; 590a0 (16:50a0)
	TX_FAR _OaksAideHereYouGoText
	db "@"

OaksAideGotItemText: ; 590a5 (16:50a5)
	TX_FAR _OaksAideGotItemText
	db $0b
	db "@"

OaksAideNoRoomText: ; 590ab (16:50ab)
	TX_FAR _OaksAideNoRoomText
	db "@"
