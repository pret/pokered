SECTION "test", ROM0[0]

Label:
	ds 4, 42
.other
	ds 5, .other - Label - 5 ; Expressions should work...
	ds 60, .last - Label     ; ...even if not constant
.last
	ds 11, $67, $89
