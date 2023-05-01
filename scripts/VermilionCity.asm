VermilionCity_Script:
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	push hl
	call nz, .initCityScript
	pop hl
	bit 5, [hl]
	res 5, [hl]
	call nz, .setFirstLockTrashCanIndex
	ld hl, VermilionCity_ScriptPointers
	ld a, [wVermilionCityCurScript]
	jp CallFunctionInTable

.setFirstLockTrashCanIndex
	call Random
	ldh a, [hRandomSub]
	and $e
	ld [wFirstLockTrashCanIndex], a
	ret

.initCityScript
	CheckEventHL EVENT_SS_ANNE_LEFT
	ret z
	CheckEventReuseHL EVENT_WALKED_PAST_GUARD_AFTER_SS_ANNE_LEFT
	SetEventReuseHL EVENT_WALKED_PAST_GUARD_AFTER_SS_ANNE_LEFT
	ret nz
	ld a, $2
	ld [wVermilionCityCurScript], a
	ret

VermilionCity_ScriptPointers:
	dw VermilionCityScript0
	dw VermilionCityScript1
	dw VermilionCityScript2
	dw VermilionCityScript3
	dw VermilionCityScript4

VermilionCityScript0:
	ld a, [wSpritePlayerStateData1FacingDirection]
	and a ; cp SPRITE_FACING_DOWN
	ret nz
	ld hl, SSAnneTicketCheckCoords
	call ArePlayerCoordsInArray
	ret nc
	xor a
	ldh [hJoyHeld], a
	ld [wcf0d], a
	ld a, $3
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, [wObtainedBadges] ; ship returns after obtaining the marsh badge
	bit 5, a
	jr nz, .default
	CheckEvent EVENT_SS_ANNE_LEFT
	jr nz, .shipHasDeparted
.default
	ld b, S_S_TICKET
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	ret nz
.shipHasDeparted
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wVermilionCityCurScript], a
	ret

SSAnneTicketCheckCoords:
	dbmapcoord 18, 30
	db -1 ; end

VermilionCityScript4:
	ld hl, SSAnneTicketCheckCoords
	call ArePlayerCoordsInArray
	ret c
	ld a, $0
	ld [wVermilionCityCurScript], a
	ret

VermilionCityScript2:
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesEnd + 1], a
	ld a, 2
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $3
	ld [wVermilionCityCurScript], a
	ret

VermilionCityScript3:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ldh [hJoyHeld], a
	ld a, $0
	ld [wVermilionCityCurScript], a
	ret

VermilionCityScript1:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld c, 10
	call DelayFrames
	ld a, $0
	ld [wVermilionCityCurScript], a
	ret

; New Pass script begins here
VermillionCityScript_GetPassesInBag:
; Gets a list of Passes in the player's bag.
; Ripped and modified from the fossil guy
	xor a
	ld [wFilteredBagItemsCount], a
	ld de, wFilteredBagItems
	ld hl, PassList
.loop
	ld a, [hli]
	and a
	jr z, .done
	push hl
	push de
	ld [wd11e], a
	ld b, a
	predef GetQuantityOfItemInBag
	pop de
	pop hl
	ld a, b
	and a
	jr z, .loop

	; A Pass is in the bag
	ld a, [wd11e]
	ld [de], a
	inc de
	push hl
	ld hl, wFilteredBagItemsCount
	inc [hl]
	pop hl
	jr .loop
.done
	ld a, $ff
	ld [de], a
	ret

PassList:
	db S_S_TICKET
	db OLD_SEA_MAP
	db CITRINE_PASS
	;db RAINBOW_PASS maybe someday
	db 0 ; end

PrintPassesInBag:
; Prints each pass in the player's bag on a separate line in the menu.
	ld hl, wFilteredBagItems
	xor a
	ldh [hItemCounter], a
.loop
	ld a, [hli]
	cp $ff
	ret z
	push hl
	ld [wd11e], a
	call GetItemName
	hlcoord 2, 2
	ldh a, [hItemCounter]
	ld bc, SCREEN_WIDTH * 2
	call AddNTimes
	ld de, wcd6d
	call PlaceString
	ld hl, hItemCounter
	inc [hl]
	pop hl
	jr .loop

PassListings:
	ld hl, VermillionCityPassSelectionText
	call PrintText
	call VermillionCityScript_GetPassesInBag
	ld hl, wd730
	set 6, [hl]
	xor a
	ld [wCurrentMenuItem], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, [wFilteredBagItemsCount]
	dec a
	ld [wMaxMenuItem], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
	ld a, [wFilteredBagItemsCount]
	dec a
	ld bc, 2
	ld hl, 3
	call AddNTimes
	dec l
	ld b, l
	ld c, $d
	hlcoord 0, 0
	call TextBoxBorder
	call UpdateSprites
	call PrintPassesInBag
	ld hl, wd730
	res 6, [hl]
	call HandleMenuInput
	bit BIT_B_BUTTON, a
	jr nz, .cancelledPass
	ld hl, wFilteredBagItems
	ld a, [wCurrentMenuItem]
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	ldh [hItemToRemoveID], a
	cp S_S_TICKET
	jr z, .choseSSAnne
	cp OLD_SEA_MAP
	jr z, .choseFaraway
	cp CITRINE_PASS
	jr z, .choseCitrine
; god bless the safari game and pokemon tower 7f for being the few times a forcewarp exists
; For some reason, these aren't working properly...
.choseSSAnne
	jp VermilionCityText3.playerHasTicket ; Saves time and less risk of bugs
.choseFaraway
	ld hl, EventVermillionCityOldSeaMap
	call PrintText
    ld a, FARAWAY_ISLAND_OUTSIDE
    ldh [hWarpDestinationMap], a
    ld a, $1
    ld [wDestinationWarpID], a
	call WarpFound2
    jr .done
.choseCitrine
	ld hl, EventVermillionCityCitrinePass
	call PrintText
	ld a, CITRINE_CITY
	ldh [hWarpDestinationMap], a
	ld a, $6
	ld [wDestinationWarpID], a
	call WarpFound2
	jr .done
.cancelledPass
	ld hl, PassRefuse
	call PrintText
.done
	ret

VermilionCity_TextPointers:
	dw VermilionCityText1
	dw VermilionCityText2
	dw VermilionCityText3
	dw VermilionCityText4
	dw VermilionCityText5
	dw VermilionCityText6
	dw VermilionCityText7
	dw VermilionCityText8
	dw MartSignText
	dw PokeCenterSignText
	dw VermilionCityText11
	dw VermilionCityText12
	dw VermilionCityText13
	dw RoingusText

VermilionCityText1:
	text_far _VermilionCityText1
	text_end

VermilionCityText2:
	text_asm
	CheckEvent EVENT_SS_ANNE_LEFT
	jr nz, .shipHasDeparted
	ld hl, VermilionCityTextDidYouSee
	call PrintText
	jr .end
.shipHasDeparted
	ld hl, VermilionCityTextSSAnneDeparted
	call PrintText
.end
	jp TextScriptEnd

VermilionCityTextDidYouSee:
	text_far _VermilionCityTextDidYouSee
	text_end

VermilionCityTextSSAnneDeparted:
	text_far _VermilionCityTextSSAnneDeparted
	text_end

VermilionCityText3:
	text_asm
	
	; If you have either of these, go to Pass List.
	; You only access these in the post-game, really, so it works out.
	ld b, OLD_SEA_MAP
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	jp nz, PassListings
	ld b, CITRINE_PASS
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	jp nz, PassListings
	
	ld a, [wObtainedBadges]
	bit 5, a ; after obtaining marsh badge the ship returns
	jr nz, .default
	CheckEvent EVENT_SS_ANNE_LEFT
	jr nz, .shipHasDeparted
.default
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_RIGHT
	jr z, .greetPlayer
	ld hl, .inFrontOfOrBehindGuardCoords
	call ArePlayerCoordsInArray
	jr nc, .greetPlayerAndCheckTicket
.greetPlayer
	ld hl, SSAnneWelcomeText4
	call PrintText
	jr .end
.greetPlayerAndCheckTicket
	ld hl, SSAnneWelcomeText9
	call PrintText
	ld b, S_S_TICKET
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	jr nz, .playerHasTicket
	ld hl, SSAnneNoTicketText
	call PrintText
	jr .end
.playerHasTicket
	ld hl, SSAnneFlashedTicketText
	call PrintText
	ld a, $4
	ld [wVermilionCityCurScript], a
	jr .end
.shipHasDeparted
	ld hl, SSAnneNotHereText
	call PrintText
.end
	jp TextScriptEnd

.inFrontOfOrBehindGuardCoords
	dbmapcoord 19, 29 ; in front of guard
	dbmapcoord 19, 31 ; behind guard
	db -1 ; end

SSAnneWelcomeText4:
	text_far _SSAnneWelcomeText4
	text_end

SSAnneWelcomeText9:
	text_far _SSAnneWelcomeText9
	text_end

SSAnneFlashedTicketText:
	text_far _SSAnneFlashedTicketText
	text_end

SSAnneNoTicketText:
	text_far _SSAnneNoTicketText
	text_end

SSAnneNotHereText:
	text_far _SSAnneNotHereText
	text_end

VermilionCityText4:
	text_far _VermilionCityText4
	text_end

VermilionCityText5:
	text_far _VermilionCityText5
	text_asm
	ld a, MACHOP
	call PlayCry
	call WaitForSoundToFinish
	ld hl, VermilionCityText14
	ret

VermilionCityText14:
	text_far _VermilionCityText14
	text_end

VermilionCityText6:
	text_asm
	ld a, [wObtainedBadges]
	bit 5, a ; after obtaining the marsh badge the ship returns
	jr z, .default
	ld hl, VermilionCityText15
	ret
.default
	ld hl, VermilionCityText6get
	ret

VermilionCityText6get:
	text_far _VermilionCityText6
	text_end

VermilionCityText15:
	text_far _VermilionCityText15
	text_end

VermilionCityText7:
	text_far _VermilionCityText7
	text_end

VermilionCityText8:
	text_far _VermilionCityText8
	text_end

VermilionCityText11:
	text_far _VermilionCityText11
	text_end

VermilionCityText12:
	text_far _VermilionCityText12
	text_end

VermilionCityText13:
	text_far _VermilionCityText13
	text_end

RoingusText:
	text_far _RoingusText
	text_end

VermillionCityPassSelectionText:
	text_far _VermillionCityPassSelectionText
	text_end

EventVermillionCityOldSeaMap:
	text_far _VermillionCityOldSeaMap
	text_end

EventVermillionCityCitrinePass:
	text_far _VermillionCityCitrinePass
	text_end

EventVermillionCitySSTicket:
	text_far _SSAnneFlashedTicketText
	text_end

PassRefuse:
	text_far _VermillionCityHarborRefuse
	text_end
