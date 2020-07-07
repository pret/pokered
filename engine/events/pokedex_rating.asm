DisplayDexRating:
	ld hl, wPokedexSeen
	ld b, wPokedexSeenEnd - wPokedexSeen
	call CountSetBits
	ld a, [wNumSetBits]
	ldh [hDexRatingNumMonsSeen], a
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	ldh [hDexRatingNumMonsOwned], a
	ld hl, DexRatingsTable
.findRating
	ld a, [hli]
	ld b, a
	ldh a, [hDexRatingNumMonsOwned]
	cp b
	jr c, .foundRating
	inc hl
	inc hl
	jr .findRating
.foundRating
	ld a, [hli]
	ld h, [hl]
	ld l, a ; load text pointer into hl
	CheckAndResetEventA EVENT_HALL_OF_FAME_DEX_RATING
	jr nz, .hallOfFame
	push hl
	ld hl, PokedexRatingText_441cc
	call PrintText
	pop hl
	call PrintText
	farcall PlayPokedexRatingSfx
	jp WaitForTextScrollButtonPress
.hallOfFame
	ld de, wDexRatingNumMonsSeen
	ldh a, [hDexRatingNumMonsSeen]
	ld [de], a
	inc de
	ldh a, [hDexRatingNumMonsOwned]
	ld [de], a
	inc de
.copyRatingTextLoop
	ld a, [hli]
	cp "@"
	jr z, .doneCopying
	ld [de], a
	inc de
	jr .copyRatingTextLoop
.doneCopying
	ld [de], a
	ret

PokedexRatingText_441cc:
	text_far _OaksLabText_441cc
	text_end

DexRatingsTable:
	db 10
	dw PokedexRatingText_44201
	db 20
	dw PokedexRatingText_44206
	db 30
	dw PokedexRatingText_4420b
	db 40
	dw PokedexRatingText_44210
	db 50
	dw PokedexRatingText_44215
	db 60
	dw PokedexRatingText_4421a
	db 70
	dw PokedexRatingText_4421f
	db 80
	dw PokedexRatingText_44224
	db 90
	dw PokedexRatingText_44229
	db 100
	dw PokedexRatingText_4422e
	db 110
	dw PokedexRatingText_44233
	db 120
	dw PokedexRatingText_44238
	db 130
	dw PokedexRatingText_4423d
	db 140
	dw PokedexRatingText_44242
	db 150
	dw PokedexRatingText_44247
	db NUM_POKEMON + 1
	dw PokedexRatingText_4424c

PokedexRatingText_44201:
	text_far _OaksLabText_44201
	text_end

PokedexRatingText_44206:
	text_far _OaksLabText_44206
	text_end

PokedexRatingText_4420b:
	text_far _OaksLabText_4420b
	text_end

PokedexRatingText_44210:
	text_far _OaksLabText_44210
	text_end

PokedexRatingText_44215:
	text_far _OaksLabText_44215
	text_end

PokedexRatingText_4421a:
	text_far _OaksLabText_4421a
	text_end

PokedexRatingText_4421f:
	text_far _OaksLabText_4421f
	text_end

PokedexRatingText_44224:
	text_far _OaksLabText_44224
	text_end

PokedexRatingText_44229:
	text_far _OaksLabText_44229
	text_end

PokedexRatingText_4422e:
	text_far _OaksLabText_4422e
	text_end

PokedexRatingText_44233:
	text_far _OaksLabText_44233
	text_end

PokedexRatingText_44238:
	text_far _OaksLabText_44238
	text_end

PokedexRatingText_4423d:
	text_far _OaksLabText_4423d
	text_end

PokedexRatingText_44242:
	text_far _OaksLabText_44242
	text_end

PokedexRatingText_44247:
	text_far _OaksLabText_44247
	text_end

PokedexRatingText_4424c:
	text_far _OaksLabText_4424c
	text_end
