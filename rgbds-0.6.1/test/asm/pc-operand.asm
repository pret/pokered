SECTION "fixed", ROM0[0]

	rst @    ; rst 0
	ld de, @ ; ld de, 1
	bit @, h ; bit 4, h
	jr @     ; jr 6

SECTION "floating", ROM0

	rst @    ; rst 8
	ld l, @  ; ld l, 9
	db @, @  ; db 11, 12
	dw @, @  ; dw 13, 15
	dl @, @  ; dl 17, 21
	jr @     ; jr 25
