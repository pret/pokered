CeladonDiner_Script:
	call EnableAutoTextBoxDrawing
	ret

CeladonDiner_TextPointers:
	dw CeladonDinerText1
	dw CeladonDinerText2
	dw CeladonDinerText3
	dw CeladonDinerText4
	dw CeladonDinerText5

CeladonDinerText1:
; PureRGBnote: ADDED: celadon diner sells drinks after giving a drink to the guards guarding saffron
; allows you to buy a bunch of drinks at once if you want.
	text_asm
	ld a, [wd728]
	bit 6, a
	jr nz, .noBreak
	ld hl, CeladonDinerBreakText
	call PrintText
	jr .done
.noBreak
	ld hl, CeladonDinerOpenText
	call PrintText
	ld hl, CeladonDinerMenu
	call DisplayPokemartNoGreeting
.done
	jp TextScriptEnd

INCLUDE "data/items/marts/celadon_diner.asm"

CeladonDinerOpenText:
	text_far _CeladonDinerOpenText
	text_end

CeladonDinerBreakText:
	text_far _CeladonDinerText1
	text_end

CeladonDinerText2:
	text_far _CeladonDinerText2
	text_end

CeladonDinerText3:
	text_far _CeladonDinerText3
	text_end

CeladonDinerText4:
	text_far _CeladonDinerText4
	text_end

CeladonDinerText5:
	text_asm
	CheckEvent EVENT_GOT_COIN_CASE
	jr nz, .got_item
	ld hl, CeladonDinerText_491a7
	call PrintText
	;lb bc, COIN_CASE, 1 ; PureRGBnote: CHANGED: COIN_CASE is not an item, it's just an event that lets you use the game corner
	;call GiveItem
	;jr nc, .bag_full
	SetEvent EVENT_GOT_COIN_CASE
	ld hl, ReceivedCoinCaseText
	call PrintText
	jr .done
;.bag_full
;	ld hl, CoinCaseNoRoomText
;	call PrintText
;	jr .done
.got_item
	ld hl, CeladonDinerText_491b7
	call PrintText
.done
	jp TextScriptEnd

CeladonDinerText_491a7:
	text_far _CeladonDinerText_491a7
	text_end

ReceivedCoinCaseText:
	text_far _ReceivedCoinCaseText
	sound_get_key_item
	text_end

;CoinCaseNoRoomText:
;	text_far _CoinCaseNoRoomText
;	text_end

CeladonDinerText_491b7:
	text_far _CeladonDinerText_491b7
	text_end
