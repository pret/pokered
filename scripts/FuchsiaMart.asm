FuchsiaMart_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaMart_TextPointers:
	dw FuchsiaCashierText
	dw FuchsiaMartText2
	dw FuchsiaMartText3
	dw FuchsiaMartTMKid

FuchsiaMartTMKid: ; PureRGBnote: ADDED: new NPC who will sell TMs
	text_asm
	ld hl, TMKidGreet5
	call PrintText
	CheckEvent EVENT_MET_FUCHSIA_TM_KID
	jr z, .intro
	ld hl, TMKidQuick5
	call PrintText
	jr .shop
.intro
	ld hl, FuchsiaMartTMKidFlavor
	call PrintText
	SetEvent EVENT_MET_FUCHSIA_TM_KID
.shop
	ld hl, FuchsiaTMKidShop
	call DisplayPokemartNoGreeting
	jp TextScriptEnd
	
TMKidGreet5::
	text_far _TMKidGreet
	text_end

FuchsiaMartTMKidFlavor:
	text_far _FuchsiaMartTMKidFlavor
	text_end

TMKidQuick5::
	text_far _TMKidQuick
	text_end

FuchsiaMartText2:
	text_far _FuchsiaMartText2
	text_end

FuchsiaMartText3:
	text_far _FuchsiaMartText3
	text_end

INCLUDE "data/items/marts/fuchsia.asm"
