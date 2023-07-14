SafariZoneSecretHouse_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneSecretHouse_TextPointers:
	def_text_pointers
	dw_const SafariZoneSecretHouseFishingGuruText, TEXT_SAFARIZONESECRETHOUSE_FISHING_GURU

SafariZoneSecretHouseFishingGuruText:
	text_asm
	CheckEvent EVENT_GOT_HM03
	jr nz, .got_item
	ld hl, .YouHaveWonText
	call PrintText
	lb bc, HM_SURF, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .ReceivedHM03Text
	call PrintText
	SetEvent EVENT_GOT_HM03
	jr .done
.bag_full
	ld hl, .HM03NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, .HM03ExplanationText
	call PrintText
.done
	jp TextScriptEnd

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
