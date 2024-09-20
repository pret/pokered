FuchsiaMart_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaMart_TextPointers:
	def_text_pointers
	dw_const FuchsiaMartClerkText,         TEXT_FUCHSIAMART_CLERK
	dw_const FuchsiaMartMiddleAgedManText, TEXT_FUCHSIAMART_MIDDLE_AGED_MAN
	dw_const FuchsiaMartCooltrainerFText,  TEXT_FUCHSIAMART_COOLTRAINER_F
	dw_const FuchsiaMartTMKid,             TEXT_FUCHSIAMART_TM_KID

FuchsiaMartTMKid: ; PureRGBnote: ADDED: new NPC who will sell TMs
	text_asm
	ld hl, TMKidGreet5
	rst _PrintText
	CheckEvent EVENT_MET_FUCHSIA_TM_KID
	jr z, .intro
	ld hl, TMKidQuick5
	rst _PrintText
	jr .shop
.intro
	ld hl, FuchsiaMartTMKidFlavor
	rst _PrintText
	SetEvent EVENT_MET_FUCHSIA_TM_KID
.shop
	ld hl, FuchsiaTMKidShop
	call DisplayPokemartNoGreeting
	rst TextScriptEnd
	
TMKidGreet5::
	text_far _TMKidGreet
	text_end

FuchsiaMartTMKidFlavor:
	text_far _TMKidBringingTMsAnyCost
	text_far _FuchsiaMartTMKidFlavor
	text_far _TMKidSellingTMsCopiedDadOriginals
	text_far _TMKidWantSomeText
	text_end

TMKidQuick5::
	text_far _TMKidQuick
	text_end

FuchsiaMartMiddleAgedManText:
	text_far _FuchsiaMartMiddleAgedManText
	text_end

FuchsiaMartCooltrainerFText:
	text_far _FuchsiaMartCooltrainerFText
	text_end

INCLUDE "data/items/marts/fuchsia.asm"
