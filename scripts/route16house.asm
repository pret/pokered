Route16HouseScript: ; 1e5f8 (7:65f8)
	jp EnableAutoTextBoxDrawing

Route16HouseTextPointers: ; 1e5fb (7:65fb)
	dw Route16HouseText1
	dw Route16HouseText2

Route16HouseText1: ; 1e5ff (7:65ff)
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

Route16HouseText3: ; 1e62b (7:662b)
	TX_FAR _Route16HouseText3
	db "@"

ReceivedHM02Text: ; 1e630 (7:6630)
	TX_FAR _ReceivedHM02Text
	db $11, "@"

HM02ExplanationText: ; 1e636 (7:6636)
	TX_FAR _HM02ExplanationText
	db "@"

HM02NoRoomText: ; 1e63b (7:663b)
	TX_FAR _HM02NoRoomText
	db "@"

Route16HouseText2: ; 1e640 (7:6640)
	TX_ASM
	ld hl, Route16HouseText_1e652
	call PrintText
	ld a, FEAROW
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

Route16HouseText_1e652: ; 1e652 (7:6652)
	TX_FAR _Route16HouseText_1e652
	db "@"
