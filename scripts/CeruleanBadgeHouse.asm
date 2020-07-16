CeruleanBadgeHouse_Script:
	ld a, TRUE
	ld [wAutoTextBoxDrawingControl], a
	dec a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret

CeruleanBadgeHouse_TextPointers:
	dw CeruleanHouse2Text1

CeruleanHouse2Text1:
	text_asm
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
	sub BOULDERBADGE
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
	db 8 ; #
	db BOULDERBADGE
	db CASCADEBADGE
	db THUNDERBADGE
	db RAINBOWBADGE
	db SOULBADGE
	db MARSHBADGE
	db VOLCANOBADGE
	db EARTHBADGE
	db -1 ; end

CeruleanHouse2Text_74e77:
	text_far _CeruleanHouse2Text_74e77
	text_end

CeruleanHouse2Text_74e7c:
	text_far _CeruleanHouse2Text_74e7c
	text_end

CeruleanHouse2Text_74e81:
	text_far _CeruleanHouse2Text_74e81
	text_end

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
	text_far _CeruleanHouse2Text_74e96
	text_end

CeruleanHouse2Text_74e9b:
	text_far _CeruleanHouse2Text_74e9b
	text_end

CeruleanHouse2Text_74ea0:
	text_far _CeruleanHouse2Text_74ea0
	text_end

CeruleanHouse2Text_74ea5:
	text_far _CeruleanHouse2Text_74ea5
	text_end

CeruleanHouse2Text_74eaa:
	text_far _CeruleanHouse2Text_74eaa
	text_end

CeruleanHouse2Text_74eaf:
	text_far _CeruleanHouse2Text_74eaf
	text_end

CeruleanHouse2Text_74eb4:
	text_far _CeruleanHouse2Text_74eb4
	text_end

CeruleanHouse2Text_74eb9:
	text_far _CeruleanHouse2Text_74eb9
	text_end
