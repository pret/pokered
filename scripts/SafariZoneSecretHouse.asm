SafariZoneSecretHouse_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneSecretHouse_TextPointers:
	dw SafariZoneSecretHouseText1

SafariZoneSecretHouseText1:
	text_asm
	CheckEvent EVENT_GOT_HM03
	jr nz, .got_item
	ld hl, SafariZoneSecretHouseText_4a350
	rst _PrintText
	lb bc, HM_SURF, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedHM03Text
	rst _PrintText
	SetEvent EVENT_GOT_HM03
	jr .done
.bag_full
	ld hl, HM03NoRoomText
	rst _PrintText
	jr .done
.got_item
	ld hl, HM03ExplanationText
	rst _PrintText
.done
	rst TextScriptEnd

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
