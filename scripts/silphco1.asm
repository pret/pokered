SilphCo1Script: ; 5d44e (17:544e)
	call EnableAutoTextBoxDrawing
	ld a, [wd838]
	bit 7, a
	ret z
	ld hl, wd7b9
	bit 7, [hl]
	set 7, [hl]
	ret nz
	ld a, $4c
	ld [wcc4d], a
	predef_jump ShowObject

SilphCo1TextPointers: ; 5d469 (17:5469)
	dw SilphCo1Text1

SilphCo1Text1: ; 5d46b (17:546b)
	TX_FAR _SilphCo1Text1
	db "@"
