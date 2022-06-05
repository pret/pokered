; code for jumping from the start of a list to the end, happens when pressing left Dpad at the top or bottom of a list menu.
; List menus are the ones capable of scrolling. (Item menu, battle item menu, PC menus, elevator menus, etc.)
WrapListMenu::
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wListScrollOffset]
	or b ; are both 0 (top of list)
	jr z, .goToBottom
	ld a, [wListScrollOffset]
	add 3
	ld b, a
	ld a, [wListCount]
	cp b ; are we at the bottom scrollable level of the list
	call c, .checkTop ; need one more check before doing the skip
	jr .done
.checkTop
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wMaxMenuItem]
	cp b ; are we at the last item visually on screen
	jr z, .goToTop
	jr .done
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
	sub 2
	ld [wListScrollOffset], a
.shortList
	ld a, [wMaxMenuItem]
	ld [wCurrentMenuItem], a
.doneWithTMCheck
	; if we skipped to the top or bottom of the list there may be TM content text to show/hide
	call CheckForTM
.done
	ret