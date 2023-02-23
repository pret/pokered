DEF OMANYTE_KABUTO_FOSSIL_TILE EQU $7C0

FuchsiaCity_Script:
	call TryLoadKabutoSprite
	call FuchsiaReplaceCutTiles
	jp EnableAutoTextBoxDrawing

; PureRGBnote: ADDED: function that will remove all cut trees in fuchsia if we deleted them with the tree deleter
FuchsiaReplaceCutTiles:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl] ; did we load the map from a save/warp/door/battle, etc?
	res 5, [hl]
	jr nz, .removeAddCutTiles
	bit 4, [hl] ; did we enter the map by traversal from another route
	res 4, [hl]
	jr nz, .removeAddCutTilesNoRedraw
	ret
.removeAddCutTiles
	ResetEvent EVENT_FOSSIL_FAN_TEXT_TOGGLE ; this is just a good place to clear this event so the guy says the first text every time you reload the area.
	CheckEvent EVENT_DELETED_FUCHSIA_TREES
	jr nz, .remove
.add
	ld a, $60
	ld [wNewTileBlockID], a
	lb bc, 6, 13
	predef ReplaceTileBlock
	lb bc, 3, 11
	predef ReplaceTileBlock
	ret
.remove
	ld a, $6E
	ld [wNewTileBlockID], a
	lb bc, 9, 9
	predef ReplaceTileBlock
	lb bc, 5, 8
	predef ReplaceTileBlock
	ret
.removeAddCutTilesNoRedraw
	; this avoids redrawing the map because when going between areas these tiles are offscreen.
	ResetEvent EVENT_FOSSIL_FAN_TEXT_TOGGLE ; this is just a good place to clear this event so the guy says the first text every time you reload the area.
	CheckEvent EVENT_DELETED_FUCHSIA_TREES
	jr nz, .removeNoRedraw
.addNoRedraw
	ld a, $60
	ld [wNewTileBlockID], a
	lb bc, 6, 13
	predef ReplaceTileBlockNoRedraw
	lb bc, 3, 11
	predef ReplaceTileBlockNoRedraw
	ret
.removeNoRedraw
	ld a, $6E
	ld [wNewTileBlockID], a
	lb bc, 9, 9
	predef ReplaceTileBlockNoRedraw
	lb bc, 5, 8
	predef ReplaceTileBlockNoRedraw
	ret

; PureRGBnote: ADDED: since we don't have enough space in the sprite sheet to add kabuto's icon, 
; we just replace omanyte's with it when loading fuchsia city if kabuto is supposed to be in the zoo
TryLoadKabutoSprite:
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ret z
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	ret z
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl] ; did we load the map from a save/warp/door/battle, etc?
	jr nz, ReplaceOmanyteWithKabutoSprite
	bit 4, [hl] ; did we enter the map by traversal from another route
	jr nz, ReplaceOmanyteWithKabutoSprite
	CheckEvent EVENT_RELOADED_KABUTO_SPRITE
	ret nz
	call ReplaceOmanyteWithKabutoSprite
	SetEvent EVENT_RELOADED_KABUTO_SPRITE
	ret
	
ReplaceOmanyteWithKabutoSprite::
	ld hl, vChars0 + OMANYTE_KABUTO_FOSSIL_TILE
	ld de, KabutoSprite
	lb bc, BANK(KabutoSprite), (KabutoSpriteEnd - KabutoSprite) / $10
	call CopyVideoData
	ret


FuchsiaCity_TextPointers:
	dw FuchsiaCityText1
	dw FuchsiaCityText2
	dw FuchsiaCityText3
	dw FuchsiaCityText4
	dw FuchsiaCityText5
	dw FuchsiaCityText6
	dw FuchsiaCityText7
	dw FuchsiaCityText8
	dw FuchsiaCityText9
	dw FuchsiaCityText10
	dw FuchsiaCityFossilFanText
	dw FuchsiaCityText11
	dw FuchsiaCityText12
	dw FuchsiaCityText13
	dw MartSignText
	dw PokeCenterSignText
	dw FuchsiaCityText16
	dw FuchsiaCityText17
	dw FuchsiaCityText18
	dw FuchsiaCityText19
	dw FuchsiaCityText20
	dw FuchsiaCityText21
	dw FuchsiaCityText22
	dw FuchsiaCityText23
	dw FuchsiaCityText24

; PureRGBnote: CHANGED: this NPC will point out how alt palette pokemon appear in the safari zone
; but only if we have alt palette pokemon enabled in the game options.
FuchsiaCityText1: 
	text_asm
	ld a, [wOptions2]
	bit BIT_ALT_PKMN_PALETTES, a ; do we have alt palettes enabled
	jr nz, .altPalettes
	ld hl, FuchsiaCityText1Start
	jr .done
.altPalettes
	ld hl, FuchsiaCityText1StartPrompt
	call PrintText
	ld hl, FuchsiaCityText1Color
.done
	call PrintText
	rst TextScriptEnd


FuchsiaCityText1Start:
	text_far _FuchsiaCityText1
	text_end

FuchsiaCityText1StartPrompt:
	text_far _FuchsiaCityText1
	text_promptbutton
	text_end

FuchsiaCityText1Color:
	text_far _FuchsiaCityText1Color
	text_end


FuchsiaCityText2:
	text_far _FuchsiaCityText2
	text_end

FuchsiaCityText3:
	text_far _FuchsiaCityText3
	text_end

FuchsiaCityText4:
	text_asm
	ld hl, FuchsiaCityText4raw
	call PrintText
;;;;;;;;;; PureRGBnote: ADDED: the voltorb will now move while talking to this NPC (but only if OGPlus icons option is turned on)
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	jr z, .done
	ld de, vChars0 + VOLTORB_POKEBALL_TILE1
	callfar LoadVoltorbSprite
	ld c, 10
	rst DelayFramesRST
	ld hl, vChars0 + VOLTORB_POKEBALL_TILE1
	ld de, PokeBallSprite
	lb bc, BANK(PokeBallSprite), (PokeBallSpriteEnd - PokeBallSprite) / $10
	call CopyVideoData
.done
;;;;;;;;;;
	rst TextScriptEnd

FuchsiaCityText4raw:
	text_far _FuchsiaCityText4
	text_end

FuchsiaCityText5:
FuchsiaCityText6:
FuchsiaCityText7:
FuchsiaCityText8:
FuchsiaCityText9:
FuchsiaCityText10:
	text_far _FuchsiaCityText5
	text_end

FuchsiaCityText12:
FuchsiaCityText11:
	text_far _FuchsiaCityText11
	text_end

FuchsiaCityText13:
	text_far _FuchsiaCityText13
	text_end

FuchsiaCityText16:
	text_far _FuchsiaCityText16
	text_end

FuchsiaCityText17:
	text_far _FuchsiaCityText17
	text_end

FuchsiaCityText18:
	text_far _FuchsiaCityText18
	text_end

FuchsiaCityText19:
	text_asm
	ld hl, FuchsiaCityChanseyText
	call PrintText
	ld a, CHANSEY
	call DisplayPokedex
	rst TextScriptEnd

FuchsiaCityChanseyText:
	text_far _FuchsiaCityChanseyText
	text_end

FuchsiaCityText20:
	text_asm
	ld hl, FuchsiaCityVoltorbText
	call PrintText
	ld a, VOLTORB
	call DisplayPokedex
	rst TextScriptEnd

FuchsiaCityVoltorbText:
	text_far _FuchsiaCityVoltorbText
	text_end

FuchsiaCityText21:
	text_asm
	ld hl, FuchsiaCityKangaskhanText
	call PrintText
	ld a, KANGASKHAN
	call DisplayPokedex
	rst TextScriptEnd

FuchsiaCityKangaskhanText:
	text_far _FuchsiaCityKangaskhanText
	text_end

FuchsiaCityText22:
	text_asm
	ld hl, FuchsiaCitySlowpokeText
	call PrintText
	ld a, SLOWPOKE
	call DisplayPokedex
	rst TextScriptEnd

FuchsiaCitySlowpokeText:
	text_far _FuchsiaCitySlowpokeText
	text_end

FuchsiaCityText23:
	text_asm
	ld hl, FuchsiaCityLaprasText
	call PrintText
	ld a, LAPRAS
	call DisplayPokedex
	rst TextScriptEnd

FuchsiaCityLaprasText:
	text_far _FuchsiaCityLaprasText
	text_end

FuchsiaCityText24:
	text_asm
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr nz, .asm_3b4e8
	CheckEventReuseA EVENT_GOT_HELIX_FOSSIL
	jr nz, .asm_667d5
	ld hl, FuchsiaCityText_19b2a
	call PrintText
	jr .asm_4343f
.asm_3b4e8
	ld hl, FuchsiaCityOmanyteText
	call PrintText
	ld a, OMANYTE
	jr .asm_81556
.asm_667d5
	ld hl, FuchsiaCityKabutoText
	call PrintText
	ld a, KABUTO
.asm_81556
	call DisplayPokedex
.asm_4343f
	rst TextScriptEnd

FuchsiaCityOmanyteText:
	text_far _FuchsiaCityOmanyteText
	text_end

FuchsiaCityKabutoText:
	text_far _FuchsiaCityKabutoText
	text_end

FuchsiaCityText_19b2a:
	text_far _FuchsiaCityText_19b2a
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
	call PrintText
	ld hl, FuchsiaCityFossilFanText2
	call PrintText
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
	call PrintText
	ld c, 20
	rst DelayFramesRST
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	call UpdateSprites
	call MoveFossilPokemon
  	jr .done
.noEvent
	ld hl, FuchsiaCityFossilFanText1
	call PrintText
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
	ld de, OmanyteSprite
	lb bc, BANK(OmanyteSprite), (OmanyteSpriteEnd - OmanyteSprite) / $10
	jr .showSprite
.domeFossil
	ld de, KabutoSpriteFrame2
	lb bc, BANK(KabutoSpriteFrame2), (KabutoSpriteFrame2End - KabutoSpriteFrame2) / $10
.showSprite
	ld hl, vChars0 + OMANYTE_KABUTO_FOSSIL_TILE
	ret

ShowFossilPokemon:
	call GetFossilSpriteData
	call CopyVideoData
	ret

GetOmanyteSpriteDataFrame2:
	ld de, OmanyteSpriteFrame2
	lb bc, BANK(OmanyteSpriteFrame2), (OmanyteSpriteFrame2End - OmanyteSpriteFrame2) / $10
	ld hl, vChars0 + OMANYTE_KABUTO_FOSSIL_TILE
	ret

MoveFossilPokemon:
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	jr nz, HideKabuto
	; omanyte will wiggle a bit before hiding
	ld a, 4
	push af
	; make it move a bit by alternating frames
.loop
	call GetFossilSpriteData
	call CopyVideoData
	call Delay3
	call GetOmanyteSpriteDataFrame2
	call CopyVideoData
	call Delay3
	pop af
	dec a
	push af
	jr nz, .loop
	pop af
.hideOmanyte
	ld de, FossilSprite
	lb bc, BANK(FossilSprite), (FossilSpriteEnd - FossilSprite) / $10
	jr RunHide
	
HideKabuto:
	ld c, 20
	rst DelayFramesRST
	ld de, KabutoSprite
	lb bc, BANK(KabutoSprite), (KabutoSpriteEnd - KabutoSprite) / $10
	; fall through
RunHide:
	ld hl, vChars0 + OMANYTE_KABUTO_FOSSIL_TILE
	call CopyVideoData
	ret
