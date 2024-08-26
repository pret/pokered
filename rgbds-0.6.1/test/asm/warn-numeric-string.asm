opt Wno-unmapped-char
charmap "<NULL>", $00

SECTION "ROM", ROM0

MACRO try
	OPT \1
	; no warning
	db "A" * 2
	db ("<NULL>")
	; warn at level 1
	dl ("AB<NULL>CD")
	dl "<NULL" + ">NULL>"
	; warn at level 2
	dl (STRCAT("A", "B"))
	dl "A<NULL>Z" + 1
ENDM

	try Wno-numeric-string
	try Wnumeric-string
	try Wnumeric-string=0
	try Wnumeric-string=1
	try Wnumeric-string=2
	try Werror=numeric-string=1
	try Werror=numeric-string=2
