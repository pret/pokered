; displays yes/no choice
; yes -> set carry
YesNoChoice::
	call SaveScreenTilesToBuffer1
	call InitYesNoTextBoxParameters
	jr DisplayYesNoChoice

;TwoOptionMenu:: ; unreferenced
;	ld a, TWO_OPTION_MENU
;	ld [wTextBoxID], a
;	call InitYesNoTextBoxParameters
;	jp DisplayTextBoxID

InitYesNoTextBoxParameters::
	xor a ; YES_NO_MENU
	ld [wTwoOptionMenuID], a
	hlcoord 14, 7
	lb bc, 8, 15
	ret

YesNoChoicePokeCenter::
	call SaveScreenTilesToBuffer1
	ld a, HEAL_CANCEL_MENU
	ld [wTwoOptionMenuID], a
	hlcoord 11, 6
	lb bc, 8, 12
	jr DisplayYesNoChoice

;WideYesNoChoice:: ; unused
;	call SaveScreenTilesToBuffer1
;	ld a, WIDE_YES_NO_MENU
;	ld [wTwoOptionMenuID], a
;	hlcoord 12, 7
;	lb bc, 8, 13

DisplayYesNoChoice::
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	jp LoadScreenTilesFromBuffer1

; hl = which list in multi_choice_menu.asm to use
; b = what buttons to watch
; output = wCurrentMenuItem = which entry the cursor was on
; z flag = whether they pressed B on the menu (nz if they did)
DisplayMultiChoiceTextBox::
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wCurrentMenuItem], a
	ld a, b
	ld [wMenuWatchedKeys], a
	callfar DisplayMultiChoiceMenu
	ldh a, [hJoy5]
	bit BIT_B_BUTTON, a
	ret
