; Need to figure out what this does
Func_152e:: ; 152e (0:152e)
	ld hl,wd0dc
	ld c,a
	ld b,0
	add hl,bc
	ld a,[hl]
	ret