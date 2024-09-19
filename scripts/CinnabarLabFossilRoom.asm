CinnabarLabFossilRoom_Script:
	jp EnableAutoTextBoxDrawing

CinnabarLabFossilRoom_TextPointers:
	def_text_pointers
	dw_const CinnabarLabFossilRoomScientist1Text, TEXT_CINNABARLABFOSSILROOM_SCIENTIST1
	dw_const CinnabarLabFossilRoomScientist2Text, TEXT_CINNABARLABFOSSILROOM_SCIENTIST2

Lab4Script_GetFossilsInBag:
; construct a list of all fossils in the player's bag
	xor a
	ld [wFilteredBagItemsCount], a
	ld de, wFilteredBagItems
	ld hl, FossilsList
.loop
	ld a, [hli]
	and a
	jr z, .done
	push hl
	push de
	ld [wTempByteValue], a
	ld b, a
	predef GetQuantityOfItemInBag
	pop de
	pop hl
	ld a, b
	and a
	jr z, .loop
	; A fossil is in the bag
	ld a, [wTempByteValue]
	ld [de], a
	inc de
	push hl
	ld hl, wFilteredBagItemsCount
	inc [hl]
	pop hl
	jr .loop
.done
	ld a, $ff
	ld [de], a
	ret

FossilsList:
	db DOME_FOSSIL
	db HELIX_FOSSIL
	db OLD_AMBER
	db 0 ; end

CinnabarLabFossilRoomScientist1Text:
	text_asm
	CheckEvent EVENT_GAVE_FOSSIL_TO_LAB
	jr nz, .check_done_reviving
	ld hl, .Text
	call PrintText
	call Lab4Script_GetFossilsInBag
	ld a, [wFilteredBagItemsCount]
	and a
	jr z, .no_fossils
	farcall GiveFossilToCinnabarLab
	jr .done
.no_fossils
	ld hl, .NoFossilsText
	call PrintText
.done
	jp TextScriptEnd
.check_done_reviving
	CheckEventAfterBranchReuseA EVENT_LAB_STILL_REVIVING_FOSSIL, EVENT_GAVE_FOSSIL_TO_LAB
	jr z, .done_reviving
	ld hl, .GoForAWalkText
	call PrintText
	jr .done
.done_reviving
	call LoadFossilItemAndMonNameBank1D
	ld hl, .FossilIsBackToLifeText
	call PrintText
	SetEvent EVENT_LAB_HANDING_OVER_FOSSIL_MON
	ld a, [wFossilMon]
	ld b, a
	ld c, 30
	call GivePokemon
	jr nc, .done
	ResetEvents EVENT_GAVE_FOSSIL_TO_LAB, EVENT_LAB_STILL_REVIVING_FOSSIL, EVENT_LAB_HANDING_OVER_FOSSIL_MON
	jr .done

.Text:
	text_far _CinnabarLabFossilRoomScientist1Text
	text_end

.NoFossilsText:
	text_far _CinnabarLabFossilRoomScientist1NoFossilsText
	text_end

.GoForAWalkText:
	text_far _CinnabarLabFossilRoomScientist1GoForAWalkText
	text_end

.FossilIsBackToLifeText:
	text_far _CinnabarLabFossilRoomScientist1FossilIsBackToLifeText
	text_end

CinnabarLabFossilRoomScientist2Text:
	text_asm
	ld a, TRADE_FOR_SAILOR
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

LoadFossilItemAndMonNameBank1D:
	farjp LoadFossilItemAndMonName
