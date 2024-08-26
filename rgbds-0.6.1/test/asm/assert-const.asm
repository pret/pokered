; The following link-time assertion is known by RGBASM to be okay.
; This previously caused it to still pass the assertion to RGBLINK with an empty
; RPN expression

SECTION "rgbasm passing asserts", ROM0[0]
	db 0
	assert @
