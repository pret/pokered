Func_74872: ; 74872 (1d:4872)
; code similar to this appears in a lot of banks; this particular
; one is called after you beat the Rocket that gives you TM28 DIG.
; the screen then fades out, he disappears, and fades back in
	call GBFadeOutToBlack
	ld a, HS_CERULEAN_GUARD_1
	ld [wcc4d], a
	predef ShowObject
	ld a, HS_CERULEAN_GUARD_2
	ld [wcc4d], a
	predef HideObject
	ld a, HS_CERULEAN_ROCKET
	ld [wcc4d], a
	predef HideObject
	call GBFadeInFromBlack
	ret
