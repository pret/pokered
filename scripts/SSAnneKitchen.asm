SSAnneKitchen_Script:
	call EnableAutoTextBoxDrawing
	ret

SSAnneKitchen_TextPointers:
	dw SSAnne6Text1
	dw SSAnne6Text2
	dw SSAnne6Text3
	dw SSAnne6Text4
	dw SSAnne6Text5
	dw SSAnne6Text6
	dw SSAnne6Text7

SSAnne6Text1:
	TX_FAR _SSAnne6Text1
	db "@"

SSAnne6Text2:
	TX_FAR _SSAnne6Text2
	db "@"

SSAnne6Text3:
	TX_FAR _SSAnne6Text3
	db "@"

SSAnne6Text4:
	TX_FAR _SSAnne6Text4
	db "@"

SSAnne6Text5:
	TX_FAR _SSAnne6Text5
	db "@"

SSAnne6Text6:
	TX_FAR _SSAnne6Text6
	db "@"

SSAnne6Text7:
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

SSAnne6Text_61807:
	TX_FAR _SSAnne6Text_61807
	db "@"

SSAnne6Text_6180c:
	TX_FAR _SSAnne6Text_6180c
	db "@"

SSAnne6Text_61811:
	TX_FAR _SSAnne6Text_61811
	db "@"

SSAnne6Text_61816:
	TX_FAR _SSAnne6Text_61816
	db "@"
