VermilionMart_Script:
	jp EnableAutoTextBoxDrawing

VermilionMart_TextPointers:
	dw VermilionCashierText
	dw VermilionMartText2
	dw VermilionMartText3
	dw VermilionMartTMKid

VermilionMartTMKid: ; PureRGBnote: ADDED: new NPC who will sell TMs
	text_asm
	ld hl, TMKidGreet2
	rst PrintTextRST
	CheckEvent EVENT_MET_VERMILION_TM_KID
	jr z, .intro
	ld hl, TMKidQuick2
	rst PrintTextRST
	jr .shop
.intro
	ld hl, VermilionMartTMKidFlavor
	rst PrintTextRST
	SetEvent EVENT_MET_VERMILION_TM_KID
.shop
	ld hl, VermilionTMKidShop
	call DisplayPokemartNoGreeting
	rst TextScriptEnd
	
TMKidGreet2::
	text_far _TMKidGreet
	text_end

VermilionMartTMKidFlavor:
	text_far _VermilionMartTMKidFlavor
	text_end

TMKidQuick2::
	text_far _TMKidQuick
	text_end

VermilionMartText2:
	text_far _VermilionMartText2
	text_end

VermilionMartText3:
	text_far _VermilionMartText3
	text_end

INCLUDE "data/items/marts/vermilion.asm"