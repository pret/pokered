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

	; trigger the next script
	ld a, 1
	ld [wBluesHouseCurScript], a
	ret

BluesHouseScript1:
	ret

BluesHouse_TextPointers:
	dw BluesHouseText1
	dw BluesHouseText2
	dw BluesHouseText3

BluesHouseText1:
	text_asm
	CheckEvent EVENT_GOT_TOWN_MAP
	jr nz, .GotMap
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .GiveMap
	ld hl, DaisyInitialText
	call PrintText
	jr .done

.GiveMap
	ld hl, DaisyOfferMapText
	call PrintText
	lb bc, TOWN_MAP, 1
	call GiveItem
	jr nc, .BagFull
	ld a, HS_TOWN_MAP
	ld [wMissableObjectIndex], a
	predef HideObject ; hide table map object
	ld hl, GotMapText
	call PrintText
	SetEvent EVENT_GOT_TOWN_MAP
	jr .done

.GotMap
	ld hl, DaisyUseMapText
	call PrintText
	jr .done

.BagFull
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

BluesHouseText2: ; Daisy, walking around
	text_far _BluesHouseText2
	text_end

BluesHouseText3: ; map on table
	text_far _BluesHouseText3
	text_end
