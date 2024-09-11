SafariZoneSecretHouse_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneSecretHouse_TextPointers:
	def_text_pointers
	dw_const SafariZoneSecretHouseFishingGuruText, TEXT_SAFARIZONESECRETHOUSE_FISHING_GURU

SafariZoneSecretHouseFishingGuruText:
	text_asm
	CheckEvent EVENT_GOT_HM03
	ld hl, .HM03ExplanationText
	jr nz, .done
	ld hl, .YouHaveWonText
	rst _PrintText
	lb bc, HM_SURF, 1
	call GiveItem
	ld hl, .HM03NoRoomText
	jr nc, .done
	SetEvent EVENT_GOT_HM03
	ld hl, .ReceivedHM03Text
.done
	rst _PrintText
	rst TextScriptEnd

.YouHaveWonText:
	text_far _SafariZoneSecretHouseFishingGuruYouHaveWonText
	text_end

.ReceivedHM03Text:
	text_far _SafariZoneSecretHouseFishingGuruReceivedHM03Text
	sound_get_item_1
	text_end

.HM03ExplanationText:
	text_far _SafariZoneSecretHouseFishingGuruHM03ExplanationText
	text_end

.HM03NoRoomText:
	text_far _SafariZoneSecretHouseFishingGuruHM03NoRoomText
	text_end
