; PureRGBnote: ADDED: code to allow repeated usages of REPEL once one runs out.
UseAnotherRepel::
	ld b, REPEL
	push bc
	call IsItemInBag
	pop bc
	jr nz, .checkUse
	ld b, SUPER_REPEL
	push bc
	call IsItemInBag
	pop bc
	jr nz, .checkUse
	ld b, MAX_REPEL
	push bc
	call IsItemInBag
	pop bc
	ret z
.checkUse
	push bc
	ld hl, RepelUseAnotherText
	rst _PrintText
	call YesNoChoice
	pop bc
	ld a, [wCurrentMenuItem]
	and a
	ret nz
	ld a, b
	ld [wcf91], a	;load item to be used
	ld [wd11e], a	;load item so its name can be grabbed
	predef GetIndexOfItemInBag
	ld a, b
	ld [wWhichPokemon], a ; load item index to be deleted when used
	call GetItemName	;get the item name into de register
	call CopyToStringBuffer ; copy name from de to wcf4b so it shows up in text
	jp UseItem	;use the item

RepelUseAnotherText:
	text_far _RepelUseAnotherText
	text_end