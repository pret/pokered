HallOfFamePC: ; 7405c (1d:405c)
	callba AnimateHallOfFame
	call ClearScreen
	ld c, 100
	call DelayFrames
	call DisableLCD
	ld hl, vFont
	ld bc, $800 / 2
	call Func_74171
	ld hl, vChars2 + $600
	ld bc, $200 / 2
	call Func_74171
	ld hl, vChars2 + $7e0
	ld bc, $10
	ld a, $ff
	call FillMemory
	hlCoord 0, 0
	call FillFourRowsWithBlack
	hlCoord 0, 14
	call FillFourRowsWithBlack
	ld a, $c0
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
	ld [wWhichTrade], a
	ld [wTrainerEngageDistance], a
	jp Credits

Func_740ba: ; 740ba (1d:40ba)
	ld hl, HoFGBPalettes
	ld b, $4
.asm_740bf
	ld a, [hli]
	ld [rBGP], a
	ld c, 5
	call DelayFrames
	dec b
	jr nz, .asm_740bf
	ret

DisplayCreditsMon: ; 740cb (1d:40cb)
	xor a
	ld [H_AUTOBGTRANSFERENABLED],a
	call SaveScreenTilesToBuffer1
	call FillMiddleOfScreenWithWhite

	; display the next monster from CreditsMons
	ld hl,wTrainerEngageDistance
	ld c,[hl] ; how many monsters have we displayed so far?
	inc [hl]
	ld b,0
	ld hl,CreditsMons
	add hl,bc ; go that far in the list of monsters and get the next one
	ld a,[hl]
	ld [wcf91],a
	ld [wd0b5],a
	hlCoord 8, 6
	call GetMonHeader
	call LoadFrontSpriteByMonIndex
	ld hl,vBGMap0 + $c
	call Func_74164
	xor a
	ld [H_AUTOBGTRANSFERENABLED],a
	call LoadScreenTilesFromBuffer1
	ld hl,vBGMap0
	call Func_74164
	ld a,$A7
	ld [$FF4B],a
	ld hl,vBGMap1
	call Func_74164
	call FillMiddleOfScreenWithWhite
	ld a,$FC
	ld [rBGP],a
	ld bc,7
.next
	call Func_74140
	dec c
	jr nz,.next
	ld c,$14
.next2
	call Func_74140
	ld a,[$FF4B]
	sub 8
	ld [$FF4B],a
	dec c
	jr nz,.next2
	xor a
	ld [hWY],a
	ld a,$C0
	ld [rBGP],a
	ret

INCLUDE "data/credit_mons.asm"

Func_74140: ; 74140 (1d:4140)
	ld h, b
	ld l, $20
	call Func_74152
	ld h, $0
	ld l, $70
	call Func_74152
	ld a, b
	add $8
	ld b, a
	ret

Func_74152: ; 74152 (1d:4152)
	ld a, [$ff44]
	cp l
	jr nz, Func_74152
	ld a, h
	ld [rSCX], a
.asm_7415a
	ld a, [$ff44]
	cp h
	jr z, .asm_7415a
	ret

HoFGBPalettes: ; 74160 (1d:4160)
	db %11000000
	db %11010000
	db %11100000
	db %11110000

Func_74164: ; 74164 (1d:4164)
	ld a, l
	ld [H_AUTOBGTRANSFERDEST], a
	ld a, h
	ld [H_AUTOBGTRANSFERDEST + 1], a
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	jp Delay3

Func_74171: ; 74171 (1d:4171)
	ld [hl], $0
	inc hl
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, Func_74171
	ret

FillFourRowsWithBlack: ; 7417b (1d:417b)
	ld bc, SCREEN_WIDTH * 4
	ld a, $7e
	jp FillMemory

FillMiddleOfScreenWithWhite: ; 74183 (1d:4183)
	hlCoord 0, 4
	ld bc, SCREEN_WIDTH * 10
	ld a, $7f ; blank white tile
	jp FillMemory

Credits: ; 7418e (1d:418e)
	ld de, CreditsOrder
	push de
.asm_74192
	pop de
	hlCoord 9, 6
	push hl
	call FillMiddleOfScreenWithWhite
	pop hl
.asm_7419b
	ld a, [de]
	inc de
	push de
	cp $ff
	jr z, .asm_741d5
	cp $fe
	jr z, .asm_741dc
	cp $fd
	jr z, .asm_741e6
	cp $fc
	jr z, .asm_741ed
	cp $fb
	jr z, .asm_741f4
	cp $fa
	jr z, .showTheEnd
	push hl
	push hl
	ld hl, CreditsTextPointers
	add a
	ld c, a
	ld b, $0
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
	ld bc, $28
	add hl, bc
	pop de
	jr .asm_7419b
.asm_741d5
	call Func_740ba
	ld c, 90
	jr .asm_741de
.asm_741dc
	ld c, 110
.asm_741de
	call DelayFrames
	call DisplayCreditsMon
	jr .asm_74192
.asm_741e6
	call Func_740ba
	ld c, 120
	jr .asm_741ef
.asm_741ed
	ld c, 140
.asm_741ef
	call DelayFrames
	jr .asm_74192
.asm_741f4
	push de
	callba LoadCopyrightTiles
	pop de
	pop de
	jr .asm_7419b
.showTheEnd
	ld c, 16
	call DelayFrames
	call FillMiddleOfScreenWithWhite
	pop de
	ld de, TheEndGfx
	ld hl, vChars2 + $600
	ld bc, (BANK(TheEndGfx) << 8) + $0a
	call CopyVideoData
	hlCoord 4, 8
	ld de, TheEndTextString
	call PlaceString
	hlCoord 4, 9
	inc de
	call PlaceString
	jp Func_740ba

TheEndTextString: ; 74229 (1d:4229)
; "T H E  E N D"
	db $60," ",$62," ",$64,"  ",$64," ",$66," ",$68,"@"
	db $61," ",$63," ",$65,"  ",$65," ",$67," ",$69,"@"

INCLUDE "data/credits_order.asm"

INCLUDE "text/credits_text.asm"

TheEndGfx: ; 7473e (1d:473e) (7473f on blue)
	INCBIN "gfx/theend.interleave.2bpp"
