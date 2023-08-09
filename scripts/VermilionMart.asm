VermilionMart_Script:
	jp EnableAutoTextBoxDrawing

VermilionMart_TextPointers:
	def_text_pointers
	dw_const VermilionMartClerkText,        TEXT_VERMILIONMART_CLERK
	dw_const VermilionMartCooltrainerMText, TEXT_VERMILIONMART_COOLTRAINER_M
	dw_const VermilionMartCooltrainerFText, TEXT_VERMILIONMART_COOLTRAINER_F
	dw_const VermilionMartTMKid,            TEXT_VERMILIONMART_TM_KID

VermilionMartTMKid: ; PureRGBnote: ADDED: new NPC who will sell TMs
	text_asm
	ld hl, TMKidGreet2
	rst _PrintText
	CheckEvent EVENT_MET_VERMILION_TM_KID
	jr z, .intro
	ld hl, TMKidQuick2
	rst _PrintText
	jr .shop
.intro
	ld hl, VermilionMartTMKidFlavor
	rst _PrintText
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

VermilionMartCooltrainerMText:
	text_far _VermilionMartCooltrainerMText
	text_end

VermilionMartCooltrainerFText:
	text_far _VermilionMartCooltrainerFText
	text_end

INCLUDE "data/items/marts/vermilion.asm"