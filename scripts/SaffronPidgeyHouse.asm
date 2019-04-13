SaffronPidgeyHouse_Script:
	jp EnableAutoTextBoxDrawing

SaffronPidgeyHouse_TextPointers:
	dw SaffronHouse1Text1
	dw SaffronHouse1Text2
	dw SaffronHouse1Text3
	dw SaffronHouse1Text4

SaffronHouse1Text1:
	TX_FAR _SaffronHouse1Text1
	db "@"

SaffronHouse1Text2:
	TX_FAR _SaffronHouse1Text2
	TX_ASM
	ld a, PIDGEY
	call PlayCry
	jp TextScriptEnd

SaffronHouse1Text3:
	TX_FAR _SaffronHouse1Text3
	db "@"

SaffronHouse1Text4:
	TX_FAR _SaffronHouse1Text4
	db "@"
