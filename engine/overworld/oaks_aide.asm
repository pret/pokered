OaksAideScript: ; 0x59035
	ld hl, OaksAideHiText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .choseNo
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	ld [hOaksAideNumMonsOwned], a
	ld b, a
	ld a, [hOaksAideRequirement]
	cp b
	jr z, .giveItem
	jr nc, .notEnoughOwnedMons
.giveItem
	ld hl, OaksAideHereYouGoText
	call PrintText
	ld a, [hOaksAideRewardItem]
	ld b, a
	ld c, 1
	call GiveItem
	jr nc, .bagFull
	ld hl, OaksAideGotItemText
	call PrintText
	ld a, $1
	jr .done
.bagFull
	ld hl, OaksAideNoRoomText
	call PrintText
	xor a
	jr .done
.notEnoughOwnedMons
	ld hl, OaksAideUhOhText
	call PrintText
	ld a, $80
	jr .done
.choseNo
	ld hl, OaksAideComeBackText
	call PrintText
	ld a, $ff
.done
	ld [hOaksAideResult], a
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
