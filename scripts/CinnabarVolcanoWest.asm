; PureRGBnote: ADDED: Map where you can power up your MAGMAR. Wanted it to be combined with CINNABAR_VOLCANO but the map was too big to fit
; everything so had to split them into two maps.
CinnabarVolcanoWest_Script:
	ld hl, wCurrentMapScriptFlags
	res BIT_CUR_MAP_LOADED_1, [hl]
	call CheckStartMagmarTransform
	callfar CheckForceSurfDirection
	jp EnableAutoTextBoxDrawing
	
CinnabarVolcanoWest_TextPointers:
	def_text_pointers
	dw_const CinnabarVolcanoWestMagmar1Text,  TEXT_CINNABAR_VOLCANO_WEST_MAGMAR1
	dw_const CinnabarVolcanoWestMagmar2Text,  TEXT_CINNABAR_VOLCANO_WEST_MAGMAR2
	dw_const CinnabarVolcanoWestMagmar3Text,  TEXT_CINNABAR_VOLCANO_WEST_MAGMAR3
	dw_const CinnabarVolcanoWestMagmar2Text,  TEXT_CINNABAR_VOLCANO_WEST_MAGMAR4
	dw_const CinnabarVolcanoWestMagmar3Text,  TEXT_CINNABAR_VOLCANO_WEST_MAGMAR5
	dw_const CinnabarVolcanoMagmarTransformText,  TEXT_CINNABAR_VOLCANO_WEST_PROXY_POKEMON
	dw_const CinnabarVolcanoWestLavaFlowText, TEXT_CINNABAR_VOLCANO_WEST_LAVA_FLOW
	dw_const CinnabarVolcanoMagmarTransformText2, TEXT_CINNABAR_VOLCANO_MAGMAR_TRANSFORM2

CinnabarVolcanoWestMagmar1Text:
	text_far _CinnabarVolcanoWestMagmar1Text
	text_asm
	ld a, MAGMAR
	call PlayCry
	ld a, [wYCoord]
	cp 4
	jr nz, .done
	call DisplayTextPromptButton
	ld hl, .roomForOneMore
	rst _PrintText
	callfar GenericShowPartyMenuSelection
	ld hl, .forgetIt
	jr c, .printDone
	call GetPartyMonName2
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Species
 	ld bc, wPartyMon2 - wPartyMon1
  	call AddNTimes
  	ld a, [hl]
  	cp VOLCANIC_MAGMAR
  	ld hl, .already
  	jr z, .printDone
  	cp MAGMAR
  	ld hl, .wrongMon
  	jr nz, .printDone
  	ld d, D_RIGHT
	callfar ForceStepFromDoor
	SetEvent EVENT_MAGMAR_TRANSFORMATION
  	ld hl, .lavaBath
.printDone
	rst _PrintText
.done
	rst TextScriptEnd
.roomForOneMore
	text_far _CinnabarVolcanoWestMagmar1QuestionText
	text_end
.forgetIt
	text_far _GenericForgetItText
	text_end
.wrongMon
	text_far _SecretLabMewtwoReactionText4
	text_end
.already
	text_far _MagmarEventAlready
	text_end
.lavaBath
	text_far _CinnabarVolcanoWestMagmarTransformText1
	text_end

CinnabarVolcanoWestMagmar2Text:
	text_far _CinnabarVolcanoWestMagmar2Text
	text_asm
CinnabarVolcanoWestMagmarCryEnd:
	ld a, MAGMAR
	call PlayCry
	rst TextScriptEnd

CinnabarVolcanoWestMagmar3Text:
	text_far _CinnabarVolcanoWestMagmar3Text
	text_asm
	jr CinnabarVolcanoWestMagmarCryEnd

CinnabarVolcanoWestLavaFlowText:
	text_far _CinnabarVolcanoWestLavaFlowText
	text_end

CheckStartMagmarTransform:
	ld a, [wMovementFlags]
	bit BIT_EXITING_DOOR, a
	ret nz
	CheckAndResetEvent EVENT_MAGMAR_TRANSFORMATION
	ret z
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	; move proxy pokemon sprite to above player
	lb de, 0, -1
	ld c, CINNABAR_VOLCANO_WEST_PROXY_POKEMON
	callfar FarMoveSpriteInRelationToPlayer
	call UpdateSprites
	; ball poof
	call .magmarBallPoof
	; monster sprite
	ld de, MonsterSprite
	lb bc, BANK(MonsterSprite), 4
	call .copyMonsterSprite
	ld c, 8
	rst _DelayFrames
	ld de, SFX_Lava_Splash
	call PlayNewSoundChannel8
	; disappeared ghost sprite frame 2
	ld de, GhostSprite tile 8
	call .copyGhostSprite
	; disappeared ghost sprite frame 1
	ld de, GhostSprite tile 4
	call .copyGhostSprite
	; monster swimming sprite
	ld de, MonsterSwimmingSprite
	lb bc, BANK(MonsterSwimmingSprite), 4
	call .copyMonsterSprite
	; monster blinking sprite
	ld b, 5
.loop
	push bc
	ld de, MonsterBlinkingSprite
	lb bc, BANK(MonsterBlinkingSprite), 2
	ld a, 3
	call .copyMonsterSpriteArbitraryDelay
	ld de, MonsterSwimmingSprite
	lb bc, BANK(MonsterSwimmingSprite), 2
	ld a, 3
	call .copyMonsterSpriteArbitraryDelay
	pop bc
	dec b
	jr nz, .loop
	ld a, TEXT_CINNABAR_VOLCANO_WEST_PROXY_POKEMON
	ldh [hTextID], a
	call DisplayTextID
	ld c, 60
	rst _DelayFrames
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	ld de, SFX_Fire_Powerup
	call PlayNewSoundChannel8
	ld de, MonsterSwimmingSprite tile 12
	lb bc, BANK(MonsterSwimmingSprite), 4
	ld a, 1
	call CheckStartMagmarTransform.copyMonsterSpriteArbitraryDelay
	call GBFadeOutToWhite
	ld c, 30
	rst _DelayFrames
	call GBFadeInFromWhite
	ld a, TEXT_CINNABAR_VOLCANO_MAGMAR_TRANSFORM2
	ldh [hTextID], a
	call DisplayTextID
	ld de, MonsterSwimmingSprite
	lb bc, BANK(MonsterSwimmingSprite), 4
	call .copyMonsterSprite
	xor a
	ld [wMuteAudioAndPauseMusic], a
	ld a, VOLCANIC_MAGMAR
	ld [wCurPartySpecies], a
	callfar ChangePartyPokemonSpecies
	ld c, 60
	rst _DelayFrames
	call .magmarBallPoof
	ld de, NothingSprite
	lb bc, BANK(NothingSprite), 4
	call .copyMonsterSprite
	ld c, CINNABAR_VOLCANO_WEST_PROXY_POKEMON
	lb de, 0, 19
	callfar FarMoveSpriteOffScreen
	jp UpdateSprites
.copyGhostSprite
	lb bc, BANK(GhostSprite), 4
.copyMonsterSprite
	ld a, 8
.copyMonsterSpriteArbitraryDelay
	push af
	ld hl, vNPCSprites tile $78
	call CopyVideoData
	pop af
	ld c, a
	rst _DelayFrames
	ret
.magmarBallPoof
	ld de, SFX_Volcano_Ball_Poof_Ch5
	call PlayNewSoundChannel5
	ld de, SFX_Volcano_Ball_Poof_Ch8
	call PlayNewSoundChannel8
	ld de, vNPCSprites tile $78
	callfar FarLoadSmokeTileFourTimes
	ld c, 5
	rst _DelayFrames
	ret

CinnabarVolcanoMagmarTransformText:
	text_far _CinnabarVolcanoWestMagmarTransformText2
	text_end


CinnabarVolcanoMagmarTransformText2:
	text_far _CinnabarVolcanoWestMagmarTransformText3
	sound_get_item_2
	text_far _CinnabarVolcanoWestMagmarTransformText4
	text_end