CeruleanCave1F_Script:
	; PureRGBnote: ADDED: if we defeated professor oak once we go back to this floor he will be reset and can be fought again.
	ResetEvent EVENT_BEAT_PROF_OAK 
	jp EnableAutoTextBoxDrawing

CeruleanCave1F_TextPointers:
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
