; PureRGBnote: ADDED:
; code for jumping from the start of a list to the end, happens when pressing left Dpad at the top or bottom of a list menu.
; List menus are the ones capable of scrolling. (Item menu, battle item menu, PC menus, elevator menus, etc.)
WrapListMenu::
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wListScrollOffset]
	or b ; are both 0 (top of list)
	jr z, .goToBottom
	; wCurrentMenuItem still stored in b
	ld a, [wListScrollOffset]
	add b
	ld b, a ; wListScrollOffset + wCurrentMenuItem = current list index
	ld a, [wListCount] ; number of selectable entries in the list (excluding CANCEL) (will be same value as max possible index value including CANCEL)
	cp b ; is the current index at the max index (arrow on CANCEL)
	ret nz ; return if not
.goToTop
	xor a
	; skip to the top: when both of these are 0 we're at the top of the list
	ld [wListScrollOffset], a
	ld [wCurrentMenuItem], a
	jr .doneWithTMCheck
.goToBottom
	ld a, [wListCount]
	cp 3
	; if the list length is 3 or less we don't have to account for offsets
	jr c, .shortList
	ld a, [wListCount]
	sub 2 ; scroll offset is only incremented after we pass the 3rd item in the list so need to account for that when setting "max scroll offset"
	ld [wListScrollOffset], a
.shortList
	ld a, [wMaxMenuItem] ; wMaxMenuItem = lowest item you can reach before scrolling is triggered (usually 3rd in the list)
	ld [wCurrentMenuItem], a
.doneWithTMCheck
	; if we skipped to the top or bottom of the list there may be TM content text to show/hide
	jp CheckForHoverText