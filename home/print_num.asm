PrintNumber::
; Print the c-digit, b-byte value at de.
; Allows 2 to 7 digits. For 1-digit numbers, add
; the value to char "0" instead of calling PrintNumber.
; Flags LEADING_ZEROES and LEFT_ALIGN can be given
; in bits 7 and 6 of b respectively.
	push bc
	xor a
	ldh [hPastLeadingZeros], a
	ldh [hNumToPrint], a
	ldh [hNumToPrint + 1], a
	ld a, b
	and $f
	cp 1
	jr z, .byte
	cp 2
	jr z, .word
.long
	ld a, [de]
	ldh [hNumToPrint], a
	inc de
	ld a, [de]
	ldh [hNumToPrint + 1], a
	inc de
	ld a, [de]
	ldh [hNumToPrint + 2], a
	jr .start

.word
	ld a, [de]
	ldh [hNumToPrint + 1], a
	inc de
	ld a, [de]
	ldh [hNumToPrint + 2], a
	jr .start

.byte
	ld a, [de]
	ldh [hNumToPrint + 2], a

.start
	push de

	ld d, b
	ld a, c
	ld b, a
	xor a
	ld c, a
	ld a, b

	cp 2
	jr z, .tens
	cp 3
	jr z, .hundreds
	cp 4
	jr z, .thousands
	cp 5
	jr z, .ten_thousands
	cp 6
	jr z, .hundred_thousands

MACRO print_digit

	IF (\1) / $10000
		ld a, \1 / $10000 % $100
	ELSE
		xor a
	ENDC
	ldh [hPowerOf10 + 0], a

	IF (\1) / $100
		ld a, \1 / $100   % $100
	ELSE
		xor a
	ENDC
	ldh [hPowerOf10 + 1], a

	ld a, \1 / $1     % $100
	ldh [hPowerOf10 + 2], a

	call .PrintDigit
	call .NextDigit
ENDM

.millions          print_digit 1000000
.hundred_thousands print_digit 100000
.ten_thousands     print_digit 10000
.thousands         print_digit 1000
.hundreds          print_digit 100

.tens
	ld c, 0
	ldh a, [hNumToPrint + 2]
.mod
	cp 10
	jr c, .ok
	sub 10
	inc c
	jr .mod
.ok

	ld b, a
	ldh a, [hPastLeadingZeros]
	or c
	ldh [hPastLeadingZeros], a
	jr nz, .past
	call .PrintLeadingZero
	jr .next
.past
	ld a, "0"
	add c
	ld [hl], a
.next

	call .NextDigit
.ones
	ld a, "0"
	add b
	ld [hli], a
	pop de
	dec de
	pop bc
	ret

.PrintDigit:
; Divide by the current decimal place.
; Print the quotient, and keep the modulus.
	ld c, 0
.loop
	ldh a, [hPowerOf10]
	ld b, a
	ldh a, [hNumToPrint]
	ldh [hSavedNumToPrint], a
	cp b
	jr c, .underflow0
	sub b
	ldh [hNumToPrint], a
	ldh a, [hPowerOf10 + 1]
	ld b, a
	ldh a, [hNumToPrint + 1]
	ldh [hSavedNumToPrint + 1], a
	cp b
	jr nc, .noborrow1

	ldh a, [hNumToPrint]
	or 0
	jr z, .underflow1
	dec a
	ldh [hNumToPrint], a
	ldh a, [hNumToPrint + 1]
.noborrow1

	sub b
	ldh [hNumToPrint + 1], a
	ldh a, [hPowerOf10 + 2]
	ld b, a
	ldh a, [hNumToPrint + 2]
	ldh [hSavedNumToPrint + 2], a
	cp b
	jr nc, .noborrow2

	ldh a, [hNumToPrint + 1]
	and a
	jr nz, .borrowed

	ldh a, [hNumToPrint]
	and a
	jr z, .underflow2
	dec a
	ldh [hNumToPrint], a
	xor a
.borrowed

	dec a
	ldh [hNumToPrint + 1], a
	ldh a, [hNumToPrint + 2]
.noborrow2
	sub b
	ldh [hNumToPrint + 2], a
	inc c
	jr .loop

.underflow2
	ldh a, [hSavedNumToPrint + 1]
	ldh [hNumToPrint + 1], a
.underflow1
	ldh a, [hSavedNumToPrint]
	ldh [hNumToPrint], a
.underflow0
	ldh a, [hPastLeadingZeros]
	or c
	jr z, .PrintLeadingZero

	ld a, "0"
	add c
	ld [hl], a
	ldh [hPastLeadingZeros], a
	ret

.PrintLeadingZero:
	bit BIT_LEADING_ZEROES, d
	ret z
	ld [hl], "0"
	ret

.NextDigit:
; Increment unless the number is left-aligned,
; leading zeroes are not printed, and no digits
; have been printed yet.
	bit BIT_LEADING_ZEROES, d
	jr nz, .inc
	bit BIT_LEFT_ALIGN, d
	jr z, .inc
	ldh a, [hPastLeadingZeros]
	and a
	ret z
.inc
	inc hl
	ret
