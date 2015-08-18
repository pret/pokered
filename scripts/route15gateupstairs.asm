Route15GateUpstairsScript: ; 4964a (12:564a)
	jp DisableAutoTextBoxDrawing

Route15GateUpstairsTextPointers: ; 4964d (12:564d)
	dw Route15GateUpstairsText1
	dw Route15GateUpstairsText2

Route15GateUpstairsText1: ; 49651 (12:5651)
	TX_ASM
	CheckEvent EVENT_GOT_EXP_ALL
	jr nz, .asm_49683
	ld a, 50 ; pokemon needed
	ld [hOaksAideRequirement], a
	ld a, EXP__ALL ; oak's aide reward
	ld [hOaksAideRewardItem], a
	ld [wd11e], a
	call GetItemName
	ld hl, wcd6d
	ld de, wOaksAideRewardItemName
	ld bc, ITEM_NAME_LENGTH
	call CopyData
	predef OaksAideScript
	ld a, [hOaksAideResult]
	cp $1
	jr nz, .asm_49689
	SetEvent EVENT_GOT_EXP_ALL
.asm_49683
	ld hl, Route15GateUpstairsText_4968c
	call PrintText
.asm_49689
	jp TextScriptEnd

Route15GateUpstairsText_4968c: ; 4968c (12:568c)
	TX_FAR _Route15GateUpstairsText_4968c
	db "@"

Route15GateUpstairsText2: ; 49691 (12:5691)
	TX_ASM
	ld hl, Route15GateUpstairsText_49698
	jp GateUpstairsScript_PrintIfFacingUp

Route15GateUpstairsText_49698: ; 49698 (12:5698)
	TX_FAR _Route15GateUpstairsText_49698
	db "@"
