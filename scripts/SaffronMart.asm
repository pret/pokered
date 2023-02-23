SaffronMart_Script:
	jp EnableAutoTextBoxDrawing

SaffronMart_TextPointers:
	dw SaffronCashierText
	dw SaffronMartText2
	dw SaffronMartText3
	dw SaffronMartTMKid

SaffronMartTMKid: ; PureRGBnote: ADDED: new NPC who will sell TMs
	text_asm
	ld hl, TMKidGreet6
	call PrintText
	CheckEvent EVENT_MET_SAFFRON_TM_KID
	jr z, .intro
	ld hl, TMKidQuick6
	call PrintText
	jr .shop
.intro
	ld hl, SaffronMartTMKidFlavor
	call PrintText
	SetEvent EVENT_MET_SAFFRON_TM_KID
.shop
	ld hl, SaffronTMKidShop
	call DisplayPokemartNoGreeting
	rst TextScriptEnd
	
TMKidGreet6::
	text_far _TMKidGreet
	text_end

SaffronMartTMKidFlavor:
	text_far _SaffronMartTMKidFlavor
	text_end

TMKidQuick6::
	text_far _TMKidQuick
	text_end

SaffronMartText2:
	text_far _SaffronMartText2
	text_end

SaffronMartText3:
	text_far _SaffronMartText3
	text_end

INCLUDE "data/items/marts/saffron.asm"
