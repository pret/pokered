CinnabarMart_Script:
	jp EnableAutoTextBoxDrawing

CinnabarMart_TextPointers:
	dw CinnabarCashierText
	dw CinnabarMartText2
	dw CinnabarMartText3
	dw CinnabarMartTMKid

CinnabarMartTMKid: ; PureRGBnote: ADDED: new NPC who will sell TMs
	text_asm
	ld hl, TMKidGreet7
	rst _PrintText
	CheckEvent EVENT_MET_CINNABAR_TM_KID
	jr z, .intro
	ld hl, TMKidQuick7
	rst _PrintText
	jr .shop
.intro
	ld hl, CinnabarMartTMKidFlavor
	rst _PrintText
	SetEvent EVENT_MET_CINNABAR_TM_KID
.shop
	ld hl, CinnabarTMKidShop
	call DisplayPokemartNoGreeting
	rst TextScriptEnd
	
TMKidGreet7::
	text_far _TMKidGreet
	text_end

CinnabarMartTMKidFlavor:
	text_far _CinnabarMartTMKidFlavor
	text_end

TMKidQuick7::
	text_far _TMKidQuick
	text_end

CinnabarMartText2:
	text_far _CinnabarMartText2
	text_end

CinnabarMartText3:
	text_far _CinnabarMartText3
	text_end

INCLUDE "data/items/marts/cinnabar.asm"
