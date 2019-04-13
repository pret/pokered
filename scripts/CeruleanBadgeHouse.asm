CeruleanBadgeHouse_Script:
	ld a, $1
	ld [wAutoTextBoxDrawingControl], a
	dec a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret

CeruleanBadgeHouse_TextPointers:
	dw CeruleanHouse2Text1

CeruleanHouse2Text1:
	TX_ASM
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
	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld [wMenuItemToSwap], a
	ld a, SPECIALLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	jr c, .asm_74e60
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
	jr .asm_74e23
.asm_74e60
	xor a
	ld [wListScrollOffset], a
	ld hl, CeruleanHouse2Text_74e81
	call PrintText
	jp TextScriptEnd

BadgeItemList:
	db $8,BOULDERBADGE,CASCADEBADGE,THUNDERBADGE,RAINBOWBADGE,SOULBADGE,MARSHBADGE,VOLCANOBADGE,EARTHBADGE,$FF

CeruleanHouse2Text_74e77:
	TX_FAR _CeruleanHouse2Text_74e77
	db "@"

CeruleanHouse2Text_74e7c:
	TX_FAR _CeruleanHouse2Text_74e7c
	db "@"

CeruleanHouse2Text_74e81:
	TX_FAR _CeruleanHouse2Text_74e81
	db "@"

TextPointers_74e86:
	dw CeruleanHouse2Text_74e96
	dw CeruleanHouse2Text_74e9b
	dw CeruleanHouse2Text_74ea0
	dw CeruleanHouse2Text_74ea5
	dw CeruleanHouse2Text_74eaa
	dw CeruleanHouse2Text_74eaf
	dw CeruleanHouse2Text_74eb4
	dw CeruleanHouse2Text_74eb9

CeruleanHouse2Text_74e96:
	TX_FAR _CeruleanHouse2Text_74e96
	db "@"

CeruleanHouse2Text_74e9b:
	TX_FAR _CeruleanHouse2Text_74e9b
	db "@"

CeruleanHouse2Text_74ea0:
	TX_FAR _CeruleanHouse2Text_74ea0
	db "@"

CeruleanHouse2Text_74ea5:
	TX_FAR _CeruleanHouse2Text_74ea5
	db "@"

CeruleanHouse2Text_74eaa:
	TX_FAR _CeruleanHouse2Text_74eaa
	db "@"

CeruleanHouse2Text_74eaf:
	TX_FAR _CeruleanHouse2Text_74eaf
	db "@"

CeruleanHouse2Text_74eb4:
	TX_FAR _CeruleanHouse2Text_74eb4
	db "@"

CeruleanHouse2Text_74eb9:
	TX_FAR _CeruleanHouse2Text_74eb9
	db "@"
