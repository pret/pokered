Route12SuperRodHouse_Script:
	jp EnableAutoTextBoxDrawing

Route12SuperRodHouse_TextPointers:
	dw Route12HouseText1

Route12HouseText1:
	text_asm
	ld a, [wd728]
	bit 5, a ; received super rod?
	jr nz, .got_item
	ld hl, Route12HouseText_564c0
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	lb bc, SUPER_ROD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, wd728
	set 5, [hl] ; received super rod
	ld hl, Route12HouseText_564c5
	jr .done
.bag_full
	ld hl, Route12HouseText_564d9
	jr .done
.refused
	ld hl, Route12HouseText_564cf
	jr .done
.got_item
	ld hl, Route12HouseText_564d4
.done
	call PrintText
	jp TextScriptEnd

Route12HouseText_564c0:
	text_far _Route12HouseText_564c0
	text_end

Route12HouseText_564c5:
	text_far _Route12HouseText_564c5
	sound_get_item_1
	text_far _Route12HouseText_564ca
	text_end

Route12HouseText_564cf:
	text_far _Route12HouseText_564cf
	text_end

Route12HouseText_564d4:
	text_far _Route12HouseText_564d4
	text_end

Route12HouseText_564d9:
	text_far _Route12HouseText_564d9
	text_end
