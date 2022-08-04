SafariZoneWestRestHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

SafariZoneWestRestHouse_TextPointers:
	dw SafariZoneRestHouse2Text1
	dw SafariZoneRestHouse2Text2
	dw SafariZoneRestHouse2Text3

SafariZoneRestHouse2Text1:
; PureRGBnote: ADDED: this NPC will display different text depending on what type of safari game you're playing
	text_asm
	ld a, [wSafariType]
	cp SAFARI_TYPE_RANGER_HUNT
	jr z, .rangerHuntText
	cp SAFARI_TYPE_FREE_ROAM
	jr z, .freeRoamText
	ld hl, SafariZoneRestHouse2TextDefault
	jr .done
.rangerHuntText
	ld hl, SafariZoneRestHouse2TextRangerHunt
	jr .done
.freeRoamText
	ld hl, SafariZoneRestHouse2TextKangaskhan
.done
	call PrintText
	jp TextScriptEnd

SafariZoneRestHouse2TextDefault:
	text_far _SafariZoneRestHouse2Text1
	text_end

SafariZoneRestHouse2TextRangerHunt:
	text_far _SafariZoneRestHouse2TextRangerHunt
	text_end

SafariZoneRestHouse2TextKangaskhan:
	text_far _SafariZoneRestHouse2TextFreeRoam
	text_end

SafariZoneRestHouse2Text2:
; PureRGBnote: ADDED: this NPC will display different text depending on what type of safari game you're playing
	text_asm
	ld a, [wSafariType]
	cp SAFARI_TYPE_RANGER_HUNT
	jr z, .rangerHuntText
	cp SAFARI_TYPE_FREE_ROAM
	jr z, .freeRoamText
	ld hl, SafariZoneRestHouse2TextDefault2
	jr .done
.rangerHuntText
	ld hl, SafariZoneRestHouse2TextRangerHunt2
	jr .done
.freeRoamText
	ld hl, SafariZoneRestHouse2TextFreeRoam2
.done
	call PrintText
	jp TextScriptEnd

SafariZoneRestHouse2TextDefault2:
	text_far _SafariZoneRestHouse2Text2
	text_end

SafariZoneRestHouse2TextRangerHunt2:
	text_far _SafariZoneRestHouse2TextRangerHunt2
	text_end

SafariZoneRestHouse2TextFreeRoam2:
	text_far _SafariZoneRestHouse2TextFreeRoam2
	text_end

SafariZoneRestHouse2Text3:
	text_far _SafariZoneRestHouse2Text3
	text_end
