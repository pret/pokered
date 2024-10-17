; PureRGBnote: ADDED: Erik and Sara can now be reunited in this map. After they will go to their house on ROUTE 19.
SafariZoneCenterRestHouse_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneCenterRestHouse_TextPointers:
	def_text_pointers
	dw_const SafariZoneCenterRestHouseSaraText,      TEXT_SAFARIZONECENTERRESTHOUSE_SARA
	dw_const SafariZoneCenterRestHouseScientistText, TEXT_SAFARIZONECENTERRESTHOUSE_SCIENTIST
	dw_const SafariZoneCenterRestHouseErikText,      TEXT_SAFARIZONECENTERRESTHOUSE_ERIK

SafariZoneCenterRestHouseSaraText:
	text_asm
	CheckExtraHideShowState HS_SAFARI_ZONE_CENTER_REST_HOUSE_ERIK
	jr z, .reunited
	SetEvent EVENT_MET_SARA
	ld hl, .whereErik
	rst _PrintText
	CheckEvent EVENT_MET_ERIK
	jr z, .done
	call DisplayTextPromptButton
	ld hl, .goGetErik
	rst _PrintText
.done
	rst TextScriptEnd	
.reunited
	ld hl, .reunitedText
	rst _PrintText
	ld a, SAFARIZONECENTERRESTHOUSE_SARA
	call SetSpriteFacingRight
	ld hl, .okayRicky
	rst _PrintText
	call ShowHouseSaraErik
	rst TextScriptEnd
.whereErik
	text_far _SafariZoneCenterRestHouseGirlText
	text_end
.goGetErik
	text_far _SaraErikOutsideText
	text_end
.reunitedText
	text_far _SaraReunitedText
	text_end
.okayRicky
	text_far _SaraOkayRicky
	text_end

SafariZoneCenterRestHouseScientistText:
	text_far _SafariZoneCenterRestHouseScientistText
	text_end

SafariZoneCenterRestHouseErikText:
	text_far _ErikReunitedText
	text_asm
	call ShowHouseSaraErik
	rst TextScriptEnd

ShowHouseSaraErik:
	ld a, HS_ERIK_HOUSE
	call .show
	ld a, HS_SARA_HOUSE
.show
	ld [wMissableObjectIndex], a
	predef_jump ShowExtraObject