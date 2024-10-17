; PureRGBnote: ADDED: This is the new roof map for the power plant where you fight ZAPDOS in a thunderstorm.
PowerPlantRoof_Script:
	call PowerPlantRoofOnMapLoad
	call CheckShowDarkClouds
	call CheckDoZapdosLightningAnimation
	call ZapdosEndBattleScript
	jp EnableAutoTextBoxDrawing

PowerPlantRoofOnMapLoad:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	; if the player is standing in a specific area, make the palette darker as if dark clouds
	CheckEvent EVENT_BEAT_ZAPDOS
	jr nz, .resetDarkClouds
	ld a, [wYCoord]
	cp 9
	jr c, .resetDarkClouds
	ld a, [wXCoord]
	cp 8
	jr c, .resetDarkClouds
	cp 16
	jr nc, .resetDarkClouds
	ld a, 3
	jr .loadPalOffset ; set dark clouds
.resetDarkClouds
	ResetEvent EVENT_POWER_PLANT_ROOF_STORM_COMING
	xor a
.loadPalOffset
	ld [wMapPalOffset], a
	; fall through
CheckLoadPowerPlantRoofTiles::
	; we need some extra tiles in the tileset to make the roof look a bit more roofy and power planty
	; so we have to dynamically replace some in the tileset
	ld de, PowerPlantRoofTiles
	ld hl, vTileset tile $44
	lb bc, BANK(PowerPlantRoofTiles), 4
	call CopyVideoData
	ld de, PowerPlantRoofTiles tile 4
	ld hl, vTileset tile $16
	lb bc, BANK(PowerPlantRoofTiles), 2
	jp CopyVideoData

CheckShowDarkClouds::
	CheckEvent EVENT_BEAT_ZAPDOS
	ret nz
	ld hl, wYCoord
	ld a, [hli]
	cp 10
	ret nz
	ld a, [hl]
	cp 8
	ret nz
	CheckAndSetEvent EVENT_POWER_PLANT_ROOF_STORM_COMING
	ret nz
	call GBFadeOutToBlack
	ld a, 3
	ld [wMapPalOffset], a
	call GBPalNormal
	call LoadGBPal
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	ld a, BANK(SFX_Battle_25)
	ld [wAudioROMBank], a
	call PlayThunderRumbleSound
	call WaitForSoundToFinish
	ld a, BANK(Music_Dungeon1)
	ld [wAudioROMBank], a
	xor a
	ld [wMuteAudioAndPauseMusic], a
	ld a, TEXT_POWER_PLANT_ROOF_DARK_CLOUDS
	ldh [hTextID], a
	jp DisplayTextID

PlayThunderRumbleSound::
	ld a, $48
	ld [wFrequencyModifier], a
	ld a, $ff
	ld [wTempoModifier], a
	ld a, SFX_BATTLE_25
	rst _PlaySound
	ret


PowerPlantRoof_TextPointers:
	def_text_pointers
	dw_const PowerPlantRoofZapdosText,  TEXT_POWER_PLANT_ROOF_ZAPDOS
	dw_const PowerPlantRoofDarkCloudsText,  TEXT_POWER_PLANT_ROOF_DARK_CLOUDS

PowerPlantRoofDarkCloudsText:
	text_far _PowerPlantRoofDarkCloudsText
	text_end

PowerPlantRoofZapdosText:
	text_far _PowerPlantZapdosBattleText
	text_asm
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	ld a, ZAPDOS
	call PlayCry
	SetEvent EVENT_ZAPDOS_LIGHTNING_ANIMATION
	rst TextScriptEnd

CheckDoZapdosLightningAnimation:
	CheckAndResetEvent EVENT_ZAPDOS_LIGHTNING_ANIMATION
	ret z
	ld a, POWER_PLANT_ROOF_ZAPDOS
	call SetSpriteFacingDown
	call UpdateSprites
	; load storm tiles for this animation
	ld hl, vNPCSprites2 tile $40
	ld de, PowerPlantStormTiles
	lb bc, BANK(PowerPlantStormTiles), 5
	call CopyVideoData
	; zapdos lightning animation
	; disable sprite update routine so we can manipulate some rain sprites directly without map sprite code running
	ld a, $FF
	ld [wUpdateSpritesEnabled], a
	; load all the rain and zap sprites into sprite OAM
	ld c, 28
	ld hl, wShadowOAMSprite08
.loopLoadStormRainSprites
	call Random
	and %1111111
	ld [hli], a ; y coord
	call Random
	and %1111111
	add 32 ; number between 32 and 160
	ld [hli], a ; x coord
	ld [hl], $C4 ; rain tile
	inc hl
	inc hl
	dec c
	jr nz, .loopLoadStormRainSprites
	ld c, 4
	ld hl, wShadowOAMSprite36TileID
.loopLoadStormZapSprites
	ld [hl], $C3
	inc hl
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loopLoadStormZapSprites
	ld hl, wShadowOAMSprite37Attributes
	; x flip
	set 5, [hl]
	ld hl, wShadowOAMSprite38Attributes
	; y flip
	set 6, [hl]
	ld hl, wShadowOAMSprite39Attributes
	; both x and y flip
	set 5, [hl]
	set 6, [hl]
	; now start the animation
	ld de, PowerPlantRoofRain
	call PlayNewSoundChannel8
	call AnimateRain
	call AnimateRain
	ld de, StopSFXSound
	call PlayNewSoundChannel8
	call GBPalWhiteOut
	; move rain sprites off screen
	ld c, 28
	ld hl, wShadowOAMSprite08XCoord
	call HideOAMSprites
	; hide the player sprite too cause it looks cooler to only see zapdos during the lightning strike
	ld c, 4
	ld hl, wShadowOAMSprite00XCoord
	call HideOAMSprites
	rst _DelayFrame
	; fill screen with simulated rain tiles in the background
	ld d, $C0
	callfar FillScreenWithTile
	; draw lightning hitting zapdos
	call PowerPlantDrawLightning
	xor a
	ldh [hWY], a ; put the window on the screen
	ld a, $01
	ldh [hAutoBGTransferEnabled], a ; enable continuous WRAM to VRAM transfer each V-blank
	ld c, 10
	rst _DelayFrames
	ld de, vNPCSprites tile $0C
	callfar FarOpenBirdSpriteWings
	call GBPalNormal
	; 10 frame flicker
	ld b, 5
.loopFlicker
	rst _DelayFrame
	push bc
	call LoadGBPal
	pop bc
	rst _DelayFrame
	push bc
	call GBPalNormal
	pop bc
	dec b
	jr nz, .loopFlicker
	ld a, BANK(SFX_Battle_26)
	ld [wAudioROMBank], a
	xor a
	ld [wFrequencyModifier], a
	ld a, $80
	ld [wTempoModifier], a
	ld a, SFX_BATTLE_26
	rst _PlaySound
	; move "zap" sprites near zapdos
	ld hl, wShadowOAMSprite36
	ld [hl], 74
	inc hl
	ld [hl], 80
	ld hl, wShadowOAMSprite37
	ld [hl], 74
	inc hl
	ld [hl], 104
	ld hl, wShadowOAMSprite38
	ld [hl], 86
	inc hl
	ld [hl], 80
	ld hl, wShadowOAMSprite39
	ld [hl], 86
	inc hl
	ld [hl], 104
	; move "zap" sprites outwards from zapdos
	ld b, 60
.loopMoveZapSpritesOut
	ld hl, wShadowOAMSprite36
	dec [hl]
	dec [hl]
	inc hl
	dec [hl]
	dec [hl]
	ld hl, wShadowOAMSprite37
	dec [hl]
	dec [hl]
	inc hl
	inc [hl]
	inc [hl]
	ld hl, wShadowOAMSprite38
	inc [hl]
	inc [hl]
	inc hl
	dec [hl]
	dec [hl]
	ld hl, wShadowOAMSprite39
	inc [hl]
	inc [hl]
	inc hl
	inc [hl]
	inc [hl]
	rst _DelayFrame
	dec b
	jr nz, .loopMoveZapSpritesOut
	call WaitForSoundToFinish
	ResetFlag FLAG_HIDE_PLAYER_SPRITE
	; articuno shows an animation when you fight it now
	ld a, ZAPDOS
	ld [wEngagedTrainerClass], a
	ld a, 50
	ld [wEngagedTrainerSet], a
	call InitBattleEnemyParameters
	callfar PlayTrainerMusic
	xor a
	ld [wMuteAudioAndPauseMusic], a
	ld c, 90
	rst _DelayFrames
	ld a, POWER_PLANT_ROOF_ZAPDOS
	ldh [hSpriteIndex], a ; makes zapdos stay on screen during battle transition
	SetEvent EVENT_FIGHTING_ZAPDOS
	ret

; hl = which sprite to start the loop from
; c = number of sprites to hide
HideOAMSprites:
.loopHideSprites
	ld [hl], $FF
	inc hl
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loopHideSprites
	ret

AnimateRain:
	call GBPalWhiteOut
	rst _DelayFrame
	call LoadGBPal
	ld b, 60
.loopRainAnimation
	ld c, 28
	ld hl, wShadowOAMSprite08
.loopMoveRainSprites
	call .checkResetRainSpriteToTop
	inc [hl] ; y coord
	inc [hl] ; y coord
	inc [hl] ; y coord
	inc hl
	dec [hl] ; x coord
	dec [hl] ; x coord
	dec [hl] ; x coord
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loopMoveRainSprites
	rst _DelayFrame
	dec b
	jr nz, .loopRainAnimation
	ret
.checkResetRainSpriteToTop
	ld a, [hl]
	cp 144
	ret c
	ld [hl], -3 ; reset to top of screen
	inc hl
	call Random
	ld [hl], a
	dec hl
	ret

PowerPlantDrawLightning:
	hlcoord 10, 0
	ld de, LightningCoords
	ld a, [de]
.loopLoadLightning
	push hl
	ld b, 0
	ld c, a
	add hl, bc
	inc de
	ld a, [de]
	ld b, a ; number of tiles in this y line
	ld c, a
.loopLine
	ld a, b
	cp 1
	ld a, $C2
	jr z, .load
	ld a, b
	cp c
	ld a, $C1
	jr z, .load
	ld a, " " ; empty
.load
	ld [hli], a
	dec b
	jr nz, .loopLine
	pop hl
	ld b, 0
	ld c, SCREEN_WIDTH
	add hl, bc
	inc de
	ld a, [de]
	cp -1
	jr nz, .loopLoadLightning
	ret

; how far past x = 10 it should start drawing the y line, how many tiles the y line uses
LightningCoords::
	db 3, 3 
	db 2, 3
	db 1, 3
	db 0, 5
	db 1, 3
	db 0, 4
	db 1, 2
	db 1, 1
	db -1 

ZapdosEndBattleScript:
	CheckAndResetEvent EVENT_FIGHTING_ZAPDOS
	ret z
	ld a, [wIsInBattle]
	cp $ff ; do nothing if you lost the battle
	ret z
	SetEvent EVENT_BEAT_ZAPDOS
	ld a, HS_POWER_PLANT_ROOF_ZAPDOS
	ld [wMissableObjectIndex], a
	predef_jump HideExtraObject
	
