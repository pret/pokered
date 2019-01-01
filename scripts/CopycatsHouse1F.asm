CopycatsHouse1F_Script:
	jp EnableAutoTextBoxDrawing

CopycatsHouse1F_TextPointers:
	dw CopycatsHouse1FText1
	dw CopycatsHouse1FText2
	dw CopycatsHouse1FText3

CopycatsHouse1FText1:
	TX_FAR _CopycatsHouse1FText1
	db "@"

CopycatsHouse1FText2:
	TX_FAR _CopycatsHouse1FText2
	db "@"

CopycatsHouse1FText3:
	TX_FAR _CopycatsHouse1FText3
	TX_ASM
	ld a, CHANSEY
	call PlayCry
	jp TextScriptEnd
