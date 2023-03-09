WardensHouse_Script:
	jp EnableAutoTextBoxDrawing

WardensHouse_TextPointers:
	dw FuchsiaHouse2Text1
	dw PickUpItemText
	dw BoulderText
	dw FuchsiaHouse2Text4
	dw FuchsiaHouse2Text5

FuchsiaHouse2Text1:
	text_asm
	CheckEvent EVENT_GOT_HM04
	jr nz, .got_item
	ld b, GOLD_TEETH
	call IsItemInBag
	jr nz, .have_gold_teeth
	CheckEvent EVENT_GAVE_GOLD_TEETH
	jr nz, .gave_gold_teeth
	ld hl, WardenGibberishText1
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, WardenGibberishText3
	jr nz, .refused
	ld hl, WardenGibberishText2
.refused
	rst _PrintText
	jr .done
.have_gold_teeth
	ld hl, WardenTeethText1
	rst _PrintText
	ld a, GOLD_TEETH
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	SetEvent EVENT_GAVE_GOLD_TEETH
.gave_gold_teeth
	ld hl, WardenThankYouText
	rst _PrintText
	lb bc, HM_STRENGTH, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedHM04Text
	rst _PrintText
	SetEvent EVENT_GOT_HM04
	jr .done
.got_item
	ld hl, HM04ExplanationText
	rst _PrintText
	jr .done
.bag_full
	ld hl, HM04NoRoomText
	rst _PrintText
.done
	rst TextScriptEnd

WardenGibberishText1:
	text_far _WardenGibberishText1
	text_end

WardenGibberishText2:
	text_far _WardenGibberishText2
	text_end

WardenGibberishText3:
	text_far _WardenGibberishText3
	text_end

WardenTeethText1:
	text_far _WardenTeethText1
	sound_get_item_1

WardenTeethText2:
	text_far _WardenTeethText2
	text_end

WardenThankYouText:
	text_far _WardenThankYouText
	text_end

ReceivedHM04Text:
	text_far _ReceivedHM04Text
	sound_get_item_1
	text_end

HM04ExplanationText:
	text_far _HM04ExplanationText
	text_end

HM04NoRoomText:
	text_far _HM04NoRoomText
	text_end

FuchsiaHouse2Text5:
FuchsiaHouse2Text4:
	text_asm
	ldh a, [hSpriteIndex]
	cp $4
	ld hl, FuchsiaHouse2Text_7517b
	jr nz, .asm_4c9a2
	ld hl, FuchsiaHouse2Text_75176
.asm_4c9a2
	rst _PrintText
	rst TextScriptEnd

FuchsiaHouse2Text_75176:
	text_far _FuchsiaHouse2Text_75176
	text_end

FuchsiaHouse2Text_7517b:
	text_far _FuchsiaHouse2Text_7517b
	text_end
