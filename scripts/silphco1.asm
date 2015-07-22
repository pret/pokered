SilphCo1Script: ; 5d44e (17:544e)
	call EnableAutoTextBoxDrawing
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ret z
	CheckAndSetEvent EVENT_SILPH_CO_RECEPTIONIST_AT_DESK
	ret nz
	ld a, HS_SILPH_CO_1F_RECEPTIONIST
	ld [wcc4d], a
	predef_jump ShowObject

SilphCo1TextPointers: ; 5d469 (17:5469)
	dw SilphCo1Text1

SilphCo1Text1: ; 5d46b (17:546b)
	TX_FAR _SilphCo1Text1
	db "@"
