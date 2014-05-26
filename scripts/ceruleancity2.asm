Func_74872: ; 74872 (1d:4872)
; code similar to this appears in a lot of banks; this particular
; one is called after you beat the Rocket that gives you TM28 DIG.
; the screen then fades out, he disappears, and fades back in
	call GBFadeIn1
	ld a, $07
	ld [wcc4d], a
	ld a, $15
	call Predef
	ld a, $09
	ld [wcc4d], a
	ld a, $11
	call Predef
	ld a, $06
	ld [wcc4d], a
	ld a, $11
	call Predef
	call GBFadeOut1
	ret
