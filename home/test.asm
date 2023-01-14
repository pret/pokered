PrintDebugMsg::
	push hl
	ld hl, TestText
	rst PrintTextRST
	pop hl
	ret

TestText:
	text "Debug"
	prompt