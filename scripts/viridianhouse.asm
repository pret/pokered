ViridianHouseScript: ; 1d58a (7:558a)
	jp EnableAutoTextBoxDrawing

ViridianHouseTextPointers: ; 1d58d (7:558d)
	dw ViridianHouseText1
	dw ViridianHouseText2
	dw ViridianHouseText3
	dw ViridianHouseText4

ViridianHouseText1: ; 1d595 (7:5595)
	TX_FAR _ViridianHouseText1
	db "@"

ViridianHouseText2: ; 1d59a (7:559a)
	TX_FAR _ViridianHouseText2
	db "@"

ViridianHouseText3: ; 1d59f (7:559f)
	TX_ASM
	ld hl, ViridianHouseText_1d5b1
	call PrintText
	ld a, SPEAROW
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

ViridianHouseText_1d5b1: ; 1d5b1 (7:55b1)
	TX_FAR _ViridianHouseText_1d5b1
	db "@"

ViridianHouseText4: ; 1d5b6 (7:55b6)
	TX_FAR _ViridianHouseText4
	db "@"
