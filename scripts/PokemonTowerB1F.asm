PokemonTowerB1F_Script:
	jp EnableAutoTextBoxDrawing

PokemonTowerB1F_TextPointers:
	def_text_pointers
	dw_const PokemonTowerB1FDarkChannelerText,  TEXT_POKEMONTOWERB1F_DARK_CHANNELER

PokemonTowerB1FDarkChannelerText:
	text_asm
	CheckEvent EVENT_MET_DARK_CHANNELER
	call nz, .checkForGengar
	jr c, .skipGreeting
	; check if player has gengar
	call DarkChannelerHandFiddling
	ld hl, DarkChannelerGreeting
	rst _PrintText
	CheckEvent EVENT_MET_DARK_CHANNELER
	jr nz, .skipCatacombs
	call DarkChannelerHandFiddling
	ld hl, DarkChannelerGreeting2
	rst _PrintText
.skipCatacombs
	call DarkChannelerHandFiddling
	ld hl, DarkChannelerGreeting3
	rst _PrintText
	SetEvent EVENT_MET_DARK_CHANNELER
	call .checkForGengar
	jr nc, .done
	ld hl, TextScriptPromptButton
	call TextCommandProcessor
.skipGreeting
	call DarkChannelerEyesAndHandsFiddling
	ld hl, DarkChannelerGengar
	rst _PrintText
	xor a ; NORMAL_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	dec a
	ld [wUpdateSpritesEnabled], a
	call SaveScreenTilesToBuffer2
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call ReloadTilesetTilePatterns
	call Delay3
	call LoadGBPal
	pop af
	ld hl, DarkChannelerGengarFalseAlarm
	jr c, .falseAlarm
	ld a, [wcf91]
	cp GENGAR
	jr nz, .falseAlarm
	ld hl, TextScriptEndingText
	rst _PrintText
	call SaveScreenTilesToBuffer2
	ld hl, DarkChannelerGengarCurseTime
	rst _PrintText
	call GengarTransformation
	call PlayDefaultMusic
	ld hl, DarkChannelerCurseComplete
.falseAlarm
	rst _PrintText	
.done
	rst TextScriptEnd
.checkForGengar
	ld d, GENGAR
	jpfar FindPokemonInParty

GengarTransformation:
	call LoadHaunterTiles
	call Delay3
	call StopAllMusic
	ld c, BANK(SFX_Intro_Hip)
	ld a, SFX_INTRO_HIP
	call PlayMusic
	call DarkChannelerEyesAndHandsFiddling
	ld a, SFX_INTRO_HOP
	rst _PlaySound
	call DarkChannelerEyesAndHandsFiddling
	ld a, SFX_INTRO_HIP
	rst _PlaySound
	call DarkChannelerEyesAndHandsFiddling
	ld a, SFX_INTRO_HOP
	rst _PlaySound
	call DarkChannelerEyesAndHandsFiddling
	ld a, 6
	ld [wMapPalOffset], a
	call LoadGBPal
	call UpdateSprites
	call Delay3
	ld a, $42
	ld [wFrequencyModifier], a
	ld a, $01
	ld [wTempoModifier], a
	ld a, SFX_BATTLE_35
	ld c, BANK(SFX_Battle_35)
	call PlayMusic
	call WaitForSoundToFinish
	ld c, BANK(SFX_Intro_Lunge)
	ld a, SFX_INTRO_LUNGE
	call PlayMusic
	call GBFadeOutToBlack
	ld d, $47
	call FillScreenWithTile
	call GBPalNormal
	ld c, 60
	rst _DelayFrames
	call DrawHaunterFaces
	ld c, 20
	rst _DelayFrames
	call LoadScreenTilesFromBuffer2
	xor a
	ld [wMapPalOffset], a
	call LoadGBPal
	call GBFadeInFromBlack
	ld a, POWERED_HAUNTER
	ld [wcf91], a
	callfar ChangePartyPokemonSpecies
	jpfar CheckMonNickNameDefault

FillScreenWithTile::
; File screen with tile d, then wait
; for the bg map to update.
	ld a, d
	ld bc, 20 * 18
	inc b
	hlcoord 0, 0
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	jp Delay3


DarkChannelerGreeting:
	text_far _DarkChannelerGreeting
	text_end
DarkChannelerGreeting2:
	text_far _DarkChannelerGreeting2
	text_end
DarkChannelerGreeting3:
	text_far _DarkChannelerGreeting3
	text_end
DarkChannelerGengar:
	text_far _DarkChannelerGengar
	text_end
DarkChannelerGengarFalseAlarm:
	text_far _DarkChannelerGengarFalseAlarm
	text_end
DarkChannelerGengarCurseTime:
	text_far _DarkChannelerGengarCurseTime
	text_end
DarkChannelerCurseComplete:
	text_far _DarkChannelerCurseComplete
	text_end


DarkChannelerHandFiddling:
	ld a, 4
	push af
.loop
	ld de, DarkChannelerHandsSprite
	lb bc, BANK(DarkChannelerHandsSprite), 2
	ld hl, vSprites tile $7A
	call CopyVideoData
	call Delay3
	ld de, DarkChannelerSprite tile 2
	lb bc, BANK(DarkChannelerSprite), 2
	ld hl, vSprites tile $7A
	call CopyVideoData
	call Delay3
	pop af
	dec a
	push af
	jr nz, .loop
	pop af
	ret

DarkChannelerEyesAndHandsFiddling:
	ld a, 4
	push af
.loop
	ld de, DarkChannelerEyesOpenSprite
	lb bc, BANK(DarkChannelerHandsSprite), 2
	ld hl, vSprites tile $78
	call CopyVideoData
	ld de, DarkChannelerHandsSprite
	lb bc, BANK(DarkChannelerHandsSprite), 2
	ld hl, vSprites tile $7A
	call CopyVideoData
	call Delay3
	ld de, DarkChannelerSprite
	lb bc, BANK(DarkChannelerSprite), 4
	ld hl, vSprites tile $78
	call CopyVideoData
	call Delay3
	pop af
	dec a
	push af
	jr nz, .loop
	pop af
	ret

LoadHaunterTiles:
	ld de, HaunterFace
	lb bc, BANK(HaunterFace), 12
	ld hl, vChars1 tile $40
	jp CopyVideoData

; draw a haunter face on the screen with top left tile at hlcoord
DrawHaunterFace:
	ld a, $C0
	ld c, 3
.loop2
	push hl
	ld b, 4
.loop
	ld [hli], a
	inc a
	dec b
	jr nz, .loop
	pop hl
	lb de, 0, SCREEN_WIDTH
	add hl, de
	dec c
	jr nz, .loop2
	xor a
	ld [wFrequencyModifier], a
	ld a, $C0
	ld [wTempoModifier], a
	ld a, SFX_CRY_23
	rst _PlaySound
	ld c, 2
	rst _DelayFrames
	ret

DrawHaunterFaces:
	; yes, this should be a loop, but I'm too lazy to figure that out this time
	hlcoord 0, 0
	call DrawHaunterFace
	hlcoord 5, 0
	call DrawHaunterFace
	hlcoord 10, 0
	call DrawHaunterFace
	hlcoord 15, 0
	call DrawHaunterFace
	hlcoord 0, 3
	call DrawHaunterFace
	hlcoord 5, 3
	call DrawHaunterFace
	hlcoord 10, 3
	call DrawHaunterFace
	hlcoord 15, 3
	call DrawHaunterFace
	hlcoord 0, 6
	call DrawHaunterFace
	hlcoord 5, 6
	call DrawHaunterFace
	hlcoord 10, 6
	call DrawHaunterFace
	hlcoord 15, 6
	call DrawHaunterFace
	hlcoord 0, 9
	call DrawHaunterFace
	hlcoord 5, 9
	call DrawHaunterFace
	hlcoord 10, 9
	call DrawHaunterFace
	hlcoord 15, 9
	call DrawHaunterFace
	hlcoord 0, 12
	call DrawHaunterFace
	hlcoord 5, 12
	call DrawHaunterFace
	hlcoord 10, 12
	call DrawHaunterFace
	hlcoord 15, 12
	call DrawHaunterFace
	hlcoord 0, 15
	call DrawHaunterFace
	hlcoord 5, 15
	call DrawHaunterFace
	hlcoord 10, 15
	call DrawHaunterFace
	hlcoord 15, 15
	call DrawHaunterFace
	call StopAllMusic
	ld a, $30
	ld [wFrequencyModifier], a
	ld a, $40
	ld [wTempoModifier], a
	ld a, SFX_CRY_1C
	rst _PlaySound
	call WaitForSoundToFinish
	ld a, 70
	ld [wFrequencyModifier], a
	ld a, 255
	ld [wTempoModifier], a
	ld c, BANK(SFX_Psychic_M)
	ld a, SFX_PSYCHIC_M
	call PlayMusic
	call GBFadeOutToBlack
	call GBFadeInFromBlack
	call GBFadeOutToBlack
	ld a, 255
	ld [wFrequencyModifier], a
	ld a, 255
	ld [wTempoModifier], a
	ld a, SFX_PSYCHIC_M
	rst _PlaySound
	call GBFadeInFromBlack
	call GBFadeOutToBlack
	jp GBFadeInFromBlack