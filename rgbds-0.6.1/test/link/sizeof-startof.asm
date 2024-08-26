SECTION "meta", ROM0[0]
	db BANK("sect")
	dw STARTOF("sect")
	dw SIZEOF("sect")

SECTION "sect", ROMX[$4567], BANK[$23]
	ds 42
