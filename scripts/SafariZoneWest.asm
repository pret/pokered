SafariZoneWest_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneWest_TextPointers:
	def_text_pointers
	dw_const PickUpItemText,                         TEXT_SAFARIZONEWEST_MAX_POTION
	dw_const PickUpItemText,                         TEXT_SAFARIZONEWEST_TM_DOUBLE_TEAM
	dw_const PickUpItemText,                         TEXT_SAFARIZONEWEST_MAX_REVIVE
	dw_const PickUpItemText,                         TEXT_SAFARIZONEWEST_GOLD_TEETH
	dw_const SafariZoneWestRestHouseSignText,        TEXT_SAFARIZONEWEST_REST_HOUSE_SIGN
	dw_const SafariZoneWestFindWardensTeethSignText, TEXT_SAFARIZONEWEST_FIND_WARDENS_TEETH_SIGN
	dw_const SafariZoneWestTrainerTipsText,          TEXT_SAFARIZONEWEST_TRAINER_TIPS
	dw_const SafariZoneWestSignText,                 TEXT_SAFARIZONEWEST_SIGN

SafariZoneWestRestHouseSignText:
	text_far _SafariZoneWestRestHouseSignText
	text_end

SafariZoneWestFindWardensTeethSignText:
	text_far _SafariZoneWestFindWardensTeethSignText
	text_end

SafariZoneWestTrainerTipsText:
	text_far _SafariZoneWestTrainerTipsText
	text_end

SafariZoneWestSignText:
	text_far _SafariZoneWestSignText
	text_end
