CeladonCity_Script:
	call EnableAutoTextBoxDrawing
	; fall through
	
; PureRGBnote: ADDED: code that keeps the cut tree cut down if we're in its alcove. Prevents getting softlocked if you delete cut.
CeladonCityCheckHideCutTree:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl] ; did we load the map from a save/warp/door/battle, etc?
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z ; map wasn't just loaded
	ld de, CeladonCutAlcove1
	callfar FarArePlayerCoordsInRange
	call c, .removeTreeBlocker
	ld de, CeladonCutAlcove2
	callfar FarArePlayerCoordsInRange
	call c, .removeTreeBlocker
	ret
.removeTreeBlocker
	; if we're in the cut alcove, remove the tree
	lb bc, 16, 17
	ld a, $6D
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

CeladonCity_TextPointers:
	def_text_pointers
	dw_const CeladonCityLittleGirlText,        TEXT_CELADONCITY_LITTLE_GIRL
	dw_const CeladonCityGramps1Text,           TEXT_CELADONCITY_GRAMPS1
	dw_const CeladonCityGirlText,              TEXT_CELADONCITY_GIRL
	dw_const CeladonCityGramps2Text,           TEXT_CELADONCITY_GRAMPS2
	dw_const CeladonCityGramps3Text,           TEXT_CELADONCITY_GRAMPS3
	dw_const CeladonCityFisherText,            TEXT_CELADONCITY_FISHER
	dw_const CeladonCityPoliwrathText,         TEXT_CELADONCITY_POLIWRATH
	dw_const CeladonCityRocket1Text,           TEXT_CELADONCITY_ROCKET1
	dw_const CeladonCityRocket2Text,           TEXT_CELADONCITY_ROCKET2
	dw_const CeladonCityTrainerTips1Text,      TEXT_CELADONCITY_TRAINER_TIPS1
	dw_const CeladonCitySignText,              TEXT_CELADONCITY_SIGN
	dw_const PokeCenterSignText,               TEXT_CELADONCITY_POKECENTER_SIGN
	dw_const CeladonCityGymSignText,           TEXT_CELADONCITY_GYM_SIGN
	dw_const CeladonCityMansionSignText,       TEXT_CELADONCITY_MANSION_SIGN
	dw_const CeladonCityDeptStoreSignText,     TEXT_CELADONCITY_DEPTSTORE_SIGN
	dw_const CeladonCityTrainerTips2Text,      TEXT_CELADONCITY_TRAINER_TIPS2
	dw_const CeladonCityPrizeExchangeSignText, TEXT_CELADONCITY_PRIZEEXCHANGE_SIGN
	dw_const CeladonCityGameCornerSignText,    TEXT_CELADONCITY_GAMECORNER_SIGN
	dw_const CeladonCityText19,    TEXT_CELADONCITY_TRAINER_TIPS3

CeladonCityLittleGirlText:
	text_far _CeladonCityLittleGirlText
	text_end

CeladonCityGramps1Text:
	text_far _CeladonCityGramps1Text
	text_end

CeladonCityGirlText:
	text_far _CeladonCityGirlText
	text_end

CeladonCityGramps2Text:
	text_far _CeladonCityGramps2Text
	text_end

CeladonCityGramps3Text:
	text_asm
	CheckEvent EVENT_GOT_TM41
	jr nz, .gotTM41
	ld hl, .Text
	rst _PrintText
	lb bc, TM_CELADON_CITY_SURF_POOL_GRAMPS, 1
	call GiveItem
	jr c, .Success
	ld hl, .TM41NoRoomText
	rst _PrintText
	jr .Done
.Success
	ld hl, .ReceivedTM41Text
	rst _PrintText
	SetEvent EVENT_GOT_TM41
	jr .Done
.gotTM41
	ld hl, .TM41ExplanationText
	rst _PrintText
.Done
	rst TextScriptEnd

.Text:
	text_far _CeladonCityGramps3Text
	text_end

.ReceivedTM41Text:
	text_far _CeladonCityGramps3ReceivedTM41Text
	sound_get_item_1
	text_end

.TM41ExplanationText:
	text_far _CeladonCityGramps3TM41ExplanationText
	text_end

.TM41NoRoomText:
	text_far _CeladonCityGramps3TM41NoRoomText
	text_end

CeladonCityFisherText:
	text_far _CeladonCityFisherText
	text_end

CeladonCityPoliwrathText:
	text_far _CeladonCityPoliwrathText
	text_asm
	ld a, POLIWRATH
	call PlayCry
	rst TextScriptEnd

CeladonCityRocket1Text:
	text_far _CeladonCityRocket1Text
	text_end

CeladonCityRocket2Text:
	text_far _CeladonCityRocket2Text
	text_end

CeladonCityTrainerTips1Text:
	text_far _CeladonCityTrainerTips1Text
	text_end

CeladonCitySignText:
;;;;; PureRGBnote: ADDED: can enable or disable the beta unused rainbow palette for celadon city by talking to the sign.
	text_asm
	ld hl, .text
	rst _PrintText
	CheckAndSetEvent EVENT_CELADON_RAINBOW_COLORS_ACTIVE
	jr z, .done
	ResetEventReuseHL EVENT_CELADON_RAINBOW_COLORS_ACTIVE
.done
	call RunDefaultPaletteCommand
	rst TextScriptEnd
.text
	text_far _CeladonCitySignText
	text_end
;;;;;

CeladonCityGymSignText:
	text_far _CeladonCityGymSignText
	text_end

CeladonCityMansionSignText:
	text_far _CeladonCityMansionSignText
	text_end

CeladonCityDeptStoreSignText:
	text_far _CeladonCityDeptStoreSignText
	text_end

CeladonCityTrainerTips2Text:
	text_far _CeladonCityTrainerTips2Text
	text_end

CeladonCityPrizeExchangeSignText:
	text_far _CeladonCityPrizeExchangeSignText
	text_end

CeladonCityGameCornerSignText:
	text_far _CeladonCityGameCornerSignText
	text_end

CeladonCityText19:
	text_far _CeladonCityText19
	text_end
