BluesHouse_Script:
	call EnableAutoTextBoxDrawing
	ld hl, BluesHouse_ScriptPointers
	ld a, [wBluesHouseCurScript]
	jp CallFunctionInTable

BluesHouse_ScriptPointers:
	dw BluesHouseScript0
	dw BluesHouseScript1

BluesHouseScript0:
	SetEvent EVENT_ENTERED_BLUES_HOUSE
	ld a, $1
	ld [wBluesHouseCurScript], a
	ret

BluesHouseScript1:
	ret

BluesHouse_TextPointers:
	dw BluesHouseDaisySittingText
	dw BluesHouseDaisyWalkingText
	dw BluesHouseTownMapText

BluesHouseDaisySittingText:
	text_asm
	CheckEvent EVENT_GOT_TOWN_MAP
	jr nz, .got_town_map
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .give_town_map
	ld hl, DaisyInitialText
	call PrintText
	jr .done

.give_town_map
	ld hl, DaisyOfferMapText
	call PrintText
	lb bc, TOWN_MAP, 1
	call GiveItem
	jr nc, .bag_full
	ld a, HS_TOWN_MAP
	ld [wMissableObjectIndex], a
	predef HideObject
	ld hl, GotMapText
	call PrintText
	SetEvent EVENT_GOT_TOWN_MAP
	jr .done

.got_town_map
	ld hl, DaisyUseMapText
	call PrintText
	jr .done

.bag_full
	ld hl, DaisyBagFullText
	call PrintText
.done
	jp TextScriptEnd

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
