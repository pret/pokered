SECTION "Test", ROM0

	db "ABC"
	dw "ABC"
	dl "ABC"

	db 0, "DEF", -1
	dw 0, "DEF", -1
	dl 0, "DEF", -1

	db "A" + 1
	dw "A" + 1
	dl "A" + 1

	db 1, ("WXYZ") & $ff, -1
	dw 1, ("WXYZ") & $ffff, -1
	dl 1, ("WXYZ"), -1
