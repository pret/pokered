; PureRGBnote: ADDED: This is the area where you can curse your GENGAR into a HAUNTER (with gengar stats)
; and also the catacombs where you lay MAROWAK to rest.
PokemonTowerB1F_Script:
	call PokemonTowerB1FOnMapLoad
	call PokemonTowerB1FCheckCatacombsIntroText
	call PokemonTowerB1FWaitForNPCWalk
	jp EnableAutoTextBoxDrawing

PokemonTowerB1F_TextPointers:
	def_text_pointers
	dw_const PokemonTowerB1FDarkChannelerText,  TEXT_POKEMONTOWERB1F_DARK_CHANNELER
	dw_const PokemonTowerB1FDarkChannelerLowerText,  TEXT_POKEMONTOWERB1F_LOWER_DARK_CHANNELER
	dw_const PokemonTowerB1FTheMawUsedHyperBeamText,  TEXT_POKEMONTOWERB1F_THE_MAW_HYPER_BEAM
	dw_const PokemonTowerB1FCuboneText,  TEXT_POKEMONTOWERB1F_CUBONE 
	dw_const PokemonTowerB1FMarowakBlockedHyperBeamText,  TEXT_POKEMONTOWERB1F_GHOST_MAROWAK
	dw_const PokemonTowerB1FCatacombsIntroText, TEXT_POKEMONTOWERB1F_CATACOMBS_INFO 
	dw_const PokemonTowerB1FTorchedGraveText,  TEXT_POKEMONTOWERB1F_TORCHED_GRAVE
	dw_const PokemonTowerB1FChunkyGraveText,  TEXT_POKEMONTOWERB1F_CHUNKY_GRAVE
	dw_const PokemonTowerB1FPainlessGraveText,  TEXT_POKEMONTOWERB1F_PAINLESS_GRAVE
	dw_const PokemonTowerB1FIrradiatedGraveText,  TEXT_POKEMONTOWERB1F_IRRADIATED_GRAVE
	dw_const PokemonTowerB1FTheMawGraveText, TEXT_POKEMONTOWERB1F_THE_MAW_GRAVE

PokemonTowerB1FOnMapLoad:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	ld a, [wYCoord]
	cp 18
	jp nc, .catacombs
	ld a, [wReplacedMapMusic]
	cp MUSIC_LAVENDER
	call z, PokemonTowerB1FPlayMusic
	xor a
	ld [wMapPalOffset], a
	jp LoadGBPal ; reset palette in upper area
.catacombs
	push hl
	ld a, [wReplacedMapMusic]
	cp MUSIC_LAVENDER
	call nz, PokemonTowerB1FPlayMusic
	CheckEvent EVENT_BEAT_IRRADIATED
	jr nz, .skipReplaceBlocks
	SetFlag FLAG_SKIP_MAP_REDRAW
	CheckEvent EVENT_BEAT_TORCHED
	lb bc, 24, 2
	call z, .replaceTileBlockEntryClosed
	CheckEvent EVENT_BEAT_CHUNKY
	lb bc, 21, 2
	call z, .replaceTileBlockEntryClosed
	CheckEvent EVENT_BEAT_PAINLESS
	lb bc, 18, 2
	call z, .replaceTileBlockEntryClosed
	CheckEvent EVENT_BEAT_IRRADIATED
	lb bc, 15, 2
	call z, .replaceTileBlockEntryClosed
	ResetFlag FLAG_SKIP_MAP_REDRAW
	callfar RedrawMapView
.skipReplaceBlocks
	; if we're not in the first room, make things darker visually
	ld a, 3
	ld [wMapPalOffset], a
	call LoadGBPal
	pop hl
	; hl = wCurrentMapScriptFlags
	bit BIT_MAP_LOADED_AFTER_BATTLE, [hl]
	res BIT_MAP_LOADED_AFTER_BATTLE, [hl]
	ret z
	; BELOW: code that only runs when you return from a battle in the catacombs
	ld a, [wIsInBattle]
	cp $ff ; do nothing if you lost the battle
	jr z, .hideGhost
	ld a, [wBattleFunctionalFlags]
	bit 1, a
	jr nz, .hideGhost ; do nothing if you ran from battle
	ld a, [wEscapedFromBattle]
	and a
	jr nz, .hideGhost ; do nothing when you used a poke doll to end the battle
.dontHideGhost
	CheckAndSetEvent EVENT_BEAT_TORCHED
	ld a, TEXT_POKEMONTOWERB1F_TORCHED_GRAVE
	jr z, .afterBattleText
	CheckAndSetEvent EVENT_BEAT_CHUNKY
	ld a, TEXT_POKEMONTOWERB1F_CHUNKY_GRAVE
	jr z, .afterBattleText
	CheckAndSetEvent EVENT_BEAT_PAINLESS
	ld a, TEXT_POKEMONTOWERB1F_PAINLESS_GRAVE
	jr z, .afterBattleText
	CheckAndSetEvent EVENT_BEAT_IRRADIATED
	ld a, TEXT_POKEMONTOWERB1F_IRRADIATED_GRAVE
	jr z, .afterBattleText
	CheckAndSetEvent EVENT_BEAT_THE_MAW
	ld a, TEXT_POKEMONTOWERB1F_THE_MAW_GRAVE
	jr .theMawAfterBattle
.hideGhost
	jp PokemonTowerB1FHideGhost
.afterBattleText
	push af
	ld c, 60
	rst _DelayFrames
	; back up channeler sprite's current pixel position before moving it
	ld hl, wSprite02StateData1YPixels
	ld e, [hl]
	inc hl
	inc hl
	ld d, [hl]
	push de
	lb de, -1, -1 ; 1 coord left and up from player
	call DarkChannelerAppears
	pop de
	pop af
	ldh [hTextID], a
	push de
	call DisplayTextID
	call PokemonTowerB1FDisappearGhost
	ld c, 30
	rst _DelayFrames
	call DarkChannelerFliesAway
	pop de
	; move channeler sprite back to default position
	ld hl, wSprite02StateData1YPixels
	ld [hl], e
	inc hl
	inc hl
	ld [hl], d
	ld hl, wSprite02StateData2MapY
	ld [hl], 54 + 4
	inc hl
	ld [hl], 8 + 4
	call UpdateSprites
	; replace tile block player standing on with new one
	call GBPalBlackOut
	ld a, [wYCoord]
	srl a
	ld b, a
	ld a, [wXCoord]
	srl a
	ld c, a	
	ld a, $43
	call .replaceTileBlockEntry
	ld a, SFX_INTRO_CRASH
	rst _PlaySound
	jp LoadGBPal
.theMawAfterBattle
	push af
	ld c, 80
	rst _DelayFrames
	call PokemonTowerB1FDisappearGhost
	pop af
	ld a, TEXT_POKEMONTOWERB1F_THE_MAW_GRAVE
	ldh [hTextID], a
	call DisplayTextID
	ld a, POKEMONTOWERB1F_GHOST_MAROWAK
	lb de, -1, 0
	call MoveSpriteInRelationToPlayer
	call UpdateSprites
	ld a, SFX_TELEPORT_EXIT_2
	rst _PlaySound
	ld a, POKEMONTOWERB1F_GHOST_MAROWAK
	call SlideSpriteDiagonallyUpLeft
	ld a, POKEMONTOWERB1F_GHOST_MAROWAK
	lb de, -2, -1
	call MoveSpriteInRelationToPlayer
	ld a, POKEMONTOWERB1F_GHOST_MAROWAK
	call SetSpriteFacingDown
	ld a, DOWN
	ld [wMapSpriteData + ((POKEMONTOWERB1F_GHOST_MAROWAK - 1) * 2)], a
	SetEvent EVENT_CATACOMBS_SPRITE_WALKING
	ld a, D_LEFT
	ld hl, wSimulatedJoypadStatesEnd
	ld [hl], D_UP
	inc hl
	ld [hli], a
	ld [hli], a
	ld [hl], D_DOWN
	inc hl
	ld [hl], -1
	ld a, 4
	ld [wSimulatedJoypadStatesIndex], a
	jp StartSimulatingJoypadStates
.replaceTileBlockEntryClosed
	ld a, $38
.replaceTileBlockEntry
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock


PokemonTowerB1FPlayMusic::
	ld a, [wAudioFadeOutControl]
	and a ; currently fading out audio?
	ret nz
	ld a, [wYCoord]
	cp 18
	jr nc, .catacombs
	ld a, [wReplacedMapMusic]
	and a
	ret z
	xor a
	ld [wReplacedMapMusic], a
	; play normal music if in first area
	jp PlayDefaultMusic
.catacombs
	ld a, MUSIC_LAVENDER
	ld [wReplacedMapMusic], a
	ld hl, Music_Lavender_Alternate
	ld c, BANK(Music_Lavender_Alternate)
	call PlaySpecialFieldMusic
	; we will set the music tempo manually so we can adjust it depending on events
	ld a, 200
	ld b, %00110000 ; 3 octaves lower
	CheckEventHL EVENT_BEAT_THE_MAW
	jr nz, .gotTempoTransposition
	add 20 ; 220
	; still 3 octaves lower
	CheckEventReuseHL EVENT_BEAT_IRRADIATED
	jr nz, .gotTempoTransposition
	sub 20 ; 200
	ld b, %00110011 ; 3 octaves lower, 3 pitches higher
	CheckEventReuseHL EVENT_BEAT_PAINLESS
	jr nz, .gotTempoTransposition
	sub 20 ; 180
	ld b, %00100000 ; 2 octaves lower
	CheckEventReuseHL EVENT_BEAT_CHUNKY
	jr nz, .gotTempoTransposition
	sub 20 ; 160
	ld b, %00100011 ; 2 octaves lower, 3 pitches higher
	CheckEventReuseHL EVENT_BEAT_TORCHED
	jr nz, .gotTempoTransposition
	ld b, %00010000 ; 1 octave lower
	sub 8 ; 152 (original tempo)
.gotTempoTransposition
	; a = tempo, b = transposition
	ld hl, wMusicTempo + 1
	ld [hld], a
	xor a
	ld [hl], a
	ld a, b
	ld hl, wChannelTranspositions
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

; input a = which warp to do
PrepareScriptedCatacombsWarp:
	ld [wDestinationWarpID], a
	ld a, POKEMON_TOWER_B1F
	ldh [hWarpDestinationMap], a
	ld hl, wStatusFlags3
	set BIT_WARP_FROM_CUR_SCRIPT, [hl] ; scripted warp
	ret


PokemonTowerB1FDarkChannelerText:
	text_asm
	CheckEvent EVENT_BEAT_THE_MAW
	jr nz, .default
	CheckEvent EVENT_ENTERED_CATACOMBS
	jr nz, .skipCatacombs
	call DarkChannelerHandFiddling
	ld hl, DarkChannelerGreeting
	rst _PrintText
	CheckEvent EVENT_MET_DARK_CHANNELER
	jr nz, .skipCatacombs
	call DarkChannelerHandFiddling
	ld hl, DarkChannelerGreeting2
	rst _PrintText
.skipCatacombs
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr z, .default
	call CheckIfGhostMarowakInParty
	jr nc, .default
	SetEvent EVENT_MET_DARK_CHANNELER
	call DarkChannelerHandFiddling
	CheckEvent EVENT_ENTERED_CATACOMBS
	ld hl, .goDown
	jr z, .catacombsIntro
	ld hl, .goBackDown
.catacombsIntro
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, PokemonTowerB1FDarkChannelerLowerText.no
	jr nz, .printDone1
	ld a, 1 ; second warp
	call PrepareScriptedCatacombsWarp
	; hide the cubone in lavender town since it will be in the catacombs
	ld a, HS_LAVENDER_TOWN_CUBONE
	ld [wMissableObjectIndex], a
	predef HideExtraObject
	ld hl, PokemonTowerB1FDarkChannelerLowerText.yes
.printDone1
	rst _PrintText
	rst TextScriptEnd
.default
	; check if player has gengar
	CheckEvent EVENT_MET_DARK_CHANNELER
	call nz, .checkForGengar
	jr c, .skipGreeting
	CheckEvent EVENT_MET_DARK_CHANNELER
	jr nz, .noBackToMe
	ld hl, .backToMe
	rst _PrintText
.noBackToMe
	SetEvent EVENT_MET_DARK_CHANNELER
	call DarkChannelerHandFiddling
	ld hl, DarkChannelerGreeting3
	rst _PrintText
	call .checkForGengar
	jr nc, .done
	call DisplayTextPromptButton
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
	jr c, .printDone2
	ld a, [wCurPartySpecies]
	cp GENGAR
	jr nz, .printDone2
	ld hl, TextScriptEndingText
	rst _PrintText
	call SaveScreenTilesToBuffer2
	ld hl, DarkChannelerGengarCurseTime
	rst _PrintText
	call GengarTransformation
	call PlayDefaultMusic
	ld hl, DarkChannelerCurseComplete
.printDone2
	rst _PrintText	
.done
	rst TextScriptEnd
.checkForGengar
	ld d, GENGAR
	jpfar FindPokemonInParty
.goDown
	text_far _DarkChannelerGoDownText
	text_end
.goBackDown
	text_far _PokemonTowerCatacombsGoBackDown
	text_end
.backToMe
	text_far _DarkChannelerBackToMyself
	text_end

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
	call GBPalBlackOut
	call LoadScreenTilesFromBuffer2
	call Delay3
	xor a
	ld [wMapPalOffset], a
	call GBFadeInFromBlack
	ld a, POWERED_HAUNTER
	ld [wCurPartySpecies], a
	callfar ChangePartyPokemonSpecies
	jpfar CheckMonNickNameDefault

GBPalBlackOut:
	ld a, $FF
	ldh [rBGP], a
	ldh [rOBP1], a
	jp UpdatePal

FillScreenWithTile::
; File screen with tile d, then wait
; for the bg map to update.
	ld a, d
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
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
	hlcoord 0, 0
	ld b, 6 ; 6 horizontal lines
.outerLoop
	push hl
	ld c, 4 ; 4 sprites per line
.innerLoop
	push hl
	push bc
	call DrawHaunterFace
	pop bc
	pop hl
	lb de, 0, 5
	add hl, de
	dec c
	jr nz, .innerLoop
	pop hl
	lb de, 0, SCREEN_WIDTH * 3
	add hl, de ; go 3 lines down
	dec b
	jr nz, .outerLoop
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
	call .fadeOutAndIn
	call GBFadeOutToBlackForcedOriginal
	ld a, 255
	ld [wFrequencyModifier], a
	ld [wTempoModifier], a
	ld a, SFX_PSYCHIC_M
	rst _PlaySound
	call GBFadeInFromBlackForcedOriginal
.fadeOutAndIn
	call GBFadeOutToBlackForcedOriginal
	jp GBFadeInFromBlackForcedOriginal

PokemonTowerB1FDarkChannelerLowerText:
	text_asm
	call DarkChannelerHandFiddling
	ld hl, .goBackQuestion
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .no
	jr nz, .printDone
	ld a, 2 ; third warp
	call PrepareScriptedCatacombsWarp
	ld hl, .yes 
.printDone
	rst _PrintText
	rst TextScriptEnd
.goBackQuestion
	text_far _PokemonTowerCatacombsDarkChannelerText
	text_end
.yes
	text_far _PokemonTowerCatacombsDarkChannelerTextYes
	text_end
.no
	text_far _FossilGuyDenied
	text_end

PokemonTowerB1FFirstGrave::
	CheckEvent EVENT_BEAT_TORCHED
	ret nz
	ld a, TEXT_POKEMONTOWERB1F_TORCHED_GRAVE
	ldh [hTextID], a
	call DisplayTextID
	lb bc, SPIRIT_TORCHED, 71
	; fall though
StartCatacombsBattle:
	ld a, b
	ld [wEngagedTrainerClass], a
	ld a, c
	ld [wEngagedTrainerSet], a
	jp InitBattleEnemyParameters

PokemonTowerB1FSecondGrave::
	CheckEvent EVENT_BEAT_CHUNKY
	ret nz
	ld a, TEXT_POKEMONTOWERB1F_CHUNKY_GRAVE
	ldh [hTextID], a
	call DisplayTextID
	lb bc, SPIRIT_CHUNKY, 72
	jr StartCatacombsBattle

PokemonTowerB1FThirdGrave::
	CheckEvent EVENT_BEAT_PAINLESS
	ret nz
	ld a, TEXT_POKEMONTOWERB1F_PAINLESS_GRAVE
	ldh [hTextID], a
	call DisplayTextID
	lb bc, SPIRIT_PAINLESS, 73
	jr StartCatacombsBattle

PokemonTowerB1FFourthGrave::
	CheckEvent EVENT_BEAT_IRRADIATED
	ret nz
	ld a, TEXT_POKEMONTOWERB1F_IRRADIATED_GRAVE
	ldh [hTextID], a
	call DisplayTextID
	lb bc, SPIRIT_IRRADIATED, 74
	jr StartCatacombsBattle


PokemonTowerB1FTorchedGraveText:
	text_asm
	CheckEvent EVENT_BEAT_TORCHED
	ld hl, .after
	jr nz, .printDone
	ld hl, .intro
	rst _PrintText
	call SummonSpiritFlashScreen
	ld hl, .afterFlash
	jp PrintPlayMusicScreamEnd
.printDone
	rst _PrintText
	rst TextScriptEnd
.intro 
	text_far _PokemonTowerCatacombsTorchedGraveText
	text_end
.afterFlash
	text_far _PokemonTowerCatacombsTorchedGraveText2
	text_end
.after
	text_far _PokemonTowerCatacombsMonSpeaksText
	text_far _PokemonTowerCatacombsTorchedAfterText
	text_end

PokemonTowerB1FChunkyGraveText:
	text_asm
	CheckEvent EVENT_BEAT_CHUNKY
	ld hl, .after
	jr nz, .printDone
	ld hl, .intro
	rst _PrintText
	call SummonSpiritFlashScreen
	ld hl, .afterFlash
	jr PrintPlayMusicScreamEnd
.printDone
	rst _PrintText
	rst TextScriptEnd
.intro 
	text_far _PokemonTowerCatacombsChunkyGraveText
	text_end
.afterFlash
	text_far _PokemonTowerCatacombsChunkyGraveText2
	text_end
.after
	text_far _PokemonTowerCatacombsMonSpeaksText
	text_far _PokemonTowerCatacombsChunkyAfterText
	text_end

PokemonTowerB1FPainlessGraveText:
	text_asm
	CheckEvent EVENT_BEAT_PAINLESS
	ld hl, .after
	jr nz, .printDone
	ld hl, .intro
	rst _PrintText
	call SummonSpiritFlashScreen
	ld hl, .afterFlash
	jr PrintPlayMusicScreamEnd
.printDone
	rst _PrintText
	rst TextScriptEnd
.intro 
	text_far _PokemonTowerCatacombsPainlessGraveText
	text_end
.afterFlash
	text_far _PokemonTowerCatacombsPainlessGraveText2
	text_end
.after
	text_far _PokemonTowerCatacombsMonSpeaksText
	text_far _PokemonTowerCatacombsPainlessAfterText
	text_end

PokemonTowerB1FIrradiatedGraveText:
	text_asm
	CheckEvent EVENT_BEAT_IRRADIATED
	ld hl, .after
	jr nz, .printDone
	ld hl, .intro
	rst _PrintText
	call SummonSpiritFlashScreen
	ld hl, .afterFlash
	jr PrintPlayMusicScreamEnd
.printDone
	rst _PrintText
	rst TextScriptEnd
.intro 
	text_far _PokemonTowerCatacombsIrradiatedGraveText
	text_end
.afterFlash
	text_far _PokemonTowerCatacombsIrradiatedGraveText2
	text_end
.after
	text_far _PokemonTowerCatacombsMonSpeaksText
	text_far _PokemonTowerCatacombsIrradiatedAfterText
	text_end

PrintPlayMusicScreamEnd:
	rst _PrintText
	callfar PlayTrainerMusic
	call LoadGhostSpriteScream
	rst TextScriptEnd

SummonSpiritFlashScreen::
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	ld a, SFX_GET_ITEM_1
	rst _PlaySound
	ld hl, wChannelCommandPointers + CHAN5 * 2
	ld de, Ghost_Encounter_SFX
	call RemapSoundChannel
	inc hl
	ld de, Ghost_Encounter_SFX2
	call RemapSoundChannel
	inc hl
	ld de, StopSFXSound
	call RemapSoundChannel
	ld b, 3
.loop
	push bc
	call GBPalBlackOut
	call Delay3
	call LoadGBPal
	call Delay3
	pop bc
	dec b
	jr nz, .loop
	ld a, POKEMONTOWERB1F_GHOST
	call SetSpriteFacingDown
	ld a, POKEMONTOWERB1F_GHOST
	lb de, 0, -1
	call MoveSpriteInRelationToPlayer
	call UpdateSprites
SpiritToggleImageIndex3Times::
	ld b, 4
.loop2
	push bc
	call LoadGhostSprite2
	call Delay3
	call LoadGhostSpriteNormal
	call Delay3
	pop bc
	dec b
	jr nz, .loop2
	call WaitForSoundToFinish
	xor a
	ld [wMuteAudioAndPauseMusic], a
	ret

LoadGhostSpriteScream:
	ld de, GhostSprite tile 16
	jr LoadGhostSpriteCommon
LoadGhostSpriteNormal:
	ld de, GhostSprite
	jr LoadGhostSpriteCommon
LoadGhostSprite2:
	ld de, GhostSprite tile 12
	; fall through
LoadGhostSpriteCommon:
	ld hl, vNPCSprites tile $0C
	lb bc, BANK(GhostSprite), 4
	jp CopyVideoData


PokemonTowerB1FCheckCatacombsIntroText:
	ld a, [wYCoord]
	cp 18
	ret c ; not in catacombs
	CheckAndSetEvent EVENT_ENTERED_CATACOMBS
	ret nz
	call UpdateSprites
	ld a, TEXT_POKEMONTOWERB1F_CATACOMBS_INFO
	ldh [hTextID], a
	jp DisplayTextID

PokemonTowerB1FCatacombsIntroText:
	text_far _DarkChannelerCatacombsIntroText
	text_asm
	callfar PlayUnusedFanfare
	rst TextScriptEnd

; c = which sprite
FarMoveSpriteInRelationToPlayer::
	ld a, c
; a = which sprite
; d = difference in x coords from player coord (-2 = 2 to the left, 2 = 2 to the right)
; e = difference in y coords from player coord (-2 = 2 upwards, 2 = 2 downwards)
MoveSpriteInRelationToPlayer:
	ldh [hSpriteIndex], a
	ld a, SPRITESTATEDATA1_YPIXELS
	ldh [hSpriteDataOffset], a
	call GetPointerWithinSpriteStateData1
	; hl = ypixels of sprite
	ld a, [wSpritePlayerStateData1YPixels]
	ld b, 16 ; 16 pixels per coord
.loopY
	add e
	dec b
	jr nz, .loopY
	ld [hli], a
	inc hl ; hl = sprite XPixels
	ld a, [wSpritePlayerStateData1XPixels]
	ld b, 16 ; 16 pixels per coord
.loopX
	add d
	dec b
	jr nz, .loopX
	ld [hl], a
	ld a, SPRITESTATEDATA2_MAPY
	ldh [hSpriteDataOffset], a
	call GetPointerWithinSpriteStateData2
	; hl = MapY of sprite
	ld a, [wYCoord]
	add 4 ; MapY offset
	add e
	ld [hli], a
	ld a, [wXCoord]
	add 4 ; MapY offset
	add d
	ld [hl], a
	ret


FarMoveSpriteOffScreen::
	ld a, c
; a = which sprite
; d = X coord on map to move it to
; e = Y coord on map to move it to
MoveSpriteOffscreen:
	ldh [hSpriteIndex], a
	ld a, SPRITESTATEDATA2_MAPY
	ldh [hSpriteDataOffset], a
	call GetPointerWithinSpriteStateData2
	ld a, e
	add 4 ; map offset
	ld [hli], a
	ld a, d
	add 4 ; map offset
	ld [hl], a
	ld a, SPRITESTATEDATA1_IMAGEINDEX
	ldh [hSpriteDataOffset], a
	call GetPointerWithinSpriteStateData1
	ld [hl], $FF ; off screen sprite
	ret

CheckIfGhostCuboneInParty::
	ld d, CUBONE
	jr CheckIfGhostMonInParty
CheckIfGhostMarowakInParty::
	ld d, MAROWAK
CheckIfGhostMonInParty::
	ld b, 0
	ld a, [wPartyCount]
	ld c, a
	ld hl, wPartyMon1Species
.loop
	ld a, [hl]
	cp d
	jr nz, .notMarowak
	push hl
	push de
	ld de, wPartyMon1Flags - wPartyMon1Species
	add hl, de
	bit 0, [hl] ; is it alt palette marowak
	pop de
	pop hl
	jr nz, .found
.notMarowak
	push de
	ld de, wPartyMon2 - wPartyMon1
	add hl, de
	pop de
	inc b
	ld a, b
	cp c
	jr nz, .loop
	; not found
	and a
	ret
.found
	; hl points to start of data of the matching marowak
	ld a, b ; b = index in party of the matching marowak
	ld [wWhichPokemon], a
	ld d, a
	scf
	ret

PokemonTowerB1FDisappearGhost:
	ld a, SFX_INTRO_RAISE
	rst _PlaySound
	ld a, POKEMONTOWERB1F_GHOST
	call SetSpriteFacingUp
	call UpdateSprites
	call Delay3
	ld a, POKEMONTOWERB1F_GHOST
	call SetSpriteFacingLeft
	call UpdateSprites
	call Delay3
PokemonTowerB1FHideGhost:
	lb de, 15, 38
	ld a, POKEMONTOWERB1F_GHOST
	jp MoveSpriteOffscreen

PokemonTowerB1FWaitForNPCWalk:
	CheckEvent EVENT_CATACOMBS_SPRITE_WALKING
	jr z, .checkStartPlayerWalk
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	bit BIT_SCRIPTED_MOVEMENT_STATE, a
	ret nz
	ld a, [wXCoord]
	cp 5
	jr z, .firstWalk
	cp 4
	jr z, .lastWalk
	ld a, [wSprite04StateData2MapX]
	cp 5 + 4
	jr nz, .secondWalk
	ResetEvent EVENT_CATACOMBS_SPRITE_WALKING
	xor a
	ld [wJoyIgnore], a
	ld a, POKEMONTOWERB1F_CUBONE
	call SetSpriteFacingUp
	ld a, UP
	ld [wMapSpriteData + ((POKEMONTOWERB1F_CUBONE - 1) * 2)], a ; make cubone face up after walking always
	ld a, TEXT_POKEMONTOWERB1F_THE_MAW_GRAVE
	ldh [hTextID], a
	call DisplayTextID
	jp TheMawAnimation
.secondWalk
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	ld a, POKEMONTOWERB1F_CUBONE
	ldh [hSpriteIndex], a
	ld de, GenericMoveRight
	jp MoveSprite
.firstWalk
	xor a
	ld [wJoyIgnore], a
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	ld a, TEXT_POKEMONTOWERB1F_CUBONE
	ldh [hTextID], a
	call DisplayTextID
	ld a, D_RIGHT
	ld hl, wSimulatedJoypadStatesEnd
	ld [hli], a
	ld [hl], -1
	ld a, 1
	ld [wSimulatedJoypadStatesIndex], a
	jp StartSimulatingJoypadStates
.checkStartPlayerWalk
	; check if the player should start walking up to Cubone
	CheckEvent EVENT_BEAT_THE_MAW
	ret nz
	ld a, [wYCoord]
	cp 29
	ret nz
	ld a, [wXCoord]
	cp 5
	ret nz
	SetEvent EVENT_CATACOMBS_SPRITE_WALKING
	ld a, D_UP
	ld hl, wSimulatedJoypadStatesEnd
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], -1
	ld a, 4
	ld [wSimulatedJoypadStatesIndex], a
	jp StartSimulatingJoypadStates
.lastWalk
	xor a
	ld [wJoyIgnore], a
	ResetEvent EVENT_CATACOMBS_SPRITE_WALKING
	ld a, TEXT_POKEMONTOWERB1F_GHOST_MAROWAK
	ldh [hTextID], a
	call DisplayTextID
	ret

PokemonTowerB1FCuboneText:
	text_far _CatacombsCuboneText
	text_asm
	ld a, CUBONE
	call PlayCry
	call DisplayTextPromptButton
	ld a, POKEMONTOWERB1F_CUBONE
	call SetSpriteFacingUp
	call CheckIfGhostMarowakInParty ; sets wWhichMon according to ghost marowak's index in party
	call GetPartyMonName2 ; wWhichMon decides what this will store
	ld hl, .marowakTouched
	rst _PrintText
	ld a, MAROWAK
	call PlayCry
	call DisplayTextPromptButton
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	lb de, 0, -1
	call DarkChannelerAppears
	ld hl, .darkChannelerTouchingReunion
	rst _PrintText
	call DarkChannelerFliesAway
	ld a, POKEMONTOWERB1F_DARK_CHANNELER_BASEMENT
	lb de, 8, 54
	call MoveSpriteOffscreen
	rst TextScriptEnd
.marowakTouched
	text_far _CatacombsMarowakTouchedText
	text_end
.darkChannelerTouchingReunion
	text_far _DarkChannelerReunionText
	text_end

DarkChannelerAppears:
	ld a, POKEMONTOWERB1F_DARK_CHANNELER_BASEMENT
	call MoveSpriteInRelationToPlayer
	ld a, SFX_INTRO_LUNGE
	rst _PlaySound
	call GBPalBlackOut
	call Delay3
	jp LoadGBPal

DarkChannelerFliesAway:
	ld a, SFX_SHRINK
	rst _PlaySound
	ld b, 5
.loopSlideSprite
	push bc
	ld d, POKEMONTOWERB1F_DARK_CHANNELER_BASEMENT
	callfar FarSlideSpriteUp
	pop bc
	dec b
	jr nz, .loopSlideSprite
	ret

PokemonTowerB1FTheMawGraveText:
	text_asm
	CheckEvent EVENT_BEAT_THE_MAW
	ld hl, .after
	jr nz, .printDone
	ld hl, .intro
	rst _PrintText
	call SummonSpiritFlashScreen
	ld hl, .second
.printDone
	rst _PrintText
	rst TextScriptEnd
.intro
	text_far _PokemonTowerCatacombsTheMawGraveText
	text_end
.second
	text_far _PokemonTowerCatacombsTheMawGraveText2
	text_end
.after
	text_far _TheMawMeltedIntoShadows
	text_end

PokemonTowerB1FTheMawUsedHyperBeamText:
	text_far _PokemonTowerB1FTheMawUsedHyperBeamText
	text_end

CuboneBlinks:
	ld b, 4
.loop
	push bc
	ld de, MonsterBlinkingSprite
	lb bc, BANK(MonsterBlinkingSprite), 2
	call CopyCuboneVideoDataEntry
	call Delay3
	ld de, MonsterSprite
	lb bc, BANK(MonsterSprite), 2
	call CopyCuboneVideoDataEntry
	call Delay3
	pop bc
	dec b
	jr nz, .loop
	ret

CuboneCries:
	ld b, 4
.loop
	push bc
	ld de, MonsterCryingSprite
	lb bc, BANK(MonsterCryingSprite), 2
	call CopyCuboneVideoDataEntry
	call Delay3
	ld de, MonsterCryingSprite tile 2
	lb bc, BANK(MonsterCryingSprite), 2
	call CopyCuboneVideoDataEntry
	call Delay3
	pop bc
	dec b
	jr nz, .loop
	ret

CopyCuboneVideoDataEntry:
	ld hl, vNPCSprites tile $18
	jp CopyVideoData

PokemonTowerB1FMarowakBlockedHyperBeamText:
	text_asm 
	CheckEvent EVENT_BEAT_THE_MAW
	jr nz, .afterMaw
	ld hl, .blockedHyperBeam
	rst _PrintText
	ld a, SFX_INTRO_RAISE
	rst _PlaySound
	ld d, POKEMONTOWERB1F_CUBONE
	callfar FarNPCSpriteQuickSpin
	rst _DelayFrame
	; make cubone blink
	call CuboneBlinks
	; cubone joined your party
	ld hl, .joinedParty
	rst _PrintText
	; copy marowak nickname to wTrainerName to be used in battle
	ld hl, wNameBuffer
	ld de, wTrainerName
	ld bc, NAME_LENGTH
	rst _CopyData
	; change ghost marowak to cubone
	ld a, CUBONE
	ld [wCurPartySpecies], a
	callfar ChangePartyPokemonSpecies
	; rename marowak to default CUBONE name (we'll ask nickname later)
	callfar CheckMonNickNameDefault
	; try to learn sonic boom immediately
	ld a, SONICBOOM
	ld [wMoveNum], a
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyToStringBuffer
	call SaveScreenTilesToBuffer2
	; have to clear screen because the "choose move to forget" box renders below sprites
	call ClearScreen
	call Delay3
	predef LearnMove ; teach sonicboom
	call .markCuboneSeenCaught
	call LoadScreenTilesFromBuffer2
	call Delay3
	ld a, POKEMONTOWERB1F_CUBONE
	call SetSpriteFacingUp
	ld hl, .attacked
	jp PrintPlayMusicScreamEnd
.afterMaw
	ld hl, .oneLastTime
	rst _PrintText
	ld a, MAROWAK
	call PlayCry
	lb de, 1, -1
	call DarkChannelerAppears
	ld hl, .channelerSpeaks
	rst _PrintText
	; turn "lights" on
	ld b, 3
.loopLightsOn
	push bc
	ld a, 3
	ld [wMapPalOffset], a
	call LoadGBPal
	rst _DelayFrame
	rst _DelayFrame
	xor a
	ld [wMapPalOffset], a
	call LoadGBPal
	rst _DelayFrame
	rst _DelayFrame
	pop bc
	dec b
	jr nz, .loopLightsOn
	ld a, MUSIC_PKMN_HEALED
	ld c, BANK(Music_PkmnHealed)
	call PlayMusic
	ld de, Music_PkmnHealed_Ch1_NoTempo
	ld hl, wChannelCommandPointers + CHAN1 * 2
	call RemapSoundChannel
	; transpose the song up 3 pitches
	ld hl, wChannelTranspositions
	ld a, 3
	ld [hli], a
	ld [hli], a
	ld [hl], a
	; make it a slower tempo
	xor a
	ld [wMusicTempo], a
	ld a, 250
	ld [wMusicTempo + 1], a
	ld b, 4
.loopSlideSprite
	push bc
	ld d, POKEMONTOWERB1F_GHOST_MAROWAK
	ld a, 4
	ld [wTempStore1], a
	callfar FarSlideSpriteUpArbitrarySpeed
	pop bc
	dec b
	jr nz, .loopSlideSprite
	lb de, 15, 39
	ld a, POKEMONTOWERB1F_GHOST_MAROWAK
	call MoveSpriteOffscreen
	ld a, BANK(SFX_Intro_Raise)
	ld [wAudioROMBank], a
	ld a, SFX_INTRO_RAISE
	rst _PlaySound
	call GBFadeOutToWhite
	call GBFadeInFromWhite
	ld hl, .afterlife
	rst _PrintText
	call DisplayTextPromptButton
	ld a, POKEMONTOWERB1F_CUBONE
	call SetSpriteFacingDown
	call UpdateSprites
	call CuboneBlinks
	call CuboneCries
	ld a, CUBONE
	call PlayCry
	ld a, POKEMONTOWERB1F_CUBONE
	call SetSpriteFacingLeft
	call UpdateSprites
	ld b, 16
	ld hl, wSprite04StateData1XPixels
.loopCuboneWalksLeft
	dec [hl]
	rst _DelayFrame
	dec b
	jr nz, .loopCuboneWalksLeft
	ld a, POKEMONTOWERB1F_CUBONE
	lb de, 15, 40
	call MoveSpriteOffscreen
	; give a nickname to cubone?
	call CheckIfGhostCuboneInParty
	ld a, CUBONE
	ld [wCurPartySpecies], a
	ld [wNamedObjectIndex], a
	ld a, NAME_MON_SCREEN
	ld [wNamingScreenType], a
	ld hl, wPartyMonNicks
	ld bc, NAME_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	; hl points to nickname of ghost cubone
	predef AskName
	ld hl, .backUpstairs
	rst _PrintText
	ld a, 2 ; back to first floor
	call PrepareScriptedCatacombsWarp
	rst TextScriptEnd
.markCuboneSeenCaught
	; make sure cubone is marked off on the pokedex because they could have only caught marowak at this point
	ld hl, wPokedexOwned
	call .markOff
	ld hl, wPokedexSeen
.markOff
	ld c, DEX_CUBONE - 1
	ld b, FLAG_SET
	predef_jump FlagActionPredef
.joinedParty
	text_far _PokemonTowerB1FMarowakBuffedCubone
	text_end
.attacked
	text_far _PokemonTowerB1FTheMawAttacked
	text_end
.oneLastTime
	text_far _GhostMarowakOneLastTime
	text_end
.blockedHyperBeam
	text_far _PokemonTowerB1FMarowakBlockedHyperBeamText
	text_end
.channelerSpeaks
	text_far _PokemonTowerCatacombsMonSpeaksText
	text_far _PokemonTowerGhostMarowakAfterText
	text_end
.afterlife
	text_far _PokemonTower2Text_toAfterlife
	text_end
.backUpstairs
	text_far _PokemonTowerCatacombsDoneText
	text_end


; a = which sprite
SlideSpriteDiagonallyUpLeft:
	ldh [hSpriteIndex], a
	ld a, SPRITESTATEDATA1_YPIXELS
	ldh [hSpriteDataOffset], a
	call GetPointerWithinSpriteStateData1
	ld b, 16 ; 16 pixels
.loop
	push hl
	dec [hl] ; y pixels
	inc hl
	inc hl
	dec [hl] ; x pixels
	rst _DelayFrame
	pop hl
	dec b
	jr nz, .loop
	ret

TheMawAnimation:
	; slide the ghost sprite diagonally up and to the left 1 coord each
	ld a, POKEMONTOWERB1F_GHOST
	call SlideSpriteDiagonallyUpLeft
	ld a, POKEMONTOWERB1F_GHOST
	; now make it actually at that location on the map just to make sure it doesn't move potentially
	lb de, -1, -2
	call MoveSpriteInRelationToPlayer
	call SpiritToggleImageIndex3Times
	ld a, TEXT_POKEMONTOWERB1F_THE_MAW_HYPER_BEAM
	ldh [hTextID], a
	call DisplayTextID
	call StopAllMusic
	; hyper beam anim
	call GBPalWhiteOut
	rst _DelayFrame
	call LoadGBPal
	ld a, [wAudioROMBank]
	push af
	ld a, BANK(SFX_Battle_36)
	ld [wAudioROMBank], a
	xor a
	ld [wFrequencyModifier], a
	ld a, $80
	ld [wTempoModifier], a
	ld a, SFX_BATTLE_36
	rst _PlaySound
	call LoadGhostSpriteScream
	; load hyperbeam bubble
	ld hl, vNPCSprites tile $7C
	ld de, HyperBeamBubble
	lb bc, BANK(HyperBeamBubble), 4
	call CopyVideoData
	ld a, POKEMONTOWERB1F_HYPER_BEAM_PROXY
	lb de, -1, -2
	call MoveSpriteInRelationToPlayer
	ld a, POKEMONTOWERB1F_GHOST_MAROWAK
	lb de, 0, 0
	call MoveSpriteInRelationToPlayer
	ld a, POKEMONTOWERB1F_GHOST_MAROWAK
	call SetSpriteFacingUp
	call UpdateSprites
	ld b, 16 ; 16 pixels
.loop2
	ld hl, wSprite06StateData1YPixels
	inc [hl]
	ld hl, wSprite05StateData1YPixels
	ld a, b
	rrca
	jr nc, .noDec
	dec [hl] ; y pixels - only go 8 pixels up
.noDec
	inc hl
	inc hl
	dec [hl] ; x pixels
	rst _DelayFrame
	dec b
	jr nz, .loop2
	call GBFadeOutToWhite
	ld a, POKEMONTOWERB1F_HYPER_BEAM_PROXY
	lb de, 15, 41
	call MoveSpriteOffscreen
	ld a, POKEMONTOWERB1F_GHOST_MAROWAK
	lb de, 15, 39
	call MoveSpriteOffscreen
	call LoadGhostSpriteNormal
	ld c, 30
	rst _DelayFrames
	; explosion sound
	xor a
	ld [wFrequencyModifier], a
	ld a, $40
	ld [wTempoModifier], a
	ld a, SFX_BATTLE_34
	rst _PlaySound
	call WaitForSoundToFinish
	call UpdateSprites
	call LoadGBPal
	pop af
	ld [wAudioROMBank], a
	; ghost marowak blocks it
	ld a, TEXT_POKEMONTOWERB1F_GHOST_MAROWAK
	ldh [hTextID], a
	call DisplayTextID
	ld c, 30
	rst _DelayFrames
	ld d, POKEMONTOWERB1F_GHOST
	callfar FarSlideSpriteDown
	ld a, 27
	ld [wGymLeaderNo], a ; makes gym leader music play
	ld a, [wOptions2]
	bit BIT_MUSIC, a
	jr z, .normalMusic
	ld a, 11 ; gengar in the graveyard music
	ld [wSpecialBattleMusicID], a
.normalMusic
	lb bc, SPIRIT_THE_MAW, 75
	jp StartCatacombsBattle
