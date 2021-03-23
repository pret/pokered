Route16FlyHouse_Script:
	jp EnableAutoTextBoxDrawing

Route16FlyHouse_TextPointers:
	dw Route16HouseText1
	dw Route16HouseText2

Route16HouseText1:
	text_asm
	CheckEvent EVENT_GOT_HM02
	ld hl, HM02ExplanationText
	jr nz, .got_item
	ld hl, Route16HouseText3
	call PrintText
	lb bc, HM_FLY, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_GOT_HM02
	ld hl, ReceivedHM02Text
	jr .got_item
.bag_full
	ld hl, HM02NoRoomText
.got_item
	call PrintText
	jp TextScriptEnd

Route16HouseText3:
	text_far _Route16HouseText3
	text_end

ReceivedHM02Text:
	text_far _ReceivedHM02Text
	sound_get_key_item
	text_end

HM02ExplanationText:
	text_far _HM02ExplanationText
	text_end

HM02NoRoomText:
	text_far _HM02NoRoomText
	text_end

Route16HouseText2:
	text_asm
	ld hl, Route16HouseText_1e652
	call PrintText
	ld a, FEAROW
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

Route16HouseText_1e652:
	text_far _Route16HouseText_1e652
	text_end
