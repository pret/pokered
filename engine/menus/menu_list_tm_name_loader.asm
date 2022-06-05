
CheckLoadTmName:: ; loads a TM name when the cursor is on TMs
	push af
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr z, .getItem ; if it's an item menu, proceed
	cp PRICEDITEMLISTMENU
	jr z, .getItem ; if it's a shop menu, proceed
	jr .noAction ; other menus cant contain TMs, so no need to check anything
.getItem
	push bc
	push hl
	push de
	ld a, [wListCount]
	and a
	jr z, .notTMHM ;if the list is 0 entries, we only have CANCEL in the list, so don't load any TM info
	ld a, [wCurrentMenuItem]
	ld c, a
	ld a, [wListScrollOffset]
	add c
	ld c, a
	ld a, [wListCount]
	dec a
	cp c ; did the player select Cancel?
	jr c, .notTMHM ; if so, don't display anything
	ld a, c
	ld a, [wCurrentMenuItem]
	ld c, a
	ld a, [wListScrollOffset]
	add c
	ld c, a
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr nz, .skipmulti 
	sla c ; item entries are 2 bytes long, so multiply by 2
.skipmulti
	ld a, [wListPointer]
	ld l, a
	ld a, [wListPointer + 1]
	ld h, a
	inc hl ; hl = beginning of list entries
	ld b, 0
	add hl, bc
	ld a, [hl] ; a = which item id it is now
	cp HM01
	jr c, .notTMHM ; item is not a TM or HM, do nothing
	sub TM01 ; underflows below 0 for HM items (before TM items)
	push af
	jr nc, .skipAdding
	add NUM_TMS + NUM_HMS ; adjust HM IDs to come after TM IDs
.skipAdding
	inc a
	ld [wd11e], a
	predef TMToMove ; get move ID from TM/HM ID
	ld a, [wd11e]
	ld [wMoveNum], a
	call GetMoveName
	pop af
	call CopyToStringBuffer
	ld hl, TMParamMoveNameText
	call PrintText
	ld a, 1
	ld [wTMTextShown], a
	jr .done
.notTMHM
	call ClearTMTextBox
.done
	pop de
	pop hl
	pop bc
	pop af
	ret
.noAction
	pop af
	ret


ClearTMTextBox:
	ld a, [wTMTextShown]
	and a
	ret z
	ld hl,EmptyItemParamText
	call PrintText
	xor a
	ld [wTMTextShown], a
	ret

TMParamMoveNameText::
	text "@"
	text_ram wStringBuffer
	text_end

EmptyItemParamText::
	text "@"
	text_end