VermilionCity_Script:
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	push hl
	call nz, VermilionCityLeftSSAnneCallbackScript
	pop hl
	bit 5, [hl]
	res 5, [hl]
	call nz, .setFirstLockTrashCanIndexAndCheckRemoveTree
	ld hl, VermilionCity_ScriptPointers
	ld a, [wVermilionCityCurScript]
	jp CallFunctionInTable
.setFirstLockTrashCanIndexAndCheckRemoveTree
	ld de, VermilionCutAlcove
	callfar FarArePlayerCoordsInRange
	; if we're in the specific area where we can get trapped without CUT, remove the tree on map load.
	call c, .removeTree
	call Random
	ldh a, [hRandomSub]
	and $e
	ld [wFirstLockTrashCanIndex], a
	ret
.removeTree
	lb bc, 9, 7
	ld a, $4C
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

VermilionCityLeftSSAnneCallbackScript:
	CheckEventHL EVENT_SS_ANNE_LEFT
	ret z
	CheckEventReuseHL EVENT_WALKED_PAST_GUARD_AFTER_SS_ANNE_LEFT
	SetEventReuseHL EVENT_WALKED_PAST_GUARD_AFTER_SS_ANNE_LEFT
	ret nz
	ld a, SCRIPT_VERMILIONCITY_PLAYER_EXIT_SHIP
	ld [wVermilionCityCurScript], a
	ret

VermilionCity_ScriptPointers:
	def_script_pointers
	dw_const VermilionCityDefaultScript,             SCRIPT_VERMILIONCITY_DEFAULT
	dw_const VermilionCityPlayerMovingUp1Script,     SCRIPT_VERMILIONCITY_PLAYER_MOVING_UP1
	dw_const VermilionCityPlayerExitShipScript,      SCRIPT_VERMILIONCITY_PLAYER_EXIT_SHIP
	dw_const VermilionCityPlayerMovingUp2Script,     SCRIPT_VERMILIONCITY_PLAYER_MOVING_UP2
	dw_const VermilionCityPlayerAllowedToPassScript, SCRIPT_VERMILIONCITY_PLAYER_ALLOWED_TO_PASS

VermilionCityDefaultScript:
	ld a, [wSpritePlayerStateData1FacingDirection]
	and a ; cp SPRITE_FACING_DOWN
	ret nz
	ld hl, SSAnneTicketCheckCoords
	call ArePlayerCoordsInArray
	ret nc
	xor a
	ldh [hJoyHeld], a
	ld [wcf0d], a
	ld a, TEXT_VERMILIONCITY_SAILOR1
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, [wObtainedBadges] ; PureRGBnote: CHANGED: ship returns after obtaining the soul badge so let the player in if they have the ticket
	bit 4, a
	jr nz, .default
	CheckEvent EVENT_SS_ANNE_LEFT
	jr nz, .ship_departed
.default
	ld b, S_S_TICKET
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	ret nz
.ship_departed
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_VERMILIONCITY_PLAYER_MOVING_UP1
	ld [wVermilionCityCurScript], a
	ret

SSAnneTicketCheckCoords:
	dbmapcoord 18, 30
	db -1 ; end

VermilionCityPlayerAllowedToPassScript:
	ld hl, SSAnneTicketCheckCoords
	call ArePlayerCoordsInArray
	ret c
	ld a, SCRIPT_VERMILIONCITY_DEFAULT
	ld [wVermilionCityCurScript], a
	ret

VermilionCityPlayerExitShipScript:
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesEnd + 1], a
	ld a, 2
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_VERMILIONCITY_PLAYER_MOVING_UP2
	ld [wVermilionCityCurScript], a
	ret

VermilionCityPlayerMovingUp2Script:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ldh [hJoyHeld], a
	ld a, SCRIPT_VERMILIONCITY_DEFAULT
	ld [wVermilionCityCurScript], a
	ret

VermilionCityPlayerMovingUp1Script:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld c, 10
	rst _DelayFrames
	ld a, SCRIPT_VERMILIONCITY_DEFAULT
	ld [wVermilionCityCurScript], a
	ret

VermilionCity_TextPointers:
	def_text_pointers
	dw_const VermilionCityBeautyText,             TEXT_VERMILIONCITY_BEAUTY
	dw_const VermilionCityGambler1Text,           TEXT_VERMILIONCITY_GAMBLER1
	dw_const VermilionCitySailor1Text,            TEXT_VERMILIONCITY_SAILOR1
	dw_const VermilionCityGambler2Text,           TEXT_VERMILIONCITY_GAMBLER2
	dw_const VermilionCityMachopText,             TEXT_VERMILIONCITY_MACHOP
	dw_const VermilionCitySailor2Text,            TEXT_VERMILIONCITY_SAILOR2
	dw_const VermilionCityDockBeautyText,         TEXT_VERMILIONCITY_DOCK_BEAUTY
	dw_const VermilionCitySignText,               TEXT_VERMILIONCITY_SIGN
	dw_const VermilionCityNoticeSignText,         TEXT_VERMILIONCITY_NOTICE_SIGN
	dw_const MartSignText,                        TEXT_VERMILIONCITY_MART_SIGN
	dw_const PokeCenterSignText,                  TEXT_VERMILIONCITY_POKECENTER_SIGN
	dw_const VermilionCityPokemonFanClubSignText, TEXT_VERMILIONCITY_POKEMON_FAN_CLUB_SIGN
	dw_const VermilionCityGymSignText,            TEXT_VERMILIONCITY_GYM_SIGN
	dw_const VermilionCityHarborSignText,         TEXT_VERMILIONCITY_HARBOR_SIGN

VermilionCityBeautyText:
	text_far _VermilionCityBeautyText
	text_end

VermilionCityGambler1Text:
	text_asm
	CheckEvent EVENT_SS_ANNE_LEFT
	jr nz, .ship_departed
	ld hl, .DidYouSeeText
	rst _PrintText
	jr .text_script_end
.ship_departed
	ld hl, .SSAnneDepartedText
	rst _PrintText
.text_script_end
	rst TextScriptEnd

.DidYouSeeText:
	text_far _VermilionCityGambler1DidYouSeeText
	text_end

.SSAnneDepartedText:
	text_far _VermilionCityGambler1SSAnneDepartedText
	text_end

VermilionCitySailor1Text:
	text_asm
	ld a, [wObtainedBadges]
	bit BIT_SOULBADGE, a ; PureRGBnote: CHANGED: after obtaining soul badge the ship returns so this NPC will talk about it
	jr nz, .default
	CheckEvent EVENT_SS_ANNE_LEFT
	jr nz, .ship_departed
.default
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_RIGHT
	jr z, .greet_player
	ld hl, .inFrontOfOrBehindGuardCoords
	call ArePlayerCoordsInArray
	jr nc, .greet_player_and_check_ticket
.greet_player
	ld hl, .WelcomeToSSAnneText
	rst _PrintText
	jr .end
.greet_player_and_check_ticket
	ld hl, .DoYouHaveATicketText
	rst _PrintText
	ld b, S_S_TICKET
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	jr nz, .player_has_ticket
	ld hl, .YouNeedATicketText
	rst _PrintText
	jr .end
.player_has_ticket
	ld hl, .FlashedTicketText
	rst _PrintText
	ld a, SCRIPT_VERMILIONCITY_PLAYER_ALLOWED_TO_PASS
	ld [wVermilionCityCurScript], a
	jr .end
.ship_departed
	ld hl, .ShipSetSailText
	rst _PrintText
.end
	rst TextScriptEnd

.inFrontOfOrBehindGuardCoords
	dbmapcoord 19, 29 ; in front of guard
	dbmapcoord 19, 31 ; behind guard
	db -1 ; end

.WelcomeToSSAnneText:
	text_far _VermilionCitySailor1WelcomeToSSAnneText
	text_end

.DoYouHaveATicketText:
	text_far _VermilionCitySailor1DoYouHaveATicketText
	text_end

.FlashedTicketText:
	text_far _VermilionCitySailor1FlashedTicketText
	text_end

.YouNeedATicketText:
	text_far _VermilionCitySailor1YouNeedATicketText
	text_end

.ShipSetSailText:
	text_far _VermilionCitySailor1ShipSetSailText
	text_end

VermilionCityGambler2Text:
	text_far _VermilionCityGambler2Text
	text_end

VermilionCityMachopText:
	text_far _VermilionCityMachopText
	text_asm
	ld a, MACHOP
	call PlayCry
	call WaitForSoundToFinish
	ld hl, .StompingTheLandFlatText
	ret

.StompingTheLandFlatText:
	text_far _VermilionCityMachopStompingTheLandFlatText
	text_end

VermilionCitySailor2Text:
	text_asm
	ld a, [wObtainedBadges]
	bit BIT_SOULBADGE, a ; after obtaining the soul badge the ship returns
	jr z, .default
	ld hl, .ShipBackText
	ret
.default
	ld hl, .Text
	ret

.Text:
	text_far _VermilionCitySailor2Text
	text_end

.ShipBackText:
	text_far _VermilionCityText15
	text_end

VermilionCitySignText:
	text_far _VermilionCitySignText
	text_end

VermilionCityNoticeSignText:
	text_far _VermilionCityNoticeSignText
	text_end

VermilionCityPokemonFanClubSignText:
	text_far _VermilionCityPokemonFanClubSignText
	text_end

VermilionCityGymSignText:
	text_far _VermilionCityGymSignText
	text_end

VermilionCityHarborSignText:
	text_far _VermilionCityHarborSignText
	text_end

; PureRGBnote: ADDED: new NPC who will give you an item if found. Requires surf to even see this NPC's location.
VermilionCityDockBeautyText: 
	text_asm
	CheckEvent EVENT_GOT_DOCK_BEAUTY_ITEM
	jr nz, .endText
	ld hl, VermilionCityDockBeautyGreeting
	rst _PrintText
	lb bc, ITEM_VERMILION_SECRET_DOCK_BEAUTY_NEW, 1
	call GiveItem
	jr nc, .bagfull
	SetEvent EVENT_GOT_DOCK_BEAUTY_ITEM
	ld hl, VermilionCityDockBeautyReceivedItemText
	rst _PrintText
	jr .done
.bagfull
	ld hl, VermilionCityDockBeautyNoRoomText
	rst _PrintText
	jr .done
.endText
	ld hl, VermilionCityDockBeautyEndText
	rst _PrintText
.done
	rst TextScriptEnd

VermilionCityDockBeautyGreeting:
	text_far _VermilionCityDockBeautyGreeting
	text_end

VermilionCityDockBeautyNoRoomText:
	text_far _PewterGymTM34NoRoomText
	text_end

VermilionCityDockBeautyReceivedItemText:
	text_far _VermilionCityDockBeautyReceivedItemText
	sound_get_key_item
	text_end

VermilionCityDockBeautyEndText:
	text_far _VermilionCityDockBeautyEndText
	text_end