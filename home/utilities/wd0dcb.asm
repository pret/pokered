; writes c to wd0dc+b
Func_137a:: ; 137a (0:137a)
	ld hl, wd0dc
	ld e, b
	ld d, $0
	add hl, de
	ld a, c
	ld [hl], a
	ret