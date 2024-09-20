SaffronMart_Script:
	jp EnableAutoTextBoxDrawing

SaffronMart_TextPointers:
	def_text_pointers
	dw_const SaffronMartClerkText,        TEXT_SAFFRONMART_CLERK
	dw_const SaffronMartSuperNerdText,    TEXT_SAFFRONMART_SUPER_NERD
	dw_const SaffronMartCooltrainerFText, TEXT_SAFFRONMART_COOLTRAINER_F
	dw_const SaffronMartTMKid,            TEXT_SAFFRONMART_TM_KID

SaffronMartTMKid: ; PureRGBnote: ADDED: new NPC who will sell TMs
	text_asm
	ld hl, TMKidGreet6
	rst _PrintText
	CheckEvent EVENT_MET_SAFFRON_TM_KID
	jr z, .intro
	ld hl, TMKidQuick6
	rst _PrintText
	jr .shop
.intro
	ld hl, SaffronMartTMKidFlavor
	rst _PrintText
	SetEvent EVENT_MET_SAFFRON_TM_KID
.shop
	ld hl, SaffronTMKidShop
	call DisplayPokemartNoGreeting
	rst TextScriptEnd
	
TMKidGreet6::
	text_far _TMKidGreet
	text_end

SaffronMartTMKidFlavor:
	text_far _TMKidBringingTMsAnyCost
	text_far _SaffronMartTMKidFlavor
	text_far _TMKidWantSomeTMsText
	text_end

TMKidQuick6::
	text_far _TMKidQuick
	text_end

SaffronMartSuperNerdText:
	text_far _SaffronMartSuperNerdText
	text_end

SaffronMartCooltrainerFText:
	text_far _SaffronMartCooltrainerFText
	text_end

INCLUDE "data/items/marts/saffron.asm"
