; PureRGBnote: ADDED: in this file, events for having tea with DAISY were added.
BluesHouse_Script:
	call EnableAutoTextBoxDrawing
	ld hl, BluesHouse_ScriptPointers
	ld a, [wBluesHouseCurScript]
	and %1111
	jp CallFunctionInTable

BluesHouse_ScriptPointers:
	dw BluesHouseScript0
	dw BluesHouseScript1

BluesHouseScript0:
	SetEvent EVENT_ENTERED_BLUES_HOUSE
	ld a, [wBluesHouseCurScript]
	and %11110000 ; left 4 bits are which tea daisy will make, right 4 bits are the current script
	or 1 ; we want the current script to be set to 1
	ld [wBluesHouseCurScript], a
	ret

BluesHouseScript1:
	ld a, [wBluesHouseCurScript]
	bit 7, a ; bit 7 is set when she's waiting for you to sit down
	ret z
	ld hl, OnExitCoords
	call ArePlayerCoordsInArray
	jr c, .clearWaiting
	ld hl, OnSeatCoords
	call ArePlayerCoordsInArray
	ret nc
	ld a, 4
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID	
.clearWaiting
	; if you go to leave the house, it'll stop her from waiting for you to sit down.
	ld hl, wBluesHouseCurScript
	res 7, [hl]
	ret

OnSeatCoords:
	dbmapcoord  2,  4
	dbmapcoord  5,  3
	dbmapcoord  5,  4
	db -1 ; end

OnExitCoords:
	dbmapcoord 2, 7
	dbmapcoord 3, 7
	db -1

BluesHouse_TextPointers:
	dw BluesHouseDaisySittingText
	dw BluesHouseDaisyWalkingText
	dw BluesHouseTownMapText
	dw BluesHouseTeaText

BluesHouseDaisySittingText:
	text_asm
	CheckEvent EVENT_GOT_TOWN_MAP
	jr nz, .got_town_map
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .give_town_map
	ld hl, DaisyInitialText
	rst _PrintText
	rst TextScriptEnd

.give_town_map
	ld hl, DaisyOfferMapText
	rst _PrintText
;	lb bc, TOWN_MAP, 1
;	call GiveItem ; PureRGBnote: CHANGED: TOWN MAP is not treated as a bag item, pressing SELECT in the pokedex will open it after having received it from daisy.
;	jr nc, .bag_full
	ld a, HS_TOWN_MAP
	ld [wMissableObjectIndex], a
	predef HideObject
	ld hl, GotMapText
	rst _PrintText
	SetEvent EVENT_GOT_TOWN_MAP
	ld hl, MapHelpText
	rst _PrintText
	rst TextScriptEnd

.got_town_map
	CheckEvent EVENT_CALLED_RIVAL_FROM_CELADON
	jr nz, .teaWithDaisy
	ld hl, DaisyUseMapText
	rst _PrintText
	rst TextScriptEnd

;.bag_full
;	ld hl, DaisyBagFullText
;	rst _PrintText	
.teaWithDaisy
	ld hl, DaisyTeaEvent
	rst _PrintText
	xor a
	ld [wCurrentMenuItem], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, DaisyTeaEventNo
	jr nz, .done
	; check if player is on sitting coord next to her
	ld hl, OnSeatCoords
	call ArePlayerCoordsInArray
	jr nc, .sitDown
	hlcoord 1, 14
	lb bc, 3, 18
	call ClearScreenArea
	call BluesHouseTeaEvent
	rst TextScriptEnd
.sitDown
	ld hl, wBluesHouseCurScript
	set 7, [hl]
	ld hl, DaisyTeaSitDown
.done
	rst _PrintText
	rst TextScriptEnd

BluesHouseTeaText:
	text_asm
	ld a, [wXCoord]
	cp 2
	jr nz, .startEvent
	; if the player chose to sit beside daisy (after talking to her while not sitting next to her), make her blink in surprise
	; make daisy face down
	ld a, 1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_DOWN
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	call UpdateSprites
  	; make daisy blink
  	call DaisyBlink
.startEvent
	call BluesHouseTeaEvent
	rst TextScriptEnd

BluesHouseTeaEvent:
	call SaveScreenTilesToBuffer2
	ld a, [wXCoord]
	cp 2
	jr z, .besideDaisy
	; face left
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	; make daisy face right
	ld a, 1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_RIGHT
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	call .todaysTeaMessage
	jr .drinkTea
.besideDaisy
	; face up
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
  	call .todaysTeaMessage
  	; make both face right
	ld a, 1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_RIGHT
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	call UpdateSprites
	ld c, 10
	rst _DelayFrames
.drinkTea
	; fade to white
	call GBFadeOutToWhite
	ld c, 60
	rst _DelayFrames
	call ClearScreen
	ld hl, TextScriptEndingText
	rst _PrintText ; seemingly the only way of preventing sprites from flickering on the screen during the next printText
	call GBPalNormal
	ld hl, TeaDrink
	rst _PrintText
	ld a, SFX_WITHDRAW_DEPOSIT
	call PlaySoundWaitForCurrent
	ld c, 30
	rst _DelayFrames
	ld a, SFX_WITHDRAW_DEPOSIT
	rst _PlaySound
	ld c, 30
	rst _DelayFrames
	ld a, SFX_WITHDRAW_DEPOSIT
	rst _PlaySound
	ld c, 30
	rst _DelayFrames
	; store a party pokemon's nickname to use later in the text
	ld a, [wPartyCount]
	cp 6 ; if they player has less than 6 pokemon just use the first pokemon
	ld a, 0
	jr nz, .firstPokemon
.random ; otherwise randomize it between any of the 6
	call Random
	and %111
	cp 6
	jr nc, .random
.firstPokemon
	push af
	ld hl, wPartyMonNicks
	call GetPartyMonName
	; talk about a pokemon's reaction to daisy
	ld hl, TeaReaction
	rst _PrintText
	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1
	pop af
	call AddNTimes
	call WaitForSoundToFinish
	ld a, [hl] ; species
	call PlayCry
	call WaitForSoundToFinish
	ld c, 30
	rst _DelayFrames
	call ClearScreen
	callfar MomHealPokemonImmediate
	ld hl, vChars2 tile $36
	ld de, House_GFX tile $36
	lb bc, BANK(House_GFX), 1
	call CopyVideoData
	call LoadScreenTilesFromBuffer2
	ld a, [wXCoord]
	cp 2
	jr nz, .skipFaceUp
	; make player face up
	ld a, PLAYER_DIR_UP
	ld [wPlayerMovingDirection], a
	; make daisy face down again
	ld a, 1
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_DOWN
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
.skipFaceUp
	call UpdateSprites
	call GBFadeInFromWhite
	; daisy says time to go
	ld hl, DaisyTeaEnd
	rst _PrintText
	ret
.todaysTeaMessage
	ld hl, vChars2 tile $36
	ld de, TeaTile
	lb bc, BANK(TeaTile), 1
	call CopyVideoData

	ld a, SFX_NOISE_INSTRUMENT19
	rst _PlaySound

	ld a, [wBluesHouseCurScript]
	res 7, a ; clear the "waiting for player to sit down" bit
	and %11110000
	swap a
	cp 3
	jr nz, .useValue
	xor a ; go back to first tea type
.useValue
	ld e, a
	inc a ; next tea will be the next type
	swap a
	set 0, a ; go back to script #1
	ld [wBluesHouseCurScript], a
	sla e ; multiply e by 2
	ld d, 0
	ld hl, TeaTextPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl = which text to print
	rst _PrintText
	ret

PlayerDaisyFacingEachOther:
	

DaisyBlink:
  	ld c, 20
  	rst _DelayFrames
	ld a, 3
.loop
	push af
 	ld hl, vChars0 tile $0C
 	ld de, DaisyBlinkingSprite
 	lb bc, BANK(DaisyBlinkingSprite), 2
 	call CopyVideoData
 	ld c, 5
 	rst _DelayFrames
 	ld hl, vChars0 tile $0C
 	ld de, DaisySprite
 	lb bc, BANK(DaisySprite), 2
 	call CopyVideoData
 	ld c, 5
 	rst _DelayFrames
 	pop af
 	dec a
 	jr nz, .loop
 	ld c, 80
 	rst _DelayFrames
 	ret


TeaTextPointers:
	dw DaisyTeaBarley
	dw DaisyTeaPeppermint
	dw DaisyTeaChai

DaisyInitialText:
	text_far _DaisyInitialText
	text_end

DaisyOfferMapText:
	text_far _DaisyOfferMapText
	text_end

GotMapText:
	text_far _GotMapText
	sound_get_key_item
	text_end

MapHelpText:
	text_far _MapHelpText
	text_end

DaisyBagFullText:
	text_far _DaisyBagFullText
	text_end

DaisyUseMapText:
	text_far _DaisyUseMapText
	text_end

BluesHouseDaisyWalkingText:
	text_far _BluesHouseDaisyWalkingText
	text_end

BluesHouseTownMapText:
	text_far _BluesHouseTownMapText
	text_end

DaisyTeaEvent:
	text_far _DaisyTeaEvent
	text_end
	
DaisyTeaEventNo:
	text_far _DaisyTeaEventNo
	text_end

DaisyTeaBarley:
	text_far _DaisyTeaBarley
	text_end

DaisyTeaPeppermint:
	text_far _DaisyTeaPeppermint
	text_end

DaisyTeaChai:
	text_far _DaisyTeaChai
	text_end

DaisyTeaSitDown:
	text_far _DaisyTeaSitDown
	text_end

TeaDrink:
	text_far _TeaDrink
	text_end

TeaReaction:
	text_far _TeaReaction
	text_end

DaisyTeaEnd:
	text_far _DaisyTeaEnd
	text_end