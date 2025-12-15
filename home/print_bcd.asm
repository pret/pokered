; function to print a BCD (Binary-coded decimal) number
; de = address of BCD number
; hl = destination address
; c = flags and length
; bit 7: if set, do not print leading zeroes
;        if unset, print leading zeroes
; bit 6: if set, left-align the string (do not pad empty digits with spaces)
;        if unset, right-align the string
; bit 5: if set, print currency symbol at the beginning of the string
;        if unset, do not print the currency symbol
; bits 0-4: length of BCD number in bytes
; Note that bits 5 and 7 are modified during execution. The above reflects
; their meaning at the beginning of the functions's execution.
PrintBCDNumber::
	ld b, c ; save flags in b
	res BIT_LEADING_ZEROES, c
	res BIT_LEFT_ALIGN, c
	res BIT_MONEY_SIGN, c ; c now holds the length
	bit BIT_MONEY_SIGN, b
	jr z, .loop
	bit BIT_LEADING_ZEROES, b
	jr nz, .loop
	ld [hl], '¥'
	inc hl
.loop
	ld a, [de]
	swap a
	call PrintBCDDigit ; print upper digit
	ld a, [de]
	call PrintBCDDigit ; print lower digit
	inc de
	dec c
	jr nz, .loop
	bit BIT_LEADING_ZEROES, b ; were any non-zero digits printed?
	jr z, .done ; if so, we are done
; if every digit of the BCD number is zero, print the last 0
	bit BIT_LEFT_ALIGN, b
	jr nz, .skipRightAlignmentAdjustment
	dec hl ; if the string is right-aligned, it needs to be moved back one space
.skipRightAlignmentAdjustment
	bit BIT_MONEY_SIGN, b
	jr z, .skipCurrencySymbol
	ld [hl], '¥'
	inc hl
.skipCurrencySymbol
	ld [hl], '0'
	call PrintLetterDelay
	inc hl
.done
	ret

PrintBCDDigit::
	and $f
	and a
	jr z, .zeroDigit
.nonzeroDigit
	bit BIT_LEADING_ZEROES, b
	jr z, .outputDigit
; if bit 7 is set, then no numbers have been printed yet
	bit BIT_MONEY_SIGN, b
	jr z, .skipCurrencySymbol
	ld [hl], '¥'
	inc hl
	res BIT_MONEY_SIGN, b
.skipCurrencySymbol
	res BIT_LEADING_ZEROES, b
.outputDigit
	add '0'
	ld [hli], a
	jp PrintLetterDelay
.zeroDigit
	bit BIT_LEADING_ZEROES, b
	jr z, .outputDigit ; if so, print a zero digit
	bit BIT_LEFT_ALIGN, b
	ret nz
	inc hl ; if right-aligned, "print" a space by advancing the pointer
	ret
