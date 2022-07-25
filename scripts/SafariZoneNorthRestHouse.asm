SafariZoneNorthRestHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

SafariZoneNorthRestHouse_TextPointers:
	dw SafariZoneRestHouse4Text1
	dw SafariZoneRestHouse4Text2
	dw SafariZoneRestHouse4Text3

SafariZoneRestHouse4Text1:
	text_asm
	ld a, [wSafariType]
	cp SAFARI_TYPE_RANGER_HUNT
	jr z, .rangerHuntText
	cp SAFARI_TYPE_FREE_ROAM
	jr z, .freeRoamText
	ld hl, SafariZoneRestHouse4TextDefault
	jr .done
.rangerHuntText
	ld hl, SafariZoneRestHouse4TextRangerHunt
	jr .done
.freeRoamText
	ld hl, SafariZoneRestHouse4TextChansey
.done
	call PrintText
	jp TextScriptEnd

SafariZoneRestHouse4TextDefault:
	text_far _SafariZoneRestHouse4Text1
	text_end

SafariZoneRestHouse4TextRangerHunt:
	text_far _SafariZoneRestHouse4TextRangerHunt
	text_end

SafariZoneRestHouse4TextChansey:
	text_far _SafariZoneRestHouse4TextChansey
	text_end

SafariZoneRestHouse4Text2:
	text_far _SafariZoneRestHouse4Text2
	text_end

SafariZoneRestHouse4Text3:
	text_far _SafariZoneRestHouse4Text3
	text_end
