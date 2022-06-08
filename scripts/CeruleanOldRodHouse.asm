CeruleanOldRodHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

CeruleanOldRodHouse_TextPointers:
	dw CeruleanOldRodHouse1Text1

CeruleanOldRodHouse1Text1:
	text_asm
	ld a, [wd728]
	bit 3, a ; got old rod?
	jr nz, .got_item
	ld hl, CeruleanHouse2Text_560b1
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	lb bc, OLD_ROD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, wd728
	set 3, [hl] ; got old rod
	ld hl, CeruleanHouse2Text_560b6
	jr .done
.bag_full
	ld hl, CeruleanHouse2Text_560ca
	jr .done
.refused
	ld hl, CeruleanHouse2Text_560c0
	jr .done
.got_item
	ld hl, CeruleanHouse2Text_560c5
.done
	call PrintText
	jp TextScriptEnd

CeruleanHouse2Text_560b1:
	text_far _CeruleanHouse2Text_560b1
	text_end

CeruleanHouse2Text_560b6:
	text_far _CeruleanHouse2Text_560b6
	sound_get_item_1
	text_far _CeruleanHouse2Text_560bb
	text_end

CeruleanHouse2Text_560c0:
	text_far _CeruleanHouse2Text_560c0
	text_end

CeruleanHouse2Text_560c5:
	text_far _CeruleanHouse2Text_560c5
	text_end

CeruleanHouse2Text_560ca:
	text_far _CeruleanHouse2Text_560ca
	text_end