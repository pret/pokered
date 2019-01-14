SafariZoneSecretHouse_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneSecretHouse_TextPointers:
	dw SafariZoneSecretHouseText1

SafariZoneSecretHouseText1:
	TX_ASM
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
	TX_FAR _SecretHouseText_4a350
	db "@"

ReceivedHM03Text:
	TX_FAR _ReceivedHM03Text
	TX_SFX_ITEM_1
	db "@"

HM03ExplanationText:
	TX_FAR _HM03ExplanationText
	db "@"

HM03NoRoomText:
	TX_FAR _HM03NoRoomText
	db "@"
