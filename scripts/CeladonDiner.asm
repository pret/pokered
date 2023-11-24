CeladonDiner_Script:
	jp EnableAutoTextBoxDrawing

CeladonDiner_TextPointers:
	def_text_pointers
	dw_const CeladonDinerCookText,            TEXT_CELADONDINER_COOK
	dw_const CeladonDinerMiddleAgedWomanText, TEXT_CELADONDINER_MIDDLE_AGED_WOMAN
	dw_const CeladonDinerMiddleAgedManText,   TEXT_CELADONDINER_MIDDLE_AGED_MAN
	dw_const CeladonDinerFisherText,          TEXT_CELADONDINER_FISHER
	dw_const CeladonDinerCoinCaseGuyText,     TEXT_CELADONDINER_COIN_CASE_GUY

CeladonDinerCookText:
; PureRGBnote: ADDED: celadon diner sells drinks after giving a drink to the guards guarding saffron
; allows you to buy a bunch of drinks at once if you want.
	text_asm
	ld a, [wd728]
	bit 6, a
	jr nz, .noBreak
	ld hl, CeladonDinerBreakText
	rst _PrintText
	jr .done
.noBreak
	ld hl, CeladonDinerOpenText
	rst _PrintText
	ld hl, CeladonDinerMenu
	call DisplayPokemartNoGreeting
.done
	rst TextScriptEnd

INCLUDE "data/items/marts/celadon_diner.asm"

CeladonDinerOpenText:
	text_far _CeladonDinerOpenText
	text_end

CeladonDinerBreakText:
	text_far _CeladonDinerCookText
	text_end

CeladonDinerMiddleAgedWomanText:
	text_far _CeladonDinerMiddleAgedWomanText
	text_end

CeladonDinerMiddleAgedManText:
	text_far _CeladonDinerMiddleAgedManText
	text_end

CeladonDinerFisherText:
	text_far _CeladonDinerFisherText
	text_end

CeladonDinerCoinCaseGuyText:
	text_asm
	CheckEvent EVENT_GOT_COIN_CASE
	jr nz, .got_item
	ld hl, .ImFlatOutBustedText
	rst _PrintText
	;lb bc, COIN_CASE, 1 ; PureRGBnote: CHANGED: COIN_CASE is not an item, it's just an event that lets you use the game corner
	;call GiveItem
	;jr nc, .bag_full
	SetEvent EVENT_GOT_COIN_CASE
	ld hl, .ReceivedCoinCaseText
	rst _PrintText
	jr .done
;.bag_full
;	ld hl, .CoinCaseNoRoomText
;	rst _PrintText
;   jr .done
.got_item
	ld hl, .WinItBackText
	rst _PrintText
.done
	rst TextScriptEnd

.ImFlatOutBustedText:
	text_far _CeladonDinerCoinCaseGuyImFlatOutBustedText
	text_end

.ReceivedCoinCaseText:
	text_far _CeladonDinerCoinCaseGuyReceivedCoinCaseText
	sound_get_key_item
	text_end

;.CoinCaseNoRoomText:
;	text_far _CeladonDinerCoinCaseGuyCoinCaseNoRoomText
;	text_end

.WinItBackText:
	text_far _CeladonDinerCoinCaseGuyWinItBackText
	text_end
