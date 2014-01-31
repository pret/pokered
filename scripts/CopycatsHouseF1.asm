CopycatsHouseF1Script: ; 75ec3 (1d:5ec3)
	jp EnableAutoTextBoxDrawing

CopycatsHouseF1TextPointers: ; 75ec6 (1d:5ec6)
	dw CopycatsHouseF1Text1
	dw CopycatsHouseF1Text2
	dw CopycatsHouseF1Text3

CopycatsHouseF1Text1: ; 75ecc (1d:5ecc)
	TX_FAR _CopycatsHouseF1Text1
	db "@"

CopycatsHouseF1Text2: ; 75ed1 (1d:5ed1)
	TX_FAR _CopycatsHouseF1Text2
	db "@"

CopycatsHouseF1Text3: ; 75ed6 (1d:5ed6)
	TX_FAR _CopycatsHouseF1Text3
	db $8
	ld a, CHANSEY
	call PlayCry
	jp TextScriptEnd
	
