CopyDebugName:
	ld bc, NAME_LENGTH
	jp CopyData

PrepareTitleScreen::
	; These debug names are already copied later in PrepareOakSpeech.
	; Removing the unused copies below has no apparent impact.
	; CopyDebugName can also be safely deleted afterwards.
	ld hl, DebugNewGamePlayerName
	ld de, wPlayerName
	call CopyDebugName
	ld hl, DebugNewGameRivalName
	ld de, wRivalName
	call CopyDebugName
	xor a
	ldh [hWY], a
	ld [wLetterPrintingDelayFlags], a
	ld hl, wStatusFlags6
	ld [hli], a
	ASSERT wStatusFlags6 + 1 == wStatusFlags7
	ld [hli], a
	ASSERT wStatusFlags7 + 1 == wElite4Flags
	ld [hl], a
	ld a, BANK(Music_TitleScreen)
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a

DisplayTitleScreen:
	call GBPalWhiteOut
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	xor a
	ldh [hTileAnimations], a
IF DEF(_BLUE)
	ldh [hSCX], a
	ld a, $40
	ldh [hSCY], a
ELSE
	ldh [hSCY], a
	ld a, -112
	ldh [hSCX], a
ENDC
	ld a, $90
	ldh [hWY], a
	call ClearScreen
	call DisableLCD
	call LoadFontTilePatterns
	ld hl, NintendoCopyrightLogoGraphics
	ld de, vTitleLogo2 tile 16
	ld bc, 5 tiles
	ld a, BANK(NintendoCopyrightLogoGraphics)
	call FarCopyData2
	ld hl, GameFreakLogoGraphics
	ld de, vTitleLogo2 tile (16 + 5)
	ld bc, 9 tiles
	ld a, BANK(GameFreakLogoGraphics)
	call FarCopyData2
	ld hl, PokemonLogoGraphics
	ld de, vTitleLogo
	ld bc, $60 tiles
	ld a, BANK(PokemonLogoGraphics)
	call FarCopyData2          ; first chunk
	ld hl, PokemonLogoGraphics tile $60
	ld de, vTitleLogo2
	ld bc, $10 tiles
	ld a, BANK(PokemonLogoGraphics)
	call FarCopyData2          ; second chunk
	ld hl, Version_GFX
	ld de, vChars2 tile $60 + (10 tiles - (Version_GFXEnd - Version_GFX) * 2) / 2
	ld bc, Version_GFXEnd - Version_GFX
	ld a, BANK(Version_GFX)
	call FarCopyDataDouble
	call ClearBothBGMaps

; place tiles for pokemon logo (except for the last row)
	hlcoord 2, 1
	ld a, $80
	ld de, SCREEN_WIDTH
	ld c, 6
.pokemonLogoTileLoop
	ld b, $10
	push hl
.pokemonLogoTileRowLoop ; place tiles for one row
	ld [hli], a
	inc a
	dec b
	jr nz, .pokemonLogoTileRowLoop
	pop hl
	add hl, de
	dec c
	jr nz, .pokemonLogoTileLoop

; place tiles for the last row of the pokemon logo
	hlcoord 2, 7
	ld a, $31
	ld b, $10
.pokemonLogoLastTileRowLoop
	ld [hli], a
	inc a
	dec b
	jr nz, .pokemonLogoLastTileRowLoop

	call DrawPlayerCharacter

; put a pokeball in the player's hand
	ld hl, wShadowOAMSprite10
IF DEF(_BLUE)
	ld a, $74
ELSE
	ld a, $70
ENDC
	ld [hl], a

; place tiles for title screen copyright
	hlcoord 2, 17
	ld de, .tileScreenCopyrightTiles
	ld b, $10
.tileScreenCopyrightTilesLoop
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .tileScreenCopyrightTilesLoop

	jr .next

.tileScreenCopyrightTiles
IF DEF(_BLUE)
	db $41,$42,$43,$44,$42,$43,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E ; ©1995.1996 GAME FREAK inc.
ELSE
	db $45,$41,$42,$43,$44,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$45,$45 ; ©1995 GAME FREAK inc.
ENDC

.next
	call SaveScreenTilesToBuffer2
	call LoadScreenTilesFromBuffer2
	call EnableLCD

IF DEF(_RED)
	ld a, STARTER1 ; which Pokemon to show first on the title screen
ENDC
IF DEF(_GREEN)
	ld a, STARTER3 ; which Pokemon to show first on the title screen
ENDC
IF DEF(_BLUE)
	ld a, STARTER2 ; which Pokemon to show first on the title screen
ENDC
	ld [wTitleMonSpecies], a
	call LoadTitleMonSprite

	ld a, HIGH(vBGMap0 + $300)
	call TitleScreenCopyTileMapToVRAM
	call SaveScreenTilesToBuffer1
	ld a, $40
	ldh [hWY], a
	call LoadScreenTilesFromBuffer2
	ld a, HIGH(vBGMap0)
	call TitleScreenCopyTileMapToVRAM
	ld b, SET_PAL_TITLE_SCREEN
	call RunPaletteCommand
	call GBPalNormal
	ld a, %11100100
	ldh [rOBP0], a

IF DEF(_BLUE)
; make pokemon logo bounce up and down
	ld bc, hSCY ; background scroll Y
	ld hl, .TitleScreenPokemonLogoYScrolls
ELSE
	ld a, SFX_INTRO_WHOOSH
	call PlaySound
	
; make pokemon logo slide in from the right
	ld bc, hSCX ; background scroll X
	ld hl, .TitleScreenPokemonLogoXScrolls
ENDC
.bouncePokemonLogoLoop
	ld a, [hli]
	and a
	jr z, .finishedBouncingPokemonLogo
	ld d, a
	cp -3
	jr nz, .skipPlayingSound
	ld a, SFX_INTRO_CRASH
	call PlaySound
.skipPlayingSound
	ld a, [hli]
	ld e, a
	call .ScrollTitleScreenPokemonLogo
	jr .bouncePokemonLogoLoop

IF DEF(_BLUE)
.TitleScreenPokemonLogoYScrolls:
; Controls the bouncing effect of the Pokemon logo on the title screen
	db -4,16  ; y scroll amount, number of times to scroll
	db 3,4
	db -3,4
	db 2,2
	db -2,2
	db 1,2
	db -1,2
ELSE
	.TitleScreenPokemonLogoXScrolls:
	db 4,28  ; y scroll amount, number of times to scroll
ENDC
	db 0      ; terminate list with 0

.ScrollTitleScreenPokemonLogo:
; Scrolls the Pokemon logo on the title screen to create the bouncing effect
; Scrolls d pixels e times
	call DelayFrame
	ld a, [bc] ; background scroll Y
	add d
	ld [bc], a
	dec e
	jr nz, .ScrollTitleScreenPokemonLogo
	ret

.finishedBouncingPokemonLogo
	call LoadScreenTilesFromBuffer1
IF DEF(_BLUE)
	ld c, 36
ELSE
	ld c, $14
ENDC
	call DelayFrames
IF DEF(_BLUE)
	ld a, SFX_INTRO_WHOOSH
	call PlaySound
ENDC

; scroll game version in from the right
	call PrintGameVersionOnTitleScreen
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
IF DEF(_BLUE)
	ld d, 144
.scrollTitleScreenGameVersionLoop
	ld h, d
	ld l, 64
	call ScrollTitleScreenGameVersion
	ld h, 0
	ld l, 80
	call ScrollTitleScreenGameVersion
	ld a, d
	add 4
	ld d, a
	and a
	jr nz, .scrollTitleScreenGameVersionLoop
ELSE
	call Delay3
ENDC

	ld a, HIGH(vBGMap1)
	call TitleScreenCopyTileMapToVRAM
	call LoadScreenTilesFromBuffer2
	call PrintGameVersionOnTitleScreen
	call Delay3
IF DEF(_BLUE)
	call WaitForSoundToFinish
ENDC
	ld a, MUSIC_TITLE_SCREEN
	ld [wNewSoundID], a
	call PlaySound
	xor a
	ld [wUnusedFlag], a

; Keep scrolling in new mons indefinitely until the user performs input.
.awaitUserInterruptionLoop
IF DEF(_BLUE)
	ld c, 200
ELSE
	ld c, $ff ;Pokemon Scroll fast in JP R/G
ENDC
	call CheckForUserInterruption
	jr c, .finishedWaiting
	call TitleScreenScrollInMon
IF DEF(_BLUE)
	ld c, 1
	call CheckForUserInterruption
	jr c, .finishedWaiting
	farcall TitleScreenAnimateBallIfStarterOut
ENDC
	call TitleScreenPickNewMon
	jr .awaitUserInterruptionLoop

.finishedWaiting
	ld a, [wTitleMonSpecies]
	call PlayCry
	call WaitForSoundToFinish
	call GBPalWhiteOutWithDelay3
	call ClearSprites
	xor a
	ldh [hWY], a
IF DEF(_BLUE)
	inc a
ELSE
	ld a, 1
ENDC
	ldh [hAutoBGTransferEnabled], a
	call ClearScreen
	ld a, HIGH(vBGMap0)
	call TitleScreenCopyTileMapToVRAM
	ld a, HIGH(vBGMap1)
	call TitleScreenCopyTileMapToVRAM
	call Delay3
	call LoadGBPal
	ldh a, [hJoyHeld]
	ld b, a
	and D_UP | SELECT | B_BUTTON
	cp D_UP | SELECT | B_BUTTON
	jp z, .doClearSaveDialogue
IF DEF(_DEBUG)
	ld a, b
	bit BIT_SELECT, a
	jp nz, DebugMenu
ENDC
	jp MainMenu

.doClearSaveDialogue
	farjp DoClearSaveDialogue

TitleScreenPickNewMon:
	ld a, HIGH(vBGMap0)
	call TitleScreenCopyTileMapToVRAM

.loop
; Keep looping until a mon different from the current one is picked.
	call Random
	and $f
	ld c, a
	ld b, 0
	ld hl, TitleMons
	add hl, bc
	ld a, [hl]
	ld hl, wTitleMonSpecies

; Can't be the same as before.
	cp [hl]
	jr z, .loop

	ld [hl], a
	call LoadTitleMonSprite

	ld a, $90
	ldh [hWY], a
	ld d, 1 ; scroll out
	farcall TitleScroll
	ret

TitleScreenScrollInMon:
	ld d, 0 ; scroll in
	farcall TitleScroll
	xor a
	ldh [hWY], a
	ret

ScrollTitleScreenGameVersion:
.wait
	ldh a, [rLY]
	cp l
	jr nz, .wait

	ld a, h
	ldh [rSCX], a

.wait2
	ldh a, [rLY]
	cp h
	jr z, .wait2
	ret

DrawPlayerCharacter:
	ld hl, PlayerCharacterTitleGraphics
	ld de, vSprites
	ld bc, PlayerCharacterTitleGraphicsEnd - PlayerCharacterTitleGraphics
	ld a, BANK(PlayerCharacterTitleGraphics)
	call FarCopyData2
	call ClearSprites
	xor a
	ld [wPlayerCharacterOAMTile], a
	ld hl, wShadowOAM
IF DEF(_BLUE)
	lb de, $60, $5a
ELSE
	lb de, $60, $30
ENDC
	ld b, 7
.loop
	push de
	ld c, 5
.innerLoop
	ld a, d
	ld [hli], a ; Y
	ld a, e
	ld [hli], a ; X
	add 8
	ld e, a
	ld a, [wPlayerCharacterOAMTile]
	ld [hli], a ; tile
	inc a
	ld [wPlayerCharacterOAMTile], a
	inc hl
	dec c
	jr nz, .innerLoop
	pop de
	ld a, 8
	add d
	ld d, a
	dec b
	jr nz, .loop
	ret

ClearBothBGMaps:
	ld hl, vBGMap0
	ld bc, $400 * 2
	ld a, " "
	jp FillMemory

LoadTitleMonSprite:
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
IF DEF(_BLUE)
	hlcoord 5, 10
ELSE
	hlcoord 9, 10
ENDC
	call GetMonHeader
	jp LoadFrontSpriteByMonIndex

TitleScreenCopyTileMapToVRAM:
	ldh [hAutoBGTransferDest + 1], a
	jp Delay3

LoadCopyrightAndTextBoxTiles:
	xor a
	ldh [hWY], a
	call ClearScreen
	call LoadTextBoxTilePatterns

LoadCopyrightTiles:
	ld de, NintendoCopyrightLogoGraphics
	ld hl, vChars2 tile $60
	lb bc, BANK(NintendoCopyrightLogoGraphics), (GameFreakLogoGraphicsEnd - NintendoCopyrightLogoGraphics) / $10
	call CopyVideoData
	hlcoord 2, 7
	ld de, CopyrightTextString
	jp PlaceString

CopyrightTextString:
IF DEF(_BLUE)
	db   $60,$61,$62,$63,$61,$62,$64,$65,$66,$67,$68,$69,$6A             ; ©1995.1996 Nintendo
	next $60,$61,$62,$63,$61,$62,$64,$6B,$6C,$6D,$6E,$6F,$70,$71,$72     ; ©1995.1996 Creatures inc.
	next $60,$61,$62,$63,$61,$62,$64,$73,$74,$75,$76,$77,$78,$79,$7A,$7B ; ©1995.1996 GAME FREAK inc.
	db   "@"
ELSE
	db   $7F,$7F,$7F,$60,$61,$62,$63,$65,$66,$67,$68,$69,$6A             ; ©1995 Nintendo
	next $7F,$7F,$7F,$60,$61,$62,$63,$6B,$6C,$6D,$6E,$6F,$70,$71,$72     ; ©1995 Creatures inc.
	next $7F,$7F,$7F,$60,$61,$62,$63,$73,$74,$75,$76,$77,$78,$79,$7A,$7B ; ©1995 GAME FREAK inc.
	db   "@"
ENDC

INCLUDE "data/pokemon/title_mons.asm"

; prints version text (red, blue)
PrintGameVersionOnTitleScreen:
IF DEF (_RED)
	hlcoord 7, 8
ENDC
IF DEF (_GREEN)
	hlcoord 6, 8
ENDC
IF DEF (_BLUE)
	hlcoord 7, 8
ENDC
	ld de, VersionOnTitleScreenText
	jp PlaceString

; these point to special tiles specifically loaded for that purpose and are not usual text
VersionOnTitleScreenText:
IF DEF(_RED)
	db $60,$61,$7F,$65,$66,$67,$68,$69,"@" ; "Red Version"
ENDC
IF DEF(_GREEN)
	db $62,$63,$64,$7F,$65,$66,$67,$68,$69,"@" ; "Green Version"
ENDC
IF DEF(_BLUE)
	db $61,$62,$63,$64,$65,$66,$67,$68,"@" ; "Blue Version"
ENDC

DebugNewGamePlayerName:
	db "NINTEN@"

DebugNewGameRivalName:
	db "SONY@"
