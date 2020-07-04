PrintRedSNESText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump RedBedroomSNESText

RedBedroomSNESText::
	text_far _RedBedroomSNESText
	text_end

OpenRedsPC:
	call EnableAutoTextBoxDrawing
	tx_pre_jump RedBedroomPCText

RedBedroomPCText::
	script_players_pc
