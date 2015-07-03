FuchsiaHouse3Script: ; 5617c (15:617c)
	jp EnableAutoTextBoxDrawing

FuchsiaHouse3TextPointers: ; 5617f (15:617f)
	dw FuchsiaHouse3Text1

FuchsiaHouse3Text1: ; 56181 (15:6181)
	TX_ASM
	ld a, [wd728]
	bit 4, a
	jr nz, .after

	ld hl, FuchsiaHouse3Text_561bd
	call PrintText

	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused

	ld bc, (GOOD_ROD << 8) | 1
	call GiveItem
	jr nc, .full

	ld hl, wd728
	set 4, [hl]

	ld hl, FuchsiaHouse3Text_561c2
	jr .talk

.full
	ld hl, FuchsiaHouse3Text_5621c
	jr .talk

.refused
	ld hl, FuchsiaHouse3Text_56212
	jr .talk

.after
	ld hl, FuchsiaHouse3Text_56217

.talk
	call PrintText
	jp TextScriptEnd

FuchsiaHouse3Text_561bd: ; 561bd (15:61bd)
	TX_FAR _FuchsiaHouse3Text_561bd
	db "@"

FuchsiaHouse3Text_561c2: ; 561c2 (15:61c2)
	TX_FAR _FuchsiaHouse3Text_561c2
	db $0B
	db "@"

UnusedText_561c8: ; 561c8
	para "つり こそ"
	line "おとこの ロマン だ!"

	para "へぼいつりざおは"
	line "コイキングしか つれ なんだが"
	line "この いいつりざおなら"
	line "もっと いいもんが つれるんじゃ!"
	done

FuchsiaHouse3Text_56212: ; 56212 (15:6212)
	TX_FAR _FuchsiaHouse3Text_56212
	db "@"

FuchsiaHouse3Text_56217: ; 56217 (15:6217)
	TX_FAR _FuchsiaHouse3Text_56217
	db "@"

FuchsiaHouse3Text_5621c: ; 5621c (15:621c)
	TX_FAR _FuchsiaHouse3Text_5621c
	db "@"
