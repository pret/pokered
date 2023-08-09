Route11Gate1F_Script:
	jp EnableAutoTextBoxDrawing

Route11Gate1F_TextPointers:
	def_text_pointers
	dw_const Route11Gate1FGuardText, TEXT_ROUTE11GATE1F_GUARD

Route11Gate1FGuardText:
	text_far _Route11Gate1FGuardText
	text_end
