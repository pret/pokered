SSAnne6Script: ; 617b3 (18:57b3)
	call EnableAutoTextBoxDrawing
	ret

SSAnne6TextPointers: ; 617b7 (18:57b7)
	dw SSAnne6Text1
	dw SSAnne6Text2
	dw SSAnne6Text3
	dw SSAnne6Text4
	dw SSAnne6Text5
	dw SSAnne6Text6
	dw SSAnne6Text7

SSAnne6Text1: ; 617c5 (18:57c5)
	TX_FAR _SSAnne6Text1
	db "@"

SSAnne6Text2: ; 617ca (18:57ca)
	TX_FAR _SSAnne6Text2
	db "@"

SSAnne6Text3: ; 617cf (18:57cf)
	TX_FAR _SSAnne6Text3
	db "@"

SSAnne6Text4: ; 617d4 (18:57d4)
	TX_FAR _SSAnne6Text4
	db "@"

SSAnne6Text5: ; 617d9 (18:57d9)
	TX_FAR _SSAnne6Text5
	db "@"

SSAnne6Text6: ; 617de (18:57de)
	TX_FAR _SSAnne6Text6
	db "@"

SSAnne6Text7: ; 617e3 (18:57e3)
	TX_ASM
	ld hl, SSAnne6Text_61807
	call PrintText
	ld a, [hRandomAdd]
	bit 7, a
	jr z, .asm_93eb1
	ld hl, SSAnne6Text_6180c
	jr .asm_63292
.asm_93eb1
	bit 4, a
	jr z, .asm_7436c
	ld hl, SSAnne6Text_61811
	jr .asm_63292
.asm_7436c
	ld hl, SSAnne6Text_61816
.asm_63292
	call PrintText
	jp TextScriptEnd

SSAnne6Text_61807: ; 61807 (18:5807)
	TX_FAR _SSAnne6Text_61807
	db "@"

SSAnne6Text_6180c: ; 6180c (18:580c)
	TX_FAR _SSAnne6Text_6180c
	db "@"

SSAnne6Text_61811: ; 61811 (18:5811)
	TX_FAR _SSAnne6Text_61811
	db "@"

SSAnne6Text_61816: ; 61816 (18:5816)
	TX_FAR _SSAnne6Text_61816
	db "@"
