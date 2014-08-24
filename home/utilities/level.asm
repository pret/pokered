; function to print pokemon level, leaving off the ":L" if the level is at least 100
; INPUT:
; hl = destination address
; [wcfb9] = level
PrintLevel:: ; 150b (0:150b)
	ld a,$6e ; ":L" tile ID
	ld [hli],a
	ld c,2 ; number of digits
	ld a,[wcfb9] ; level
	cp a,100
	jr c,PrintLevelCommon
; if level at least 100, write over the ":L" tile
	dec hl
	inc c ; increment number of digits to 3
	jr PrintLevelCommon

; prints the level without leaving off ":L" regardless of level
; INPUT:
; hl = destination address
; [wcfb9] = level
PrintLevelFull:: ; 151b (0:151b)
	ld a,$6e ; ":L" tile ID
	ld [hli],a
	ld c,3 ; number of digits
	ld a,[wcfb9] ; level

PrintLevelCommon:: ; 1523 (0:1523)
	ld [wd11e],a
	ld de,wd11e
	ld b,$41 ; no leading zeroes, left-aligned, one byte
	jp PrintNumber