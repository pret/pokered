PrintDebugMsg::
	push hl
	ld hl, TestText
	rst _PrintText
	pop hl
	ret

TestText:
	text "Debug"
	prompt