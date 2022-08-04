LavenderMart_Script:
	jp EnableAutoTextBoxDrawing

LavenderMart_TextPointers:
	dw LavenderCashierText
	dw LavenderMartText2
	dw LavenderMartText3
	dw LavenderMartTMKid

LavenderMartTMKid: ; PureRGBnote: ADDED: new NPC who will sell TMs
	text_asm
	ld hl, TMKidGreet3
	call PrintText
	CheckEvent EVENT_MET_LAVENDER_TM_KID
	jr z, .intro
	ld hl, TMKidQuick3
	call PrintText
	jr .shop
.intro
	ld hl, LavenderMartTMKidFlavor
	call PrintText
	SetEvent EVENT_MET_LAVENDER_TM_KID
.shop
	ld hl, LavenderTMKidShop
	call DisplayPokemartNoGreeting
	jp TextScriptEnd
	
TMKidGreet3::
	text_far _TMKidGreet
	text_end

LavenderMartTMKidFlavor:
	text_far _LavenderMartTMKidFlavor
	text_end

TMKidQuick3::
	text_far _TMKidQuick
	text_end

LavenderMartText2:
	text_far _LavenderMartText2
	text_end

LavenderMartText3:
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr nz, .Nugget
	ld hl, .ReviveText
	call PrintText
	jr .done
.Nugget
	ld hl, .NuggetText
	call PrintText
.done
	jp TextScriptEnd

.ReviveText
	text_far _LavenderMartReviveText
	text_end

.NuggetText
	text_far _LavenderMartNuggetText
	text_end

INCLUDE "data/items/marts/lavender.asm"