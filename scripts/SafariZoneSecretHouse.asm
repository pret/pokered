SafariZoneSecretHouse_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneSecretHouse_TextPointers:
	dw SafariZoneSecretHouseText1

SafariZoneSecretHouseText1:
	text_asm
	CheckEvent EVENT_GOT_HM03
	jr nz, .asm_20a9b
	ld hl, SafariZoneSecretHouseText_4a350
	call PrintText
	lb bc, HM_03, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedHM03Text
	call PrintText
	SetEvent EVENT_GOT_HM03
	jr .asm_8f1fc
.BagFull
	ld hl, HM03NoRoomText
	call PrintText
	jr .asm_8f1fc
.asm_20a9b
	ld hl, HM03ExplanationText
	call PrintText
.asm_8f1fc
	jp TextScriptEnd

SafariZoneSecretHouseText_4a350:
	text_far _SecretHouseText_4a350
	text_end

ReceivedHM03Text:
	text_far _ReceivedHM03Text
	sound_get_item_1
	text_end

HM03ExplanationText:
	text_far _HM03ExplanationText
	text_end

HM03NoRoomText:
	text_far _HM03NoRoomText
	text_end
