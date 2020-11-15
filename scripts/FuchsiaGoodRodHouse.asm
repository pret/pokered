FuchsiaGoodRodHouse_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaGoodRodHouse_TextPointers:
	dw FuchsiaHouse3Text1

FuchsiaHouse3Text1:
	text_asm
	ld a, [wd728]
	bit 4, a ; got good rod?
	jr nz, .got_item
	ld hl, FuchsiaHouse3Text_561bd
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
	ld hl, FuchsiaHouse3Text_561c2
	jr .done
.bag_full
	ld hl, FuchsiaHouse3Text_5621c
	jr .done
.refused
	ld hl, FuchsiaHouse3Text_56212
	jr .done
.got_item
	ld hl, FuchsiaHouse3Text_56217
.done
	call PrintText
	jp TextScriptEnd

FuchsiaHouse3Text_561bd:
	text_far _FuchsiaHouse3Text_561bd
	text_end

FuchsiaHouse3Text_561c2:
	text_far _FuchsiaHouse3Text_561c2
	sound_get_item_1
	text_end

UnusedText_561c8:
	para "つり　こそ"
	line "おとこの　ロマン　だ！"

	para "へぼいつりざおは"
	line "コイキングしか　つれ　なんだが"
	line "この　いいつりざおなら"
	line "もっと　いいもんが　つれるんじゃ！"
	done

FuchsiaHouse3Text_56212:
	text_far _FuchsiaHouse3Text_56212
	text_end

FuchsiaHouse3Text_56217:
	text_far _FuchsiaHouse3Text_56217
	text_end

FuchsiaHouse3Text_5621c:
	text_far _FuchsiaHouse3Text_5621c
	text_end
