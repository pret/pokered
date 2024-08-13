SeafoamIslandsB4F_Script:
	call EnableAutoTextBoxDrawing
	call SeafoamIslandsB4FOnMapLoad
	ld a, [wSeafoamIslandsB4FCurScript]
	ld hl, SeafoamIslandsB4F_ScriptPointers
	jp CallFunctionInTable

SeafoamIslandsB4FOnMapLoad::
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_BEAT_ARTICUNO
	jr z, .dontMoveCrystals
	call SeafoamMoveCrystals
.dontMoveCrystals
	CheckBothEventsSet EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM3_BOULDER2_DOWN_HOLE
	call z, SeafoamB4FReplaceEastCurrentBlock
	CheckBothEventsSet EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE
	ret nz
	ld de, SeafoamB4FCurrentWestHorizontalReplacements
	ld a, $76
	ld [wNewTileBlockID], a
	jpfar ReplaceMultipleTileBlockLineHorizontalWithOneBlock

SeafoamMoveCrystals:
	ld hl, wSprite05StateData2MapY
	call .setToOrigin
	ld hl, wSprite06StateData2MapY
	call .setToOrigin
	ld hl, wSprite07StateData2MapY
	call .setToOrigin
	ld hl, wSprite08StateData2MapY
.setToOrigin
	ld [hl], 0 + 4
	inc hl
	ld [hl], 0 + 4
	ret


SeafoamB4FReplaceEastCurrentBlock:
	ld a, $76
	lb bc, 8, 10
SeafoamReplaceTileBlockEntry:
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

SeafoamIslandsB4FResetScript:
	xor a
	ld [wSeafoamIslandsB4FCurScript], a
	ld [wJoyIgnore], a
	ret

SeafoamIslandsB4F_ScriptPointers:
	def_script_pointers
	dw_const SeafoamIslandsB4FDefaultScript,       SCRIPT_SEAFOAMISLANDSB4F_DEFAULT
	dw_const SeafoamIslandsB4FObjectMoving1Script, SCRIPT_SEAFOAMISLANDSB4F_OBJECT_MOVING1
	dw_const SeafoamIslandsB4FArticunoIntroAnimation, SCRIPT_SEAFOAMISLANDSB4F_ARTICUNO_INTRO_ANIMATION
	dw_const SeafoamIslandsB4FEndArticunoBattleScript, SCRIPT_SEAFOAMISLANDSB4F_ARTICUNO_BATTLE_END

SeafoamIslandsB4FEndArticunoBattleScript:
	ld a, [wIsInBattle]
	cp $ff ; do nothing if you lost the battle
	jr z, SeafoamIslandsB4FResetScript
	SetEvent EVENT_BEAT_ARTICUNO
	ld a, HS_ARTICUNO
	ld [wMissableObjectIndex], a
	predef HideObject
	call SeafoamMoveCrystals
SeafoamB4FDefaultScript:
	ld a, SCRIPT_SEAFOAMISLANDSB4F_DEFAULT
	ld [wSeafoamIslandsB4FCurScript], a
	ret

SeafoamIslandsB4FDefaultScript:
	ld a, [wXCoord]
	cp 18
	jr c, .leftSideCurrent
	CheckBothEventsSet EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM3_BOULDER2_DOWN_HOLE
	jr nz, .doCurrents
.leftSideCurrent
	CheckBothEventsSet EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE
	ret z
.doCurrents
	call SeafoamIslandsCurrents ; in SeafoamIslandsB3F.asm
	ret nc
	ld a, SCRIPT_SEAFOAMISLANDSB4F_OBJECT_MOVING1
	ld [wSeafoamIslandsB4FCurScript], a
	ret

SeafoamIslandsB4FObjectMoving1Script:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, [wYCoord]
	cp 12
	jr nz, SeafoamB4FDefaultScript
	ld a, [wXCoord]
	cp 7
	call z, SeafoamDoneForcedSurfMovementLeft
	jr SeafoamB4FDefaultScript

SeafoamDoneForcedSurfMovementLeft:
	xor a
	ld [wWalkBikeSurfState], a
	ld [wWalkBikeSurfStateCopy], a
	jp ForceBikeOrSurf

SeafoamIslandsB4F_TextPointers:
	def_text_pointers
	dw_const BoulderBlockingWaterB4F,              TEXT_SEAFOAMISLANDSB4F_BOULDER1
	dw_const BoulderBlockingWaterB4F,              TEXT_SEAFOAMISLANDSB4F_BOULDER2
	dw_const SeafoamIslandsB4FArticunoText,     TEXT_SEAFOAMISLANDSB4F_ARTICUNO
	dw_const PickUpItemText,                    TEXT_SEAFOAMISLANDSB4F_ITEM1 ; PureRGBnote: ADDED: new item located here.
	dw_const DoRet,                             TEXT_SEAFOAMISLANDSB4F_ANIMSPRITE1 
	dw_const DoRet,                             TEXT_SEAFOAMISLANDSB4F_ANIMSPRITE2
	dw_const DoRet,                             TEXT_SEAFOAMISLANDSB4F_ANIMSPRITE3
	dw_const DoRet,                             TEXT_SEAFOAMISLANDSB4F_ANIMSPRITE4
	dw_const SeafoamIslandsB4FBouldersSignText, TEXT_SEAFOAMISLANDSB4F_BOULDERS_SIGN
	dw_const SeafoamIslandsB4FDangerSignText,   TEXT_SEAFOAMISLANDSB4F_DANGER_SIGN

SeafoamIslandsB4FArticunoText:
	text_far _SeafoamIslandsB4FArticunoBattleText
	text_asm
	call StopAllMusic
	ld a, ARTICUNO
	call PlayCry
	call WaitForSoundToFinish
	ld a, SCRIPT_SEAFOAMISLANDSB4F_ARTICUNO_INTRO_ANIMATION
	ld [wSeafoamIslandsB4FCurScript], a
	rst TextScriptEnd

SeafoamIslandsB4FArticunoIntroAnimation:
	; make articuno face down then open its wings
	ld a, SEAFOAMISLANDSB4F_ARTICUNO
	call SetSpriteFacingDown
	call UpdateSprites
	; make moltres open its wings
	ld hl, vNPCSprites tile $0C
	call OpenBirdWingsSprite
	; show snowflakes flying outwards in an X pattern
	call UpdateSprites
	call Delay3
	ld de, ArticunoIcyWindSFX
	call PlayNewSoundChannel8
	xor a
.animationLoop
	push af
	; replace the "nothing" sprite with
	; an ice crystal
	ld de, IceCrystalSprite
	lb bc, BANK(IceCrystalSprite), 4
	ld hl, vNPCSprites tile $18
	call CopyVideoData
	; loop over moving them diagonally outwards at 60fps
	ld c, 63
	ld b, 0
.loop
	; top left crystal
	ld hl, wSprite05StateData1YPixels
	dec [hl]
	dec [hl]
	inc hl
	inc hl
	dec [hl]
	dec [hl]
	; top right crystal
	ld hl, wSprite06StateData1YPixels
	dec [hl]
	dec [hl]
	inc hl
	inc hl
	inc [hl]
	inc [hl]
	; bottom left crystal
	ld hl, wSprite07StateData1YPixels
	inc [hl]
	inc [hl]
	inc hl
	inc hl
	dec [hl]
	dec [hl]
	; bottom right crystal
	ld hl, wSprite08StateData1YPixels
	inc [hl]
	inc [hl]
	inc hl
	inc hl
	inc [hl]
	inc [hl]
	rst _DelayFrame
	ld a, c
	; every 4 frames we make the ice crystal "sparkle"
	rrca
	jr c, .noSpriteUpdate
	rrca
	jr c, .noSpriteUpdate
	ld a, b
	xor 1
	ld b, a
	push bc
	ld de, IceCrystalSprite tile 4
	jr nz, .gotSprite
	ld de, IceCrystalSprite
.gotSprite
	lb bc, BANK(IceCrystalSprite), 4
	ld hl, vNPCSprites tile $18
	call CopyVideoData
	pop bc
.noSpriteUpdate
	dec c
	jr nz, .loop
	pop af
	and a
	jr nz, .doneAnimation
	callfar AnimationLightScreenPalette
	ld de, ArticunoIcyWindSFX2
	call PlayNewSoundChannel8
	ld a, 1
	jp .animationLoop
.doneAnimation
	; replace ice crystal sprite with nothing again
	ld de, NothingSprite
	lb bc, BANK(NothingSprite), 4
	ld hl, vNPCSprites tile $18
	call CopyVideoData
	; show everything freezing 
	call GBFadeOutToWhite
	; turn off the water visual animation
	xor a
	ldh [hTileAnimations], a
	; replace water tiles with "frozen water"
	ld de, FrozenWaterTile
	lb bc, BANK(FrozenWaterTile), 1
	ld hl, vTileset tile $14
	call CopyVideoData
	; replace rock tiles with ice crystals
	ld de, IceCrystal
	lb bc, BANK(IceCrystal), 2
	ld hl, vTileset tile $02
	call CopyVideoData
	ld de, IceCrystal tile 2
	lb bc, BANK(IceCrystal), 2
	ld hl, vTileset tile $12
	call CopyVideoData
	call GBPalNormal
	ld de, ArticunoFreezesEverythingCh5
	call PlayNewSoundChannel5
	ld de, ArticunoFreezesEverythingCh8
	call PlayNewSoundChannel8
	ld c, 60
	rst _DelayFrames
	; articuno shows an animation when you fight it now
	ld a, ARTICUNO
	ld [wEngagedTrainerClass], a
	ld a, 50
	ld [wEngagedTrainerSet], a
	call InitBattleEnemyParameters
	callfar PlayTrainerMusic
	ld c, 100
	rst _DelayFrames
	ld a, SCRIPT_SEAFOAMISLANDSB4F_ARTICUNO_BATTLE_END
	ld [wSeafoamIslandsB4FCurScript], a
	ret

SeafoamIslandsB4FBouldersSignText:
	text_far _SeafoamIslandsB4FBouldersSignText
	text_end

SeafoamIslandsB4FDangerSignText:
	text_far _SeafoamIslandsB4FDangerSignText
	text_end

BoulderBlockingWaterB4F:
	text_far _BoulderBlockingCurrent
	text_end

; input hl = where in vram to replace it
OpenBirdWingsSprite:
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ld de, LegendaryBirdSprite tile 12
	lb bc, BANK(LegendaryBirdSprite), 4
	jr nz, .gotSprite
	ld de, BirdSprite tile 12
	lb bc, BANK(BirdSprite), 4
.gotSprite
	jp CopyVideoData