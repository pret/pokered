Route16FlyHouse_Script:
	jp EnableAutoTextBoxDrawing

Route16FlyHouse_TextPointers:
	dw Route16HouseText1
	dw Route16HouseText2

Route16HouseText1:
	TX_ASM
	CheckEvent EVENT_GOT_HM02
	ld hl, HM02ExplanationText
	jr nz, .asm_13616
	ld hl, Route16HouseText3
	call PrintText
	lb bc, HM_02, 1
	call GiveItem
	jr nc, .BagFull
	SetEvent EVENT_GOT_HM02
	ld hl, ReceivedHM02Text
	jr .asm_13616
.BagFull
	ld hl, HM02NoRoomText
.asm_13616
	call PrintText
	jp TextScriptEnd

Route16HouseText3:
	TX_FAR _Route16HouseText3
	db "@"

ReceivedHM02Text:
	TX_FAR _ReceivedHM02Text
	TX_SFX_KEY_ITEM
	db "@"

HM02ExplanationText:
	TX_FAR _HM02ExplanationText
	db "@"

HM02NoRoomText:
	TX_FAR _HM02NoRoomText
	db "@"

Route16HouseText2:
	TX_ASM
	ld hl, Route16HouseText_1e652
	call PrintText
	ld a, FEAROW
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

Route16HouseText_1e652:
	TX_FAR _Route16HouseText_1e652
	db "@"
