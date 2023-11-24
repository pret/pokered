SafariZoneWestRestHouse_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneWestRestHouse_TextPointers:
	def_text_pointers
	dw_const SafariZoneWestRestHouseScientistText,    TEXT_SAFARIZONEWESTRESTHOUSE_SCIENTIST
	dw_const SafariZoneWestRestHouseCooltrainerMText, TEXT_SAFARIZONEWESTRESTHOUSE_COOLTRAINER_M
	dw_const SafariZoneWestRestHouseSilphWorkerFText, TEXT_SAFARIZONEWESTRESTHOUSE_SILPH_WORKER_F

SafariZoneWestRestHouseScientistText:
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
	rst _PrintText
	rst TextScriptEnd

SafariZoneRestHouse2TextDefault:
	text_far _SafariZoneWestRestHouseScientistText
	text_end

SafariZoneRestHouse2TextRangerHunt:
	text_far _SafariZoneRestHouse2TextRangerHunt
	text_end

SafariZoneRestHouse2TextKangaskhan:
	text_far _SafariZoneRestHouse2TextFreeRoam
	text_end

SafariZoneWestRestHouseCooltrainerMText:
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
	rst _PrintText
	rst TextScriptEnd

SafariZoneRestHouse2TextDefault2:
	text_far _SafariZoneWestRestHouseCooltrainerMText
	text_end

SafariZoneRestHouse2TextRangerHunt2:
	text_far _SafariZoneRestHouse2TextRangerHunt2
	text_end

SafariZoneRestHouse2TextFreeRoam2:
	text_far _SafariZoneRestHouse2TextFreeRoam2
	text_end

SafariZoneWestRestHouseSilphWorkerFText:
	text_far _SafariZoneWestRestHouseSilphWorkerFText
	text_end
