SafariZoneNorthRestHouse_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneNorthRestHouse_TextPointers:
	def_text_pointers
	dw_const SafariZoneNorthRestHouseScientistText,        TEXT_SAFARIZONENORTHRESTHOUSE_SCIENTIST
	dw_const SafariZoneNorthRestHouseSafariZoneWorkerText, TEXT_SAFARIZONENORTHRESTHOUSE_SAFARI_ZONE_WORKER
	dw_const SafariZoneNorthRestHouseGentlemanText,        TEXT_SAFARIZONENORTHRESTHOUSE_GENTLEMAN

SafariZoneNorthRestHouseScientistText:
; PureRGBnote: ADDED: this NPC will display different text depending on what type of safari game you're playing
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
	rst _PrintText
	rst TextScriptEnd

SafariZoneRestHouse4TextDefault:
	text_far _SafariZoneNorthRestHouseScientistText
	text_end

SafariZoneRestHouse4TextRangerHunt:
	text_far _SafariZoneRestHouse4TextRangerHunt
	text_end

SafariZoneRestHouse4TextChansey:
	text_far _SafariZoneRestHouse4TextChansey
	text_end

SafariZoneNorthRestHouseSafariZoneWorkerText:
	text_far _SafariZoneNorthRestHouseSafariZoneWorkerText
	text_end

SafariZoneNorthRestHouseGentlemanText:
	text_far _SafariZoneNorthRestHouseGentlemanText
	text_end
