; PureRGBnote: FIXED: function to redraw the party menu without any bottom box text, used to avoid minor graphical glitches
EmptyPartyMenuRedraw::
	hlcoord 11, 11
	lb bc, 1, 9
	call ClearScreenArea
	ld a, EMPTY_PARTY_MENU ; new party menu text option - it just displays no text in the bottom box since we'll be writing there immediately
	ld [wPartyMenuTypeOrMessageID], a
	call RedrawPartyMenu 
	xor a ; NORMAL_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	ret