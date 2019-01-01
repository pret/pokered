ViridianNicknameHouse_Script:
	jp EnableAutoTextBoxDrawing

ViridianNicknameHouse_TextPointers:
	dw ViridianHouseText1
	dw ViridianHouseText2
	dw ViridianHouseText3
	dw ViridianHouseText4

ViridianHouseText1:
	TX_FAR _ViridianHouseText1
	db "@"

ViridianHouseText2:
	TX_FAR _ViridianHouseText2
	db "@"

ViridianHouseText3:
	TX_ASM
	ld hl, ViridianHouseText_1d5b1
	call PrintText
	ld a, SPEAROW
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

ViridianHouseText_1d5b1:
	TX_FAR _ViridianHouseText_1d5b1
	db "@"

ViridianHouseText4:
	TX_FAR _ViridianHouseText4
	db "@"
