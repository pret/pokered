OaksAideScript:
	ld hl, wOaksAideRequirement
	ld a, [hli]
	ld d, a
	ld a , [hl]
	ld [wOaksAideRequirement], a
	ld [hl], d
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
	ld [wOaksAideNumMonsOwned + 1], a
	ld a, [wNumSetBits + 1]
	ld [wOaksAideNumMonsOwned], a
	ld a, [wOaksAideNumMonsOwned]
	ld b, a
	ld a, [wOaksAideRequirement]
	cp b
	jr c, .giveItem
	jr nz, .notEnoughOwnedMons
	ld a, [wOaksAideNumMonsOwned + 1]
	ld b, a
	ld a, [wOaksAideRequirement + 1]
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

OaksAideHiText:
	TX_FAR _OaksAideHiText
	db "@"

OaksAideUhOhText:
	TX_FAR _OaksAideUhOhText
	db "@"

OaksAideComeBackText:
	TX_FAR _OaksAideComeBackText
	db "@"

OaksAideHereYouGoText:
	TX_FAR _OaksAideHereYouGoText
	db "@"

OaksAideGotItemText:
	TX_FAR _OaksAideGotItemText
	TX_SFX_ITEM_1
	db "@"

OaksAideNoRoomText:
	TX_FAR _OaksAideNoRoomText
	db "@"
