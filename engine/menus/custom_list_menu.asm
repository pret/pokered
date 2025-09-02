; PureRGBnote: ADDED: code to allow customized list menus that don't need item slots for each thing in the list.
CustomListMenuTextMethods:
	dw GetMonNameListMenu
	dw GetTrainerNameListMenu
	dw GetChampArenaMusicNameListMenu

CustomListMenuGetEntryText::
	push hl
	ld a, [wListMenuCustomType]
	ld hl, CustomListMenuTextMethods
	call GetAddressFromPointerArray
	call hl_caller
	pop hl
	ret

GetMonNameListMenu:
	jp GetMonName

GetTrainerNameListMenu:
	ld a, [wNamedObjectIndex]
	ld [wTrainerClass], a
	callfar GetTrainerName_
	ld de, wTrainerName
	ret

GetChampArenaMusicNameListMenu:
	jpfar GetChampArenaMusicNameIntoWRAM

CheckLoadHoverText::
	push af
	push bc
	push hl
	push de
	; wListMenuHoverTextType still loaded
	dec a
	ld hl, CustomListMenuHoverTextMethods
	call GetAddressFromPointerArray
	call hl_caller
	pop de
	pop hl
	pop bc
	pop af
	ret

CustomListMenuHoverTextMethods:
	dw CheckLoadTmName
	dw CheckLoadTypes

GetListEntryID:
	ld a, [wListCount]
	and a
	jr z, .noText ;if the list is 0 entries, we only have CANCEL in the list, so don't load any TM info
	ld a, [wCurrentMenuItem]
	ld c, a
	ld a, [wListScrollOffset]
	add c
	ld c, a
	ld a, [wListCount]
	dec a
	cp c ; did the player select Cancel?
	jr c, .noText ; if so, don't display anything
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
	hl_deref wListPointer
	inc hl ; hl = beginning of list entries
	ld b, 0
	add hl, bc
	ld a, [hl] ; a = which item id it is now
	and a ; clear carry
	ret
.noText
	scf
	ret

CheckLoadTypes:
	call GetListEntryID
	jr c, .noText
	; a = which pokemon ID in the list is selected
	ld [wCurSpecies], a ; needed to make PrintMonType work
	ld a, 1
	ld [wListMenuHoverTextShown], a
	hlcoord 4, 13
	lb bc, 3, 14  ; height, width
	call TextBoxBorder
	callfar IsMonTypeRemapped
	ld a, $C0
	jr nc, .new
	ld a, $C2
.new
	hlcoord 5, 13
	ld [hli], a
	inc a
	ld [hl], a 
	hlcoord 5, 14
	ld de, MenuType1Text
	call PlaceString
	hlcoord 11, 14
	predef PrintMonType
	hlcoord 11, 16
	ld a, [hl]
	cp " "
	ret z ; if no type printed for the second type at this point, don't print "Type2:" on that line
	hlcoord 5, 16
	ld de, MenuType2Text
	jp PlaceString
.noText
	ld a, [wListMenuHoverTextShown]
	and a
	ret z
	hlcoord 4, 13
	lb bc, 16, 5
	predef LoadScreenTileAreaFromBuffer3
	call UpdateSprites
	xor a
	ld [wListMenuHoverTextShown], a
	ret

MenuType1Text:
	db "TYPE1:@"

MenuType2Text:
	db "TYPE2:@"

CustomListMenuHoverTextSaveScreenTileMethods:
	dw CheckSaveTMTextScreenTiles
	dw CheckSaveTypeTextScreenTiles

CheckSaveHoverTextScreenTiles::
	; wListMenuHoverTextType still loaded
	dec a
	ld hl, CustomListMenuHoverTextSaveScreenTileMethods
	call GetAddressFromPointerArray
	jp hl

CheckSaveTypeTextScreenTiles:
	; load some special tiles that are used when displaying this list menu
	ld hl, vChars1 tile $40
	ld de, OldNewTypes
	lb bc, BANK(OldNewTypes), 4
	call CopyVideoDataDouble
	; we need to save some tiles for later in case we display a TM text box above these tiles
	hlcoord 4, 13
	lb bc, 16, 5
	predef_jump SaveScreenTileAreaToBuffer3

CheckBadOffset::
	; in some cases we can end up near the end of the list with less than 3 entries showing like after depositing an item or pokemon
	; in this case we change the offset to avoid issues
	ld a, [wListCount] ; number of items in list, minus CANCEL (same value as max index value possible)
	cp 2
	ret c ; if less than 2 entries, no need to check
	; wListCount still loaded
	ld b, a ; wListCount in b
	ld a, [wListScrollOffset]
	and a
	ret z ; if scroll offset is 0, no need to check
	ld c, a
	ld a, b
	sub c
	cp 1
	ret nz
	ld hl, wListScrollOffset
	dec [hl] ; decs once because it is assumed only 1 item can be removed from the list at a time
	ret

