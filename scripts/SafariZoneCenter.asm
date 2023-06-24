SafariZoneCenter_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneCenter_TextPointers:
	def_text_pointers
	dw_const PickUpItemText,                      TEXT_SAFARIZONECENTER_NUGGET
	dw_const SafariZoneCenterRestHouseSignText,   TEXT_SAFARIZONECENTER_REST_HOUSE_SIGN
	dw_const SafariZoneCenterTrainerTipsSignText, TEXT_SAFARIZONECENTER_TRAINER_TIPS_SIGN

SafariZoneCenterRestHouseSignText:
	text_far _SafariZoneCenterRestHouseSignText
	text_end

SafariZoneCenterTrainerTipsSignText:
	text_far _SafariZoneCenterTrainerTipsSignText
	text_end
