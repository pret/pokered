SafariZoneEast_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneEast_TextPointers:
	def_text_pointers
	dw_const PickUpItemText,                  TEXT_SAFARIZONEEAST_FULL_RESTORE
	dw_const PickUpItemText,                  TEXT_SAFARIZONEEAST_MAX_RESTORE
	dw_const PickUpItemText,                  TEXT_SAFARIZONEEAST_CARBOS
	dw_const PickUpItemText,                  TEXT_SAFARIZONEEAST_TM_EGG_BOMB
	dw_const SafariZoneEastRestHouseSignText, TEXT_SAFARIZONEEAST_REST_HOUSE_SIGN
	dw_const SafariZoneEastTrainerTipsText,   TEXT_SAFARIZONEEAST_TRAINER_TIPS
	dw_const SafariZoneEastSignText,          TEXT_SAFARIZONEEAST_SIGN

SafariZoneEastRestHouseSignText:
	text_far _SafariZoneEastRestHouseSignText
	text_end

SafariZoneEastTrainerTipsText:
	text_far _SafariZoneEastTrainerTipsText
	text_end

SafariZoneEastSignText:
	text_far _SafariZoneEastSignText
	text_end
