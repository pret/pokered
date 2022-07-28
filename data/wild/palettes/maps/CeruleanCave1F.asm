; PureRGBnote: ADDED: indicates which encounters will use alt palettes in the area specified. 1 is alt palette, 0 is normal
; first encounter slot is the rightmost bit on line 1 (read from right to left)
; first 10 bits: grass encounters 
; next 10 bits: water encounters
; last 4 bits: super rod encounters

CeruleanCave1FWildPalettes:
	db %01110011
	db %01010100
	db %11110101

