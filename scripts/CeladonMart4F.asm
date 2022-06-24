CeladonMart4F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMart4F_TextPointers:
	def_text_pointers
	dw_const CeladonMart4FClerkText,            TEXT_CELADONMART4F_CLERK
	dw_const CeladonMart4FSuperNerdText,        TEXT_CELADONMART4F_SUPER_NERD
	dw_const CeladonMart4FYoungsterText,        TEXT_CELADONMART4F_YOUNGSTER
	dw_const CeladonMart4FCurrentFloorSignText, TEXT_CELADONMART4F_CURRENT_FLOOR_SIGN

CeladonMart4FSuperNerdText:
	text_far _CeladonMart4FSuperNerdText
	text_end

CeladonMart4FYoungsterText:
	text_far _CeladonMart4FYoungsterText
	text_end

CeladonMart4FCurrentFloorSignText:
	text_far _CeladonMart4FCurrentFloorSignText
	text_end
