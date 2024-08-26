	opt Wno-unmapped-char
	charmap "<NULL>", $00
	charmap "A", $10
	charmap "B", $20
	charmap "C", $30
	charmap "Bold", $88

SECTION "test", ROM0

S EQUS "XBold<NULL>ABC"

	assert CHARLEN("{S}") == 6
	println CHARSUB("{S}", 2)
	assert !STRCMP(CHARSUB("{S}", 2), "Bold")
	assert CHARSUB("{S}", -5) == CHARSUB("{S}", CHARLEN("{S}") + 1 - 5)
	assert CHARSUB("{S}", 2) == "Bold" && "Bold" == $88
	assert CHARSUB("{S}", 1) == $58 ; ASCII "X"
	db "{S}"

	newcharmap ascii

	assert CHARLEN("{S}") == 14
	println CHARSUB("{S}", 2)
	assert !STRCMP(CHARSUB("{S}", 2), "B")
	assert CHARSUB("{S}", -5) == CHARSUB("{S}", CHARLEN("{S}") + 1 - 5)
	assert CHARSUB("{S}", 2) == "B" && "B" == $42 ; ASCII "B"
	assert CHARSUB("{S}", 1) == $58 ; ASCII "X"
	db "{S}"
