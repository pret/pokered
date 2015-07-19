PlayIntro: ; 41682 (10:5682)
	xor a
	ld [hJoyHeld], a
	inc a
	ld [H_AUTOBGTRANSFERENABLED], a
	call PlayShootingStar
	call PlayIntroScene
	call GBFadeOutToWhite
	xor a
	ld [hSCX], a
	ld [H_AUTOBGTRANSFERENABLED], a
	call ClearSprites
	call DelayFrame
	ret

PlayIntroScene: ; 4169d (10:569d)
	ld b, $7
	call GoPAL_SET
	ld a, %11100100
	ld [rBGP], a
	ld [rOBP0], a
	ld [rOBP1], a
	xor a
	ld [hSCX], a
	ld b, $3 ; Gengar tiles
	call IntroCopyTiles
	ld a, 0
	ld [W_BASECOORDX], a
	ld a, 80
	ld [W_BASECOORDY], a
	ld bc, $606
	call InitIntroNidorinoOAM
	ld de, $28ff ; move Nidorino right by 80 pixels
	call IntroMoveMon
	ret c

; hip
	ld a, SFX_INTRO_HIP
	call PlaySound
	xor a
	ld [wd09f], a
	ld de, IntroNidorinoAnimation1
	call AnimateIntroNidorino
; hop
	ld a, SFX_INTRO_HOP
	call PlaySound
	ld de, IntroNidorinoAnimation2
	call AnimateIntroNidorino
	ld c, $a
	call CheckForUserInterruption
	ret c

; hip
	ld a, SFX_INTRO_HIP
	call PlaySound
	ld de, IntroNidorinoAnimation1
	call AnimateIntroNidorino
; hop
	ld a, SFX_INTRO_HOP
	call PlaySound
	ld de, IntroNidorinoAnimation2
	call AnimateIntroNidorino
	ld c, $1e
	call CheckForUserInterruption
	ret c

; raise
	ld b, $4
	call IntroCopyTiles
	ld a, SFX_INTRO_RAISE
	call PlaySound
	ld de, $401 ; move Gengar left by 8 pixels
	call IntroMoveMon
	ld c, $1e
	call CheckForUserInterruption
	ret c

; slash
	ld b, $5
	call IntroCopyTiles
	ld a, SFX_INTRO_CRASH
	call PlaySound
	ld de, $800 ; move Gengar right by 16 pixels
	call IntroMoveMon
; hip
	ld a, SFX_INTRO_HIP
	call PlaySound
	ld a, $24
	ld [wd09f], a
	ld de, IntroNidorinoAnimation3
	call AnimateIntroNidorino
	ld c, $1e
	call CheckForUserInterruption
	ret c

	ld de, $401 ; move Gengar left by 8 pixels
	call IntroMoveMon
	ld b, $3
	call IntroCopyTiles
	ld c, $3c
	call CheckForUserInterruption
	ret c

; hip
	ld a, SFX_INTRO_HIP
	call PlaySound
	xor a
	ld [wd09f], a
	ld de, IntroNidorinoAnimation4
	call AnimateIntroNidorino
; hop
	ld a, SFX_INTRO_HOP
	call PlaySound
	ld de, IntroNidorinoAnimation5
	call AnimateIntroNidorino
	ld c, $14
	call CheckForUserInterruption
	ret c

	ld a, $24
	ld [wd09f], a
	ld de, IntroNidorinoAnimation6
	call AnimateIntroNidorino
	ld c, $1e
	call CheckForUserInterruption
	ret c

; lunge
	ld a, SFX_INTRO_LUNGE
	call PlaySound
	ld a, $48
	ld [wd09f], a
	ld de, IntroNidorinoAnimation7
	jp AnimateIntroNidorino

AnimateIntroNidorino: ; 41793 (10:5793)
	ld a, [de]
	cp $50
	ret z
	ld [W_BASECOORDY], a
	inc de
	ld a, [de]
	ld [W_BASECOORDX], a
	push de
	ld c, 6 * 6
	call UpdateIntroNidorinoOAM
	ld c, 5
	call DelayFrames
	pop de
	inc de
	jr AnimateIntroNidorino

UpdateIntroNidorinoOAM: ; 417ae (10:57ae)
	ld hl, wOAMBuffer
	ld a, [wd09f]
	ld d, a
.loop
	ld a, [W_BASECOORDY]
	add [hl]
	ld [hli], a
	ld a, [W_BASECOORDX]
	add [hl]
	ld [hli], a
	ld a, d
	ld [hli], a
	inc hl
	inc d
	dec c
	jr nz, .loop
	ret

InitIntroNidorinoOAM: ; 417c7 (10:57c7)
	ld hl, wOAMBuffer
	ld d, 0
.loop
	push bc
	ld a, [W_BASECOORDY]
	ld e, a
.innerLoop
	ld a, e
	add 8
	ld e, a
	ld [hli], a ; Y
	ld a, [W_BASECOORDX]
	ld [hli], a ; X
	ld a, d
	ld [hli], a ; tile
	ld a, $80
	ld [hli], a ; attributes
	inc d
	dec c
	jr nz, .innerLoop
	ld a, [W_BASECOORDX]
	add 8
	ld [W_BASECOORDX], a
	pop bc
	dec b
	jr nz, .loop
	ret

IntroClearScreen: ; 417f0 (10:57f0)
	ld hl, vBGMap1
	ld bc, $240
	jr IntroClearCommon

IntroClearMiddleOfScreen: ; 417f8 (10:57f8)
; clear the area of the tile map between the black bars on the top and bottom
	coord hl, 0, 4
	ld bc, SCREEN_WIDTH * 10

IntroClearCommon: ; 417fe (10:57fe)
	ld [hl], $0
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, IntroClearCommon
	ret

IntroPlaceBlackTiles: ; 41807 (10:5807)
	ld a, $1
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

IntroMoveMon: ; 4180e (10:580e)
; d = number of times to move the mon (2 pixels each time)
; e: $00 = move Gengar right, $01 = move Gengar left, $ff = move Nidorino right
	ld a, e
	cp $ff
	jr z, .moveNidorinoRight
	cp $1
	jr z, .moveGengarLeft
; move Gengar right
	ld a, [hSCX]
	dec a
	dec a
	jr .next
.moveNidorinoRight
	push de
	ld a, 2
	ld [W_BASECOORDX], a
	xor a
	ld [W_BASECOORDY], a
	ld c, 6 * 6
	call UpdateIntroNidorinoOAM
	pop de
.moveGengarLeft
	ld a, [hSCX]
	inc a
	inc a
.next
	ld [hSCX], a
	push de
	ld c, 2
	call CheckForUserInterruption
	pop de
	ret c
	dec d
	jr nz, IntroMoveMon
	ret

IntroCopyTiles: ; 4183f (10:583f)
	coord hl, 13, 7

CopyTileIDsFromList_ZeroBaseTileID: ; 41842 (10:5842)
	ld c, 0
	predef_jump CopyTileIDsFromList

PlayMoveSoundB: ; 41849 (10:5849)
; unused
	predef GetMoveSoundB
	ld a, b
	jp PlaySound

LoadIntroGraphics: ; 41852 (10:5852)
	ld hl, FightIntroBackMon
	ld de, vChars2
	ld bc, $600
	ld a, BANK(FightIntroBackMon)
	call FarCopyData2
	ld hl, GameFreakIntro
	ld de, vChars2 + $600
	ld bc, $140
	ld a, BANK(GameFreakIntro)
	call FarCopyData2
	ld hl, GameFreakIntro
	ld de, vChars1
	ld bc, $140
	ld a, BANK(GameFreakIntro)
	call FarCopyData2
	ld hl, FightIntroFrontMon
	ld de, vChars0
	ld bc, $6c0
	ld a, BANK(FightIntroFrontMon)
	jp FarCopyData2

PlayShootingStar: ; 4188a (10:588a)
	ld b, $c
	call GoPAL_SET
	callba LoadCopyrightAndTextBoxTiles
	ld a, $e4
	ld [rBGP], a
	ld c, 180
	call DelayFrames
	call ClearScreen
	call DisableLCD
	xor a
	ld [W_CUROPPONENT], a
	call IntroDrawBlackBars
	call LoadIntroGraphics
	call EnableLCD
	ld hl, rLCDC
	res 5, [hl]
	set 3, [hl]
	ld c, 64
	call DelayFrames
	callba AnimateShootingStar
	push af
	pop af
	jr c, .next ; skip the delay if the user interrupted the animation
	ld c, 40
	call DelayFrames
.next
	ld a, BANK(Music_IntroBattle)
	ld [wc0ef], a
	ld [wc0f0], a
	ld a, MUSIC_INTRO_BATTLE
	ld [wc0ee], a
	call PlaySound
	call IntroClearMiddleOfScreen
	call ClearSprites
	jp Delay3

IntroDrawBlackBars: ; 418e9 (10:58e9)
; clear the screen and draw black bars on the top and bottom
	call IntroClearScreen
	coord hl, 0, 0
	ld c, SCREEN_WIDTH * 4
	call IntroPlaceBlackTiles
	coord hl, 0, 14
	ld c, SCREEN_WIDTH * 4
	call IntroPlaceBlackTiles
	ld hl, vBGMap1
	ld c, $80
	call IntroPlaceBlackTiles
	ld hl, vBGMap1 + $1c0
	ld c, $80
	jp IntroPlaceBlackTiles

EmptyFunc4: ; 4190c (10:590c)
	ret

IntroNidorinoAnimation0: ; 4190d (10:590d)
	db 0, 0
	db $50

IntroNidorinoAnimation1: ; 41910 (10:5910)
; This is a sequence of pixel movements for part of the Nidorino animation. This
; list describes how Nidorino should hop.
; First byte is y movement, second byte is x movement
	db  0, 0
	db -2, 2
	db -1, 2
	db  1, 2
	db  2, 2
	db $50 ; list terminator

IntroNidorinoAnimation2: ; 4191b (10:591b)
; This is a sequence of pixel movements for part of the Nidorino animation.
; First byte is y movement, second byte is x movement
	db  0,  0
	db -2, -2
	db -1, -2
	db  1, -2
	db  2, -2
	db $50 ; list terminator

IntroNidorinoAnimation3: ; 41926 (10:5926)
; This is a sequence of pixel movements for part of the Nidorino animation.
; First byte is y movement, second byte is x movement
	db   0, 0
	db -12, 6
	db  -8, 6
	db   8, 6
	db  12, 6
	db $50 ; list terminator

IntroNidorinoAnimation4: ; 41931 (10:5931)
; This is a sequence of pixel movements for part of the Nidorino animation.
; First byte is y movement, second byte is x movement
	db  0,  0
	db -8, -4
	db -4, -4
	db  4, -4
	db  8, -4
	db $50 ; list terminator

IntroNidorinoAnimation5: ; 4193c (10:593c)
; This is a sequence of pixel movements for part of the Nidorino animation.
; First byte is y movement, second byte is x movement
	db  0, 0
	db -8, 4
	db -4, 4
	db  4, 4
	db  8, 4
	db $50 ; list terminator

IntroNidorinoAnimation6: ; 41947 (10:5947)
; This is a sequence of pixel movements for part of the Nidorino animation.
; First byte is y movement, second byte is x movement
	db 0, 0
	db 2, 0
	db 2, 0
	db 0, 0
	db $50 ; list terminator

IntroNidorinoAnimation7: ; 41950 (10:5950)
; This is a sequence of pixel movements for part of the Nidorino animation.
; First byte is y movement, second byte is x movement
	db -8, -16
	db -7, -14
	db -6, -12
	db -4, -10
	db $50 ; list terminator

GameFreakIntro: ; 41959 (10:5959)
	INCBIN "gfx/gamefreak_intro.2bpp"
	INCBIN "gfx/gamefreak_logo.2bpp"
	ds $10 ; blank tile

FightIntroBackMon: ; 41a99 (10:5a99)
	INCBIN "gfx/intro_fight.2bpp"

FightIntroFrontMon: ; 42099 (10:6099)

IF DEF(_RED)
	INCBIN "gfx/red/intro_nido_1.6x6.2bpp"
	INCBIN "gfx/red/intro_nido_2.6x6.2bpp"
	INCBIN "gfx/red/intro_nido_3.6x6.2bpp"
	ds $10 ; blank tile
ENDC
IF DEF(_BLUE)
	INCBIN "gfx/blue/intro_purin_1.6x6.2bpp"
	INCBIN "gfx/blue/intro_purin_2.6x6.2bpp"
	INCBIN "gfx/blue/intro_purin_3.6x6.2bpp"
	ds $10 ; blank tile
ENDC
