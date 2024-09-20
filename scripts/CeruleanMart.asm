CeruleanMart_Script:
	jp EnableAutoTextBoxDrawing

CeruleanMart_TextPointers:
	def_text_pointers
	dw_const CeruleanMartClerkText,        TEXT_CERULEANMART_CLERK
	dw_const CeruleanMartCooltrainerMText, TEXT_CERULEANMART_COOLTRAINER_M
	dw_const CeruleanMartCooltrainerFText, TEXT_CERULEANMART_COOLTRAINER_F
	dw_const CeruleanMartTMKid,            TEXT_CERULEANMART_TM_KID

CeruleanMartTMKid: ; PureRGBnote: ADDED: new NPC who will sell TMs
	text_asm
	ld hl, TMKidGreet1
	rst _PrintText
	CheckEvent EVENT_MET_CERULEAN_TM_KID
	jr z, .intro
	ld hl, TMKidQuick1
	rst _PrintText
	jr .shop
.intro
	ld hl, CeruleanMartTMKidFlavor
	rst _PrintText
	SetEvent EVENT_MET_CERULEAN_TM_KID
.shop
	ld hl, CeruleanTMKidShop
	call DisplayPokemartNoGreeting
	rst TextScriptEnd
	
TMKidGreet1::
	text_far _TMKidGreet
	text_end

CeruleanMartTMKidFlavor:
	text_far _TMKidBringingTMsAnyCost
	text_far _CeruleanMartTMKidFlavor
	text_far _TMKidSellingTMsCopiedDadOriginals
	text_far _TMKidWantSomeText
	text_end

TMKidQuick1::
	text_far _TMKidQuick
	text_end

CeruleanMartCooltrainerMText:
	text_far _CeruleanMartCooltrainerMText
	text_end

CeruleanMartCooltrainerFText:
	text_far _CeruleanMartCooltrainerFText
	text_end

INCLUDE "data/items/marts/cerulean.asm"
