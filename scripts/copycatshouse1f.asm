CopycatsHouse1FScript: ; 75ec3 (1d:5ec3)
	jp EnableAutoTextBoxDrawing

CopycatsHouse1FTextPointers: ; 75ec6 (1d:5ec6)
	dw CopycatsHouse1FText1
	dw CopycatsHouse1FText2
	dw CopycatsHouse1FText3

CopycatsHouse1FText1: ; 75ecc (1d:5ecc)
	TX_FAR _CopycatsHouse1FText1
	db "@"

CopycatsHouse1FText2: ; 75ed1 (1d:5ed1)
	TX_FAR _CopycatsHouse1FText2
	db "@"

CopycatsHouse1FText3: ; 75ed6 (1d:5ed6)
	TX_FAR _CopycatsHouse1FText3
	TX_ASM
	ld a, CHANSEY
	call PlayCry
	jp TextScriptEnd
