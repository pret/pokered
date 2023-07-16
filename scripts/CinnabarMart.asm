CinnabarMart_Script:
	jp EnableAutoTextBoxDrawing

CinnabarMart_TextPointers:
	def_text_pointers
	dw_const CinnabarMartClerkText,        TEXT_CINNABARMART_CLERK
	dw_const CinnabarMartSilphWorkerFText, TEXT_CINNABARMART_SILPH_WORKER_F
	dw_const CinnabarMartScientistText,    TEXT_CINNABARMART_SCIENTIST
	dw_const CinnabarMartTMKid,            TEXT_CINNABARMART_TM_KID

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

CinnabarMartSilphWorkerFText:
	text_far _CinnabarMartSilphWorkerFText
	text_end

CinnabarMartScientistText:
	text_far _CinnabarMartScientistText
	text_end

INCLUDE "data/items/marts/cinnabar.asm"
