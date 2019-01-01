Route2Gate_Script:
	jp EnableAutoTextBoxDrawing

Route2Gate_TextPointers:
	dw Route2GateText1
	dw Route2GateText2

Route2GateText1:
	TX_ASM
	CheckEvent EVENT_GOT_HM05
	jr nz, .asm_5d60d
	ld a, 10 ; pokemon needed
	ld [hOaksAideRequirement], a
	ld a, HM_05 ; oak's aide reward
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
	jr nz, .asm_5d613
	SetEvent EVENT_GOT_HM05
.asm_5d60d
	ld hl, Route2GateText_5d616
	call PrintText
.asm_5d613
	jp TextScriptEnd

Route2GateText_5d616:
	TX_FAR _Route2GateText_5d616
	db "@"

Route2GateText2:
	TX_FAR _Route2GateText2
	db "@"
