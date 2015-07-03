DisplayDexRating: ; 44169 (11:4169)
	ld hl, wPokedexSeen
	ld b, wPokedexSeenEnd - wPokedexSeen
	call CountSetBits
	ld a, [wd11e] ; result of CountSetBits (seen count)
	ld [$FFDB], a
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wd11e] ; result of CountSetBits (own count)
	ld [$FFDC], a
	ld hl, DexRatingsTable
.findRating
	ld a, [hli]
	ld b, a
	ld a, [$FFDC] ; number of pokemon owned
	cp b
	jr c, .foundRating
	inc hl
	inc hl
	jr .findRating
.foundRating
	ld a, [hli]
	ld h, [hl]
	ld l, a ; load text pointer into hl
	ld a, [wd747]
	bit 3, a
	res 3, a
	ld [wd747], a
	jr nz, .label3
	push hl
	ld hl, PokedexRatingText_441cc
	call PrintText
	pop hl
	call PrintText
	callba PlayPokedexRatingSfx
	jp WaitForTextScrollButtonPress ; wait for button press
.label3
	ld de, wcc5b
	ld a, [$FFDB]
	ld [de], a
	inc de
	ld a, [$FFDC]
	ld [de], a
	inc de
.label4
	ld a, [hli]
	cp a, $50
	jr z, .label5
	ld [de], a
	inc de
	jr .label4
.label5
	ld [de], a
	ret

PokedexRatingText_441cc: ; 441cc (11:41cc)
	TX_FAR _OaksLabText_441cc
	db "@"

DexRatingsTable: ; 441d1 (11:41d1)
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
	db 152
	dw PokedexRatingText_4424c

PokedexRatingText_44201: ; 44201 (11:4201)
	TX_FAR _OaksLabText_44201
	db "@"

PokedexRatingText_44206: ; 44206 (11:4206)
	TX_FAR _OaksLabText_44206
	db "@"

PokedexRatingText_4420b: ; 4420b (11:420b)
	TX_FAR _OaksLabText_4420b
	db "@"

PokedexRatingText_44210: ; 44210 (11:4210)
	TX_FAR _OaksLabText_44210
	db "@"

PokedexRatingText_44215: ; 44215 (11:4215)
	TX_FAR _OaksLabText_44215
	db "@"

PokedexRatingText_4421a: ; 4421a (11:421a)
	TX_FAR _OaksLabText_4421a
	db "@"

PokedexRatingText_4421f: ; 4421f (11:421f)
	TX_FAR _OaksLabText_4421f
	db "@"

PokedexRatingText_44224: ; 44224 (11:4224)
	TX_FAR _OaksLabText_44224
	db "@"

PokedexRatingText_44229: ; 44229 (11:4229)
	TX_FAR _OaksLabText_44229
	db "@"

PokedexRatingText_4422e: ; 4422e (11:422e)
	TX_FAR _OaksLabText_4422e
	db "@"

PokedexRatingText_44233: ; 44233 (11:4233)
	TX_FAR _OaksLabText_44233
	db "@"

PokedexRatingText_44238: ; 44238 (11:4238)
	TX_FAR _OaksLabText_44238
	db "@"

PokedexRatingText_4423d: ; 4423d (11:423d)
	TX_FAR _OaksLabText_4423d
	db "@"

PokedexRatingText_44242: ; 44242 (11:4242)
	TX_FAR _OaksLabText_44242
	db "@"

PokedexRatingText_44247: ; 44247 (11:4247)
	TX_FAR _OaksLabText_44247
	db "@"

PokedexRatingText_4424c: ; 4424c (11:424c)
	TX_FAR _OaksLabText_4424c
	db "@"
