CeruleanMart_Script:
	jp EnableAutoTextBoxDrawing

CeruleanMart_TextPointers:
	dw CeruleanCashierText
	dw CeruleanMartText2
	dw CeruleanMartText3
	dw CeruleanMartTMKid

CeruleanMartTMKid: ; PureRGBnote: ADDED: new NPC who will sell TMs
	text_asm
	ld hl, TMKidGreet1
	call PrintText
	CheckEvent EVENT_MET_CERULEAN_TM_KID
	jr z, .intro
	ld hl, TMKidQuick1
	call PrintText
	jr .shop
.intro
	ld hl, CeruleanMartTMKidFlavor
	call PrintText
	SetEvent EVENT_MET_CERULEAN_TM_KID
.shop
	ld hl, CeruleanTMKidShop
	call DisplayPokemartNoGreeting
	jp TextScriptEnd
	
TMKidGreet1::
	text_far _TMKidGreet
	text_end

CeruleanMartTMKidFlavor:
	text_far _CeruleanMartTMKidFlavor
	text_end

TMKidQuick1::
	text_far _TMKidQuick
	text_end


CeruleanMartText2:
	text_far _CeruleanMartText2
	text_end

CeruleanMartText3:
	text_far _CeruleanMartText3
	text_end

INCLUDE "data/items/marts/cerulean.asm"
