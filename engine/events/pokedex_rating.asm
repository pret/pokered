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
	dbw 10, PokedexRatingText_44201
	dbw 20, PokedexRatingText_44206
	dbw 30, PokedexRatingText_4420b
	dbw 40, PokedexRatingText_44210
	dbw 50, PokedexRatingText_44215
	dbw 60, PokedexRatingText_4421a
	dbw 70, PokedexRatingText_4421f
	dbw 80, PokedexRatingText_44224
	dbw 90, PokedexRatingText_44229
	dbw 100, PokedexRatingText_4422e
	dbw 110, PokedexRatingText_44233
	dbw 120, PokedexRatingText_44238
	dbw 130, PokedexRatingText_4423d
	dbw 140, PokedexRatingText_44242
	dbw 150, PokedexRatingText_44247
	dbw NUM_POKEMON + 1, PokedexRatingText_4424c

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
