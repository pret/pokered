GiveFossilToCinnabarLab::
	ld hl, wd730
	set 6, [hl]
	xor a
	ld [wCurrentMenuItem], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, [wFilteredBagItemsCount]
	dec a
	ld [wMaxMenuItem], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
	ld a, [wFilteredBagItemsCount]
	dec a
	ld bc, 2
	ld hl, 3
	call AddNTimes
	dec l
	ld b, l
	ld c, $d
	hlcoord 0, 0
	call TextBoxBorder
	call UpdateSprites
	call PrintFossilsInBag
	ld hl, wd730
	res 6, [hl]
	call HandleMenuInput
	bit BIT_B_BUTTON, a
	jr nz, .cancelledGivingFossil
	ld hl, wFilteredBagItems
	ld a, [wCurrentMenuItem]
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	ldh [hItemToRemoveID], a
	cp DOME_FOSSIL
	jr z, .choseDomeFossil
	cp HELIX_FOSSIL
	jr z, .choseHelixFossil
	ld b, AERODACTYL
	jr .fossilSelected
.choseHelixFossil
	ld b, OMANYTE
	jr .fossilSelected
.choseDomeFossil
	ld b, KABUTO
.fossilSelected
	ld [wFossilItem], a
	ld a, b
	ld [wFossilMon], a
	call LoadFossilItemAndMonName
	ld hl, LabFossil_610ae
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .cancelledGivingFossil
	ld hl, LabFossil_610b3
	call PrintText
	ld a, [wFossilItem]
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	ld hl, LabFossil_610b8
	call PrintText
	SetEvents EVENT_GAVE_FOSSIL_TO_LAB, EVENT_LAB_STILL_REVIVING_FOSSIL
	ret
.cancelledGivingFossil
	ld hl, LabFossil_610bd
	call PrintText
	ret

LabFossil_610ae:
	text_far _Lab4Text_610ae
	text_end

LabFossil_610b3:
	text_far _Lab4Text_610b3
	text_end

LabFossil_610b8:
	text_far _Lab4Text_610b8
	text_end

LabFossil_610bd:
	text_far _Lab4Text_610bd
	text_end

PrintFossilsInBag:
; Prints each fossil in the player's bag on a separate line in the menu.
	ld hl, wFilteredBagItems
	xor a
	ldh [hItemCounter], a
.loop
	ld a, [hli]
	cp $ff
	ret z
	push hl
	ld [wd11e], a
	call GetItemName
	hlcoord 2, 2
	ldh a, [hItemCounter]
	ld bc, SCREEN_WIDTH * 2
	call AddNTimes
	ld de, wcd6d
	call PlaceString
	ld hl, hItemCounter
	inc [hl]
	pop hl
	jr .loop

; loads the names of the fossil item and the resulting mon
LoadFossilItemAndMonName::
	ld a, [wFossilMon]
	ld [wd11e], a
	call GetMonName
	call CopyToStringBuffer
	ld a, [wFossilItem]
	ld [wd11e], a
	call GetItemName
	ret
