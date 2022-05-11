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
	jr nz, .checkUse
	jr .done
.checkUse
	push bc
	ld hl, RepelUseAnotherText
	call PrintText
	call YesNoChoice
	pop bc
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld a, b
	ld [wcf91], a	;load item to be used
	ld [wd11e], a	;load item so its name can be grabbed
	predef GetIndexOfItemInBag
	ld a, b
	ld [wWhichPokemon], a ; load item index to be deleted when used
	call GetItemName	;get the item name into de register
	call CopyToStringBuffer ; copy name from de to wcf4b so it shows up in text
	call UseItem	;use the item
.done
	ret

RepelUseAnotherText:
	text_far _RepelUseAnotherText
	text_end