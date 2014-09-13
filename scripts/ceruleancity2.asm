Func_74872: ; 74872 (1d:4872)
; code similar to this appears in a lot of banks; this particular
; one is called after you beat the Rocket that gives you TM28 DIG.
; the screen then fades out, he disappears, and fades back in
	call GBFadeOutToBlack
	ld a, $07
	ld [wcc4d], a
	predef ShowObject
	ld a, $09
	ld [wcc4d], a
	predef HideObject
	ld a, $06
	ld [wcc4d], a
	predef HideObject
	call GBFadeInFromBlack
	ret
