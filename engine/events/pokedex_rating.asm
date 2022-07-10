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
	dbw 10, PokedexRatingText01
	dbw 20, PokedexRatingText02
	dbw 30, PokedexRatingText03
	dbw 40, PokedexRatingText04
	dbw 50, PokedexRatingText05
	dbw 60, PokedexRatingText06
	dbw 70, PokedexRatingText07
	dbw 80, PokedexRatingText08
	dbw 90, PokedexRatingText09
	dbw 100, PokedexRatingText10
	dbw 110, PokedexRatingText11
	dbw 120, PokedexRatingText12
	dbw 130, PokedexRatingText13
	dbw 140, PokedexRatingText14
	dbw 150, PokedexRatingText15
	dbw NUM_POKEMON + 1, PokedexRatingText16

PokedexRatingText01:
	text_far _PokedexRatingText01
	text_end

PokedexRatingText02:
	text_far _PokedexRatingText02
	text_end

PokedexRatingText03:
	text_far _PokedexRatingText03
	text_end

PokedexRatingText04:
	text_far _PokedexRatingText04
	text_end

PokedexRatingText05:
	text_far _PokedexRatingText05
	text_end

PokedexRatingText06:
	text_far _PokedexRatingText06
	text_end

PokedexRatingText07:
	text_far _PokedexRatingText07
	text_end

PokedexRatingText08:
	text_far _PokedexRatingText08
	text_end

PokedexRatingText09:
	text_far _PokedexRatingText09
	text_end

PokedexRatingText10:
	text_far _PokedexRatingText10
	text_end

PokedexRatingText11:
	text_far _PokedexRatingText11
	text_end

PokedexRatingText12:
	text_far _PokedexRatingText12
	text_end

PokedexRatingText13:
	text_far _PokedexRatingText13
	text_end

PokedexRatingText14:
	text_far _PokedexRatingText14
	text_end

PokedexRatingText15:
	text_far _PokedexRatingText15
	text_end

PokedexRatingText16:
	text_far _PokedexRatingText16
	text_end
