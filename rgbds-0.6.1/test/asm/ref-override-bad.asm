
SECTION "Bad!", ROM0

	db W
W equ 0 ; OK

	db X
X equs "0" ; Not OK

	db Y
macro Y ; Not ok
	db 0
endm
