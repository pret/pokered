ViridianNicknameHouse_Script:
	jp EnableAutoTextBoxDrawing

ViridianNicknameHouse_TextPointers:
	dw ViridianHouseText1
	dw ViridianHouseText2
	dw ViridianHouseText3
	dw ViridianHouseText4

ViridianHouseText1:
	text_far _ViridianHouseText1
	text_end

ViridianHouseText2:
	text_far _ViridianHouseText2
	text_end

ViridianHouseText3:
	text_asm
	ld hl, ViridianHouseText_1d5b1
	call PrintText
	ld a, SPEAROW
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

ViridianHouseText_1d5b1:
	text_far _ViridianHouseText_1d5b1
	text_end

ViridianHouseText4:
	text_far _ViridianHouseText4
	text_end
