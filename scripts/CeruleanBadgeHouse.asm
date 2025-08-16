CeruleanBadgeHouse_Script:
	ld a, 1 << BIT_NO_AUTO_TEXT_BOX
	ld [wAutoTextBoxDrawingControl], a
	dec a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret

CeruleanBadgeHouse_TextPointers:
	def_text_pointers
	dw_const CeruleanBadgeHouseMiddleAgedManText, TEXT_CERULEANBADGEHOUSE_MIDDLE_AGED_MAN

CeruleanBadgeHouseMiddleAgedManText:
	text_asm
	ld hl, .Text
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
.loop
	ld hl, .WhichBadgeText
	call PrintText
	ld hl, .BadgeItemList
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
	jr c, .done
	ld hl, CeruleanBadgeHouseBadgeTextPointers
	ld a, [wCurItem]
	sub BOULDERBADGE
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jr .loop
.done
	xor a
	ld [wListScrollOffset], a
	ld hl, .VisitAnyTimeText
	call PrintText
	jp TextScriptEnd

.BadgeItemList:
	db NUM_BADGES ; #
	table_width 1
	db BOULDERBADGE
	db CASCADEBADGE
	db THUNDERBADGE
	db RAINBOWBADGE
	db SOULBADGE
	db MARSHBADGE
	db VOLCANOBADGE
	db EARTHBADGE
	assert_table_length NUM_BADGES
	db -1 ; end

.Text:
	text_far _CeruleanBadgeHouseMiddleAgedManText
	text_end

.WhichBadgeText:
	text_far _CeruleanBadgeHouseMiddleAgedManWhichBadgeText
	text_end

.VisitAnyTimeText:
	text_far _CeruleanBadgeHouseMiddleAgedManVisitAnyTimeText
	text_end

CeruleanBadgeHouseBadgeTextPointers:
	table_width 2
	dw CeruleanBadgeHouseBoulderBadgeText
	dw CeruleanBadgeHouseCascadeBadgeText
	dw CeruleanBadgeHouseThunderBadgeText
	dw CeruleanBadgeHouseRainbowBadgeText
	dw CeruleanBadgeHouseSoulBadgeText
	dw CeruleanBadgeHouseMarshBadgeText
	dw CeruleanBadgeHouseVolcanoBadgeText
	dw CeruleanBadgeHouseEarthBadgeText
	assert_table_length NUM_BADGES

CeruleanBadgeHouseBoulderBadgeText:
	text_far _CeruleanBadgeHouseBoulderBadgeText
	text_end

CeruleanBadgeHouseCascadeBadgeText:
	text_far _CeruleanBadgeHouseCascadeBadgeText
	text_end

CeruleanBadgeHouseThunderBadgeText:
	text_far _CeruleanBadgeHouseThunderBadgeText
	text_end

CeruleanBadgeHouseRainbowBadgeText:
	text_far _CeruleanBadgeHouseRainbowBadgeText
	text_end

CeruleanBadgeHouseSoulBadgeText:
	text_far _CeruleanBadgeHouseSoulBadgeText
	text_end

CeruleanBadgeHouseMarshBadgeText:
	text_far _CeruleanBadgeHouseMarshBadgeText
	text_end

CeruleanBadgeHouseVolcanoBadgeText:
	text_far _CeruleanBadgeHouseVolcanoBadgeText
	text_end

CeruleanBadgeHouseEarthBadgeText:
	text_far _CeruleanBadgeHouseEarthBadgeText
	text_end
