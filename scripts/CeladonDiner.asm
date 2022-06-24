CeladonDiner_Script:
	call EnableAutoTextBoxDrawing
	ret

CeladonDiner_TextPointers:
	def_text_pointers
	dw_const CeladonDinerCookText,            TEXT_CELADONDINER_COOK
	dw_const CeladonDinerMiddleAgedWomanText, TEXT_CELADONDINER_MIDDLE_AGED_WOMAN
	dw_const CeladonDinerMiddleAgedManText,   TEXT_CELADONDINER_MIDDLE_AGED_MAN
	dw_const CeladonDinerFisherText,          TEXT_CELADONDINER_FISHER
	dw_const CeladonDinerGymGuideText,        TEXT_CELADONDINER_GYM_GUIDE

CeladonDinerCookText:
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

CeladonDinerGymGuideText:
	text_asm
	CheckEvent EVENT_GOT_COIN_CASE
	jr nz, .got_item
	ld hl, .ImFlatOutBustedText
	call PrintText
	lb bc, COIN_CASE, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_GOT_COIN_CASE
	ld hl, .ReceivedCoinCaseText
	call PrintText
	jr .done
.bag_full
	ld hl, .CoinCaseNoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, .WinItBackText
	call PrintText
.done
	jp TextScriptEnd

.ImFlatOutBustedText:
	text_far _CeladonDinerGymGuideImFlatOutBustedText
	text_end

.ReceivedCoinCaseText:
	text_far _CeladonDinerGymGuideReceivedCoinCaseText
	sound_get_key_item
	text_end

.CoinCaseNoRoomText:
	text_far _CeladonDinerGymGuideCoinCaseNoRoomText
	text_end

.WinItBackText:
	text_far _CeladonDinerGymGuideWinItBackText
	text_end
