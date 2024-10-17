DEF FUCHSIA_OMANYTE_KABUTO_FOSSIL_TILE EQU $7C


FuchsiaCity_Script:
	call FuchsiaCityDefaultScript
	jp EnableAutoTextBoxDrawing

; PureRGBnote: ADDED: function that will remove all cut trees in fuchsia if we deleted them with the tree deleter
FuchsiaCityDefaultScript:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CROSSED_MAP_CONNECTION, [hl] ; did we enter the map by traversal from another route
	res BIT_CROSSED_MAP_CONNECTION, [hl]
	jr nz, .removeAddCutTilesNoRedraw
	bit BIT_CUR_MAP_LOADED_1, [hl] ; did we load the map from a save/warp/door/battle, etc?
	res BIT_CUR_MAP_LOADED_1, [hl]
	jr nz, .removeAddCutTiles
; PureRGBnote: ADDED: ERIK can walk away after you tell him where SARA is.
	; check if ERIK is walking away
	CheckEventHL EVENT_ERIK_LEAVING
	ret z
	ld a, $FF
	ld [wJoyIgnore], a
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ResetEventReuseHL EVENT_ERIK_LEAVING
	xor a
	ld [wJoyIgnore], a
	; hide erik sprite
	ld a, HS_FUCHSIA_ERIK
	ld [wMissableObjectIndex], a
	predef HideExtraObject
	ld a, HS_SAFARI_ZONE_CENTER_REST_HOUSE_ERIK
	ld [wMissableObjectIndex], a
	; show erik in safari zone sprite
	predef_jump ShowExtraObject
.removeAddCutTiles
	CheckEvent EVENT_DELETED_FUCHSIA_TREES
	jr z, .firstLoadCommon
	ld de, FuchsiaCityCutTreeTileBlockReplacements
	callfar ReplaceMultipleTileBlocks
	jr .firstLoadCommon
.removeAddCutTilesNoRedraw
	; this guarantees avoiding redrawing the map because when going between areas these tiles are offscreen.
	CheckEvent EVENT_DELETED_FUCHSIA_TREES
	jr z, .firstLoadCommon
	ld de, FuchsiaCityCutTreeTileBlockReplacements
	callfar ReplaceMultipleTileBlocksForceNoRedraw
.firstLoadCommon
	ResetEvent EVENT_FOSSIL_FAN_TEXT_TOGGLE ; this is just a good place to clear this event so the guy says the first text every time you reload the area.
	; fall through
	
; PureRGBnote: ADDED: since we don't have enough space in the sprite sheet to add kabuto's icon, 
; we just replace omanyte's with it when loading fuchsia city if kabuto is supposed to be in the zoo

CheckLoadKabutoShell::
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ret z
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	ret z
	; fall through

LoadKabutoShellSprite:
	ld hl, vSprites tile FUCHSIA_OMANYTE_KABUTO_FOSSIL_TILE
	ld de, PartyMonSprites2 tile 66
	lb bc, BANK(PartyMonSprites2), 4
	predef_jump CopyMenuSpritesVideoDataFar


FuchsiaCity_TextPointers:
	def_text_pointers
	dw_const FuchsiaCityYoungster1Text,      TEXT_FUCHSIACITY_YOUNGSTER1
	dw_const FuchsiaCityGamblerText,         TEXT_FUCHSIACITY_GAMBLER
	dw_const FuchsiaCityErikText,            TEXT_FUCHSIACITY_ERIK
	dw_const FuchsiaCityYoungster2Text,      TEXT_FUCHSIACITY_YOUNGSTER2
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_CHANSEY
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_VOLTORB
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_KANGASKHAN
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_SLOWPOKE
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_LAPRAS
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_FOSSIL
	dw_const FuchsiaCityFossilFanText,       TEXT_FUCHSIACITY_FOSSIL_FAN
	dw_const FuchsiaCitySignText,            TEXT_FUCHSIACITY_SIGN1
	dw_const FuchsiaCitySignText,            TEXT_FUCHSIACITY_SIGN2
	dw_const FuchsiaCitySafariGameSignText,  TEXT_FUCHSIACITY_SAFARI_GAME_SIGN
	dw_const MartSignText,                   TEXT_FUCHSIACITY_MART_SIGN
	dw_const PokeCenterSignText,             TEXT_FUCHSIACITY_POKECENTER_SIGN
	dw_const FuchsiaCityWardensHomeSignText, TEXT_FUCHSIACITY_WARDENS_HOME_SIGN
	dw_const FuchsiaCitySafariZoneSignText,  TEXT_FUCHSIACITY_SAFARI_ZONE_SIGN
	dw_const FuchsiaCityGymSignText,         TEXT_FUCHSIACITY_GYM_SIGN
	dw_const FuchsiaCityChanseySignText,     TEXT_FUCHSIACITY_CHANSEY_SIGN
	dw_const FuchsiaCityVoltorbSignText,     TEXT_FUCHSIACITY_VOLTORB_SIGN
	dw_const FuchsiaCityKangaskhanSignText,  TEXT_FUCHSIACITY_KANGASKHAN_SIGN
	dw_const FuchsiaCitySlowpokeSignText,    TEXT_FUCHSIACITY_SLOWPOKE_SIGN
	dw_const FuchsiaCityLaprasSignText,      TEXT_FUCHSIACITY_LAPRAS_SIGN
	dw_const FuchsiaCityFossilSignText,      TEXT_FUCHSIACITY_FOSSIL_SIGN

; PureRGBnote: CHANGED: this NPC will point out how alt palette pokemon appear in the safari zone
; but only if we have alt palette pokemon enabled in the game options.
FuchsiaCityYoungster1Text: 
	text_asm
	ld a, [wOptions2]
	bit BIT_ALT_PKMN_PALETTES, a ; do we have alt palettes enabled
	jr nz, .altPalettes
	ld hl, .didYouTrySafariText
	jr .done
.altPalettes
	ld hl, .didYouTrySafariPromptText
	rst _PrintText
	ld hl, .manyHaveUniqueColorsText
.done
	rst _PrintText
	rst TextScriptEnd

.didYouTrySafariText:
	text_far _FuchsiaCityYoungster1Text
	text_end

.didYouTrySafariPromptText:
	text_far _FuchsiaCityYoungster1Text
	text_promptbutton
	text_end

.manyHaveUniqueColorsText:
	text_far _FuchsiaCityYoungster1TextColor
	text_end

FuchsiaCityGamblerText:
	text_far _FuchsiaCityGamblerText
	text_end

; PureRGBnote: CHANGED: ERIK can be sent off to find SARA once you find her in the SAFARI ZONE.
FuchsiaCityErikText:
	text_far _FuchsiaCityErikText
	text_asm
	SetEvent EVENT_MET_ERIK
	CheckEvent EVENT_MET_SARA
	jr z, .notMet
	call DisplayTextPromptButton
	ld hl, .ohShesInSafariZone
	rst _PrintText
	call .checkTreeBlockPresent
	jr z, .treePresent
	ld a, [wXCoord]
	cp 29
	ld de, ErikLeavesNoTreeLeft
	jr z, .gotDirections
	cp 30
	ld de, ErikLeavesNoTreeDown
	jr z, .gotDirections
	ld de, ErikLeavesNoTreeRight
	jr .gotDirections
.treePresent
	ld a, [wXCoord]
	cp 29
	ld de, ErikLeavesTreeLeft
	jr z, .gotDirections
	cp 30
	ld de, ErikLeavesTreeDown
	jr z, .gotDirections
	ld de, ErikLeavesTreeRight
	jr .gotDirections
.gotDirections
	ld hl, wNPCMovementDirections2
	call DecodeRLEList
	SetEvent EVENT_ERIK_LEAVING
	ld a, FUCHSIACITY_ERIK
	ldh [hSpriteIndex], a
	ld de, wNPCMovementDirections2
	callfar MoveSpriteButAllowAOrBPress
.notMet
	rst TextScriptEnd
.ohShesInSafariZone
	text_far _ErikSaraInSafariZoneText
	text_end
.checkTreeBlockPresent
	ld a, [wXCoord]
	cp 29
	lb de, 1, 1
	jr z, .gotBlock
	lb de, 0, 1
.gotBlock
	callfar GetBlockAtCoord
	ld a, d
	cp $60 ; tree block
	ret

ErikLeavesNoTreeLeft:
	db NPC_MOVEMENT_DOWN, 1
	db NPC_MOVEMENT_LEFT, 4
	db NPC_MOVEMENT_UP, 5
	db -1

ErikLeavesNoTreeDown:
	db NPC_MOVEMENT_LEFT, 4
	db NPC_MOVEMENT_UP, 3
	db -1

ErikLeavesNoTreeRight:
	db NPC_MOVEMENT_LEFT, 3
	db -1

ErikLeavesTreeLeft:
	db NPC_MOVEMENT_RIGHT, 5
	db -1

ErikLeavesTreeDown:
	db NPC_MOVEMENT_RIGHT, 5
	db NPC_MOVEMENT_UP, 3
	db -1

ErikLeavesTreeRight:
	db NPC_MOVEMENT_DOWN, 1
	db NPC_MOVEMENT_RIGHT, 5
	db NPC_MOVEMENT_UP, 5
	db -1

FuchsiaCityYoungster2Text:
	text_asm
	ld hl, .Text
	rst _PrintText
;;;;;;;;;; PureRGBnote: ADDED: the voltorb will now move while talking to this NPC (but only if OGPlus icons option is turned on)
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	jr z, .done
	ld de, vChars0 + VOLTORB_POKEBALL_TILE1
	callfar LoadVoltorbSprite
	ld c, 10
	rst _DelayFrames
	ld hl, vChars0 + VOLTORB_POKEBALL_TILE1
	ld de, PokeBallSprite
	lb bc, BANK(PokeBallSprite), 4
	call CopyVideoData
.done
;;;;;;;;;;
	rst TextScriptEnd
.Text:
	text_far _FuchsiaCityYoungster2Text
	text_end

FuchsiaCityPokemonText:
	text_far _FuchsiaCityPokemonText
	text_end

FuchsiaCitySignText:
	text_far _FuchsiaCitySignText
	text_end

FuchsiaCitySafariGameSignText:
	text_far _FuchsiaCitySafariGameSignText
	text_end

FuchsiaCityWardensHomeSignText:
	text_far _FuchsiaCityWardensHomeSignText
	text_end

FuchsiaCitySafariZoneSignText:
	text_far _FuchsiaCitySafariZoneSignText
	text_end

FuchsiaCityGymSignText:
	text_far _FuchsiaCityGymSignText
	text_end

FuchsiaCityChanseySignText:
	text_asm
	ld hl, .Text
	rst _PrintText
	ld a, CHANSEY
	call DisplayPokedex
	rst TextScriptEnd

.Text:
	text_far _FuchsiaCityChanseySignText
	text_end

FuchsiaCityVoltorbSignText:
	text_asm
	ld hl, .Text
	rst _PrintText
	ld a, VOLTORB
	call DisplayPokedex
	rst TextScriptEnd

.Text:
	text_far _FuchsiaCityVoltorbSignText
	text_end

FuchsiaCityKangaskhanSignText:
	text_asm
	ld hl, .Text
	rst _PrintText
	ld a, KANGASKHAN
	call DisplayPokedex
	rst TextScriptEnd

.Text:
	text_far _FuchsiaCityKangaskhanSignText
	text_end

FuchsiaCitySlowpokeSignText:
	text_asm
	ld hl, .Text
	rst _PrintText
	ld a, SLOWPOKE
	call DisplayPokedex
	rst TextScriptEnd

.Text:
	text_far _FuchsiaCitySlowpokeSignText
	text_end

FuchsiaCityLaprasSignText:
	text_asm
	ld hl, .Text
	rst _PrintText
	ld a, LAPRAS
	call DisplayPokedex
	rst TextScriptEnd

.Text:
	text_far _FuchsiaCityLaprasSignText
	text_end

FuchsiaCityFossilSignText:
	text_asm
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr nz, .got_dome_fossil
	CheckEventReuseA EVENT_GOT_HELIX_FOSSIL
	jr nz, .got_helix_fossil
	ld hl, .UndeterminedText
	rst _PrintText
	jr .done
.got_dome_fossil
	ld hl, .OmanyteText
	rst _PrintText
	ld a, OMANYTE
	jr .display
.got_helix_fossil
	ld hl, .KabutoText
	rst _PrintText
	ld a, KABUTO
.display
	call DisplayPokedex
.done
	rst TextScriptEnd

.OmanyteText:
	text_far _FuchsiaCityFossilSignOmanyteText
	text_end

.KabutoText:
	text_far _FuchsiaCityFossilSignKabutoText
	text_end

.UndeterminedText:
	text_far _FuchsiaCityFossilSignUndeterminedText
	text_end

FuchsiaCityFossilFanText:
	text_asm
	CheckEvent EVENT_FOSSIL_FAN_TEXT_TOGGLE
	jr nz, .moveFossil
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a 
	jr z, .noEvent
	CheckEitherEventSet EVENT_GOT_HELIX_FOSSIL, EVENT_GOT_DOME_FOSSIL
	jr z, .noEvent
	ld hl, FuchsiaCityFossilFanText1Prompt
	rst _PrintText
	ld hl, FuchsiaCityFossilFanText2
	rst _PrintText
	SetEvent EVENT_FOSSIL_FAN_TEXT_TOGGLE
	jr .done
.moveFossil
	ResetEvent EVENT_FOSSIL_FAN_TEXT_TOGGLE
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a 
	jr z, .noEvent
	call ShowFossilPokemon
	ld a, 11
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
	ld hl, FuchsiaCityFossilFanText3
	rst _PrintText
	ld c, 20
	rst _DelayFrames
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	call UpdateSprites
	call MoveFossilPokemon
  	jr .done
.noEvent
	ld hl, FuchsiaCityFossilFanText1
	rst _PrintText
.done
	rst TextScriptEnd

FuchsiaCityFossilFanText1:
	text_far _FuchsiaCityFossilFanText
	text_end

FuchsiaCityFossilFanText1Prompt:
	text_far _FuchsiaCityFossilFanText
	text_promptbutton
	text_end

FuchsiaCityFossilFanText2:
	text_far _FuchsiaCityFossilFanText2
	text_end

FuchsiaCityFossilFanText3:
	text_far _FuchsiaCityFossilFanText3
	text_end

GetFossilSpriteData:
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	jr nz, .domeFossil
	ld de, PartyMonSprites1 tile 16
	lb bc, BANK(PartyMonSprites1), 4
	jr .showSprite
.domeFossil
	ld de, PartyMonSprites2 tile 64
	lb bc, BANK(PartyMonSprites2), 4
.showSprite
	ld hl, vSprites tile FUCHSIA_OMANYTE_KABUTO_FOSSIL_TILE
	ret

ShowFossilPokemon:
	call GetFossilSpriteData
	predef_jump CopyMenuSpritesVideoDataFar

GetOmanyteSpriteDataFrame2:
	ld de, PartyMonSprites1 tile 18
	lb bc, BANK(PartyMonSprites1), 4
	ld hl, vSprites tile FUCHSIA_OMANYTE_KABUTO_FOSSIL_TILE
	ret

MoveFossilPokemon:
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	jr nz, .hideKabuto
	; omanyte will wiggle a bit before hiding
	ld a, 4
	push af
	; make it move a bit by alternating frames
.loop
	call GetFossilSpriteData
	predef CopyMenuSpritesVideoDataFar
	call Delay3
	call GetOmanyteSpriteDataFrame2
	predef CopyMenuSpritesVideoDataFar
	call Delay3
	pop af
	dec a
	push af
	jr nz, .loop
	pop af
.hideOmanyte
	ld de, FossilSprite
	lb bc, BANK(FossilSprite), 4
	ld hl, vSprites tile FUCHSIA_OMANYTE_KABUTO_FOSSIL_TILE
	jp CopyVideoData
.hideKabuto:
	ld c, 20
	rst _DelayFrames
	jp LoadKabutoShellSprite