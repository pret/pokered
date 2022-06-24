DiglettsCaveRoute2_Script:
	ld a, ROUTE_2
	ld [wLastMap], a
	jp EnableAutoTextBoxDrawing

DiglettsCaveRoute2_TextPointers:
	def_text_pointers
	dw_const DiglettsCaveRoute2FishingGuruText, TEXT_DIGLETTSCAVEROUTE2_FISHING_GURU

DiglettsCaveRoute2FishingGuruText:
	text_far _DiglettsCaveRoute2FishingGuruText
	text_end
