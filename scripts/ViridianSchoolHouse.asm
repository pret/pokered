ViridianSchoolHouse_Script:
	jp EnableAutoTextBoxDrawing

ViridianSchoolHouse_TextPointers:
	def_text_pointers
	dw_const ViridianSchoolHouseBrunetteGirlText, TEXT_VIRIDIANSCHOOLHOUSE_BRUNETTE_GIRL
	dw_const ViridianSchoolHouseCooltrainerFText, TEXT_VIRIDIANSCHOOLHOUSE_COOLTRAINER_F
	dw_const SchoolText3,                         TEXT_VIRIDIANSCHOOLHOUSE_ROCKER
	dw_const SchoolText4,                         TEXT_VIRIDIANSCHOOLHOUSE_DETENTION_SIGN

ViridianSchoolHouseBrunetteGirlText:
	text_far _ViridianSchoolHouseBrunetteGirlText
	text_end

ViridianSchoolHouseCooltrainerFText:
	text_far _ViridianSchoolHouseCooltrainerFText
	text_end

SchoolText3:
	text_far _SchoolText3
	text_end

SchoolText4:
	text_far _SchoolText4
	text_end

