HallOfFamePC:
	callba AnimateHallOfFame
	call ClearScreen
	ld c, 100
	call DelayFrames
	call DisableLCD
	ld hl, vFont
	ld bc, $800 / 2
	call ZeroMemory
	ld hl, vChars2 + $600
	ld bc, $200 / 2
	call ZeroMemory
	ld hl, vChars2 + $7e0
	ld bc, $10
	ld a, $ff
	call FillMemory
	coord hl, 0, 0
	call FillFourRowsWithBlack
	coord hl, 0, 14
	call FillFourRowsWithBlack
	ld a, %11000000
	ld [rBGP], a
	call EnableLCD
	ld a, $ff
	call PlaySoundWaitForCurrent
	ld c, BANK(Music_Credits)
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
	ld [rBGP], a
	ld c, 5
	call DelayFrames
	dec b
	jr nz, .loop
	ret

DisplayCreditsMon:
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
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
	coord hl, 8, 6
	call GetMonHeader
	call LoadFrontSpriteByMonIndex
	ld hl, vBGMap0 + $c
	call CreditsCopyTileMapToVRAM
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	call LoadScreenTilesFromBuffer1
	ld hl, vBGMap0
	call CreditsCopyTileMapToVRAM
	ld a, $A7
	ld [rWX], a
	ld hl, vBGMap1
	call CreditsCopyTileMapToVRAM
	call FillMiddleOfScreenWithWhite
	ld a, %11111100 ; make the mon a black silhouette
	ld [rBGP], a

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
	ld a, [rWX]
	sub 8
	ld [rWX], a
	dec c
	jr nz, .scrollLoop2

	xor a
	ld [hWY], a
	ld a, %11000000
	ld [rBGP], a
	ret

INCLUDE "data/credit_mons.asm"

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
	ld a, [rLY]
	cp l
	jr nz, ScrollCreditsMonLeft_SetSCX
	ld a, h
	ld [rSCX], a
.loop
	ld a, [rLY]
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
	ld [H_AUTOBGTRANSFERDEST], a
	ld a, h
	ld [H_AUTOBGTRANSFERDEST + 1], a
	ld a, 1
	ld [H_AUTOBGTRANSFERENABLED], a
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
	coord hl, 0, 4
	ld bc, SCREEN_WIDTH * 10
	ld a, " "
	jp FillMemory

Credits:
	ld de, CreditsOrder
	push de
.nextCreditsScreen
	pop de
	coord hl, 9, 6
	push hl
	call FillMiddleOfScreenWithWhite
	pop hl
.nextCreditsCommand
	ld a, [de]
	inc de
	push de
	cp $ff
	jr z, .fadeInTextAndShowMon
	cp $fe
	jr z, .showTextAndShowMon
	cp $fd
	jr z, .fadeInText
	cp $fc
	jr z, .showText
	cp $fb
	jr z, .showCopyrightText
	cp $fa
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
	ld b, $ff
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
	callba LoadCopyrightTiles
	pop de
	pop de
	jr .nextCreditsCommand
.showTheEnd
	ld c, 16
	call DelayFrames
	call FillMiddleOfScreenWithWhite
	pop de
	ld de, TheEndGfx
	ld hl, vChars2 + $600
	lb bc, BANK(TheEndGfx), (TheEndGfxEnd - TheEndGfx) / $10
	call CopyVideoData
	coord hl, 4, 8
	ld de, TheEndTextString
	call PlaceString
	coord hl, 4, 9
	inc de
	call PlaceString
	jp FadeInCreditsText

TheEndTextString:
; "T H E  E N D"
	db $60," ",$62," ",$64,"  ",$64," ",$66," ",$68,"@"
	db $61," ",$63," ",$65,"  ",$65," ",$67," ",$69,"@"

INCLUDE "data/credits_order.asm"

INCLUDE "text/credits_text.asm"

TheEndGfx:
	INCBIN "gfx/theend.2bpp"
TheEndGfxEnd:
