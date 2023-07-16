CeruleanCave1F_Script:
	; PureRGBnote: ADDED: if we defeated professor oak once we go back to this floor he will be reset and can be fought again.
	ResetEvent EVENT_BEAT_PROF_OAK 
	jp EnableAutoTextBoxDrawing

CeruleanCave1F_TextPointers:
	def_text_pointers
	dw_const PickUpItemText, TEXT_CERULEANCAVE1F_ITEM1
	dw_const PickUpItemText, TEXT_CERULEANCAVE1F_ITEM2
	dw_const PickUpItemText, TEXT_CERULEANCAVE1F_ITEM3
