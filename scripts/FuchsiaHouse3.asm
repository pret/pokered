FuchsiaHouse3Script: ; 5617c (15:617c)
	jp EnableAutoTextBoxDrawing

FuchsiaHouse3TextPointers: ; 5617f (15:617f)
	dw FuchsiaHouse3Text1

FuchsiaHouse3Text1: ; 56181 (15:6181)
	db $08 ; asm
	ld a, [$d728]
	bit 4, a
	jr nz, .after

	ld hl, UnnamedText_561bd
	call PrintText

	call YesNoChoice
	ld a, [$cc26]
	and a
	jr nz, .refused

	ld bc, (GOOD_ROD << 8) | 1
	call GiveItem
	jr nc, .full

	ld hl, $d728
	set 4, [hl]

	ld hl, UnnamedText_561c2
	jr .talk

.full
	ld hl, UnnamedText_5621c
	jr .talk

.refused
	ld hl, UnnamedText_56212
	jr .talk

.after
	ld hl, UnnamedText_56217

.talk
	call PrintText
	jp TextScriptEnd

UnnamedText_561bd: ; 561bd (15:61bd)
	TX_FAR _UnnamedText_561bd
	db "@"

UnnamedText_561c2: ; 561c2 (15:61c2)
	TX_FAR _UnnamedText_561c2 ; 0xa06e8
	db $0B
	db "@"

UnnamedText_561c8: ; 561c8
	para "つり こそ";Only Fishing
	line "おとこの ロマン だ!" ;It is a romance of a man!

	para "へぼいつりざおは" ;I have an old rod
	line "コイキングしか つれ なんだが" ;although I can only catch Magikarp
	line "この いいつりざおなら" ;If you get a good rod
	line "もっと いいもんが つれるんじゃ!" ;you can catch better Pokemon!
	done

UnnamedText_56212: ; 56212 (15:6212)
	TX_FAR _UnnamedText_56212
	db "@"

UnnamedText_56217: ; 56217 (15:6217)
	TX_FAR _UnnamedText_56217
	db "@"

UnnamedText_5621c: ; 5621c (15:621c)
	TX_FAR _UnnamedText_5621c
	db "@"
	
