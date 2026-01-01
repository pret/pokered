CeruleanHideRocket:
; code similar to this appears in a lot of banks; this particular
; one is called after you beat the Rocket that gives you TM28 DIG.
; the screen then fades out, he disappears, and fades back in
	call GBFadeOutToBlack
	ld a, TOGGLE_CERULEAN_GUARD_1
	ld [wToggleableObjectIndex], a
	predef ShowObject
	ld a, TOGGLE_CERULEAN_GUARD_2
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_CERULEAN_ROCKET
	ld [wToggleableObjectIndex], a
	predef HideObject
	call GBFadeInFromBlack
	ret
