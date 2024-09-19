WardensHouse_Script:
	jp EnableAutoTextBoxDrawing

WardensHouse_TextPointers:
	def_text_pointers
	dw_const WardensHouseWardenText,  TEXT_WARDENSHOUSE_WARDEN
	dw_const PickUpItemText,          TEXT_WARDENSHOUSE_RARE_CANDY
	dw_const BoulderText,             TEXT_WARDENSHOUSE_BOULDER
	dw_const WardensHouseDisplayText, TEXT_WARDENSHOUSE_DISPLAY_LEFT
	dw_const WardensHouseDisplayText, TEXT_WARDENSHOUSE_DISPLAY_RIGHT

WardensHouseWardenText:
	text_asm
	CheckEvent EVENT_GOT_HM04
	jr nz, .got_item
	ld b, GOLD_TEETH
	call IsItemInBag
	jr nz, .have_gold_teeth
	CheckEvent EVENT_GAVE_GOLD_TEETH
	jr nz, .gave_gold_teeth
	ld hl, .Gibberish1Text
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .Gibberish3Text
	jr nz, .refused
	ld hl, .Gibberish2Text
.refused
	call PrintText
	jr .done
.have_gold_teeth
	ld hl, .GaveTheGoldTeethText
	call PrintText
	ld a, GOLD_TEETH
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	SetEvent EVENT_GAVE_GOLD_TEETH
.gave_gold_teeth
	ld hl, .ThanksText
	call PrintText
	lb bc, HM_STRENGTH, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .ReceivedHM04Text
	call PrintText
	SetEvent EVENT_GOT_HM04
	jr .done
.got_item
	ld hl, .HM04ExplanationText
	call PrintText
	jr .done
.bag_full
	ld hl, .HM04NoRoomText
	call PrintText
.done
	jp TextScriptEnd

.Gibberish1Text:
	text_far _WardensHouseWardenGibberish1Text
	text_end

.Gibberish2Text:
	text_far _WardensHouseWardenGibberish2Text
	text_end

.Gibberish3Text:
	text_far _WardensHouseWardenGibberish3Text
	text_end

.GaveTheGoldTeethText:
	text_far _WardensHouseWardenGaveTheGoldTeethText
	sound_get_item_1

.PoppedInHisTeethText: ; unreferenced
	text_far _WardensHouseWardenTeethPoppedInHisTeethText
	text_end

.ThanksText:
	text_far _WardensHouseWardenThanksText
	text_end

.ReceivedHM04Text:
	text_far _WardensHouseWardenReceivedHM04Text
	sound_get_item_1
	text_end

.HM04ExplanationText:
	text_far _WardensHouseWardenHM04ExplanationText
	text_end

.HM04NoRoomText:
	text_far _WardensHouseWardenHM04NoRoomText
	text_end

WardensHouseDisplayText:
	text_asm
	ldh a, [hTextID]
	cp TEXT_WARDENSHOUSE_DISPLAY_LEFT
	ld hl, .MerchandiseText
	jr nz, .print_text
	ld hl, .PhotosAndFossilsText
.print_text
	call PrintText
	jp TextScriptEnd

.PhotosAndFossilsText:
	text_far _WardensHouseDisplayPhotosAndFossilsText
	text_end

.MerchandiseText:
	text_far _WardensHouseDisplayMerchandiseText
	text_end
