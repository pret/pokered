VermilionMart_Script:
	jp EnableAutoTextBoxDrawing

VermilionMart_TextPointers:
	dw VermilionCashierText
	dw VermilionMartText2
	dw VermilionMartText3
	dw VermilionMartTMKid

VermilionMartTMKid:
	text_asm
	ld hl, TMKidGreet2
	call PrintText
	CheckEvent EVENT_MET_VERMILION_TM_KID
	jr z, .intro
	ld hl, TMKidQuick2
	call PrintText
	jr .shop
.intro
	ld hl, VermilionMartTMKidFlavor
	call PrintText
	SetEvent EVENT_MET_VERMILION_TM_KID
.shop
	ld hl, VermilionTMKidShop
	call DisplayPokemartNoGreeting
	jp TextScriptEnd
	
TMKidGreet2::
	text_far _TMKidGreet
	text_end

VermilionMartTMKidFlavor:
	text_far _VermilionMartTMKidFlavor
	text_end

TMKidQuick2::
	text_far _TMKidQuick
	text_end
	
VermilionTMKidShop::
	script_mart TM_KINESIS, TM_LEECH_SEED

VermilionMartText2:
	text_far _VermilionMartText2
	text_end

VermilionMartText3:
	text_far _VermilionMartText3
	text_end

VermilionCashierText::
	script_mart POKE_BALL, SUPER_POTION, ICE_HEAL, AWAKENING, PARLYZ_HEAL, REPEL