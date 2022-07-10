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
	ld hl, DexCompletionText
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

DexCompletionText:
	text_far _DexCompletionText
	text_end

DexRatingsTable:
	dbw 10, DexRatingText_Own0To9
	dbw 20, DexRatingText_Own10To19
	dbw 30, DexRatingText_Own20To29
	dbw 40, DexRatingText_Own30To39
	dbw 50, DexRatingText_Own40To49
	dbw 60, DexRatingText_Own50To59
	dbw 70, DexRatingText_Own60To69
	dbw 80, DexRatingText_Own70To79
	dbw 90, DexRatingText_Own80To89
	dbw 100, DexRatingText_Own90To99
	dbw 110, DexRatingText_Own100To109
	dbw 120, DexRatingText_Own110To119
	dbw 130, DexRatingText_Own120To129
	dbw 140, DexRatingText_Own130To139
	dbw 150, DexRatingText_Own140To149
	dbw NUM_POKEMON + 1, DexRatingText_Own150To151

DexRatingText_Own0To9:
	text_far _DexRatingText_Own0To9
	text_end

DexRatingText_Own10To19:
	text_far _DexRatingText_Own10To19
	text_end

DexRatingText_Own20To29:
	text_far _DexRatingText_Own20To29
	text_end

DexRatingText_Own30To39:
	text_far _DexRatingText_Own30To39
	text_end

DexRatingText_Own40To49:
	text_far _DexRatingText_Own40To49
	text_end

DexRatingText_Own50To59:
	text_far _DexRatingText_Own50To59
	text_end

DexRatingText_Own60To69:
	text_far _DexRatingText_Own60To69
	text_end

DexRatingText_Own70To79:
	text_far _DexRatingText_Own70To79
	text_end

DexRatingText_Own80To89:
	text_far _DexRatingText_Own80To89
	text_end

DexRatingText_Own90To99:
	text_far _DexRatingText_Own90To99
	text_end

DexRatingText_Own100To109:
	text_far _DexRatingText_Own100To109
	text_end

DexRatingText_Own110To119:
	text_far _DexRatingText_Own110To119
	text_end

DexRatingText_Own120To129:
	text_far _DexRatingText_Own120To129
	text_end

DexRatingText_Own130To139:
	text_far _DexRatingText_Own130To139
	text_end

DexRatingText_Own140To149:
	text_far _DexRatingText_Own140To149
	text_end

DexRatingText_Own150To151:
	text_far _DexRatingText_Own150To151
	text_end
