CallFunctionInTable::
; Call function a in jumptable hl.
; de is not preserved.
	push hl
	push de
	push bc
	add a
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .returnAddress
	push de
	jp hl
.returnAddress
	pop bc
	pop de
	pop hl
	ret

IsInArray::
; Search an array at hl for the value in a.
; Entry size is de bytes.
; Return count b and carry if found.
	ld b, 0

IsInRestOfArray::
	ld c, a
.loop
	ld a, [hl]
	cp -1
	jr z, .notfound
	cp c
	jr z, .found
	inc b
	add hl, de
	jr .loop

.notfound
	and a
	ret

.found
	scf
	ret

; navigates to index a in an array of bytes in hl and gets the pointer from that index into hl
GetAddressFromPointerArray::
	ld d, 0
	ld e, a
	add hl, de
	add hl, de ; 2 bytes per pointer
GetAddressFromPointer::
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret