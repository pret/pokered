; PureRGBnote: ADDED: code that displays the name of a TM when scrolling over it on various list screens that can contain TMs.
;                     this code is called from the generic list menu code if the menu that called it indicates it can contain TMs via wListMenuHoverTextType
CheckLoadTmName:: ; loads a TM name when the cursor is on TMs
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr z, .getItem ; if it's an item menu, proceed
	cp PRICEDITEMLISTMENU
	jr nz, .notTMHM ; other menus cant contain TMs, so no need to check anything
.getItem
	call GetListEntryID
	jr c, .notTMHM
	; a = current list entry ID
	cp HM01
	jr c, .notTMHM ; item is not a TM or HM, do nothing
	sub TM01 ; underflows below 0 for HM items (before TM items)
	push af
	jr nc, .skipAdding
	add NUM_TMS + NUM_HMS ; adjust HM IDs to come after TM IDs
.skipAdding
	inc a
	ld [wNamedObjectIndex], a
	predef TMToMove ; get move ID from TM/HM ID

	hlcoord 4, 13
	lb bc, 1, 14  ; height, width
	call TextBoxBorder
	call UpdateSprites
	ld a, [wNameListType] ; GetMoveName changes this value so we need to back it up
	push af
	ld a, [wNamedObjectIndex]
	ld [wMoveNum], a
	call GetMoveName
	pop af
	ld [wNameListType], a
	pop af
	call CopyToStringBuffer
	bccoord 6, 14
	ld hl, TMParamMoveNameText
	call TextCommandProcessor
	ld a, 1
	ld [wListMenuHoverTextShown], a
	ret
.notTMHM
	; fall through
ClearTMTextBox:
	ld a, [wListMenuHoverTextShown]
	and a
	ret z
	hlcoord 4, 13
	lb bc, 16, 3 
	predef LoadScreenTileAreaFromBuffer3
	call UpdateSprites
	xor a
	ld [wListMenuHoverTextShown], a
	ret

CheckSaveTMTextScreenTiles::
	; we need to save some tiles for later in case we display a TM text box above these tiles
	hlcoord 4, 13
	lb bc, 16, 3
	predef_jump SaveScreenTileAreaToBuffer3


TMParamMoveNameText::
	text "@"
	text_ram wStringBuffer
	text_end
