VermilionOldRodHouse_Script:
	jp EnableAutoTextBoxDrawing

VermilionOldRodHouse_TextPointers:
	dw VermilionGuruHouseText1

VermilionGuruHouseText1:
	text_asm
	ld a, [wd728]
	bit 4, a ; got good rod?
	jr nz, .got_item
	ld hl, VermilionHouse3Text_561bd
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	lb bc, GOOD_ROD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, wd728
	set 4, [hl] ; got good rod
	ld hl, VermilionHouse3Text_561c2
	jr .done
.bag_full
	ld hl, VermilionHouse3Text_5621c
	jr .done
.refused
	ld hl, VermilionHouse3Text_56212
	jr .done
.got_item
	ld hl, VermilionHouse3Text_56217
.done
	call PrintText
	jp TextScriptEnd

VermilionHouse3Text_561bd:
	text_far _VermilionHouse3Text_561bd
	text_end

VermilionHouse3Text_561c2:
	text_far _VermilionHouse3Text_561c2
	sound_get_item_1
	text_end

;UnusedText_561c8:
;	para "つり　こそ"
;	line "おとこの　ロマン　だ！"
;
;	para "へぼいつりざおは"
;	line "コイキングしか　つれ　なんだが"
;	line "この　いいつりざおなら"
;	line "もっと　いいもんが　つれるんじゃ！"
;	done

VermilionHouse3Text_56212:
	text_far _VermilionHouse3Text_56212
	text_end

VermilionHouse3Text_56217:
	text_far _VermilionHouse3Text_56217
	text_end

VermilionHouse3Text_5621c:
	text_far _VermilionHouse3Text_5621c
	text_end
