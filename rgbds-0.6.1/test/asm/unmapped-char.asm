opt Wunmapped-char=1 ; non-default empty charmaps can have unmapped chars

SECTION "test", ROM0

	db "A" ; OK, default empty charmap

	pushc
	newcharmap custom
	db "A" ; OK, unmapped in non-default empty charmap
		pusho
		opt Wunmapped-char=2
		db "A" ; unmapped in non-default empty charmap
		popo
	charmap "C", $99
	db "A" ; unmapped in non-empty charmap
	popc

	db "A" ; OK, default empty charmap again

	charmap "B", $42
	db "A" ; unmapped in non-empty charmap

	println "A" ; does not use charmap

	opt Wno-unmapped-char
	db "A" ; warning silenced
