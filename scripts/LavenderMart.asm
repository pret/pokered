LavenderMart_Script:
	jp EnableAutoTextBoxDrawing

LavenderMart_TextPointers:
	def_text_pointers
	dw_const LavenderMartClerkText,        TEXT_LAVENDERMART_CLERK
	dw_const LavenderMartBaldingGuyText,   TEXT_LAVENDERMART_BALDING_GUY
	dw_const LavenderMartCooltrainerMText, TEXT_LAVENDERMART_COOLTRAINER_M
	dw_const LavenderMartTMKid,            TEXT_LAVENDERMART_TM_KID

LavenderMartTMKid: ; PureRGBnote: ADDED: new NPC who will sell TMs
	text_asm
	ld hl, TMKidGreet3
	rst _PrintText
	CheckEvent EVENT_MET_LAVENDER_TM_KID
	jr z, .intro
	ld hl, TMKidQuick3
	rst _PrintText
	jr .shop
.intro
	ld hl, LavenderMartTMKidFlavor
	rst _PrintText
	SetEvent EVENT_MET_LAVENDER_TM_KID
.shop
	ld hl, LavenderTMKidShop
	call DisplayPokemartNoGreeting
	rst TextScriptEnd
	
TMKidGreet3::
	text_far _TMKidGreet
	text_end

LavenderMartTMKidFlavor:
	text_far _TMKidBringingTMsAnyCost
	text_far _LavenderMartTMKidFlavor
	text_far _TMKidSellingTMsCopiedDadOriginals
	text_far _TMKidWantSomeText
	text_end

TMKidQuick3::
	text_far _TMKidQuick
	text_end
LavenderMartBaldingGuyText:
	text_far _LavenderMartBaldingGuyText
	text_end

LavenderMartCooltrainerMText:
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr nz, .Nugget
	ld hl, .ReviveText
	rst _PrintText
	jr .done
.Nugget
	ld hl, .NuggetText
	rst _PrintText
.done
	rst TextScriptEnd

.ReviveText
	text_far _LavenderMartCooltrainerMReviveText
	text_end

.NuggetText
	text_far _LavenderMartCooltrainerMNuggetText
	text_end

INCLUDE "data/items/marts/lavender.asm"