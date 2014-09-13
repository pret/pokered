CeruleanHouse2Script: ; 74e09 (1d:4e09)
	ld a, $1
	ld [wAutoTextBoxDrawingControl], a
	dec a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret

CeruleanHouse2TextPointers: ; 74e13 (1d:4e13)
	dw CeruleanHouse2Text1

CeruleanHouse2Text1: ; 74e15 (1d:4e15)
	db $8
	ld hl, CeruleanHouse2Text_74e77
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
.asm_74e23
	ld hl, CeruleanHouse2Text_74e7c
	call PrintText
	ld hl, BadgeItemList
	call LoadItemList
	ld hl, wStringBuffer2 + 11
	ld a, l
	ld [wcf8b], a
	ld a, h
	ld [wcf8c], a
	xor a
	ld [wcf93], a
	ld [wMenuItemToSwap], a
	ld a, SPECIALLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	jr c, .asm_74e60 ; 0x74e49 $15
	ld hl, TextPointers_74e86
	ld a, [wcf91]
	sub $15
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jr .asm_74e23 ; 0x74e5e $c3
.asm_74e60
	xor a
	ld [wListScrollOffset], a
	ld hl, CeruleanHouse2Text_74e81
	call PrintText
	jp TextScriptEnd

BadgeItemList: ; 74e6d (1d:4e6d)
	db $8,BOULDERBADGE,CASCADEBADGE,THUNDERBADGE,RAINBOWBADGE,SOULBADGE,MARSHBADGE,VOLCANOBADGE,EARTHBADGE,$FF

CeruleanHouse2Text_74e77: ; 74e77 (1d:4e77)
	TX_FAR _CeruleanHouse2Text_74e77
	db "@"

CeruleanHouse2Text_74e7c: ; 74e7c (1d:4e7c)
	TX_FAR _CeruleanHouse2Text_74e7c
	db "@"

CeruleanHouse2Text_74e81: ; 74e81 (1d:4e81)
	TX_FAR _CeruleanHouse2Text_74e81
	db "@"

TextPointers_74e86: ; 74e86 (1d:4e86)
	dw CeruleanHouse2Text_74e96
	dw CeruleanHouse2Text_74e9b
	dw CeruleanHouse2Text_74ea0
	dw CeruleanHouse2Text_74ea5
	dw CeruleanHouse2Text_74eaa
	dw CeruleanHouse2Text_74eaf
	dw CeruleanHouse2Text_74eb4
	dw CeruleanHouse2Text_74eb9

CeruleanHouse2Text_74e96: ; 74e96 (1d:4e96)
	TX_FAR _CeruleanHouse2Text_74e96
	db "@"

CeruleanHouse2Text_74e9b: ; 74e9b (1d:4e9b)
	TX_FAR _CeruleanHouse2Text_74e9b
	db "@"

CeruleanHouse2Text_74ea0: ; 74ea0 (1d:4ea0)
	TX_FAR _CeruleanHouse2Text_74ea0
	db "@"

CeruleanHouse2Text_74ea5: ; 74ea5 (1d:4ea5)
	TX_FAR _CeruleanHouse2Text_74ea5
	db "@"

CeruleanHouse2Text_74eaa: ; 74eaa (1d:4eaa)
	TX_FAR _CeruleanHouse2Text_74eaa
	db "@"

CeruleanHouse2Text_74eaf: ; 74eaf (1d:4eaf)
	TX_FAR _CeruleanHouse2Text_74eaf
	db "@"

CeruleanHouse2Text_74eb4: ; 74eb4 (1d:4eb4)
	TX_FAR _CeruleanHouse2Text_74eb4
	db "@"

CeruleanHouse2Text_74eb9: ; 74eb9 (1d:4eb9)
	TX_FAR _CeruleanHouse2Text_74eb9
	db "@"
