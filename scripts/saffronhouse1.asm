SaffronHouse1Script: ; 1dddd (7:5ddd)
	jp EnableAutoTextBoxDrawing

SaffronHouse1TextPointers: ; 1dde0 (7:5de0)
	dw SaffronHouse1Text1
	dw SaffronHouse1Text2
	dw SaffronHouse1Text3
	dw SaffronHouse1Text4

SaffronHouse1Text1: ; 1dde8 (7:5de8)
	TX_FAR _SaffronHouse1Text1
	db "@"

SaffronHouse1Text2: ; 1dded (7:5ded)
	TX_FAR _SaffronHouse1Text2
	TX_ASM
	ld a, PIDGEY
	call PlayCry
	jp TextScriptEnd

SaffronHouse1Text3: ; 1ddfa (7:5dfa)
	TX_FAR _SaffronHouse1Text3
	db "@"

SaffronHouse1Text4: ; 1ddff (7:5dff)
	TX_FAR _SaffronHouse1Text4
	db "@"
