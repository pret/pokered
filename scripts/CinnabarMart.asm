CinnabarMart_Script:
	jp EnableAutoTextBoxDrawing

CinnabarMart_TextPointers:
	dw CinnabarCashierText
	dw CinnabarMartText2
	dw CinnabarMartText3
	dw CinnabarMartTMKid

CinnabarMartTMKid:
	text_asm
	ld hl, TMKidGreet7
	call PrintText
	CheckEvent EVENT_MET_CINNABAR_TM_KID
	jr z, .intro
	ld hl, TMKidQuick7
	call PrintText
	jr .shop
.intro
	ld hl, CinnabarMartTMKidFlavor
	call PrintText
	SetEvent EVENT_MET_CINNABAR_TM_KID
.shop
	ld hl, CinnabarTMKidShop
	call DisplayPokemartNoGreeting
	jp TextScriptEnd
	
TMKidGreet7::
	text_far _TMKidGreet
	text_end

CinnabarMartTMKidFlavor:
	text_far _CinnabarMartTMKidFlavor
	text_end

TMKidQuick7::
	text_far _TMKidQuick
	text_end
	
CinnabarTMKidShop::
	script_mart TM_TOXIC, TM_BARRIER, TM_AMNESIA, TM_BODY_SLAM, TM_BARRAGE, TM_SLAM

CinnabarMartText2:
	text_far _CinnabarMartText2
	text_end

CinnabarMartText3:
	text_far _CinnabarMartText3
	text_end

CinnabarCashierText::
	script_mart ULTRA_BALL, GREAT_BALL, HYPER_POTION, MAX_REPEL, ESCAPE_ROPE, FULL_HEAL, REVIVE