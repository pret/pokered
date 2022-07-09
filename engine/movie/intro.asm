	const_def -1
	const MOVE_NIDORINO_RIGHT
	const MOVE_GENGAR_RIGHT
	const MOVE_GENGAR_LEFT

DEF ANIMATION_END EQU 80

PlayIntro:
	xor a
	ldh [hJoyHeld], a
	inc a
	ldh [hAutoBGTransferEnabled], a
	call PlayShootingStar
	call PlayIntroScene
	call GBFadeOutToWhite
	xor a
	ldh [hSCX], a
	ldh [hAutoBGTransferEnabled], a
	call ClearSprites
	call DelayFrame
	ret

PlayIntroScene:
	ld b, SET_PAL_NIDORINO_INTRO
	call RunPaletteCommand
	ldpal a, SHADE_BLACK, SHADE_DARK, SHADE_LIGHT, SHADE_WHITE
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	xor a
	ldh [hSCX], a
	ld b, TILEMAP_GENGAR_INTRO_1
	call IntroCopyTiles
	ld a, 0
	ld [wBaseCoordX], a
	ld a, 80
	ld [wBaseCoordY], a
	lb bc, 6, 6
	call InitIntroNidorinoOAM
	lb de, 80 / 2, MOVE_NIDORINO_RIGHT
	call IntroMoveMon
	ret c

; hip
	ld a, SFX_INTRO_HIP
	call PlaySound
	xor a
	ld [wIntroNidorinoBaseTile], a
	ld de, IntroNidorinoAnimation1
	call AnimateIntroNidorino
; hop
	ld a, SFX_INTRO_HOP
	call PlaySound
	ld de, IntroNidorinoAnimation2
	call AnimateIntroNidorino
	ld c, 10
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
	ld c, 30
	call CheckForUserInterruption
	ret c

; raise
	ld b, TILEMAP_GENGAR_INTRO_2
	call IntroCopyTiles
	ld a, SFX_INTRO_RAISE
	call PlaySound
	lb de, 8 / 2, MOVE_GENGAR_LEFT
	call IntroMoveMon
	ld c, 30
	call CheckForUserInterruption
	ret c

; slash
	ld b, TILEMAP_GENGAR_INTRO_3
	call IntroCopyTiles
	ld a, SFX_INTRO_CRASH
	call PlaySound
	lb de, 16 / 2, MOVE_GENGAR_RIGHT
	call IntroMoveMon
; hip
	ld a, SFX_INTRO_HIP
	call PlaySound
	ld a, (FightIntroFrontMon2 - FightIntroFrontMon) / LEN_2BPP_TILE
	ld [wIntroNidorinoBaseTile], a
	ld de, IntroNidorinoAnimation3
	call AnimateIntroNidorino
	ld c, 30
	call CheckForUserInterruption
	ret c

	lb de, 8 / 2, MOVE_GENGAR_LEFT
	call IntroMoveMon
	ld b, TILEMAP_GENGAR_INTRO_1
	call IntroCopyTiles
	ld c, 60
	call CheckForUserInterruption
	ret c

; hip
	ld a, SFX_INTRO_HIP
	call PlaySound
	xor a
	ld [wIntroNidorinoBaseTile], a
	ld de, IntroNidorinoAnimation4
	call AnimateIntroNidorino
; hop
	ld a, SFX_INTRO_HOP
	call PlaySound
	ld de, IntroNidorinoAnimation5
	call AnimateIntroNidorino
	ld c, 20
	call CheckForUserInterruption
	ret c

	ld a, (FightIntroFrontMon2 - FightIntroFrontMon) / LEN_2BPP_TILE
	ld [wIntroNidorinoBaseTile], a
	ld de, IntroNidorinoAnimation6
	call AnimateIntroNidorino
	ld c, 30
	call CheckForUserInterruption
	ret c

; lunge
	ld a, SFX_INTRO_LUNGE
	call PlaySound
	ld a, (FightIntroFrontMon3 - FightIntroFrontMon) / LEN_2BPP_TILE
	ld [wIntroNidorinoBaseTile], a
	ld de, IntroNidorinoAnimation7
	jp AnimateIntroNidorino

AnimateIntroNidorino:
	ld a, [de]
	cp ANIMATION_END
	ret z
	ld [wBaseCoordY], a
	inc de
	ld a, [de]
	ld [wBaseCoordX], a
	push de
	ld c, 6 * 6
	call UpdateIntroNidorinoOAM
	ld c, 5
	call DelayFrames
	pop de
	inc de
	jr AnimateIntroNidorino

UpdateIntroNidorinoOAM:
	ld hl, wShadowOAM
	ld a, [wIntroNidorinoBaseTile]
	ld d, a
.loop
	ld a, [wBaseCoordY]
	add [hl]
	ld [hli], a ; Y
	ld a, [wBaseCoordX]
	add [hl]
	ld [hli], a ; X
	ld a, d
	ld [hli], a ; tile
	inc hl
	inc d
	dec c
	jr nz, .loop
	ret

InitIntroNidorinoOAM:
	ld hl, wShadowOAM
	ld d, 0
.loop
	push bc
	ld a, [wBaseCoordY]
	ld e, a
.innerLoop
	ld a, e
	add 8
	ld e, a
	ld [hli], a ; Y
	ld a, [wBaseCoordX]
	ld [hli], a ; X
	ld a, d
	ld [hli], a ; tile
	ld a, OAM_BEHIND_BG
	ld [hli], a ; attributes
	inc d
	dec c
	jr nz, .innerLoop
	ld a, [wBaseCoordX]
	add 8
	ld [wBaseCoordX], a
	pop bc
	dec b
	jr nz, .loop
	ret

IntroClearScreen:
	ld hl, vBGMap1
	ld bc, BG_MAP_WIDTH * SCREEN_HEIGHT
	jr IntroClearCommon

IntroClearMiddleOfScreen:
; clear the area of the tile map between the black bars on the top and bottom
	hlcoord 0, 4
	ld bc, SCREEN_WIDTH * 10

IntroClearCommon:
	ld [hl], 0
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, IntroClearCommon
	ret

IntroPlaceBlackTiles:
	ld a, 1
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

IntroMoveMon:
; d = number of times to move the mon (2 pixels each time)
	ld a, e
	cp MOVE_NIDORINO_RIGHT
	jr z, .moveNidorinoRight
	cp MOVE_GENGAR_LEFT
	jr z, .moveGengarLeft
; move Gengar right
	ldh a, [hSCX]
	dec a
	dec a
	jr .next
.moveNidorinoRight
	push de
	ld a, 2
	ld [wBaseCoordX], a
	xor a
	ld [wBaseCoordY], a
	ld c, 6 * 6
	call UpdateIntroNidorinoOAM
	pop de
.moveGengarLeft
	ldh a, [hSCX]
	inc a
	inc a
.next
	ldh [hSCX], a
	push de
	ld c, 2
	call CheckForUserInterruption
	pop de
	ret c
	dec d
	jr nz, IntroMoveMon
	ret

IntroCopyTiles:
	hlcoord 13, 7

CopyTileIDsFromList_ZeroBaseTileID:
	ld c, 0
	predef_jump CopyTileIDsFromList

PlayMoveSoundB:
; unused
	predef GetMoveSoundB
	ld a, b
	jp PlaySound

LoadIntroGraphics:
	ld hl, FightIntroBackMon
	ld de, vChars2
	ld bc, FightIntroBackMonEnd - FightIntroBackMon
	ld a, BANK(FightIntroBackMon)
	call FarCopyData2
	ld hl, GameFreakIntro
	ld de, vChars2 + (FightIntroBackMonEnd - FightIntroBackMon)
	ld bc, GameFreakIntroEnd - GameFreakIntro
	ld a, BANK(GameFreakIntro)
	call FarCopyData2
	ld hl, GameFreakIntro
	ld de, vChars1
	ld bc, GameFreakIntroEnd - GameFreakIntro
	ld a, BANK(GameFreakIntro)
	call FarCopyData2
	ld hl, FightIntroFrontMon
	ld de, vChars0
	ld bc, FightIntroFrontMonEnd - FightIntroFrontMon
	ld a, BANK(FightIntroFrontMon)
	jp FarCopyData2

PlayShootingStar:
	ld b, SET_PAL_GAME_FREAK_INTRO
	call RunPaletteCommand
	farcall LoadCopyrightAndTextBoxTiles
	ldpal a, SHADE_BLACK, SHADE_DARK, SHADE_LIGHT, SHADE_WHITE
	ldh [rBGP], a
	ld c, 180
	call DelayFrames
	call ClearScreen
	call DisableLCD
	xor a
	ld [wCurOpponent], a
	call IntroDrawBlackBars
	call LoadIntroGraphics
	call EnableLCD
	ld hl, rLCDC
	res 5, [hl]
	set 3, [hl]
	ld c, 64
	call DelayFrames
	farcall AnimateShootingStar
	push af
	pop af
	jr c, .next ; skip the delay if the user interrupted the animation
	ld c, 40
	call DelayFrames
.next
	ld a, BANK(Music_IntroBattle)
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a
	ld a, MUSIC_INTRO_BATTLE
	ld [wNewSoundID], a
	call PlaySound
	call IntroClearMiddleOfScreen
	call ClearSprites
	jp Delay3

IntroDrawBlackBars:
; clear the screen and draw black bars on the top and bottom
	call IntroClearScreen
	hlcoord 0, 0
	ld c, SCREEN_WIDTH * 4
	call IntroPlaceBlackTiles
	hlcoord 0, 14
	ld c, SCREEN_WIDTH * 4
	call IntroPlaceBlackTiles
	ld hl, vBGMap1
	ld c,  BG_MAP_WIDTH * 4
	call IntroPlaceBlackTiles
	hlbgcoord 0, 14, vBGMap1
	ld c,  BG_MAP_WIDTH * 4
	jp IntroPlaceBlackTiles

EmptyFunc2:
	ret

IntroNidorinoAnimation0:
	db 0, 0
	db ANIMATION_END

IntroNidorinoAnimation1:
; This is a sequence of pixel movements for part of the Nidorino animation. This
; list describes how Nidorino should hop.
; First byte is y movement, second byte is x movement
	db  0, 0
	db -2, 2
	db -1, 2
	db  1, 2
	db  2, 2
	db ANIMATION_END

IntroNidorinoAnimation2:
; This is a sequence of pixel movements for part of the Nidorino animation.
; First byte is y movement, second byte is x movement
	db  0,  0
	db -2, -2
	db -1, -2
	db  1, -2
	db  2, -2
	db ANIMATION_END

IntroNidorinoAnimation3:
; This is a sequence of pixel movements for part of the Nidorino animation.
; First byte is y movement, second byte is x movement
	db   0, 0
	db -12, 6
	db  -8, 6
	db   8, 6
	db  12, 6
	db ANIMATION_END

IntroNidorinoAnimation4:
; This is a sequence of pixel movements for part of the Nidorino animation.
; First byte is y movement, second byte is x movement
	db  0,  0
	db -8, -4
	db -4, -4
	db  4, -4
	db  8, -4
	db ANIMATION_END

IntroNidorinoAnimation5:
; This is a sequence of pixel movements for part of the Nidorino animation.
; First byte is y movement, second byte is x movement
	db  0, 0
	db -8, 4
	db -4, 4
	db  4, 4
	db  8, 4
	db ANIMATION_END

IntroNidorinoAnimation6:
; This is a sequence of pixel movements for part of the Nidorino animation.
; First byte is y movement, second byte is x movement
	db 0, 0
	db 2, 0
	db 2, 0
	db 0, 0
	db ANIMATION_END

IntroNidorinoAnimation7:
; This is a sequence of pixel movements for part of the Nidorino animation.
; First byte is y movement, second byte is x movement
	db -8, -16
	db -7, -14
	db -6, -12
	db -4, -10
	db ANIMATION_END

GameFreakIntro:
	INCBIN "gfx/splash/gamefreak_presents.2bpp"
	INCBIN "gfx/splash/gamefreak_logo.2bpp"
	ds 16, $00 ; blank tile
GameFreakIntroEnd:

FightIntroBackMon:
	INCBIN "gfx/intro/gengar.2bpp"
	ds 16, $00 ; blank tile
FightIntroBackMonEnd:

IF DEF(_RED)
FightIntroFrontMon:
	INCBIN "gfx/intro/red_nidorino_1.2bpp"
FightIntroFrontMon2:
	INCBIN "gfx/intro/red_nidorino_2.2bpp"
FightIntroFrontMon3:
	INCBIN "gfx/intro/red_nidorino_3.2bpp"
ENDC

IF DEF(_BLUE)
FightIntroFrontMon:
	INCBIN "gfx/intro/blue_jigglypuff_1.2bpp"
FightIntroFrontMon2:
	INCBIN "gfx/intro/blue_jigglypuff_2.2bpp"
FightIntroFrontMon3:
	INCBIN "gfx/intro/blue_jigglypuff_3.2bpp"
ENDC

FightIntroFrontMonEnd:

	ds 16, $00 ; blank tile
