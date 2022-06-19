SaffronMart_Script:
	jp EnableAutoTextBoxDrawing

SaffronMart_TextPointers:
	dw SaffronCashierText
	dw SaffronMartText2
	dw SaffronMartText3
	dw SaffronMartTMKid

SaffronMartTMKid:
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
	jp TextScriptEnd
	
TMKidGreet6::
	text_far _TMKidGreet
	text_end

SaffronMartTMKidFlavor:
	text_far _SaffronMartTMKidFlavor
	text_end

TMKidQuick6::
	text_far _TMKidQuick
	text_end
	
SaffronTMKidShop::
	script_mart TM_KARATE_CHOP, TM_ICE_PUNCH, TM_FIRE_PUNCH, TM_THUNDERPUNCH

SaffronMartText2:
	text_far _SaffronMartText2
	text_end

SaffronMartText3:
	text_far _SaffronMartText3
	text_end

SaffronCashierText::
	script_mart GREAT_BALL, HYPER_POTION, MAX_REPEL, ESCAPE_ROPE, FULL_HEAL, REVIVE