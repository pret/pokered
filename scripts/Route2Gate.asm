Route2Gate_Script:
	jp EnableAutoTextBoxDrawing

Route2Gate_TextPointers:
	def_text_pointers
	dw_const Route2GateOaksAideText,  TEXT_ROUTE2GATE_OAKS_AIDE
	dw_const Route2GateYoungsterText, TEXT_ROUTE2GATE_YOUNGSTER

Route2GateOaksAideText:
	text_asm
	CheckEvent EVENT_GOT_HM05
	jr nz, .got_item
	ld a, 10
	ldh [hOaksAideRequirement], a
	ld a, HM_FLASH
	ldh [hOaksAideRewardItem], a
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, wNameBuffer
	ld de, wOaksAideRewardItemName
	ld bc, ITEM_NAME_LENGTH
	call CopyData
	predef OaksAideScript
	ldh a, [hOaksAideResult]
	cp OAKS_AIDE_GOT_ITEM
	jr nz, .no_item
	SetEvent EVENT_GOT_HM05
.got_item
	ld hl, .FlashExplanationText
	call PrintText
.no_item
	jp TextScriptEnd

.FlashExplanationText:
	text_far _Route2GateOaksAideFlashExplanationText
	text_end

Route2GateYoungsterText:
	text_far _Route2GateYoungsterText
	text_end
