Route15Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route15Gate2F_TextPointers:
	dw Route15GateUpstairsText1
	dw Route15GateUpstairsText2

Route15GateUpstairsText1:
	text_asm
	CheckEvent EVENT_GOT_EXP_ALL
	jr nz, .got_item
	ld a, 50
	ldh [hOaksAideRequirement], a
	ld a, EXP_ALL
	ldh [hOaksAideRewardItem], a
	ld [wd11e], a
	call GetItemName
	ld hl, wcd6d
	ld de, wOaksAideRewardItemName
	ld bc, ITEM_NAME_LENGTH
	call CopyData
	predef OaksAideScript
	ldh a, [hOaksAideResult]
	cp OAKS_AIDE_GOT_ITEM
	jr nz, .no_item
	SetEvent EVENT_GOT_EXP_ALL
.got_item
	ld hl, Route15GateUpstairsText_4968c
	call PrintText
.no_item
	jp TextScriptEnd

Route15GateUpstairsText_4968c:
	text_far _Route15GateUpstairsText_4968c
	text_end

Route15GateUpstairsText2:
	text_asm
	ld hl, Route15GateUpstairsText_49698
	jp GateUpstairsScript_PrintIfFacingUp

Route15GateUpstairsText_49698:
	text_far _Route15GateUpstairsText_49698
	text_end
