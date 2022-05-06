PrintDebugMsg::
	push hl
	ld hl, TestText
	call PrintText
	pop hl
	ret

TestText:
	text "Debug"
	prompt