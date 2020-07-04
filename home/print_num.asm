PrintNumber::
; Print the c-digit, b-byte value at de.
; Allows 2 to 7 digits. For 1-digit numbers, add
; the value to char "0" instead of calling PrintNumber.
; Flags LEADING_ZEROES and LEFT_ALIGN can be given
; in bits 7 and 6 of b respectively.
	push bc
	xor a
	ld [hPastLeadingZeros], a
	ld [hNumToPrint], a
	ld [hNumToPrint + 1], a
	ld a, b
	and $f
	cp 1
	jr z, .byte
	cp 2
	jr z, .word
.long
	ld a, [de]
	ld [hNumToPrint], a
	inc de
	ld a, [de]
	ld [hNumToPrint + 1], a
	inc de
	ld a, [de]
	ld [hNumToPrint + 2], a
	jr .start

.word
	ld a, [de]
	ld [hNumToPrint + 1], a
	inc de
	ld a, [de]
	ld [hNumToPrint + 2], a
	jr .start

.byte
	ld a, [de]
	ld [hNumToPrint + 2], a

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

print_digit: macro

if (\1) / $10000
	ld a, \1 / $10000 % $100
else	xor a
endc
	ld [hPowerOf10 + 0], a

if (\1) / $100
	ld a, \1 / $100   % $100
else	xor a
endc
	ld [hPowerOf10 + 1], a

	ld a, \1 / $1     % $100
	ld [hPowerOf10 + 2], a

	call .PrintDigit
	call .NextDigit
endm

.millions          print_digit 1000000
.hundred_thousands print_digit 100000
.ten_thousands     print_digit 10000
.thousands         print_digit 1000
.hundreds          print_digit 100

.tens
	ld c, 0
	ld a, [hNumToPrint + 2]
.mod
	cp 10
	jr c, .ok
	sub 10
	inc c
	jr .mod
.ok

	ld b, a
	ld a, [hPastLeadingZeros]
	or c
	ld [hPastLeadingZeros], a
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
	ld a, [hPowerOf10]
	ld b, a
	ld a, [hNumToPrint]
	ld [hSavedNumToPrint], a
	cp b
	jr c, .underflow0
	sub b
	ld [hNumToPrint], a
	ld a, [hPowerOf10 + 1]
	ld b, a
	ld a, [hNumToPrint + 1]
	ld [hSavedNumToPrint + 1], a
	cp b
	jr nc, .noborrow1

	ld a, [hNumToPrint]
	or 0
	jr z, .underflow1
	dec a
	ld [hNumToPrint], a
	ld a, [hNumToPrint + 1]
.noborrow1

	sub b
	ld [hNumToPrint + 1], a
	ld a, [hPowerOf10 + 2]
	ld b, a
	ld a, [hNumToPrint + 2]
	ld [hSavedNumToPrint + 2], a
	cp b
	jr nc, .noborrow2

	ld a, [hNumToPrint + 1]
	and a
	jr nz, .borrowed

	ld a, [hNumToPrint]
	and a
	jr z, .underflow2
	dec a
	ld [hNumToPrint], a
	xor a
.borrowed

	dec a
	ld [hNumToPrint + 1], a
	ld a, [hNumToPrint + 2]
.noborrow2
	sub b
	ld [hNumToPrint + 2], a
	inc c
	jr .loop

.underflow2
	ld a, [hSavedNumToPrint + 1]
	ld [hNumToPrint + 1], a
.underflow1
	ld a, [hSavedNumToPrint]
	ld [hNumToPrint], a
.underflow0
	ld a, [hPastLeadingZeros]
	or c
	jr z, .PrintLeadingZero

	ld a, "0"
	add c
	ld [hl], a
	ld [hPastLeadingZeros], a
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
	ld a, [hPastLeadingZeros]
	and a
	ret z
.inc
	inc hl
	ret
