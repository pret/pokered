; function to draw various text boxes
; INPUT:
; [wTextBoxID] = text box ID
; b, c = y, x cursor position (TWO_OPTION_MENU only)
DisplayTextBoxID::
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(DisplayTextBoxID_)
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call DisplayTextBoxID_
	pop bc
	ld a, b
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret
