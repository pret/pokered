WardensHouse_Script:
	jp EnableAutoTextBoxDrawing

WardensHouse_TextPointers:
	dw FuchsiaHouse2Text1
	dw PickUpItemText
	dw BoulderText
	dw FuchsiaHouse2Text4
	dw FuchsiaHouse2Text5

FuchsiaHouse2Text1:
	TX_ASM
	CheckEvent EVENT_GOT_HM04
	jr nz, .subtract
	ld b, GOLD_TEETH
	call IsItemInBag
	jr nz, .asm_3f30f
	CheckEvent EVENT_GAVE_GOLD_TEETH
	jr nz, .asm_60cba
	ld hl, WardenGibberishText1
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, WardenGibberishText3
	jr nz, .asm_61238
	ld hl, WardenGibberishText2
.asm_61238
	call PrintText
	jr .asm_52039
.asm_3f30f
	ld hl, WardenTeethText1
	call PrintText
	ld a, GOLD_TEETH
	ld [$ffdb], a
	callba RemoveItemByID
	SetEvent EVENT_GAVE_GOLD_TEETH
.asm_60cba
	ld hl, WardenThankYouText
	call PrintText
	lb bc, HM_04, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedHM04Text
	call PrintText
	SetEvent EVENT_GOT_HM04
	jr .asm_52039
.subtract
	ld hl, HM04ExplanationText
	call PrintText
	jr .asm_52039
.BagFull
	ld hl, HM04NoRoomText
	call PrintText
.asm_52039
	jp TextScriptEnd

WardenGibberishText1:
	TX_FAR _WardenGibberishText1
	db "@"

WardenGibberishText2:
	TX_FAR _WardenGibberishText2
	db "@"

WardenGibberishText3:
	TX_FAR _WardenGibberishText3
	db "@"

WardenTeethText1:
	TX_FAR _WardenTeethText1
	TX_SFX_ITEM_1

WardenTeethText2:
	TX_FAR _WardenTeethText2
	db "@"

WardenThankYouText:
	TX_FAR _WardenThankYouText
	db "@"

ReceivedHM04Text:
	TX_FAR _ReceivedHM04Text
	TX_SFX_ITEM_1
	db "@"

HM04ExplanationText:
	TX_FAR _HM04ExplanationText
	db "@"

HM04NoRoomText:
	TX_FAR _HM04NoRoomText
	db "@"

FuchsiaHouse2Text5:
FuchsiaHouse2Text4:
	TX_ASM
	ld a, [H_SPRITEINDEX]
	cp $4
	ld hl, FuchsiaHouse2Text_7517b
	jr nz, .asm_4c9a2
	ld hl, FuchsiaHouse2Text_75176
.asm_4c9a2
	call PrintText
	jp TextScriptEnd

FuchsiaHouse2Text_75176:
	TX_FAR _FuchsiaHouse2Text_75176
	db "@"

FuchsiaHouse2Text_7517b:
	TX_FAR _FuchsiaHouse2Text_7517b
	db "@"
