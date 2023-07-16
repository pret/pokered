SSAnne1F_Script:
	call EnableAutoTextBoxDrawing
	ret

SSAnne1F_TextPointers:
	def_text_pointers
	dw_const SSAnne1FWaiterText, TEXT_SSANNE1F_WAITER
	dw_const SSAnne1FSailorText, TEXT_SSANNE1F_SAILOR

SSAnne1FWaiterText:
	text_far _SSAnne1FWaiterText
	text_end

SSAnne1FSailorText:
	text_far _SSAnne1FSailorText
	text_end
