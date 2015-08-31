Lab4Script: ; 75d31 (1d:5d31)
	jp EnableAutoTextBoxDrawing

Lab4TextPointers: ; 75d34 (1d:5d34)
	dw Lab4Text1
	dw Lab4Text2

Lab4Script_GetFossilsInBag: ; 75d38 (1d:5d38)
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
	ld [wd11e], a
	ld b, a
	predef GetQuantityOfItemInBag
	pop de
	pop hl
	ld a, b
	and a
	jr z, .loop

	; A fossil's in the bag
	ld a, [wd11e]
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

FossilsList: ; 75d68 (1d:5d68)
	db DOME_FOSSIL
	db HELIX_FOSSIL
	db OLD_AMBER
	db $00

Lab4Text1: ; 75d6c (1d:5d6c)
	TX_ASM
	CheckEvent EVENT_GAVE_FOSSIL_TO_LAB
	jr nz, .asm_75d96
	ld hl, Lab4Text_75dc6
	call PrintText
	call Lab4Script_GetFossilsInBag
	ld a, [wFilteredBagItemsCount]
	and a
	jr z, .asm_75d8d
	callba GiveFossilToCinnabarLab
	jr .asm_75d93
.asm_75d8d
	ld hl, Lab4Text_75dcb
	call PrintText
.asm_75d93
	jp TextScriptEnd
.asm_75d96
	CheckEventAfterBranchReuseA EVENT_LAB_STILL_REVIVING_FOSSIL, EVENT_GAVE_FOSSIL_TO_LAB
	jr z, .asm_75da2
	ld hl, Lab4Text_75dd0
	call PrintText
	jr .asm_75d93
.asm_75da2
	call LoadFossilItemAndMonNameBank1D
	ld hl, Lab4Text_75dd5
	call PrintText
	SetEvent EVENT_LAB_HANDING_OVER_FOSSIL_MON
	ld a, [wFossilMon]
	ld b, a
	ld c, 30
	call GivePokemon
	jr nc, .asm_75d93
	ResetEvents EVENT_GAVE_FOSSIL_TO_LAB, EVENT_LAB_STILL_REVIVING_FOSSIL, EVENT_LAB_HANDING_OVER_FOSSIL_MON
	jr .asm_75d93

Lab4Text_75dc6: ; 75dc6 (1d:5dc6)
	TX_FAR _Lab4Text_75dc6
	db "@"

Lab4Text_75dcb: ; 75dcb (1d:5dcb)
	TX_FAR _Lab4Text_75dcb
	db "@"

Lab4Text_75dd0: ; 75dd0 (1d:5dd0)
	TX_FAR _Lab4Text_75dd0
	db "@"

Lab4Text_75dd5: ; 75dd5 (1d:5dd5)
	TX_FAR _Lab4Text_75dd5
	db "@"

Lab4Text2: ; 75dda (1d:5dda)
	TX_ASM
	ld a, $3
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

LoadFossilItemAndMonNameBank1D: ; 75de8 (1d:5de8)
	jpba LoadFossilItemAndMonName
