CeruleanHideRocket:
; code similar to this appears in a lot of banks; this particular
; one is called after you beat the Rocket that gives you TM28 DIG.
; the screen then fades out, he disappears, and fades back in
	call GBFadeOutToBlack
	ld a, HS_CERULEAN_GUARD_1
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_CERULEAN_GUARD_2
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_CERULEAN_ROCKET
	ld [wMissableObjectIndex], a
	predef HideObject
	call GBFadeInFromBlack
	ret
