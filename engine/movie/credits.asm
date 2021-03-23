HallOfFamePC:
	farcall AnimateHallOfFame
	call ClearScreen
	ld c, 100
	call DelayFrames
	call DisableLCD
	ld hl, vFont
	ld bc, ($80 tiles) / 2
	call ZeroMemory
	ld hl, vChars2 tile $60
	ld bc, ($20 tiles) / 2
	call ZeroMemory
	ld hl, vChars2 tile $7e
	ld bc, 1 tiles
	ld a, $ff ; solid black
	call FillMemory
	hlcoord 0, 0
	call FillFourRowsWithBlack
	hlcoord 0, 14
	call FillFourRowsWithBlack
	ld a, %11000000
	ldh [rBGP], a
	call EnableLCD
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySoundWaitForCurrent
	ld c, 0 ; BANK(Music_Credits)
	ld a, MUSIC_CREDITS
	call PlayMusic
	ld c, 128
	call DelayFrames
	xor a
	ld [wUnusedCD3D], a ; not read
	ld [wNumCreditsMonsDisplayed], a
	jp Credits

FadeInCreditsText:
	ld hl, HoFGBPalettes
	ld b, 4
.loop
	ld a, [hli]
	ldh [rBGP], a
	ld c, 5
	call DelayFrames
	dec b
	jr nz, .loop
	ret

DisplayCreditsMon:
	xor a
	ldh [hAutoBGTransferEnabled], a
	call SaveScreenTilesToBuffer1
	call FillMiddleOfScreenWithWhite

	; display the next monster from CreditsMons
	ld hl, wNumCreditsMonsDisplayed
	ld c, [hl] ; how many monsters have we displayed so far?
	inc [hl]
	ld b, 0
	ld hl, CreditsMons
	add hl, bc ; go that far in the list of monsters and get the next one
	ld a, [hl]
	ld [wcf91], a
	ld [wd0b5], a
	hlcoord 8, 6
	call GetMonHeader
	call LoadFrontSpriteByMonIndex
	ld hl, vBGMap0 + $c
	call CreditsCopyTileMapToVRAM
	xor a
	ldh [hAutoBGTransferEnabled], a
	call LoadScreenTilesFromBuffer1
	ld hl, vBGMap0
	call CreditsCopyTileMapToVRAM
	ld a, $A7
	ldh [rWX], a
	ld hl, vBGMap1
	call CreditsCopyTileMapToVRAM
	call FillMiddleOfScreenWithWhite
	ld a, %11111100 ; make the mon a black silhouette
	ldh [rBGP], a

; scroll the mon left by one tile 7 times
	ld bc, 7
.scrollLoop1
	call ScrollCreditsMonLeft
	dec c
	jr nz, .scrollLoop1

; scroll the mon left by one tile 20 times
; This time, we have to move the window left too in order to hide the text that
; is wrapping around to the right side of the screen.
	ld c, 20
.scrollLoop2
	call ScrollCreditsMonLeft
	ldh a, [rWX]
	sub 8
	ldh [rWX], a
	dec c
	jr nz, .scrollLoop2

	xor a
	ldh [hWY], a
	ld a, %11000000
	ldh [rBGP], a
	ret

INCLUDE "data/credits/credits_mons.asm"

ScrollCreditsMonLeft:
	ld h, b
	ld l, $20
	call ScrollCreditsMonLeft_SetSCX
	ld h, $0
	ld l, $70
	call ScrollCreditsMonLeft_SetSCX
	ld a, b
	add $8
	ld b, a
	ret

ScrollCreditsMonLeft_SetSCX:
	ldh a, [rLY]
	cp l
	jr nz, ScrollCreditsMonLeft_SetSCX
	ld a, h
	ldh [rSCX], a
.loop
	ldh a, [rLY]
	cp h
	jr z, .loop
	ret

HoFGBPalettes:
	db %11000000
	db %11010000
	db %11100000
	db %11110000

CreditsCopyTileMapToVRAM:
	ld a, l
	ldh [hAutoBGTransferDest], a
	ld a, h
	ldh [hAutoBGTransferDest + 1], a
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	jp Delay3

ZeroMemory:
; zero bc bytes at hl
	ld [hl], 0
	inc hl
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, ZeroMemory
	ret

FillFourRowsWithBlack:
	ld bc, SCREEN_WIDTH * 4
	ld a, $7e
	jp FillMemory

FillMiddleOfScreenWithWhite:
	hlcoord 0, 4
	ld bc, SCREEN_WIDTH * 10
	ld a, " "
	jp FillMemory

Credits:
	ld de, CreditsOrder
	push de
.nextCreditsScreen
	pop de
	hlcoord 9, 6
	push hl
	call FillMiddleOfScreenWithWhite
	pop hl
.nextCreditsCommand
	ld a, [de]
	inc de
	push de
	cp CRED_TEXT_FADE_MON
	jr z, .fadeInTextAndShowMon
	cp CRED_TEXT_MON
	jr z, .showTextAndShowMon
	cp CRED_TEXT_FADE
	jr z, .fadeInText
	cp CRED_TEXT
	jr z, .showText
	cp CRED_COPYRIGHT
	jr z, .showCopyrightText
	cp CRED_THE_END
	jr z, .showTheEnd
	push hl
	push hl
	ld hl, CreditsTextPointers
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	inc de
	ld c, a
	ld b, -1
	pop hl
	add hl, bc
	call PlaceString
	pop hl
	ld bc, SCREEN_WIDTH * 2
	add hl, bc
	pop de
	jr .nextCreditsCommand
.fadeInTextAndShowMon
	call FadeInCreditsText
	ld c, 90
	jr .next1
.showTextAndShowMon
	ld c, 110
.next1
	call DelayFrames
	call DisplayCreditsMon
	jr .nextCreditsScreen
.fadeInText
	call FadeInCreditsText
	ld c, 120
	jr .next2
.showText
	ld c, 140
.next2
	call DelayFrames
	jr .nextCreditsScreen
.showCopyrightText
	push de
	farcall LoadCopyrightTiles
	pop de
	pop de
	jr .nextCreditsCommand
.showTheEnd
	ld c, 16
	call DelayFrames
	call FillMiddleOfScreenWithWhite
	pop de
	ld de, TheEndGfx
	ld hl, vChars2 tile $60
	lb bc, BANK(TheEndGfx), (TheEndGfxEnd - TheEndGfx) / $10
	call CopyVideoData
	hlcoord 4, 8
	ld de, TheEndTextString
	call PlaceString
	hlcoord 4, 9
	inc de
	call PlaceString
	jp FadeInCreditsText

TheEndTextString:
; "T H E  E N D"
	db $60," ",$62," ",$64,"  ",$64," ",$66," ",$68,"@"
	db $61," ",$63," ",$65,"  ",$65," ",$67," ",$69,"@"

INCLUDE "data/credits/credits_order.asm"

INCLUDE "data/credits/credits_text.asm"

TheEndGfx:
	INCBIN "gfx/credits/the_end.2bpp"
TheEndGfxEnd:
