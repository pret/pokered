Route15Gate1F_Script:
	jp EnableAutoTextBoxDrawing

Route15Gate1F_TextPointers:
	def_text_pointers
	dw_const Route15Gate1FGuardText, TEXT_ROUTE15GATE1F_GUARD

Route15Gate1FGuardText:
	text_far _Route15Gate1FGuardText
	text_end
